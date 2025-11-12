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
local questIconTexture = nil -- [NEW] Variable to hold our icon texture

----------------------------------------------------------------------------------------------------
-- Configuration & Data (from OnMob v2.6.6)
----------------------------------------------------------------------------------------------------
-- Global Default Settings
local DEFAULT_USE_VERTICAL_BEACON = false
local DEFAULT_BEACON_HEIGHT = 15.0
local DEFAULT_BEACON_BASE_Y_OFFSET = 0.0

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

-- Runtime state for tracking the *current* NPC trigger
local currentQuestTriggerNPC = nil


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
    local party = mem:GetParty()
    local entityMgr = mem:GetEntity()
    if not party or not entityMgr then return false end
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

    local targetData = nil
    local targetStepText = nil

    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = get_current_step(currentTopCategory, currentSubfile, current_mission)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]

                if type(step_data) == 'table' then
                    targetStepText = step_data.text or ("Step " .. step_idx)
                    local target_ref = step_data.onmob_target

                    if type(target_ref) == 'table' then
                        targetData = target_ref
                    elseif type(target_ref) == 'string' then
                        if location_data[target_ref] then
                            targetData = location_data[target_ref]
                        else
                            if shouldPrintDebugNow then
                                print(string.format("[%s Debug] Error: Step references location key '%s', but it's not in locations.lua.", addon.name, target_ref))
                            end
                        end
                    end
                end
            end
        end
    end

    local drawActive = false

    if targetData then
        local npcNameToActuallyFindInGame = targetData.trigger_npc

        if not npcNameToActuallyFindInGame or npcNameToActuallyFindInGame == "" then
            drawActive = true
            if currentQuestTriggerNPC ~= "__NO_NPC_TRIGGER__" then
                if shouldPrintDebugNow then print(string.format("[%s Debug] Step target has no NPC trigger. Activating. Resetting animation.", addon.name)) end
                currentQuestTriggerNPC = "__NO_NPC_TRIGGER__"
                beamAppearProgress = 0.0
            end
        else
            local npcFoundThisFrame = false
            local foundNpcObjectName = nil

            if memManager then
                for i = 0, 1023 do
                    local entity = GetEntity(i)
                    if entity and entity.Name and entity.Name == npcNameToActuallyFindInGame then
                        npcFoundThisFrame = true
                        foundNpcObjectName = entity.Name
                        break
                    end
                end
            end

            if npcFoundThisFrame then
                drawActive = true
                if currentQuestTriggerNPC ~= foundNpcObjectName then
                    if shouldPrintDebugNow then print(string.format("[%s Debug] Game NPC '%s' for step acquired. Resetting animation.", addon.name, foundNpcObjectName)) end
                    currentQuestTriggerNPC = foundNpcObjectName
                    beamAppearProgress = 0.0
                end
                if shouldPrintDebugNow then print(string.format("[%s Debug] Game NPC Trigger Found: %s for Step: %s", addon.name, foundNpcObjectName, targetStepText)) end
            else
                if currentQuestTriggerNPC == npcNameToActuallyFindInGame then
                     if shouldPrintDebugNow then print(string.format("[%s Debug] Previously tracked game NPC '%s' for step lost.", addon.name, npcNameToActuallyFindInGame)) end
                end
                currentQuestTriggerNPC = nil
            end
        end
    else
        currentQuestTriggerNPC = nil
    end

    if drawActive then

        local useBeacon = (targetData.visual_mode == "beacon")
        if targetData.visual_mode == nil then
            useBeacon = DEFAULT_USE_VERTICAL_BEACON
        end

        local beaconHeight = targetData.beacon_height or DEFAULT_BEACON_HEIGHT
        local beaconBaseYOffset = targetData.beacon_base_y_offset or DEFAULT_BEACON_BASE_Y_OFFSET

        -- This is the logic from v1.5
        local effectiveTargetX = 0.0
        local effectiveTargetY_height = 0.0 -- This is the 'y' from the file (Z-Depth)
        local effectiveTargetZ_depth = 0.0  -- This is the 'z' from the file (Y-Height)

        if targetData.target_pos and type(targetData.target_pos) == 'table' then
            effectiveTargetX = targetData.target_pos.x or 0.0
            effectiveTargetY_height = targetData.target_pos.y or 0.0 -- Read Y from file (which is Z-Depth)
            effectiveTargetZ_depth = targetData.target_pos.z or 0.0  -- Read Z from file (which is Y-Height)
        else
             if shouldPrintDebugNow then print(string.format("[%s Debug] Error: Location data for step '%s' is missing 'target_pos' table.", addon.name, targetStepText)) end
        end

        local visualStartX, visualStartY_height, visualStartZ_depth
        local visualEndX, visualEndY_height, visualEndZ_depth

        if useBeacon then
            -- Beacon (Normal logic, but needs to use the un-swapped coords)
            visualStartX = effectiveTargetX
            visualStartY_height = effectiveTargetY_height + beaconBaseYOffset -- Use the real Y-Height (from file's 'y')
            visualStartZ_depth = effectiveTargetZ_depth                       -- Use the real Z-Depth (from file's 'z')

            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height + beaconBaseYOffset + beaconHeight -- Use the real Y-Height
            visualEndZ_depth = effectiveTargetZ_depth                                     -- Use the real Z-Depth
        else
            -- Arc (This is the exact logic from v1.5)
            visualStartX = playerPosX + PLAYER_ARC_START_X_OFFSET
            visualStartY_height = playerPosZ_depth + PLAYER_ARC_START_Y_OFFSET_ON_PLAYER -- Arc Start Height is based on Player's Z_Depth
            visualStartZ_depth = playerPosY_height + PLAYER_ARC_START_Z_OFFSET       -- Arc Start Depth is based on Player's Y_Height

            visualEndX = effectiveTargetX
            visualEndY_height = effectiveTargetY_height -- This reads 'y' from file (Z-Depth)
            visualEndZ_depth = effectiveTargetZ_depth   -- This reads 'z' from file (Y-Height)
        end

        if beamAppearProgress < 1.0 then
            beamAppearProgress = beamAppearProgress + (deltaTime / BEAM_APPEAR_DURATION)
            if beamAppearProgress > 1.0 then beamAppearProgress = 1.0 end
        end
        calculateDynamicColor()

        if shouldPrintDebugNow then
            local type = useBeacon and "Beacon" or "Arc"
            print(string.format("[%s Debug] Drawing %s for step '%s'. Start(X:%.1f YH:%.1f ZD:%.1f) End(X:%.1f YH:%.1f ZD:%.1f) Prog:%.2f", addon.name, type, targetStepText, visualStartX, visualStartY_height, visualStartZ_depth, visualEndX, visualEndY_height, visualEndZ_depth, beamAppearProgress))
        end

        -- This is the draw call from v1.5, which you said was perfect.
        -- It passes (X, Y-Height, Z-Depth) to the function, which is wrong,
        -- but it's what v1.5 did, so we will keep it.
        drawArcModule(visualStartX, visualStartZ_depth, visualStartY_height, visualEndX, visualEndZ_depth, visualEndY_height, ARGB_BEAM_COLOR, beamAppearProgress, true)

        -- [NEW] Draw the quest icon AFTER the arc
        if questIconTexture then
            local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
            local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

            -- **FIXED ICON LOGIC**
            -- We get the target's coordinates in the *real* 3D world format
            local targetWorldX = effectiveTargetX
            local targetWorldY = effectiveTargetZ_depth -- The REAL Y (from file's 'z')
            local targetWorldZ = effectiveTargetY_height -- The REAL Z (from file's 'y')

            -- Add offset to float it above the target's head
            targetWorldZ = targetWorldZ - 0.5 -- <-- You can adjust this value

            -- Convert 3D world pos to 2D screen pos
            -- helpers.worldToScreen correctly expects (X, Y-Height, Z-Depth)
            local sx, sy, sz = helpers.worldToScreen(targetWorldX, targetWorldZ, targetWorldY, view, projection)

            if sx and sz > 0 and sz < 1 then
                drawQuestIcon(sx, sy, 0.5, 1.0, 32, 0xFFFFFFFF) -- Draw 32x32 icon
            end
        end
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

    if command_base == 'onmob_target' or command_base == 'onmob_list' then
        print(string.format("[%s] Info: This command is disabled. Beams are now automatic based on your active quest step and data/locations.lua.", addon.name))
        e.blocked = true
        return true

    elseif command_base == 'onmob_mode' then
        if args[2] and args[2]:lower() == "beacon" then
            DEFAULT_USE_VERTICAL_BEACON = true
        elseif args[2] and args[2]:lower() == "arc" then
            DEFAULT_USE_VERTICAL_BEACON = false
        else
            DEFAULT_USE_VERTICAL_BEACON = not DEFAULT_USE_VERTICAL_BEACON
        end
        print(string.format("[%s] Global Default visual mode set to: %s.", addon.name, DEFAULT_USE_VERTICAL_BEACON and "Vertical Beacon" or "Arcing Beam"))
        beamAppearProgress = 0.0
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