-- Main UI window module
local ui_main = {}

local imgui = require('imgui')
local bit = require('bit')

-- ImGui Tree Node Flags
ImGuiTreeNodeFlags_DefaultOpen = 0x20  -- Default node to be open

-- ImGui Condition Flags
ImGuiCond_FirstUseEver = 2  -- Set the variable only on first use

-- ImGui Window Flags
ImGuiWindowFlags_AlwaysAutoResize = 0x40  -- Resize every frame based on content

-- Search functionality
local search_query = ""
local search_results = T{}

-- Inventory checking (periodic, not every frame)
local inventory_results = {} -- Cached results
local last_inventory_check = 0
local INVENTORY_CHECK_INTERVAL = 5.0 -- Check every 5 seconds

-- Settings window state
local show_settings_window = false

local function perform_search(quest_data)
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

-- Collects all unique items needed for entire quest with quantities
-- NOTE: Only collects from items_needed (not trigger_on_item_obtain)
-- trigger_on_item_obtain items are REWARDS/OUTCOMES, not items you need to bring
-- Returns: { {name = "Item Name", quantity = 2, alternatives = {...}}, ... }
--
-- Supported formats:
--   items_needed = "Dark Crystal"  -- qty 1
--   items_needed = {"Dark Crystal", "Lizard Egg"}  -- qty 1 each
--   items_needed = {
--       "Dark Crystal",
--       { item = "Lizard Egg", quantity = 6 },
--       { display = "Elemental Crystal", alternatives = {"Dark Crystal", "Wind Crystal", "Water Crystal"} }
--   }
local function getAllItemsNeeded(missionData)
    local allItems = {}
    local itemData = {}  -- { itemName = {quantity, alternatives} }

    if not missionData or not missionData.steps then return allItems end

    for _, step_data in ipairs(missionData.steps) do
        if type(step_data) == 'table' and step_data.items_needed then
            local items = step_data.items_needed

            -- Process items_needed (can be string, table of strings, or table with {item=, quantity=})
            if type(items) == 'string' then
                if not itemData[items] then
                    itemData[items] = { quantity = 0, alternatives = nil }
                end
                itemData[items].quantity = itemData[items].quantity + 1
            elseif type(items) == 'table' then
                for _, item in ipairs(items) do
                    if type(item) == 'string' then
                        -- Simple string format
                        if not itemData[item] then
                            itemData[item] = { quantity = 0, alternatives = nil }
                        end
                        itemData[item].quantity = itemData[item].quantity + 1
                    elseif type(item) == 'table' then
                        if item.display and item.alternatives then
                            -- Alias format: { display = "Elemental Crystal", alternatives = {"Dark Crystal", ...} }
                            local displayName = item.display
                            if not itemData[displayName] then
                                itemData[displayName] = { quantity = 0, alternatives = item.alternatives }
                            end
                            itemData[displayName].quantity = itemData[displayName].quantity + (item.quantity or 1)
                        elseif item.item then
                            -- Object format: { item = "Name", quantity = 6 }
                            local itemName = item.item
                            if not itemData[itemName] then
                                itemData[itemName] = { quantity = 0, alternatives = nil }
                            end
                            local qty = item.quantity or 1
                            itemData[itemName].quantity = itemData[itemName].quantity + qty
                        end
                    end
                end
            end
        end
    end

    -- Convert to array with quantities and alternatives
    for itemName, data in pairs(itemData) do
        table.insert(allItems, {
            name = itemName,
            quantity = data.quantity,
            alternatives = data.alternatives
        })
    end

    return allItems
end

