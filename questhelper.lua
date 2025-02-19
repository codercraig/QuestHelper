require('common')
addon.author   = 'Oxos'
addon.name     = 'QuestHelper'
addon.version  = '1.0'

local imgui        = require('imgui')
local settings     = require('settings')
local image_loader = require('images')
local ffi          = require('ffi')
local bit          = require('bit') -- For bit.bor if needed

--------------------------------------------------------------------------------
-- Constants / Settings
--------------------------------------------------------------------------------

local QUESTHELPER_ALIAS = 'QuestHelper_settings'

local default_settings = T{
    step_states = T{}
}

-- Load settings from disk
local quest_settings = settings.load(default_settings, QUESTHELPER_ALIAS)

--------------------------------------------------------------------------------
-- Current UI states
--------------------------------------------------------------------------------
local currentTopCategory = nil   -- e.g. "Missions", "Quests", "Fishing"
local currentSubfile     = nil   -- e.g. "BastokMissions"
local current_mission    = nil   -- e.g. "1-1: The Zeruhn Report"
local is_open            = false -- Whether the UI window is open
local showImagesDrawer   = true  -- Toggle for the side image drawer

-- We’ll track last-known main window coords/sizes so we can “attach” the images drawer properly:
local lastMainX, lastMainY = 300, 200
local lastMainW, lastMainH = 400, 600

--------------------------------------------------------------------------------
-- Search Feature: We store the query and results
--------------------------------------------------------------------------------
local search_query   = ""  -- The user’s search string
local search_results = T{} -- Matches (lowest-level missions/quests only)

--------------------------------------------------------------------------------
-- Data from subfolders
--------------------------------------------------------------------------------
local quest_data = T{}

--------------------------------------------------------------------------------
-- Optional JSON decode (if needed)
--------------------------------------------------------------------------------
local function decode_json(json_str)
    local status, result = pcall(function()
        return load("return " .. json_str)()  -- interpret as Lua code
    end)
    if status then
        return result
    else
        print('Failed to parse data file:', result)
        return nil
    end
end

--------------------------------------------------------------------------------
-- Load quest/guide data from subdirectories
--------------------------------------------------------------------------------
local function load_quest_data()
    local baseFolder = string.format('%saddons/%s/data/', AshitaCore:GetInstallPath(), addon.name)
    local directories = { 'Missions', 'Quests', 'Jobs' , 'Crafting', 'Fishing', 'NMs', 'Custom' }

    for _, subdir in ipairs(directories) do
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
                            print(string.format('Error running file: %s -> %s', filepath, err))
                        end
                    else
                        print(string.format('Error loading Lua file: %s -> %s', filepath, err))
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
-- Utility
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
-- Text Wrapping (Optional)
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
-- Step Completion: Get / Set
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
-- Identify "Current Step" (next uncompleted)
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
-- Completion Checks
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
    if not mission_data then
        return false
    end
    local steps = mission_data.steps or {}
    for i = 1, #steps do
        if not get_step_state(topCat, subfile, mission, i) then
            return false
        end
    end
    return true
end

