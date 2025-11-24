-- [[
--  QuestHelper (v1.5.2)
--  Original by Oxos
--  Integrated with OnMob (v2.6.6) functionality.
--
--  v1.5.2 - Re-based on v1.5. Retains the user's correct arc logic.
--         - Added Quest Icon drawing function.
--         - FIXED Icon position to correctly read the swapped Y/Z
--           from locations.lua.
--         - FIXED /onmob_getpos to print swapped Y/Z
--           to match the user's locations.lua format.
-- ]]

require('common')
addon.author   = 'Oxos'
addon.name     = 'QuestHelper'
addon.version  = '1.0'

-- QuestHelper Requirements
local imgui        = require('imgui')
local settings     = require('settings')
local image_loader = require('images')
local ffi          = require('ffi')
local bit          = require('bit')

-- OnMob Requirements
local d3d = require('d3d8')
local d3d8dev = require('d3d8').get_device() -- [NEW] Get D3D device
local C = ffi.C                             -- [NEW] Get FFI C library
local helpers = require('helpers')
if not helpers then
    error("[" .. addon.name .. "] helpers.lua is missing.")
end

local drawArcModule = require('drawArc')
if not drawArcModule then
    error("[" .. addon.name .. "] drawArc.lua is missing. Ensure it and Bezier3D_2.lua are present.")
end

local drawingModule = require('drawing')
if not drawingModule then
    error("[" .. addon.name .. "] drawing.lua is missing.")
end

-- [NEW] FFI definition for our 2D icon vertices
ffi.cdef [[
    #pragma pack(1)
    struct IconVertFormat
    {
        float x;
        float y;
        float z;
        float rhw;
        unsigned int diffuse;
        float u;
        float v;
    };
]]
local iconVertFormatMask = bit.bor(C.D3DFVF_XYZRHW, C.D3DFVF_DIFFUSE, C.D3DFVF_TEX1)
local iconVertSize = ffi.sizeof('struct IconVertFormat')


--------------------------------------------------------------------------------
-- Constants / Settings (QuestHelper)
--------------------------------------------------------------------------------
local QUESTHELPER_ALIAS = 'QuestHelper_settings'
local default_settings = T{
    step_states = T{}
}
local quest_settings = settings.load(default_settings, QUESTHELPER_ALIAS)

--------------------------------------------------------------------------------
-- Current UI states (QuestHelper)
--------------------------------------------------------------------------------
local currentTopCategory = nil
local currentSubfile     = nil
local current_mission    = nil
local is_open            = false
local showImagesDrawer   = true
local lastMainX, lastMainY = 300, 200
local lastMainW, lastMainH = 400, 600
local step_trigger_flags = T{}

--------------------------------------------------------------------------------
-- Search Feature (QuestHelper)
--------------------------------------------------------------------------------
local search_query   = ""
local search_results = T{}

--------------------------------------------------------------------------------
-- Data from subfolders
--------------------------------------------------------------------------------
local quest_data = T{}
local location_data = T{}
local zone_data = T{}
local questIconTexture = nil -- [NEW] Variable to hold our icon texture

----------------------------------------------------------------------------------------------------
-- Configuration & Data (from OnMob v2.6.6)
----------------------------------------------------------------------------------------------------
-- Player Arc Start Offsets (from OnMob v2.6.6)
local PLAYER_ARC_START_X_OFFSET = 0
local PLAYER_ARC_START_Y_OFFSET_ON_PLAYER = -2
local PLAYER_ARC_START_Z_OFFSET = 0

-- Beam Visuals Configuration
local BEAM_BASE_COLOR_R, BEAM_BASE_COLOR_G, BEAM_BASE_COLOR_B = 1.0, 1.0, 0.0 -- Yellow base
local BEAM_MIN_ALPHA = 0.4
local BEAM_MAX_ALPHA = 0.9
local BEAM_PULSE_SPEED = 2.0
local BEAM_APPEAR_DURATION = 3

local ENABLE_VERBOSE_DEBUG = false
local DEBUG_PRINT_INTERVAL = 10
local lastDebugPrintTime = 0

-- Runtime State (from OnMob)
local beamAppearProgress = 0.0
local lastFrameTime = os.clock()
local ARGB_BEAM_COLOR

-- Player position (updated each frame)
local playerPosX, playerPosY_height, playerPosZ_depth = 0,0,0
local playerZoneId = 0

-- Runtime state for tracking the *current* NPC trigger
local currentQuestTriggerNPC = nil
local playerName = ""



----------------------------------------------------------------------------------------------------
-- Helper Functions (from OnMob)
----------------------------------------------------------------------------------------------------
local function calculateDynamicColor()
    local time = os.clock()
    local pulse = (math.sin(time * BEAM_PULSE_SPEED) + 1) / 2
    local currentAlpha = BEAM_MIN_ALPHA + pulse * (BEAM_MAX_ALPHA - BEAM_MIN_ALPHA)
    local A_int = math.floor(currentAlpha * 255)
    local R_int = math.floor(BEAM_BASE_COLOR_R * 255)
    local G_int = math.floor(BEAM_BASE_COLOR_G * 255)
    local B_int = math.floor(BEAM_BASE_COLOR_B * 255)
    ARGB_BEAM_COLOR = bit.bor(bit.lshift(A_int, 24), bit.lshift(R_int, 16), bit.lshift(G_int, 8), B_int)
end