-- Renders the main QuestHelper window
function ui_main.render(is_open, currentTopCategory, currentSubfile, current_mission, showImagesDrawer,
                       quest_data, quest_state, utils, inventory_cache, keyitem_module, keyitems_db)

    local settings = require('settings')
    local ui_settings = quest_state.settings.ui_settings

    imgui.PushStyleColor(ImGuiCol_WindowBg, {0.1, 0.1, 0.1, 0.73})
    imgui.PushStyleColor(ImGuiCol_CheckMark, {0.8, 0.8, 0.8, 1.0})
    imgui.PushStyleColor(ImGuiCol_FrameBg, {0.3, 0.3, 0.3, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgHovered, {0.5, 0.5, 0.5, 0.8})
    imgui.PushStyleColor(ImGuiCol_FrameBgActive, {0.7, 0.7, 0.7, 1.0})

    -- Dynamic window sizing based on collapsed state
    local window_height = 600  -- Default height
    if current_mission and not ui_settings.show_all_steps then
        -- Collapsed mode: Calculate height based on current step text
        local missionData = quest_data[currentTopCategory] and quest_data[currentTopCategory][currentSubfile] and quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
            local steps = missionData.steps

            -- Base height for UI elements (top bar, mission name, separators, etc.)
            local base_height = 150

            -- Get current step text
            if current_step_index and current_step_index <= #steps then
                local step_data = steps[current_step_index]
                local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)

                -- Estimate text height: ~60 chars per line, ~20px per line
                local text_length = #text
                local estimated_lines = math.ceil(text_length / 60)
                local text_height = estimated_lines * 20

                -- Add height for items/key items if present
                local items_height = 0
                local itemsNeeded = getAllItemsNeeded(missionData)
                if #itemsNeeded > 0 then
                    items_height = (#itemsNeeded * 25) + 40  -- ~25px per item + header
                end

                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 then
                    items_height = items_height + (#keyItemsNeeded * 25) + 40
                end

                -- Calculate total height
                window_height = base_height + text_height + items_height

                -- Minimum of 200px
                if window_height < 200 then
                    window_height = 200
                end
            else
                window_height = 250  -- Fallback
            end
        else
            window_height = 250  -- Fallback
        end
    else
        -- Expanded mode: Larger window for scrolling
        window_height = 600
    end

    -- Set initial size but allow auto-resize based on content
    imgui.SetNextWindowSize({600, window_height}, ImGuiCond_FirstUseEver)

    local mainFlags = bit.bor(
        ImGuiWindowFlags_NoCollapse,
        ImGuiWindowFlags_NoTitleBar,
        ImGuiWindowFlags_AlwaysAutoResize  -- Auto-resize based on content
    )
    local window_open = imgui.Begin('Quest Helper', nil, mainFlags)

    local mainX, mainY = 0, 0
    local mainW, mainH = 0, 0
    local new_showImagesDrawer = showImagesDrawer
    local new_currentTopCategory = currentTopCategory
    local new_currentSubfile = currentSubfile
    local new_current_mission = current_mission

    if window_open then
        mainX, mainY = imgui.GetWindowPos()
        mainW, mainH = imgui.GetWindowSize()

        -- STICKY TOP BAR: All control buttons in one line
        -- Images drawer toggle
        if showImagesDrawer then
            if imgui.Button("<##drawerToggle") then new_showImagesDrawer = false end
            imgui.SameLine(); imgui.Text("Hide Images")
        else
            if imgui.Button(">##drawerToggle") then new_showImagesDrawer = true end
            imgui.SameLine(); imgui.Text("Show Images")
        end

        -- Settings button
        imgui.SameLine()
        if imgui.SmallButton("\xE2\x9A\x99##Settings") then  -- ⚙ gear icon
            show_settings_window = not show_settings_window
        end

        -- Collapse/Expand Steps Toggle (only show when viewing a mission)
        if current_mission then
            imgui.SameLine()
            if ui_settings.show_all_steps then
                if imgui.SmallButton("[-] Collapse##CollapseToggle") then
                    ui_settings.show_all_steps = false
                    settings.save('QuestHelper_settings', quest_state.settings)
                end
            else
                if imgui.SmallButton("[+] Expand##CollapseToggle") then
                    ui_settings.show_all_steps = true
                    settings.save('QuestHelper_settings', quest_state.settings)
                end
            end

            -- Back to Missions button (on same line, right-aligned)
            imgui.SameLine()
            if imgui.Button("Back##BackToMissions") then
                new_current_mission = nil
            end
        end

        imgui.Separator()

        -- Begin scrollable content area (everything below the top bar scrolls)
        imgui.BeginChild("##ScrollableContent", {0, 0}, false, 0)

        -- SEARCH BAR (hide when viewing mission in collapsed mode to save space)
        local show_search = not (current_mission and not ui_settings.show_all_steps)
        if show_search then
            imgui.Text("Search Missions/Quests (lowest-level):")
            local input_buf = { search_query }
            if imgui.InputText("##SearchQuest", input_buf, 256) then
                search_query = input_buf[1]
                perform_search(quest_data)
            end
            imgui.Separator()
        end

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
                    local isComplete = quest_state.isMissionComplete(topCat, subfile, mission, quest_data)
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
                        new_currentTopCategory = topCat
                        new_currentSubfile     = subfile
                        new_current_mission    = mission
                        search_query           = ""
                        search_results         = T{}
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
                        new_currentTopCategory = category
                    end
                end

            elseif not currentSubfile then
                imgui.Text('Category: ' .. currentTopCategory)
                imgui.Separator()
                imgui.Text('Select a Subfile:')
                if not quest_data[currentTopCategory] then
                    imgui.TextColored({1,0,0,1}, 'No subfiles found in ' .. currentTopCategory)
                else
                    local subKeys = utils.get_sorted_keys(quest_data[currentTopCategory])
                    for _, sfName in ipairs(subKeys) do
                        local complete = quest_state.isSubfileComplete(currentTopCategory, sfName, quest_data)
                        if complete then imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5}) end
                        local label = sfName
                        if complete then label = label .. " (Complete!)" end
                        if imgui.Button(label) then new_currentSubfile = sfName end
                        if complete then imgui.PopStyleColor() end
                    end
                end
                if imgui.Button("Back to Categories") then new_currentTopCategory = nil end

            elseif not current_mission then
                imgui.Text('Category: ' .. currentTopCategory)
                imgui.Text('Subfile:  ' .. currentSubfile)
                imgui.Separator()
                local subData = quest_data[currentTopCategory][currentSubfile]
                if not subData then
                    imgui.TextColored({1,0,0,1}, 'No missions found in ' .. currentSubfile)
                else
                    imgui.Text('Select a mission:')
                    local missionKeys = utils.get_sorted_keys(subData)
                    for _, mname in ipairs(missionKeys) do
                        local complete = quest_state.isMissionComplete(currentTopCategory, currentSubfile, mname, quest_data)
                        if complete then imgui.PushStyleColor(ImGuiCol_Button, {0,1,0,0.5}) end
                        local label = mname
                        if complete then label = label .. " (Complete!)" end
                        if imgui.Button(label) then new_current_mission = mname end
                        if complete then imgui.PopStyleColor() end
                    end
                end
                if imgui.Button("Back to Subfiles") then new_currentSubfile = nil end

            else
                -- Display mission details
                local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
                local steps  = missionData.steps or {}
                local reward = missionData.reward

                -- Show full header and progress only when NOT collapsed
                if ui_settings.show_all_steps then
                    imgui.Text('Top Category: ' .. currentTopCategory)
                    imgui.Text('Subfile: ' .. currentSubfile)
                    imgui.Text('Mission: ' .. current_mission)
                    imgui.Separator()

                    -- Progress readout
                    local pct, done, tot = quest_state.calculateProgress(currentTopCategory, currentSubfile, current_mission, quest_data)
                    local barCount = 0
                    if tot > 0 then barCount = math.floor((pct / 100) * 20); if barCount > 20 then barCount = 20 end end
                    imgui.Text('[' .. string.rep('|', barCount) .. string.rep(' ', 20 - barCount) .. '] ' .. string.format("%.2f%% (%d/%d steps)", pct, done, tot))
                    imgui.Separator()
                else
                    -- Minimal header when collapsed: just mission name
                    imgui.Text('Mission: ' .. current_mission)
                    imgui.Separator()
                end

                -- Items Needed Section (check inventory every 5 seconds)
                local itemsNeeded = getAllItemsNeeded(missionData)
                if #itemsNeeded > 0 and inventory_cache then
                    local currentTime = os.clock()
                    local timeSinceLastCheck = currentTime - last_inventory_check

                    -- Check inventory every 5 seconds or when quest first opens
                    -- Search all storages (not just inventory)
                    if timeSinceLastCheck >= INVENTORY_CHECK_INTERVAL or not inventory_results[current_mission] then
                        -- We need to manually check all items across all storages
                        local results = {}
                        local inventory_module = require('modules.inventory')
                        for _, itemData in ipairs(itemsNeeded) do
                            local itemName = itemData.name
                            local alternatives = itemData.alternatives

                            -- If alternatives exist, check all of them
                            if alternatives and type(alternatives) == 'table' then
                                local totalCount = 0
                                local combinedLocations = {}
                                local hasAny = false

                                for _, altName in ipairs(alternatives) do
                                    local hasItem, count, locations = inventory_module.hasItem(altName, true)
                                    if hasItem then
                                        hasAny = true
                                        totalCount = totalCount + count
                                        -- Merge locations
                                        if locations then
                                            for locName, locCount in pairs(locations) do
                                                combinedLocations[locName] = (combinedLocations[locName] or 0) + locCount
                                            end
                                        end
                                    end
                                end

                                results[itemName] = {
                                    hasItem = hasAny,
                                    count = totalCount,
                                    locations = combinedLocations
                                }
                            else
                                -- Normal single item check
                                local hasItem, count, locations = inventory_module.hasItem(itemName, true)
                                results[itemName] = {
                                    hasItem = hasItem,
                                    count = count,
                                    locations = locations  -- Store location info
                                }
                            end
                        end
                        inventory_results[current_mission] = results
                        last_inventory_check = currentTime
                    end

                    -- Display items needed (collapsible, open by default)
                    if imgui.CollapsingHeader("Items Needed:", ImGuiTreeNodeFlags_DefaultOpen) then
                        for _, itemData in ipairs(itemsNeeded) do
                            local itemName = itemData.name
                            local qtyNeeded = itemData.quantity
                            local result = inventory_results[current_mission] and inventory_results[current_mission][itemName]

                            if result and result.hasItem then
                                -- Build compact location string
                                local locationStr = ""
                                if result.locations then
                                    local locParts = {}
                                    -- Put Inventory first if it exists
                                    if result.locations["Inventory"] then
                                        table.insert(locParts, string.format("Inventory: %d", result.locations["Inventory"]))
                                    end
                                    -- Then add other locations
                                    for locName, locCount in pairs(result.locations) do
                                        if locName ~= "Inventory" then
                                            table.insert(locParts, string.format("%s: %d", locName, locCount))
                                        end
                                    end
                                    if #locParts > 0 then
                                        locationStr = "    " .. table.concat(locParts, ", ")
                                    end
                                end

                                -- Color based on location: GREEN if in Inventory, YELLOW if in storage
                                local inInventory = result.locations and result.locations["Inventory"]

                                -- Display main line
                                if inInventory then
                                    -- GREEN - Item in Inventory (ready!)
                                    imgui.TextColored({0, 1, 0, 1}, string.format("  [x] %s x%d (have %d)", itemName, qtyNeeded, result.count))
                                else
                                    -- YELLOW - Item in storage (need to retrieve)
                                    imgui.TextColored({1, 1, 0, 1}, string.format("  [!] %s x%d (have %d)", itemName, qtyNeeded, result.count))
                                end

                                -- Display storage locations on one line
                                if locationStr ~= "" then
                                    local color = inInventory and {0, 1, 0, 1} or {1, 1, 0, 1}
                                    imgui.TextColored(color, locationStr)
                                end
                            else
                                -- RED - Don't have it
                                imgui.TextColored({1, 0, 0, 1}, string.format("  [ ] %s x%d", itemName, qtyNeeded))
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Key Items Needed Section (collapsible, open by default)
                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 and keyitem_module then
                    if imgui.CollapsingHeader("Key Items Needed:", ImGuiTreeNodeFlags_DefaultOpen) then
                        -- Check if key item tracking is initialized
                        if not keyitem_module.isInitialized() then
                            imgui.TextColored({1, 1, 0, 1}, "  [!] Key item tracking not ready yet")
                            imgui.TextColored({0.7, 0.7, 0.7, 1}, "  Open your Key Items menu in-game")
                        else
                            for _, ki in ipairs(keyItemsNeeded) do
                                local hasKI = keyitem_module.hasKeyItem(ki.id)
                                if hasKI then
                                    -- GREEN - Player has it
                                    imgui.TextColored({0, 1, 0, 1}, string.format("  [x] KI: %s", ki.name))
                                else
                                    -- RED - Don't have it
                                    imgui.TextColored({1, 0, 0, 1}, string.format("  [ ] KI: %s", ki.name))
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Steps
                -- Determine which steps to display based on show_all_steps setting
                local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
                local steps_to_show = {}

                if ui_settings.show_all_steps then
                    -- Show all steps
                    for i = 1, #steps do
                        table.insert(steps_to_show, i)
                    end
                else
                    -- Show only current step (first incomplete step)
                    if current_step_index and current_step_index <= #steps then
                        table.insert(steps_to_show, current_step_index)
                    elseif #steps > 0 then
                        -- If all complete, show last step
                        table.insert(steps_to_show, #steps)
                    end
                end

                for _, i in ipairs(steps_to_show) do
                    local step_data = steps[i]
                    local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
                    local st = quest_state.getStepState(currentTopCategory, currentSubfile, current_mission, i)
                    local cbLabel = string.format("##step_%d", i)
                    local ref = { st }
                    if imgui.Checkbox(cbLabel, ref) then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, i, ref[1], nil)
                    end
                    imgui.SameLine()
                    if ref[1] then
                        imgui.TextColored({0,1,0,1}, utils.wrap_text(text, 60))
                    else
                        imgui.Text(utils.wrap_text(text, 60))
                    end

                    -- KILL COUNTER UI DISPLAY
                    if not st and step_data.kill_requirement then
                        local kill_req = step_data.kill_requirement
                        local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, i) or 0
                        local required_count = kill_req.count

                        imgui.Indent(20)
                        if current_count >= required_count then
                            imgui.TextColored({0,1,0,1}, string.format("[%d/%d] Kills Complete!", current_count, required_count))
                        else
                            imgui.TextColored({1,1,0,1}, string.format("[%d/%d] Kills Remaining", current_count, required_count))
                        end

                        -- Show enemy types if specified
                        if kill_req.enemies and #kill_req.enemies > 0 then
                            imgui.SameLine()
                            imgui.TextColored({0.7,0.7,0.7,1}, "(" .. table.concat(kill_req.enemies, ", ") .. ")")
                        end
                        imgui.Unindent(20)
                    end
                end

                -- Rewards (hide when collapsed to save space)
                if reward and ui_settings.show_all_steps then
                    if type(reward.text) == 'string' and reward.text ~= "" then
                         imgui.TextColored({0.8,0.8,0,1}, "Rewards:")
                         imgui.TextWrapped(reward.text)
                    end
                    if type(reward.items) == 'table' and #reward.items > 0 then
                        if not reward.text or reward.text == "" then
                            imgui.TextColored({0.8,0.8,0,1}, "Rewards:")
                        end
                        for idx, item_data in ipairs(reward.items) do
                            imgui.Separator()
                            if type(item_data) == 'table' and item_data.name then
                                if imgui.TreeNode(item_data.name .. "##rewarditem" .. idx) then
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
            end
        end

        -- End scrollable content area
        imgui.EndChild()
    end

    imgui.End()
    imgui.PopStyleColor(5)

    -- Settings Window
    if show_settings_window then
        imgui.SetNextWindowSize({320, 300}, ImGuiCond_Always)
        if imgui.Begin("QuestHelper Settings", true, 0) then
            imgui.Text("Map Display Settings")
            imgui.Separator()

            -- Auto-scroll toggle
            local auto_scroll_ref = { ui_settings.auto_scroll_enabled }
            if imgui.Checkbox("Auto-scroll to current floor/zone", auto_scroll_ref) then
                ui_settings.auto_scroll_enabled = auto_scroll_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end

            -- Map opacity slider
            imgui.Text("Map Opacity:")
            local opacity_ref = { ui_settings.map_opacity }
            if imgui.SliderFloat("##MapOpacity", opacity_ref, 0.0, 1.0, "%.2f") then
                ui_settings.map_opacity = opacity_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            if ui_settings.map_opacity == 0.0 then
                imgui.TextColored({1, 0.5, 0, 1}, "Maps hidden (opacity = 0)")
            end

            -- Reset map position button
            imgui.Text("Map Window Position:")
            if imgui.Button("Reset Map Position") then
                ui_settings.map_pos_x = 100
                ui_settings.map_pos_y = 100
                settings.save('QuestHelper_settings', quest_state.settings)
                print("\30\106[QH]\30\01 Map position reset to (100, 100)")
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Reset map window to default position (100, 100)")
            end

            imgui.Separator()
            imgui.Text("Step Display Settings")
            imgui.Separator()

            -- Show all steps toggle
            local show_all_ref = { ui_settings.show_all_steps }
            if imgui.Checkbox("Show all steps (vs current step only)", show_all_ref) then
                ui_settings.show_all_steps = show_all_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end

            imgui.Separator()
            if imgui.Button("Close##SettingsClose") then
                show_settings_window = false
            end

            imgui.End()
        else
            show_settings_window = false
        end
    end

    return window_open, mainX, mainY, mainW, mainH, new_showImagesDrawer,
           new_currentTopCategory, new_currentSubfile, new_current_mission
end

return ui_main
