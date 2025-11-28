-- Main UI window module
local ui_main = {}

local imgui = require('imgui')
local bit = require('bit')

-- Search functionality
local search_query = ""
local search_results = T{}

-- Inventory checking (periodic, not every frame)
local inventory_results = {} -- Cached results
local last_inventory_check = 0
local INVENTORY_CHECK_INTERVAL = 5.0 -- Check every 5 seconds

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
-- Returns: { {name = "Item Name", quantity = 2}, ... }
--
-- Supported formats:
--   items_needed = "Dark Crystal"  -- qty 1
--   items_needed = {"Dark Crystal", "Lizard Egg"}  -- qty 1 each
--   items_needed = {
--       "Dark Crystal",
--       { item = "Lizard Egg", quantity = 6 }
--   }
local function getAllItemsNeeded(missionData)
    local allItems = {}
    local itemCounts = {}  -- { itemName = count }

    if not missionData or not missionData.steps then return allItems end

    for _, step_data in ipairs(missionData.steps) do
        if type(step_data) == 'table' and step_data.items_needed then
            local items = step_data.items_needed

            -- Process items_needed (can be string, table of strings, or table with {item=, quantity=})
            if type(items) == 'string' then
                itemCounts[items] = (itemCounts[items] or 0) + 1
            elseif type(items) == 'table' then
                for _, item in ipairs(items) do
                    if type(item) == 'string' then
                        -- Simple string format
                        itemCounts[item] = (itemCounts[item] or 0) + 1
                    elseif type(item) == 'table' and item.item then
                        -- Object format: { item = "Name", quantity = 6 }
                        local qty = item.quantity or 1
                        itemCounts[item.item] = (itemCounts[item.item] or 0) + qty
                    end
                end
            end
        end
    end

    -- Convert to array with quantities
    for itemName, qty in pairs(itemCounts) do
        table.insert(allItems, { name = itemName, quantity = qty })
    end

    return allItems
end

-- Renders the main QuestHelper window
function ui_main.render(is_open, currentTopCategory, currentSubfile, current_mission, showImagesDrawer,
                       quest_data, quest_state, utils, inventory_cache)

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
    local new_showImagesDrawer = showImagesDrawer
    local new_currentTopCategory = currentTopCategory
    local new_currentSubfile = currentSubfile
    local new_current_mission = current_mission

    if window_open then
        mainX, mainY = imgui.GetWindowPos()
        mainW, mainH = imgui.GetWindowSize()

        -- Images drawer toggle
        if showImagesDrawer then
            if imgui.Button("<##drawerToggle") then new_showImagesDrawer = false end
            imgui.SameLine(); imgui.Text("Hide Images")
        else
            if imgui.Button(">##drawerToggle") then new_showImagesDrawer = true end
            imgui.SameLine(); imgui.Text("Show Images")
        end
        imgui.Separator()

        -- SEARCH BAR
        imgui.Text("Search Missions/Quests (lowest-level):")
        local input_buf = { search_query }
        if imgui.InputText("##SearchQuest", input_buf, 256) then
            search_query = input_buf[1]
            perform_search(quest_data)
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
                imgui.Text('Top Category: ' .. currentTopCategory)
                imgui.Text('Subfile: ' .. currentSubfile)
                imgui.Text('Mission: ' .. current_mission)
                imgui.Separator()

                local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
                local steps  = missionData.steps or {}
                local reward = missionData.reward

                -- Progress readout
                local pct, done, tot = quest_state.calculateProgress(currentTopCategory, currentSubfile, current_mission, quest_data)
                local barCount = 0
                if tot > 0 then barCount = math.floor((pct / 100) * 20); if barCount > 20 then barCount = 20 end end
                imgui.Text('[' .. string.rep('|', barCount) .. string.rep(' ', 20 - barCount) .. '] ' .. string.format("%.2f%% (%d/%d steps)", pct, done, tot))
                imgui.Separator()

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
                            local hasItem, count, locations = inventory_module.hasItem(itemName, true)
                            results[itemName] = {
                                hasItem = hasItem,
                                count = count,
                                locations = locations  -- Store location info
                            }
                        end
                        inventory_results[current_mission] = results
                        last_inventory_check = currentTime
                    end

                    -- Display items needed
                    imgui.TextColored({0.9, 0.9, 0.9, 1}, "Items Needed:")
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
                    imgui.Separator()
                end

                -- Steps
                for i = 1, #steps do
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

                    -- CHECKLIST UI DISPLAY
                    if not st and step_data.require_all_items and step_data.trigger_on_item_obtain then
                        local list = {}
                        if type(step_data.trigger_on_item_obtain) == 'string' then
                            table.insert(list, step_data.trigger_on_item_obtain)
                        else
                            list = step_data.trigger_on_item_obtain
                        end

                        for _, item in ipairs(list) do
                            local gotIt = quest_state.getPartialState(currentTopCategory, currentSubfile, current_mission, i, item)

                            imgui.Indent(20)
                            if gotIt then
                                imgui.TextColored({0,1,0,1}, "[x] " .. item)
                            else
                                imgui.TextColored({1,1,0,1}, "[ ] " .. item)
                            end
                            imgui.Unindent(20)
                        end
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

                if imgui.Button("Back to Missions") then
                    new_current_mission = nil
                end
            end
        end
    end

    imgui.End()
    imgui.PopStyleColor(5)

    return window_open, mainX, mainY, mainW, mainH, new_showImagesDrawer,
           new_currentTopCategory, new_currentSubfile, new_current_mission
end

return ui_main