local function updatePlayerPosition(mem)
    if not mem then return false end

    -- Get Player Name via GetPlayerEntity as requested by user
    local playerInfo = GetPlayerEntity()
    if playerInfo and playerInfo.Name then
        playerName = playerInfo.Name
    end

    local party = mem:GetParty()
    local entityMgr = mem:GetEntity()
    if not party or not entityMgr then return false end
    playerZoneId = party:GetMemberZone(0)
    local playerIndex = party:GetMemberTargetIndex(0)
    local pActorPointer = 0
    if playerIndex == 0xFFFF or playerIndex == nil then
        local player = mem:GetPlayer()
        if player and player:GetActorPointer() ~= 0 then
             pActorPointer = player:GetActorPointer()
        else return false
        end
    else
        pActorPointer = entityMgr:GetActorPointer(playerIndex)
    end
    if pActorPointer == 0 then return false end
    playerPosX = ashita.memory.read_float(pActorPointer + 0x678)
    playerPosZ_depth = ashita.memory.read_float(pActorPointer + 0x67C) -- Z (Depth)
    playerPosY_height = ashita.memory.read_float(pActorPointer + 0x680) -- Y (Height)
    return true
end

-- [NEW] Function to draw our 2D icon
local function drawQuestIcon(x, y, z, rhw, size, color)
    local halfSize = size * 0.5
    local x1, y1 = x - halfSize, y - halfSize
    local x2, y2 = x + halfSize, y + halfSize

    -- Create a 4-vertex quad
    local vertices = ffi.new('struct IconVertFormat[4]', {
        { x1, y1, z, rhw, color, 0, 0 }, -- Top-left
        { x2, y1, z, rhw, color, 1, 0 }, -- Top-right
        { x1, y2, z, rhw, color, 0, 1 }, -- Bottom-left
        { x2, y2, z, rhw, color, 1, 1 }  -- Bottom-right
    })

    -- Set device states for 2D texture drawing
    d3d8dev:SetStreamSource(0, nil, 0) -- Unbind any existing buffer
    d3d8dev:SetVertexShader(iconVertFormatMask)
    d3d8dev:SetTexture(0, questIconTexture)

    -- Standard alpha blending
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0) -- No Z-buffer
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)

    -- Modulate texture color with vertex color (for tinting/alpha)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP, C.D3DTOP_MODULATE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG2, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP, C.D3DTOP_MODULATE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_TEXTURE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG2, C.D3DTA_DIFFUSE)

    -- Draw the quad
    d3d8dev:DrawPrimitiveUP(C.D3DPT_TRIANGLESTRIP, 2, vertices, iconVertSize)
end

--------------------------------------------------------------------------------
-- JSON/Data Loading (QuestHelper)
--------------------------------------------------------------------------------
local function decode_json(json_str)
    local status, result = pcall(function()
        return load("return " .. json_str)()
    end)
    if status then
        return result
    else
        print('Failed to parse data file:', result)
        return nil
    end
end

local function load_zone_data()
    local filepath = string.format('%saddons/%s/data/zones.lua', AshitaCore:GetInstallPath(), addon.name)
    local chunk, err = loadfile(filepath)
    if chunk then
        local ok, result = pcall(chunk)
        if ok and type(result) == 'table' then
            zone_data = T(result)
            print(string.format("[%s] Loaded %d zones from data/zones.lua.", addon.name, table.count(zone_data)))
        else
            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
        end
    else
        print(string.format('Warning: Could not load data/zones.lua. Zone checks will not work. Error: %s', err or "file not found"))
    end
end

local function load_location_data()
    local filepath = string.format('%saddons/%s/data/locations.lua', AshitaCore:GetInstallPath(), addon.name)
    local chunk, err = loadfile(filepath)
    if chunk then
        local ok, result = pcall(chunk)
        if ok and type(result) == 'table' then
            location_data = T(result)
            print(string.format("[%s] Loaded %d locations from data/locations.lua.", addon.name, table.count(location_data)))
        else
            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
        end
    else
        print(string.format('Warning: Could not load data/locations.lua. Beams relying on it will not work. Error: %s', err or "file not found"))
    end
end

local function load_quest_data()
    local baseFolder = string.format('%saddons/%s/data/', AshitaCore:GetInstallPath(), addon.name)
    local dynamic_directories_list = T{}
    local dirCmdScanCategories = string.format('dir /b /ad "%s"', baseFolder:gsub('/', '\\'))
    local pCategories = io.popen(dirCmdScanCategories)
    if pCategories then
        for category_name_raw in pCategories:lines() do
            local category_name = category_name_raw:match("^%s*(.-)%s*$")
            if category_name and #category_name > 0 and category_name ~= "." and category_name ~= ".." then
                table.insert(dynamic_directories_list, category_name)
            end
        end
        pCategories:close()
        if #dynamic_directories_list == 0 then
            print("QuestHelper: WARNING - No category subdirectories found in " .. baseFolder)
        else
            print("QuestHelper: Discovered categories: " .. table.concat(dynamic_directories_list, ", "))
        end
    else
        print("QuestHelper: ERROR - Could not execute 'dir' command to find categories in " .. baseFolder)
        return
    end

    for _, subdir in ipairs(dynamic_directories_list) do
        local folderPath = baseFolder .. subdir .. '/'
        local dirCmd = 'dir "' .. folderPath .. '" /b'
        local p = io.popen(dirCmd)
        if p then
            for file_name in p:lines() do
                if file_name:match('%.lua$') then
                    local filepath = folderPath .. file_name
                    local chunk, err = loadfile(filepath)
                    if chunk then
                        local ok, result = pcall(chunk)
                        if ok and type(result) == 'table' then
                            local shortName = file_name:gsub('%.lua$', '')
                            if not quest_data[subdir] then
                                quest_data[subdir] = T{}
                            end
                            quest_data[subdir][shortName] = T(result)
                        else
                            print(string.format('Error running file: %s -> %s', filepath, err or "unknown"))
                        end
                    else
                        print(string.format('Error loading Lua file: %s -> %s', filepath, err or "unknown"))
                    end
                elseif file_name:match('%.json$') then
                    local filepath = folderPath .. file_name
                    local f = io.open(filepath, 'r')
                    if f then
                        local content = f:read('*all')
                        f:close()
                        local data = decode_json(content)
                        if data then
                            local shortName = file_name:gsub('%.json$', '')
                            if not quest_data[subdir] then
                                quest_data[subdir] = T{}
                            end
                            quest_data[subdir][shortName] = T(data)
                        else
                            print(string.format('Error parsing JSON data: %s', filepath))
                        end
                    end
                end
            end
            p:close()
        end
    end
