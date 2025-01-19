require('common')
addon.author   = 'Oxos'
addon.name     = 'QuestHelper'
addon.version  = '3.0'

local imgui        = require('imgui')
local settings     = require('settings')
local image_loader = require('images')
local ffi          = require('ffi')

-- Use an ALIAS for the settings file, like "QuestHelper_settings"
local QUESTHELPER_ALIAS = 'QuestHelper_settings'

local default_settings = T{
    step_states = T{}
}
local quest_settings = settings.load(default_settings, QUESTHELPER_ALIAS)

-- Current UI states
local current_category   = nil
local current_mission    = nil
local is_open            = false
local showImagesDrawer   = true  -- We'll start with the drawer open

-- Data from JSON
local quest_data = T{}

--------------------------------------------------------------------------------
-- JSON Loading
--------------------------------------------------------------------------------
local function decode_json(json_str)
    local status, result = pcall(function()
        return load("return " .. json_str)()
    end)
    if status then
        return result
    else
        print('Failed to parse JSON:', result)
        return nil
    end
end

local function load_quest_data()
    local folder = string.format('%saddons/%s/data/', AshitaCore:GetInstallPath(), addon.name)
    for file_name in io.popen('dir "' .. folder .. '" /b'):lines() do
        if file_name:match('%.json$') then
            local filepath = folder .. file_name
            local f = io.open(filepath, 'r')
            if f then
                local content = f:read('*all')
                f:close()
                local data = decode_json(content)
                if data then
                    local category_name = file_name:gsub('%.json$', '')
                    quest_data[category_name] = T(data)
                else
                    print(string.format('Error parsing JSON file: %s', filepath))
                end
            else
                print(string.format('Error opening file: %s', filepath))
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Utility
--------------------------------------------------------------------------------
local function get_sorted_keys(t)
    local keys = {}
    for k in pairs(t) do
        -- make sure we only call table.sort once for the keys
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
-- Text Wrapping
--------------------------------------------------------------------------------
local function wrap_text(text, max_length)
    local wrapped_text = {}
    local start = 1
    while start <= #text do
        local next_break = start + max_length - 1
        if next_break >= #text then
            table.insert(wrapped_text, text:sub(start))
            break
        end
        local space_pos = text:sub(start, next_break):match("^.*() ")
        if not space_pos then
            space_pos = max_length
        end
        local segment = text:sub(start, start + space_pos - 1)
        table.insert(wrapped_text, segment)
        start = start + space_pos
    end
    return table.concat(wrapped_text, "\n")
end

--------------------------------------------------------------------------------
-- Step Completion
--------------------------------------------------------------------------------
local function get_step_state(category, mission, step)
    local path = ensure_key_path(quest_settings.step_states, category, mission)
    return path[step] or false
end

local function set_step_state(category, mission, step, state)
    local path = ensure_key_path(quest_settings.step_states, category, mission)
    path[step] = state
    print(string.format("Saving step: %s -> %s -> Step %d = %s", category, mission, step, tostring(state)))
    settings.save(QUESTHELPER_ALIAS, quest_settings)
end

--------------------------------------------------------------------------------
-- Completion Checks
--------------------------------------------------------------------------------
local function is_category_complete(category)
    local missions = quest_data[category]
    if not missions then return false end
    for mission_name, mission_data in pairs(missions) do
        local steps = mission_data.steps or {}
        for i = 1, #steps do
            if not get_step_state(category, mission_name, i) then
                return false
            end
        end
    end
    return true
end

local function is_mission_complete(category, mission)
    local mission_data = quest_data[category][mission]
    if not mission_data then return false end

    local steps = mission_data.steps or {}
    for i=1, #steps do
        if not get_step_state(category, mission, i) then
            return false
        end
    end
    return true
end

--------------------------------------------------------------------------------
-- Progress
--------------------------------------------------------------------------------
local function calculate_progress(category, mission)
    local steps = quest_data[category][mission].steps or {}
    local completed = 0
    for i = 1, #steps do
        if get_step_state(category, mission, i) then
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
-- Gathering Images
--------------------------------------------------------------------------------
local function get_all_images_for_mission(category, mission)
    local imgs = {}
    local mdata = quest_data[category] and quest_data[category][mission]
    if not mdata then return imgs end

    -- Check steps
    if mdata.steps then
        for _, step_info in ipairs(mdata.steps) do
            if type(step_info) == 'table' then
                if step_info.images then -- Check for "images" (multiple maps per step)
                    for _, image in ipairs(step_info.images) do
                        table.insert(imgs, image)
                    end
                elseif step_info.image then -- Fallback for single "image"
                    table.insert(imgs, step_info.image)
                end
            end
        end
    end

    -- Check reward
    if mdata.reward then
        if type(mdata.reward) == 'table' then
            if mdata.reward.images then
                for _, rimg in ipairs(mdata.reward.images) do
                    table.insert(imgs, rimg)
                end
            end
            if mdata.reward.image then
                table.insert(imgs, mdata.reward.image)
            end
        end
    end

    return imgs
end

