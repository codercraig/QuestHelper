require('common')
addon.author   = 'Oxos'
addon.name     = 'QuestHelper'
addon.version  = '3.0'

local imgui        = require('imgui')
local settings     = require('settings')
local image_loader = require('images')
local ffi          = require('ffi')

--------------------------------------------------------------------------------
-- Constants / Settings
--------------------------------------------------------------------------------

-- Use an ALIAS for the settings file, so it doesn't conflict with other addons
local QUESTHELPER_ALIAS = 'QuestHelper_settings'

-- Default settings structure: storing whether steps are completed or not
local default_settings = T{
    step_states = T{ }
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

--------------------------------------------------------------------------------
-- Data from subfolders
--------------------------------------------------------------------------------
local quest_data = T{ }

--------------------------------------------------------------------------------
-- (Optional) JSON decoding function if you still use .json anywhere
--------------------------------------------------------------------------------
local function decode_json(json_str)
    local status, result = pcall(function()
        return load("return " .. json_str)()  -- interpret as Lua
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
    -- The top-level categories (subfolders):
    local directories = { 'Missions', 'Quests', 'Crafting', 'Fishing', 'NMs' }

    for _, subdir in ipairs(directories) do
        local folderPath = baseFolder .. subdir .. '/'

        -- If the subdir doesn't exist or is empty, no big deal:
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
                    -- Optionally handle .json the same way if you want:
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

-- Ensure nested keys exist in quest_settings
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
-- Text Wrapping (Optional Utility)
--------------------------------------------------------------------------------
local function wrap_text(text, max_length)
    local wrapped_text = {}
    for line in text:gmatch("[^\r\n]+") do  -- Split text by manual line breaks
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
-- Identify "Current Step" (the next uncompleted step)
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
    local mission_data = quest_data[topCat]
        and quest_data[topCat][subfile]
        and quest_data[topCat][subfile][mission]
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
-- Return all images for the "current" step of a mission
--------------------------------------------------------------------------------
local function get_images_for_step(topCat, subfile, mission, stepIndex)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then
        return {}
    end

    local step_data = mdata.steps[stepIndex]
    if type(step_data) == 'table' and step_data.images then
        -- If we only want images exactly matching stepIndex => if image_info.state == stepIndex
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
-- H-7 style coordinate helper (for drawing highlights)
--------------------------------------------------------------------------------
local function letter_to_col(letter)
    letter = letter:upper() -- 'H' -> ASCII 72
    return (letter:byte() - 65) + 1
end

local function display_mission_text(text)
    for line in text:gmatch("[^\r\n]+") do
        if line:match("^%*%*.-%*%*") then
            imgui.TextColored({0.8, 0.8, 0, 1}, line)  -- Highlight titles in yellow
        elseif line:match("^  %-") then
            imgui.Text("    " .. line)  -- Indent bullets
        else
            imgui.Text(line)
        end
    end
end

--------------------------------------------------------------------------------
-- Main Rendering
--------------------------------------------------------------------------------
ashita.events.register('d3d_present', 'present_callback', function()
    if not is_open then return end

    local is_open_ref = { is_open }
    imgui.SetNextWindowSizeConstraints({ 300, 200 }, { 600, 800 })
    local window_open = imgui.Begin('Quest Helper', is_open_ref, ImGuiWindowFlags_AlwaysAutoResize)

    local mainX, mainY = imgui.GetWindowPos()
    local mainW, mainH = imgui.GetWindowSize()

    if window_open then
        -- TOP LEVEL: If no top category is selected, list them: "Missions", "Quests", etc.
        if not currentTopCategory then
            imgui.Text('Select a top category:')
            for category, _ in pairs(quest_data) do
                if imgui.Button(category) then
                    currentTopCategory = category

                    -- Directly load content for NMs and similar categories
                    if category == "NMs" or category == "Crafting" or category == "Fishing" then
                        current_category = category
                    end
                end
            end

        -- SECOND LEVEL: Show subfiles in that category
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

            if imgui.Button("Back to Top-Level") then
                currentTopCategory = nil
            end

        -- THIRD LEVEL: We have a category & subfile, but no mission selected
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

        -- FOURTH LEVEL: Show steps & reward for the selected mission
        else
            -- Drawer toggle
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
            local steps = missionData.steps or {}
            local reward = missionData.reward

            -- Show progress
            local pct, done, tot = calculate_progress(currentTopCategory, currentSubfile, current_mission)
            local pct_text = string.format("%.2f%% (%d/%d steps)", pct, done, tot)
            imgui.Text('[' ..
                string.rep('|', math.floor(pct / 5)) ..
                string.rep(' ', 20 - math.floor(pct / 5)) ..
                '] ' .. pct_text
            )
            imgui.Separator()

            -- Steps
            for i = 1, #steps do
                local step_data = steps[i]
                local text = (type(step_data) == 'table' and step_data.text) and step_data.text or tostring(step_data)

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

            -- Reward display
            if reward then
                if type(reward) == 'string' then
                    imgui.TextColored({0.8, 0.8, 0, 1}, "Reward: " .. reward)
                elseif type(reward) == 'table' then
                    local rtxt = reward.text or "None"
                    imgui.TextColored({0.8, 0.8, 0, 1}, "Reward: " .. rtxt)

                    -- If there's an images array, display them
                    if reward.images then
                        for _, image_info in ipairs(reward.images) do
                            local tex_ptr = image_loader.GetTexture(image_info.file)
                            if tex_ptr then
                                local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                                local w = image_info.width or 200
                                local h = image_info.height or 100

                                imgui.Image(tex_id, { w, h })

                                -- If you want highlights for the reward image:
                                if image_info.highlights then
                                    local imageX, imageY = imgui.GetCursorScreenPos()
                                    local drawList = imgui.GetWindowDrawList()

                                    -- Example highlight code:
                                    for _, highlight in ipairs(image_info.highlights) do
                                        local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
                                        if letter and numStr then
                                            -- Convert letter -> column
                                            -- Then do the same highlight box logic
                                        end
                                    end
                                end

                                imgui.Spacing()
                            else
                                imgui.TextColored({1, 0, 0, 1}, "(Missing image: " .. tostring(image_info.file) .. ")")
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

    imgui.End()
    is_open = is_open_ref[1]

    ----------------------------------------------------------------------------
    -- Images Drawer (Only if we want the "current step" images shown)
    ----------------------------------------------------------------------------
    if showImagesDrawer and currentTopCategory and currentSubfile and current_mission then
        local cs = get_current_step(currentTopCategory, currentSubfile, current_mission)
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        local totalSteps = (missionData and missionData.steps) and #missionData.steps or 0

        if cs <= totalSteps then
            local images_for_step = get_images_for_step(currentTopCategory, currentSubfile, current_mission, cs)
            if #images_for_step > 0 then
                local attachX = mainX + mainW + 5
                local attachY = mainY

                imgui.SetNextWindowPos({attachX, attachY}, ImGuiCond_Always)
                imgui.SetNextWindowSizeConstraints({200,100}, {800,800})

                local drawerFlags = bit.bor(
                    ImGuiWindowFlags_NoTitleBar,
                    ImGuiWindowFlags_NoResize,
                    ImGuiWindowFlags_NoMove,
                    ImGuiWindowFlags_NoCollapse,
                    ImGuiWindowFlags_AlwaysAutoResize
                )

                if imgui.Begin("ImagesDrawer", nil, drawerFlags) then
                    for _, img_data in ipairs(images_for_step) do
                        local tex_ptr = image_loader.GetTexture(img_data.file)
                        if tex_ptr then
                            local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                            local w = img_data.width or 200
                            local h = img_data.height or 100

                            local imageX, imageY = imgui.GetCursorScreenPos()
                            imgui.Image(tex_id, { w, h })

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

                                        local boxSize   = 32
                                        local halfBox   = boxSize * 0.5
                                        local x1        = centerX - halfBox
                                        local y1        = centerY - halfBox
                                        local x2        = centerX + halfBox
                                        local y2        = centerY + halfBox

                                        local colorFill    = 0x5500FF00  -- translucent green
                                        local colorOutline = 0xFFFFFFFF  -- white

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
        end
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

    -- Toggle the UI on/off
    is_open = not is_open
    e.blocked = true
end)

ashita.events.register('load', 'load_callback', function()
    load_quest_data()
end)

ashita.events.register('unload', 'unload_callback', function()
    settings.save(QUESTHELPER_ALIAS, quest_settings)
end)