end

--------------------------------------------------------------------------------
-- Utility (QuestHelper)
--------------------------------------------------------------------------------
local function get_sorted_keys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    return keys
end

local function ensure_key_path(t, ...)
    local keys = {...}
    local current = t
    for _, key in ipairs(keys) do
        if not current[key] then
            current[key] = T{}
        end
        current = current[key]
    end
    return current
end

--------------------------------------------------------------------------------
-- Text Wrapping (QuestHelper)
--------------------------------------------------------------------------------
local function wrap_text(text, max_length)
    local wrapped_text = {}
    for line in text:gmatch("[^\r\n]+") do
        local start = 1
        while start <= #line do
            local next_break = start + max_length - 1
            if next_break >= #line then
                table.insert(wrapped_text, line:sub(start))
                break
            end
            local space_pos = line:sub(start, next_break):match("^.*() ") or max_length
            table.insert(wrapped_text, line:sub(start, start + space_pos - 1))
            start = start + space_pos
        end
    end
    return table.concat(wrapped_text, "\n")
end

--------------------------------------------------------------------------------
-- Step Completion (QuestHelper)
--------------------------------------------------------------------------------
local function get_step_state(topCat, subfile, mission, step)
    local path = ensure_key_path(quest_settings.step_states, topCat, subfile, mission)
    return path[step] or false
end

local function set_step_state(topCat, subfile, mission, step, state)
    -- Clear any existing trigger flags for this specific step to ensure a clean state
    if step_trigger_flags[topCat] and step_trigger_flags[topCat][subfile] and step_trigger_flags[topCat][subfile][mission] then
        step_trigger_flags[topCat][subfile][mission][step] = nil
    end

    local path = ensure_key_path(quest_settings.step_states, topCat, subfile, mission)
    path[step] = state
    print(string.format("Saving step: %s -> %s -> %s -> Step %d = %s", topCat, subfile, mission, step, tostring(state)))
    settings.save(QUESTHELPER_ALIAS, quest_settings)
end

--------------------------------------------------------------------------------
-- Identify "Current Step" (QuestHelper)
--------------------------------------------------------------------------------
local function get_current_step(topCat, subfile, mission)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then
        return 1
    end
    for i = 1, #mdata.steps do
        if not get_step_state(topCat, subfile, mission, i) then
            return i
        end
    end
    return #mdata.steps + 1
end

--------------------------------------------------------------------------------
-- Completion Checks (QuestHelper)
--------------------------------------------------------------------------------
local function is_subfile_complete(topCat, subfile)
    local fileData = quest_data[topCat] and quest_data[topCat][subfile]
    if not fileData then return false end
    for mission_name, mission_data in pairs(fileData) do
        local steps = mission_data.steps or {}
        for i = 1, #steps do
            if not get_step_state(topCat, subfile, mission_name, i) then
                return false
            end
        end
    end
    return true
end

local function is_mission_complete(topCat, subfile, mission)
    local mission_data = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mission_data then return false end
    local steps = mission_data.steps or {}
    for i = 1, #steps do
        if not get_step_state(topCat, subfile, mission, i) then
            return false
        end
    end
    return true
end

--------------------------------------------------------------------------------
-- Progress (QuestHelper)
--------------------------------------------------------------------------------
local function calculate_progress(topCat, subfile, mission)
    local mdata = quest_data[topCat][subfile][mission]
    local steps = mdata.steps or {}
    local completed = 0
    for i = 1, #steps do
        if get_step_state(topCat, subfile, mission, i) then
            completed = completed + 1
        end
    end
    local total = #steps
    local pct   = 0
    if total > 0 then
        pct = (completed / total) * 100
    end
    return pct, completed, total
end

--------------------------------------------------------------------------------
-- Return images (QuestHelper)
--------------------------------------------------------------------------------
local function get_images_for_step(topCat, subfile, mission, stepIndex)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then return {} end
    local step_data = mdata.steps[stepIndex]
    if type(step_data) == 'table' and step_data.images then
        local matched = {}
        for _, image_info in ipairs(step_data.images) do
            if (image_info.state == stepIndex) or (image_info.state == nil) then
                table.insert(matched, image_info)
            end
        end
        return matched
    end
    return {}
end

--------------------------------------------------------------------------------
-- Search (QuestHelper)
--------------------------------------------------------------------------------
local function perform_search()
    search_results = T{}
    local query = (search_query or ""):lower()
    if query == "" then return end
    for topCategory, subfiles in pairs(quest_data) do
        for subfile, missions in pairs(subfiles) do
            for mission_name, _ in pairs(missions) do
                if mission_name:lower():find(query, 1, true) then
                    table.insert(search_results, {
                        topCategory = topCategory,
                        subfile     = subfile,
                        mission     = mission_name
                    })
                end
            end
        end
    end
end

local function distToSegmentSquared(p, v, w)
    local l2 = (v.x - w.x)^2 + (v.z - w.z)^2
    if l2 == 0 then return (p.x - v.x)^2 + (p.z - v.z)^2 end
    local t = ((p.x - v.x) * (w.x - v.x) + (p.z - v.z) * (w.z - v.z)) / l2
    t = math.max(0, math.min(1, t))
    local projX = v.x + t * (w.x - v.x)
    local projZ = v.z + t * (w.z - v.z)
    return (p.x - projX)^2 + (p.z - projZ)^2
end