--------------------------------------------------------------------------------
-- Progress
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
-- Return images for the "current" step
--------------------------------------------------------------------------------
local function get_images_for_step(topCat, subfile, mission, stepIndex)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then
        return {}
    end

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
-- Search the lowest-level mission/quest names
--------------------------------------------------------------------------------
local function perform_search()
    search_results = T{}

    local query = (search_query or ""):lower()
    if query == "" then
        return
    end

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
-- Main Rendering
--------------------------------------------------------------------------------
ashita.events.register('d3d_present', 'present_callback', function()
    -- If the main window is not open, do nothing (including images)
    if not is_open then
        return
    end

    -- Push style
    imgui.PushStyleColor(ImGuiCol_WindowBg, {0.1, 0.1, 0.1, 0.73})
    imgui.PushStyleColor(ImGuiCol_CheckMark, {0.8, 0.8, 0.8, 1.0})
    imgui.PushStyleColor(ImGuiCol_FrameBg, {0.3, 0.3, 0.3, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgHovered, {0.5, 0.5, 0.5, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgActive, {0.7, 0.7, 0.7, 1.0})

    -- Main "Quest Helper" window
    -- NOTE: We use AlwaysAutoResize or constraints as you prefer:
    -- Instead of constraints, force a 400x600, no user resize
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
        -- Track main window position & size for drawer attachment
        mainX, mainY = imgui.GetWindowPos()
        mainW, mainH = imgui.GetWindowSize()

        -- Save them so we can re-attach if the user toggles images or something
        if mainW > 0 and mainH > 0 then
            lastMainX = mainX
            lastMainY = mainY
            lastMainW = mainW
            lastMainH = mainH
        end

        ----------------------------------------------------------------------
        -- SEARCH BAR (Always on top)
        ----------------------------------------------------------------------
        imgui.Text("Search Missions/Quests (lowest-level):")
        local input_buf = { search_query }
        if imgui.InputText("##SearchQuest", input_buf, 256) then
            search_query = input_buf[1]
            perform_search()
        end
        imgui.Separator()

        ----------------------------------------------------------------------
        -- If searching => Show results
        ----------------------------------------------------------------------
        if search_query ~= "" then
            if #search_results == 0 then
                imgui.TextColored({1,0,0,1}, "No matches found.")
            else
                imgui.TextColored({0,1,0,1}, "Search Results:")
                for _, result in ipairs(search_results) do
                    local topCat  = result.topCategory
                    local subfile = result.subfile
                    local mission = result.mission

                    -- Check completion:
                    local isComplete = is_mission_complete(topCat, subfile, mission)

                    -- Button label:
                    local label = string.format("[%s] %s -> %s", topCat, subfile, mission)

                    -- Push style colors for the button background and text:
                    if isComplete then
                        -- Green background, white text
                        imgui.PushStyleColor(ImGuiCol_Button,        {0, 1, 0, 0.5})
                        imgui.PushStyleColor(ImGuiCol_ButtonHovered, {0, 1, 0, 0.7})
                        imgui.PushStyleColor(ImGuiCol_ButtonActive,  {0, 1, 0, 0.9})
                        imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                    else
                        -- Red background, white text
                        imgui.PushStyleColor(ImGuiCol_Button,        {1, 0, 0, 0.5})
                        imgui.PushStyleColor(ImGuiCol_ButtonHovered, {1, 0, 0, 0.7})
                        imgui.PushStyleColor(ImGuiCol_ButtonActive,  {1, 0, 0, 0.9})
                        imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                    end

                    -- Create the button
                    if imgui.Button(label) then
                        currentTopCategory = topCat
                        currentSubfile     = subfile
                        current_mission    = mission
                        search_query       = ""
                        search_results     = T{}
                    end

                    -- Pop all style colors (4 pushes above)
                    imgui.PopStyleColor(4)
                end
            end
            imgui.Separator()
        else
            ------------------------------------------------------------------
            -- Normal Navigation (Categories → Subfiles → Missions)
            ------------------------------------------------------------------
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
                        if complete then
                            imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5})
                        end

                        local label = sfName
                        if complete then
                            label = label .. " (Complete!)"
                        end

                        if imgui.Button(label) then
                            currentSubfile = sfName
                        end

                        if complete then
                            imgui.PopStyleColor()
                        end
                    end
                end

                if imgui.Button("Back to Categories") then
                    currentTopCategory = nil
                end

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
                        if complete then
                            imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5})
                        end

                        local label = mname
                        if complete then
                            label = label .. " (Complete!)"
                        end

                        if imgui.Button(label) then
                            current_mission = mname
                        end

                        if complete then
                            imgui.PopStyleColor()
                        end
                    end
                end

                if imgui.Button("Back to Subfiles") then
                    currentSubfile = nil
                end

            else
                --------------------------------------------------------------
                -- Images drawer toggle (showImagesDrawer)
                --------------------------------------------------------------
                if showImagesDrawer then
                    if imgui.Button("<##drawerToggle") then
                        showImagesDrawer = false
                    end
                    imgui.SameLine()
                    imgui.Text("Hide Images")
                else
                    if imgui.Button(">##drawerToggle") then
                        showImagesDrawer = true
                    end
                    imgui.SameLine()
                    imgui.Text("Show Images")
                end
                imgui.Separator()

                imgui.Text('Top Category: ' .. currentTopCategory)
                imgui.Text('Subfile: ' .. currentSubfile)
                imgui.Text('Mission: ' .. current_mission)
                imgui.Separator()

                local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
                local steps  = missionData.steps or {}
                local reward = missionData.reward

                -- Show a simple progress readout
                local pct, done, tot = calculate_progress(currentTopCategory, currentSubfile, current_mission)
                local barCount = 0
                if tot > 0 then
                    barCount = math.floor((pct / 100) * 20)
                    if barCount > 20 then barCount = 20 end
                end
                imgui.Text('[' ..
                    string.rep('|', barCount) ..
                    string.rep(' ', 20 - barCount) ..
                    '] ' .. string.format("%.2f%% (%d/%d steps)", pct, done, tot)
                )
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

                imgui.Separator()

                -- Reward
                if reward then
                    if type(reward) == 'string' then
                        imgui.TextColored({0.8,0.8,0,1}, "Reward: " .. reward)
                    elseif type(reward) == 'table' then
                        local rtxt = reward.text or "None"
                        imgui.TextColored({0.8,0.8,0,1}, "Reward: " .. rtxt)
                        if reward.images then
                            for _, image_info in ipairs(reward.images) do
                                local tex_ptr = image_loader.GetTexture(image_info.file)
                                if tex_ptr then
                                    local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                                    local w = image_info.width or 200
                                    local h = image_info.height or 100
                                    imgui.Image(tex_id, { w, h })
                                    imgui.Spacing()
                                else
                                    imgui.TextColored({1,0,0,1}, "(Missing image: " .. tostring(image_info.file) .. ")")
                                end
                            end
                        end
                    end
                else
                    imgui.TextColored({0.8,0.8,0,1}, "Reward: None")
                end

                if imgui.Button("Back to Missions") then
                    current_mission = nil
                end
            end
        end
    end

    imgui.End()
    imgui.PopStyleColor(5)

    ----------------------------------------------------------------------------
    -- IMAGE DRAWER (Attaches to the right of main window)
    ----------------------------------------------------------------------------
    -- If the main window was fully closed/collapsed, we do NOT draw the images.
    if not window_open then
        -- Force it hidden when main window is collapsed/closed:
        showImagesDrawer = false
        return
    end

    -- If user has toggled showImagesDrawer off, skip
    if not showImagesDrawer then
        return
    end

    -- We only draw images if a mission is selected:
    if currentTopCategory and currentSubfile and current_mission then

        -- Position to the right side of the main window
        local attachX = lastMainX - lastMainW + 50
        local attachY = lastMainY

        imgui.SetNextWindowPos({attachX, attachY}, ImGuiCond_Always)
        imgui.SetNextWindowSizeConstraints({200, 100}, {800, 600})

        -- Use flags to remove the title bar, resize, decorations, etc.
        local drawerFlags = bit.bor(
            ImGuiWindowFlags_NoTitleBar,
            ImGuiWindowFlags_NoResize,
            ImGuiWindowFlags_NoMove,
            ImGuiWindowFlags_NoCollapse,
            --ImGuiWindowFlags_NoScrollbar,
            --ImGuiWindowFlags_NoScrollWithMouse,
            ImGuiWindowFlags_NoBackground,
            ImGuiWindowFlags_NoDecoration,     -- If your ImGui version supports it
            ImGuiWindowFlags_AlwaysAutoResize
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

                    -- If highlight boxes exist, draw them:
                    if img_data.highlights then
                        local drawList = imgui.GetWindowDrawList()
                        for _, highlight in ipairs(img_data.highlights) do
                            local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
                            if letter and numStr then
                                local colIndex = (letter:byte() - 65) + 1
                                local rowIndex = tonumber(numStr)
                                local cellCountX = 16
                                local cellCountY = 16
                                local cellW = w / cellCountX
                                local cellH = h / cellCountY

                                local offsetX = highlight.offsetX or 0
                                local offsetY = highlight.offsetY or 0
                                local centerX = imageX + (colIndex - 0.5) * cellW + offsetX
                                local centerY = imageY + (rowIndex - 0.5) * cellH + offsetY

                                local boxSize = 32
                                local halfBox = boxSize * 0.5
                                local x1 = centerX - halfBox
                                local y1 = centerY - halfBox
                                local x2 = centerX + halfBox
                                local y2 = centerY + halfBox

                                local colorFill    = 0x5500FF00 -- translucent green
                                local colorOutline = 0xFFFFFFFF -- white

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
-- Commands / Events
--------------------------------------------------------------------------------
ashita.events.register('command', 'command_callback', function(e)
    local args = {}
    for word in string.gmatch(e.command, '%S+') do
        table.insert(args, word)
    end

    if args[1] ~= '/questhelper' then
        return
    end

    -- Toggle the main Quest Helper window
    is_open = not is_open
    e.blocked = true
end)

ashita.events.register('load', 'load_callback', function()
    load_quest_data()
end)

ashita.events.register('unload', 'unload_callback', function()
    settings.save(QUESTHELPER_ALIAS, quest_settings)
end)