--------------------------------------------------------------------------------
-- H-7 style coordinate helper
--------------------------------------------------------------------------------
local function letter_to_col(letter)
    letter = letter:upper() -- e.g. 'H' -> ASCII 72
    return (letter:byte() - 65) + 1
end

--------------------------------------------------------------------------------
-- (Optional) Player Position
--------------------------------------------------------------------------------
local function getPlayerPosition()
    -- Example usage if you want real coords from memory:
    local entityMgr = AshitaCore:GetMemoryManager():GetEntity()
    if not entityMgr then return nil,nil end

    local partyMgr = AshitaCore:GetMemoryManager():GetParty()
    local meIndex = partyMgr:GetMemberTargetIndex(0)
    if meIndex == 0xFFFFFFFF or meIndex < 0 or meIndex > 2303 then
        return nil,nil
    end

    local px = entityMgr:GetLocalX(meIndex)
    local py = entityMgr:GetLocalZ(meIndex)
    return px, py
end

--------------------------------------------------------------------------------
-- Main Rendering
--------------------------------------------------------------------------------
ashita.events.register('d3d_present', 'present_callback', function()
    if not is_open then return end

    local is_open_ref = { is_open }

    -- Main QuestHelper Window
    imgui.SetNextWindowSizeConstraints({ 300, 200 }, { 600, 800 })
    local window_open = imgui.Begin('Quest Helper', is_open_ref, ImGuiWindowFlags_AlwaysAutoResize)

    -- Avoid sugar math: get numeric coords
    local mainX, mainY = imgui.GetWindowPos()
    local mainW, mainH = imgui.GetWindowSize()

    if window_open then
        -- 1) No Category => Show Category Buttons
        if not current_category then
            imgui.Text('Select a category:')
            for category, _ in pairs(quest_data) do
                local cat_complete = is_category_complete(category)
                local label = category
                if cat_complete then
                    label = label .. " (Complete!)"
                    imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5})
                end

                if imgui.Button(label) then
                    current_category = category
                end

                if cat_complete then
                    imgui.PopStyleColor()
                end
            end

        -- 2) Category Selected => Show Missions
        elseif not current_mission then
            imgui.Text('Category: ' .. current_category)
            imgui.Separator()
            imgui.Text('Select a mission:')

            local missionKeys = get_sorted_keys(quest_data[current_category])
            for _, mname in ipairs(missionKeys) do
                local complete = is_mission_complete(current_category, mname)
                local label = mname
                if complete then
                    label = label .. " (Complete!)"
                    imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5})
                end

                if imgui.Button(label) then
                    current_mission = mname
                end

                if complete then
                    imgui.PopStyleColor()
                end
            end

            if imgui.Button("Back to Categories") then
                current_category = nil
            end

        -- 3) Mission Selected => Show Steps, Rewards, Drawer Toggle
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

            imgui.Text('Mission: ' .. current_mission)
            imgui.Separator()

            local missionData = quest_data[current_category][current_mission]
            local steps = missionData.steps or {}
            local reward = missionData.reward

            -- Progress bar
            local pct, done, tot = calculate_progress(current_category, current_mission)
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
                local text = ""
                if type(step_data) == 'table' then
                    text = step_data.text or string.format("Step %d (No text)", i)
                else
                    text = tostring(step_data)
                end

                local st = get_step_state(current_category, current_mission, i)
                local cbLabel = string.format("##step_%d", i)
                local ref = { st }
                if imgui.Checkbox(cbLabel, ref) then
                    set_step_state(current_category, current_mission, i, ref[1])
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
                end
            else
                imgui.TextColored({0.8,0.8,0,1}, "Reward: None")
            end

            if imgui.Button("Back to Mission List") then
                current_mission = nil
            end
        end
    end

    imgui.End()
    is_open = is_open_ref[1]

    -- Attached Images "Drawer"
    if showImagesDrawer and current_category and current_mission then
        local images_for_mission = get_all_images_for_mission(current_category, current_mission)
        if #images_for_mission > 0 then
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

                -- (Optional) read player's in-game position:
                -- local px, py = getPlayerPosition()
                -- if px and py then
                --     imgui.Text(string.format("Player coords: %.1f, %.1f", px, py))
                -- end

                for _, img_data in ipairs(images_for_mission) do
                    local tex_ptr = image_loader.GetTexture(img_data.file)
                    if tex_ptr then
                        local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                        local w = img_data.width or 200
                        local h = img_data.height or 100

                        local imageX, imageY = imgui.GetCursorScreenPos()
                        imgui.Image(tex_id, { w, h })

                        -- Handle multiple highlights for each map
                        if img_data.highlights then
                            for _, highlight in ipairs(img_data.highlights) do
                                local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
                                if letter and numStr then
                                    local colIndex = letter_to_col(letter)
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

                                    local drawList  = imgui.GetWindowDrawList()
                                    local colorFill    = 0x5500FF00
                                    local colorOutline = 0xFFFFFFFF

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
    is_open = not is_open
    e.blocked = true
end)

ashita.events.register('load', 'load_callback', function()
    load_quest_data()
end)

ashita.events.register('unload', 'unload_callback', function()
    settings.save(QUESTHELPER_ALIAS, quest_settings)
end)