--------------------------------------------------------------------------------
-- Main Rendering - MERGED
--------------------------------------------------------------------------------
ashita.events.register('d3d_present', 'present_callback', function()

    -- [[ START OF MERGED ONMOB LOGIC ]]

    local systemCurrentTime = os.time()
    local frameCurrentTime = os.clock()
    local deltaTime = frameCurrentTime - lastFrameTime
    lastFrameTime = frameCurrentTime
    local shouldPrintDebugNow = false

    if ENABLE_VERBOSE_DEBUG then
        if (systemCurrentTime - lastDebugPrintTime) >= DEBUG_PRINT_INTERVAL then
            shouldPrintDebugNow = true
            lastDebugPrintTime = systemCurrentTime
        end
    end

    local memManager = AshitaCore:GetMemoryManager()

    if memManager then
        if not updatePlayerPosition(memManager) then
            if shouldPrintDebugNow then print("["..addon.name.."] Could not update player position for dynamic arc start.") end
        end
    else
        if shouldPrintDebugNow then print("["..addon.name.."] MemoryManager not ready.") end
    end

    local targetsToDraw = {}
    local targetStepText = nil

    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]

                -- Handle trigger zones before drawing logic
                if type(step_data) == 'table' and step_data.trigger_zones then
                    for _, zone in ipairs(step_data.trigger_zones) do
                        if zone.type == 'square' and playerPosX and playerPosZ_depth and zone.center and zone.size then
                            local half_size = zone.size / 2
                            if  math.abs(playerPosX - zone.center.x) < half_size and
                                math.abs(playerPosZ_depth - zone.center.z) < half_size then
                                set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                                return
                            end
                        elseif zone.type == 'line' and playerPosX and playerPosZ_depth and zone.start and zone.stop then
                            local player_pos = { x = playerPosX, z = playerPosZ_depth }
                            local distSq = distToSegmentSquared(player_pos, zone.start, zone.stop)
                            local width = zone.width or 2
                            if distSq < (width * width) then
                                set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                                return
                            end
                        end
                    end
                end

                if type(step_data) == 'table' then
                    targetStepText = step_data.text or ("Step " .. step_idx)
                    local target_ref = step_data.onmob_target

                    local potential_targets = {}
                    if type(target_ref) == 'string' then
                        table.insert(potential_targets, target_ref)
                    elseif type(target_ref) == 'table' then
                        if target_ref[1] and type(target_ref[1]) == 'string' then -- List of strings
                            potential_targets = target_ref
                        else -- Inline definition
                            table.insert(targetsToDraw, target_ref)
                        end
                    end

                    for _, name in ipairs(potential_targets) do
                        if location_data[name] then
                            table.insert(targetsToDraw, location_data[name])
                        else
                             if shouldPrintDebugNow then
                                print(string.format("[%s Debug] Error: Step references location key '%s', but it's not in locations.lua.", addon.name, name))
                            end
                        end
                    end
                end
            end
        end
    end

    -- New drawing logic for trigger_zone and draw_type
    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]
                if type(step_data) == 'table' then
                    calculateDynamicColor()

                    if step_data.trigger_zones then
                        for _, zone in ipairs(step_data.trigger_zones) do
                            if zone.type == 'square' and zone.center and zone.size then
                                drawingModule.drawSquare(zone.center, zone.size, ARGB_BEAM_COLOR)
                            elseif zone.type == 'line' and zone.start and zone.stop then
                                drawingModule.drawLine(zone.start, zone.stop, ARGB_BEAM_COLOR)
                            end
                        end
                    end

                    if step_data.draw_type then
                        if step_data.draw_type == 'line' and step_data.start_pos and step_data.end_pos then
                            drawingModule.drawLine(step_data.start_pos, step_data.end_pos, ARGB_BEAM_COLOR)
                        elseif step_data.draw_type == 'square' and step_data.center and step_data.size then
                            drawingModule.drawSquare(step_data.center, step_data.size, ARGB_BEAM_COLOR)
                        end
                    end
                end
            end
        end
    end

    -- Loop through all resolved targets and draw them
    for _, targetData in ipairs(targetsToDraw) do
        local drawActive = false
        if targetData then
            -- Zone Check
            if targetData.zone and zone_data[targetData.zone] then
                if playerZoneId ~= zone_data[targetData.zone] then
                    goto continue_loop
                end
            end

            local npcNameToActuallyFindInGame = targetData.trigger_npc

            if not npcNameToActuallyFindInGame or npcNameToActuallyFindInGame == "" then
                drawActive = true
            else
                local npcFoundThisFrame = false
                if memManager then
                    for i = 0, 1023 do
                        local entity = GetEntity(i)
                        if entity and entity.Name and entity.Name == npcNameToActuallyFindInGame then
                            npcFoundThisFrame = true
                            break
                        end
                    end
                end
                if npcFoundThisFrame then
                    drawActive = true
                end
            end
        end

        if drawActive then
            -- This is the logic from v1.5
            local effectiveTargetX = 0.0
            local effectiveTargetY_height = 0.0
            local effectiveTargetZ_depth = 0.0

            if targetData.target_pos and type(targetData.target_pos) == 'table' then
                effectiveTargetX = targetData.target_pos.x or 0.0
                effectiveTargetY_height = targetData.target_pos.y or 0.0
                effectiveTargetZ_depth = targetData.target_pos.z or 0.0
            else
                 if shouldPrintDebugNow then print(string.format("[%s Debug] Error: Location data for target is missing 'target_pos' table.", addon.name)) end
            end

            local visualStartX, visualStartY_height, visualStartZ_depth
            local visualEndX, visualEndY_height, visualEndZ_depth

            visualStartX = playerPosX + PLAYER_ARC_START_X_OFFSET
            visualStartY_height = playerPosZ_depth + PLAYER_ARC_START_Y_OFFSET_ON_PLAYER
            visualStartZ_depth = playerPosY_height + PLAYER_ARC_START_Z_OFFSET

            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height
            visualEndZ_depth = effectiveTargetZ_depth

            if beamAppearProgress < 1.0 then
                beamAppearProgress = beamAppearProgress + (deltaTime / BEAM_APPEAR_DURATION)
                if beamAppearProgress > 1.0 then beamAppearProgress = 1.0 end
            end
            calculateDynamicColor()

            if shouldPrintDebugNow then
                local npc_name_for_print = "Position"
                if targetData and targetData.trigger_npc then npc_name_for_print = targetData.trigger_npc end
                print(string.format("[%s Debug] Drawing Arc for step '%s'. Target: %s", addon.name, targetStepText, npc_name_for_print))
            end

            drawArcModule(visualStartX, visualStartZ_depth, visualStartY_height, visualEndX, visualEndZ_depth, visualEndY_height, ARGB_BEAM_COLOR, beamAppearProgress, true)

            if questIconTexture then
                local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
                local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

                local targetWorldX = effectiveTargetX
                local targetWorldY = effectiveTargetZ_depth
                local targetWorldZ = effectiveTargetY_height

                targetWorldZ = targetWorldZ - 0.5

                local sx, sy, sz = helpers.worldToScreen(targetWorldX, targetWorldZ, targetWorldY, view, projection)

                if sx and sz > 0 and sz < 1 then
                    drawQuestIcon(sx, sy, 0.5, 1.0, 32, 0xFFFFFFFF)
                end
            end
        end
        ::continue_loop::
    end

    -- [[ END OF MERGED ONMOB LOGIC ]]


    -- [[ START OF ORIGINAL QUESTHELPER UI LOGIC ]]

    if not is_open then
        return
    end

    imgui.PushStyleColor(ImGuiCol_WindowBg, {0.1, 0.1, 0.1, 0.73})
    imgui.PushStyleColor(ImGuiCol_CheckMark, {0.8, 0.8, 0.8, 1.0})
    imgui.PushStyleColor(ImGuiCol_FrameBg, {0.3, 0.3, 0.3, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgHovered, {0.5, 0.5, 0.5, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgActive, {0.7, 0.7, 0.7, 1.0})

    imgui.SetNextWindowSize({600, 600}, ImGuiCond_Always)
    local mainFlags = bit.bor(
        ImGuiWindowFlags_NoResize,
        ImGuiWindowFlags_NoCollapse,
        ImGuiWindowFlags_NoTitleBar
    )
    local window_open = imgui.Begin('Quest Helper', nil, mainFlags)

    local mainX, mainY = 0, 0
    local mainW, mainH = 0, 0

    if window_open then
        mainX, mainY = imgui.GetWindowPos()
        mainW, mainH = imgui.GetWindowSize()
        if mainW > 0 and mainH > 0 then
            lastMainX = mainX
            lastMainY = mainY
            lastMainW = mainW
            lastMainH = mainH
        end

        -- SEARCH BAR
        imgui.Text("Search Missions/Quests (lowest-level):")
        local input_buf = { search_query }
        if imgui.InputText("##SearchQuest", input_buf, 256) then
            search_query = input_buf[1]
            perform_search()
        end
        imgui.Separator()

        -- SEARCH RESULTS
        if search_query ~= "" then
            if #search_results == 0 then
                imgui.TextColored({1,0,0,1}, "No matches found.")
            else
                imgui.TextColored({0,1,0,1}, "Search Results:")
                for _, result in ipairs(search_results) do
                    local topCat  = result.topCategory
                    local subfile = result.subfile
                    local mission = result.mission
                    local isComplete = is_mission_complete(topCat, subfile, mission)
                    local label = string.format("[%s] %s -> %s", topCat, subfile, mission)

                    if isComplete then
                        imgui.PushStyleColor(ImGuiCol_Button,        {0, 1, 0, 0.5})
                        imgui.PushStyleColor(ImGuiCol_ButtonHovered, {0, 1, 0, 0.7})
                        imgui.PushStyleColor(ImGuiCol_ButtonActive,  {0, 1, 0, 0.9})
                        imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                    else
                        imgui.PushStyleColor(ImGuiCol_Button,        {1, 0, 0, 0.5})
                        imgui.PushStyleColor(ImGuiCol_ButtonHovered, {1, 0, 0, 0.7})
                        imgui.PushStyleColor(ImGuiCol_ButtonActive,  {1, 0, 0, 0.9})
                        imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                    end

                    if imgui.Button(label) then
                        currentTopCategory = topCat
                        currentSubfile     = subfile
                        current_mission    = mission
                        search_query       = ""
                        search_results     = T{}
                    end
                    imgui.PopStyleColor(4)
                end
            end
            imgui.Separator()
        else
            -- Normal Navigation
            if not currentTopCategory then
                imgui.Text('Select a top category:')
                for category, _ in pairs(quest_data) do
                    if imgui.Button(category) then
                        currentTopCategory = category
                    end
                end

            elseif not currentSubfile then
                imgui.Text('Category: ' .. currentTopCategory)
                imgui.Separator()
                imgui.Text('Select a Subfile:')
                if not quest_data[currentTopCategory] then
                    imgui.TextColored({1,0,0,1}, 'No subfiles found in ' .. currentTopCategory)
                else
                    local subKeys = get_sorted_keys(quest_data[currentTopCategory])
                    for _, sfName in ipairs(subKeys) do
                        local complete = is_subfile_complete(currentTopCategory, sfName)
                        if complete then imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5}) end
                        local label = sfName
                        if complete then label = label .. " (Complete!)" end
                        if imgui.Button(label) then currentSubfile = sfName end
                        if complete then imgui.PopStyleColor() end
                    end
                end
                if imgui.Button("Back to Categories") then currentTopCategory = nil end

            elseif not current_mission then
                imgui.Text('Category: ' .. currentTopCategory)
                imgui.Text('Subfile:  ' .. currentSubfile)
                imgui.Separator()
                local subData = quest_data[currentTopCategory][currentSubfile]
                if not subData then
                    imgui.TextColored({1,0,0,1}, 'No missions found in ' .. currentSubfile)
                else
                    imgui.Text('Select a mission:')
                    local missionKeys = get_sorted_keys(subData)
                    for _, mname in ipairs(missionKeys) do
                        local complete = is_mission_complete(currentTopCategory, currentSubfile, mname)
                        if complete then imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5}) end
                        local label = mname
                        if complete then label = label .. " (Complete!)" end
                        if imgui.Button(label) then current_mission = mname end
                        if complete then imgui.PopStyleColor() end
                    end
                end
                if imgui.Button("Back to Subfiles") then currentSubfile = nil end

            else
                -- Images drawer toggle
                if showImagesDrawer then
                    if imgui.Button("<##drawerToggle") then showImagesDrawer = false end
                    imgui.SameLine(); imgui.Text("Hide Images")
                else
                    if imgui.Button(">##drawerToggle") then showImagesDrawer = true end
                    imgui.SameLine(); imgui.Text("Show Images")
                end
                imgui.Separator()

                imgui.Text('Top Category: ' .. currentTopCategory)
                imgui.Text('Subfile: ' .. currentSubfile)
                imgui.Text('Mission: ' .. current_mission)
                imgui.Separator()

                local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
                local steps  = missionData.steps or {}
                local reward = missionData.reward

                -- Progress readout
                local pct, done, tot = calculate_progress(currentTopCategory, currentSubfile, current_mission)
                local barCount = 0
                if tot > 0 then barCount = math.floor((pct / 100) * 20); if barCount > 20 then barCount = 20 end end
                imgui.Text('[' .. string.rep('|', barCount) .. string.rep(' ', 20 - barCount) .. '] ' .. string.format("%.2f%% (%d/%d steps)", pct, done, tot))
                imgui.Separator()

                -- Steps
                for i = 1, #steps do
                    local step_data = steps[i]
                    local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
                    local st = get_step_state(currentTopCategory, currentSubfile, current_mission, i)
                    local cbLabel = string.format("##step_%d", i)
                    local ref = { st }
                    if imgui.Checkbox(cbLabel, ref) then
                        set_step_state(currentTopCategory, currentSubfile, current_mission, i, ref[1])
                    end
                    imgui.SameLine()
                    if ref[1] then
                        imgui.TextColored({0,1,0,1}, wrap_text(text, 60))
                    else
                        imgui.Text(wrap_text(text, 60))
                    end
                end

                -- Rewards
                if reward then
                    if type(reward.text) == 'string' and reward.text ~= "" then
                         imgui.TextColored({0.8,0.8,0,1}, "Rewards:")
                         imgui.TextWrapped(reward.text)
                    end
                    if type(reward.items) == 'table' and #reward.items > 0 then
                        if not reward.text or reward.text == "" then
                            imgui.TextColored({0.8,0.8,0,1}, "Rewards:")
                        end
                        for i, item_data in ipairs(reward.items) do
                            imgui.Separator()
                            if type(item_data) == 'table' and item_data.name then
                                if imgui.TreeNode(item_data.name .. "##rewarditem" .. i) then
                                    imgui.TextColored({0.8,0.8,0,1},"  Name: ");  imgui.SameLine(); imgui.TextWrapped(item_data.name)
                                    if item_data.type then imgui.TextColored({0.8,0.8,0,1},"  Type: "); imgui.SameLine(); imgui.TextWrapped(item_data.type) end
                                    if item_data.races then imgui.TextColored({0.8,0.8,0,1},"  Race: "); imgui.SameLine(); imgui.TextWrapped(item_data.races) end
                                    if item_data.stats then imgui.TextColored({0.8,0.8,0,1},"  Stat: "); imgui.SameLine(); imgui.TextWrapped(table.concat(item_data.stats, ", ")) end
                                    if item_data.level then imgui.TextColored({0.8,0.8,0,1},"  Lvl.: "); imgui.SameLine(); imgui.TextWrapped(item_data.level) end
                                    if item_data.jobs then imgui.TextColored({0.8,0.8,0,1},"  Jobs: "); imgui.SameLine(); imgui.TextWrapped(item_data.jobs) end
                                    if item_data.note then imgui.TextColored({0.8,0.8,0,1},"  Note: "); imgui.SameLine(); imgui.TextWrapped(item_data.note) end
                                    imgui.TreePop()
                                end
                            end
                        end
                        imgui.Separator()
                    end
                end
                -- End of REWARD section

                if imgui.Button("Back to Missions") then
                    current_mission = nil
                end
            end
        end
    end

    imgui.End()
    imgui.PopStyleColor(5)

    -- IMAGE DRAWER
    if not window_open then
        showImagesDrawer = false
        return
    end
    if not showImagesDrawer then return end

    if currentTopCategory and currentSubfile and current_mission then
        local attachX = lastMainX - lastMainW + 50
        local attachY = lastMainY
        imgui.SetNextWindowPos({attachX, attachY}, ImGuiCond_Always)
        imgui.SetNextWindowSizeConstraints({200, 100}, {800, 600})
        local drawerFlags = bit.bor(
            ImGuiWindowFlags_NoTitleBar, ImGuiWindowFlags_NoResize, ImGuiWindowFlags_NoMove,
            ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoBackground,
            ImGuiWindowFlags_NoDecoration, ImGuiWindowFlags_AlwaysAutoResize
        )

        if imgui.Begin("##ImagesDrawer", true, drawerFlags ) then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            local step_imgs = get_images_for_step(currentTopCategory, currentSubfile, current_mission, step_idx)

            for _, img_data in ipairs(step_imgs) do
                local tex_ptr = image_loader.GetTexture(img_data.file)
                if tex_ptr then
                    local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                    local w = img_data.width or 200
                    local h = img_data.height or 100
                    local imageX, imageY = imgui.GetCursorScreenPos()
                    imgui.Image(tex_id, {w, h})

                    if img_data.highlights then
                        local drawList = imgui.GetWindowDrawList()
                        for _, highlight in ipairs(img_data.highlights) do
                            local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
                            if letter and numStr then
                                local colIndex = (letter:byte() - 65) + 1
                                local rowIndex = tonumber(numStr)
                                local cellW, cellH = w / 16, h / 16
                                local offsetX, offsetY = highlight.offsetX or 0, highlight.offsetY or 0
                                local centerX = imageX + (colIndex - 0.5) * cellW + offsetX
                                local centerY = imageY + (rowIndex - 0.5) * cellH + offsetY
                                local halfBox = 16
                                local x1, y1 = centerX - halfBox, centerY - halfBox
                                local x2, y2 = centerX + halfBox, centerY + halfBox
                                local colorFill, colorOutline = 0x5500FF00, 0xFFFFFFFF
                                drawList:AddRectFilled({x1, y1}, {x2, y2}, colorFill)
                                drawList:AddRect({x1, y1}, {x2, y2}, colorOutline)
                            end
                        end
                    end
                    imgui.Spacing()
                else
                    imgui.TextColored({1,0,0,1}, "(Missing image: " .. tostring(img_data.file) .. ")")
                end
            end
        end
        imgui.End()
    end
end)

--------------------------------------------------------------------------------
-- Commands / Events - MERGED
--------------------------------------------------------------------------------
ashita.events.register('command', 'command_callback', function(e)
    local args = e.command:args()
    if not args[1] then return false end

    local command_base = args[1]:gsub("^/", ""):lower()

    if command_base == 'questhelper' then
        is_open = not is_open
        e.blocked = true
        return true
    end

    if command_base == 'qh_zone_id' then
        local mem = AshitaCore:GetMemoryManager()
        if mem and mem:GetParty() then
            local zone_id = mem:GetParty():GetMemberZone(0)
            print(string.format("[%s] Current Zone ID: %d", addon.name, zone_id))
        else
            print(string.format("[%s] Could not retrieve zone ID.", addon.name))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_events' then
        if not current_mission then
            print(string.format("[%s] No mission selected.", addon.name))
            e.blocked = true
            return true
        end
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if not missionData or not missionData.steps then
            print(string.format("[%s] No steps found for current mission.", addon.name))
            e.blocked = true
            return true
        end

        print(string.format("[%s] Available events for %s:", addon.name, current_mission))
        for i, step_data in ipairs(missionData.steps) do
            local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
            print(string.format("  Event ID %d: %s", i, text))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_trigger' then
        if not current_mission then
            print(string.format("[%s] No mission selected.", addon.name))
            e.blocked = true
            return true
        end
        local step_to_trigger = tonumber(args[2])
        if not step_to_trigger then
            print(string.format("[%s] Usage: /qh_trigger <step_number>", addon.name))
            e.blocked = true
            return true
        end

        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if not missionData or not missionData.steps or step_to_trigger > #missionData.steps or step_to_trigger < 1 then
            print(string.format("[%s] Invalid step number.", addon.name))
            e.blocked = true
            return true
        end

        print(string.format("[%s] Triggering events up to %d...", addon.name, step_to_trigger))
        for i = 1, step_to_trigger do
            if not get_step_state(currentTopCategory, currentSubfile, current_mission, i) then
                set_step_state(currentTopCategory, currentSubfile, current_mission, i, true)
            end
        end
        e.blocked = true
        return true
    end

    if command_base == 'onmob_target' or command_base == 'onmob_list' then
        print(string.format("[%s] Info: This command is disabled. Beams are now automatic based on your active quest step and data/locations.lua.", addon.name))
        e.blocked = true
        return true

    elseif command_base == 'onmob_getpos' then
        local mem = AshitaCore:GetMemoryManager()
        if not mem then
            print(string.format("[%s] MemoryManager not available for getpos.", addon.name))
            e.blocked = true; return true
        end

        if updatePlayerPosition(mem) then
            -- [FIXED] This line shows the REAL coordinates
            print(string.format("[%s] Player Position (Raw): X: %.2f, Y(Height): %.2f, Z(Depth): %.2f", addon.name, playerPosX, playerPosY_height, playerPosZ_depth))
            -- [FIXED] This line prints the SWAPPED coordinates, matching your locations.lua format
            print(string.format("[%s] For locations.lua: target_pos = { x = %.1f, y = %.1f, z = %.1f },", addon.name, playerPosX, playerPosZ_depth, playerPosY_height))
        else
            print(string.format("[%s] Failed to get player position.", addon.name))
        end
        e.blocked = true
        return true

    -- COMMANDS from OnMob v2.6.6
    elseif command_base == 'onmob_offset_x' then
        if args[2] then
            PLAYER_ARC_START_X_OFFSET = tonumber(args[2]) or PLAYER_ARC_START_X_OFFSET
            print(string.format("[%s] Player arc start X offset set to: %.2f", addon.name, PLAYER_ARC_START_X_OFFSET))
        else
            print(string.format("[%s] Current player arc start X offset: %.2f. Usage: /onmob_offset_x <value>", addon.name, PLAYER_ARC_START_X_OFFSET))
        end
        e.blocked = true; return true
    elseif command_base == 'onmob_offset_y' then
        if args[2] then
            PLAYER_ARC_START_Y_OFFSET_ON_PLAYER = tonumber(args[2]) or PLAYER_ARC_START_Y_OFFSET_ON_PLAYER
            print(string.format("[%s] Player arc start Y (Height component) offset set to: %.2f", addon.name, PLAYER_ARC_START_Y_OFFSET_ON_PLAYER))
        else
            print(string.format("[%s] Current player arc start Y (Height component) offset: %.2f. Usage: /onmob_offset_y <value>", addon.name, PLAYER_ARC_START_Y_OFFSET_ON_PLAYER))
        end
        e.blocked = true; return true
    elseif command_base == 'onmob_offset_z' then
        if args[2] then
            PLAYER_ARC_START_Z_OFFSET = tonumber(args[2]) or PLAYER_ARC_START_Z_OFFSET
            print(string.format("[%s] Player arc start Z (Depth component) offset set to: %.2f", addon.name, PLAYER_ARC_START_Z_OFFSET))
        else
            print(string.format("[%s] Current player arc start Z (Depth component) offset: %.2f. Usage: /onmob_offset_z <value>", addon.name, PLAYER_ARC_START_Z_OFFSET))
        end
        e.blocked = true; return true
    end

    return false
end)

ashita.events.register('load', 'load_callback', function()
    print(string.format("[%s] v%s loading...", addon.name, addon.version))
    load_quest_data()
    load_location_data()
    load_zone_data()
    -- [NEW] Load the quest icon texture
    questIconTexture = helpers.getTexture(addon.path .. 'assets/quest_icon.png')
    if not questIconTexture then
        print(string.format("[%s] WARNING: Could not load 'assets/quest_icon.png'. Quest icon will not be shown.", addon.name))
    end
    print(string.format("[%s] Data loaded. Use /questhelper to open.", addon.name))
    if ENABLE_VERBOSE_DEBUG then
        print(string.format("[%s] Player Arc Offsets (Y/Z Swapped): X=%.2f, Y(H)=%.2f, Z(D)=%.2f", addon.name, PLAYER_ARC_START_X_OFFSET, PLAYER_ARC_START_Y_OFFSET_ON_PLAYER, PLAYER_ARC_START_Z_OFFSET))
    end
end)

ashita.events.register('unload', 'unload_callback', function()

    settings.save(QUESTHELPER_ALIAS, quest_settings)

    print(string.format("[%s] Settings saved. Unloaded.", addon.name))

end)



local function read_uint16(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256)
end

local function read_uint32(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256) + (p[offset+2] * 65536) + (p[offset+3] * 16777216)
end

ashita.events.register('packet_in', 'qh_packet_in_cb', function(e)
    if e.id == 0x034 or e.id == 0x032 then -- Event or Interaction
        local event_id = read_uint16(e.data, 0x2C)
        print("QuestHelper Debug: Received Event ID: " .. tostring(event_id))
        local actor_id = read_uint32(e.data, 0x04)

        if not currentTopCategory or not currentSubfile or not current_mission then
            return
        end

        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]
                if type(step_data) == 'table' and step_data.trigger_on_event_id then
                    local trigger = step_data.trigger_on_event_id
                    local event_match = false
                    if type(trigger) == 'table' then
                        for _, id in ipairs(trigger) do
                            if event_id == id then
                                event_match = true
                                break
                            end
                        end
                    else -- It's a number
                        event_match = (event_id == trigger)
                    end

                    local npc_match = true -- Assume true if no npc id is specified
                    if step_data.trigger_on_npc_id then
                        npc_match = (actor_id == step_data.trigger_on_npc_id)
                    end

                    if event_match and npc_match then
                        local has_talk_trigger = false
                        if step_data.trigger_on_talk then
                            if type(step_data.trigger_on_talk) == 'string' and step_data.trigger_on_talk ~= '' then
                                has_talk_trigger = true
                            elseif type(step_data.trigger_on_talk) == 'table' and #step_data.trigger_on_talk > 0 then
                                has_talk_trigger = true
                            end
                        end

                        if not has_talk_trigger then
                            -- Case 1: Event trigger ONLY. Complete the step.
                            set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                        else
                            -- Case 2: Event AND Talk triggers. Mark event as done and check if talk is also done.
                            local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                            flags.event_complete = true
                            if flags.talk_complete then
                                set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                            end
                        end
                    end
                end
            end
        end
    end
end)

ashita.events.register('text_in', 'text_in_callback', function(e)
    -- This event fires for any incoming chat text.
    -- We check if the text corresponds to an NPC we are waiting to talk to for the current quest step.
    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]
                if type(step_data) == 'table' then
                    local trigger_npcs = step_data.trigger_on_talk

                    -- Check if the current step is waiting for a specific NPC to talk.
                    if trigger_npcs and e.message_modified then
                        local triggers = {}
                        if type(trigger_npcs) == 'string' then
                            table.insert(triggers, trigger_npcs)
                        elseif type(trigger_npcs) == 'table' then
                            triggers = trigger_npcs
                        end

                        for _, npc_name in ipairs(triggers) do
                            if type(npc_name) == 'string' and npc_name ~= "" then
                                local processed_trigger = npc_name:gsub("{player_name}", playerName)
                                if e.message_modified:contains(processed_trigger) then
                                    local has_event_trigger = step_data.trigger_on_event_id ~= nil

                                    if not has_event_trigger then
                                        -- Case 1: Talk trigger ONLY. Complete the step.
                                        set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                                    else
                                        -- Case 2: Talk AND Event triggers. Mark talk as done and check if event is also done.
                                        local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                                        flags.talk_complete = true
                                        if flags.event_complete then
                                            set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end

                    -- Check for item obtain trigger
                    local Wrapping = step_data.trigger_on_item_obtain
                    if trigger_item and e.message_modified then
                        local obtain_message = ""
                        if playerName ~= "" then
                            obtain_message = string.format("%s obtains a\nitem: %s.", playerName, trigger_item)
                        end
                        local purchase_message = string.format("%s for", trigger_item:lower())

                        if (obtain_message ~= "" and e.message_modified:contains(obtain_message)) or e.message_modified:contains(purchase_message) then
                            print("QuestHelper Debug: Matched item trigger for: " .. trigger_item)
                            set_step_state(currentTopCategory, currentSubfile, current_mission, step_idx, true)
                        end
                    end
                end
            end
        end
    end
end)
