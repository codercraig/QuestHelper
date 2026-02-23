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

-- Collapsed mode step navigation
local collapsed_viewed_step = nil  -- Track which step we're viewing in collapsed mode

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
                            -- alternatives can be:
                            --   1. Array of strings: {"Dark Crystal", "Wind Crystal"}
                            --   2. Array of tables: {{"Meteorite", 1}, {"Soil Geodes", 12}}
                            --   3. Array of tables: {{item="Meteorite", quantity=1}, {item="Soil Geodes", quantity=12}}
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

-- Collects all prerequisites for a quest/mission
-- Returns: { {category = "Missions", subfile = "Bastok", name = "7-1: The Final Image"}, ... }
local function getAllPrerequisites(missionData)
    if not missionData or not missionData.prerequisites then
        return {}
    end

    -- Prerequisites should be an array of tables with category, subfile, and name
    local prerequisites = {}
    if type(missionData.prerequisites) == 'table' then
        for _, prereq in ipairs(missionData.prerequisites) do
            if type(prereq) == 'table' and prereq.category and prereq.subfile and prereq.name then
                table.insert(prerequisites, prereq)
            end
        end
    end

    return prerequisites
end

-- Renders the main QuestHelper window
function ui_main.render(is_open, currentTopCategory, currentSubfile, current_mission, showImagesDrawer,
                       quest_data, quest_state, utils, inventory_cache, keyitem_module, keyitems_db)

    local settings = require('settings')
    local ui_settings = quest_state.settings.ui_settings

    -- Get UI scale setting early so it can be used for window sizing
    local ui_scale = ui_settings.ui_scale or 1.0

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
            -- Add extra height for navigation buttons if more than 1 step
            local base_height = 150
            if #steps > 1 then
                base_height = base_height + 40  -- Add space for navigation buttons + separator
            end

            -- Get step text for height calculation
            -- Use collapsed_viewed_step if set, otherwise use current step
            if current_step_index and #steps > 0 then
                -- Use viewed step for height calculation (will be initialized in navigation section)
                local step_index_to_use = collapsed_viewed_step or math.min(current_step_index, #steps)
                local step_data = steps[step_index_to_use]
                local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)

                -- Estimate text height: Count newlines + account for line wrapping
                -- Each line wraps at ~55 chars (to account for scrollbar), each line is ~20px tall
                local lines = 1  -- Start with 1 line minimum
                local current_line_length = 0
                local wrap_chars = 55  -- Use 55 to match scrollable text rendering

                for i = 1, #text do
                    local char = text:sub(i, i)
                    if char == '\n' then
                        -- Hit a newline, start a new line
                        lines = lines + 1
                        current_line_length = 0
                    else
                        current_line_length = current_line_length + 1
                        -- Check if current line exceeds wrap width
                        if current_line_length >= wrap_chars then
                            lines = lines + 1
                            current_line_length = 0
                        end
                    end
                end

                local text_height = lines * 20

                -- Cap text height to scroll limit (350px) if it exceeds that
                -- Scale the scroll limit with UI scale
                local scroll_limit = 350 * ui_scale
                if text_height > scroll_limit then
                    text_height = scroll_limit
                end

                -- Add height for items/key items if present
                -- Only add full height if sections are expanded, otherwise just add header height + extra breathing room
                local items_height = 0
                local itemsNeeded = getAllItemsNeeded(missionData)
                if #itemsNeeded > 0 then
                    if ui_settings.items_section_expanded then
                        items_height = (#itemsNeeded * 25) + 30  -- ~25px per item + header
                    else
                        items_height = 30 -- Collapsed header + extra breathing room
                    end
                end

                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 then
                    if ui_settings.keyitems_section_expanded then
                        items_height = items_height + (#keyItemsNeeded * 25) + 30
                    else
                        items_height = items_height + 30  -- Collapsed header + extra breathing room
                    end
                end

                local prerequisites = getAllPrerequisites(missionData)
                if #prerequisites > 0 then
                    if ui_settings.prerequisites_section_expanded then
                        items_height = items_height + (#prerequisites * 25) + 30
                    else
                        items_height = items_height + 30  -- Collapsed header + extra breathing room
                    end
                end

                -- Add height for route display (if route_to is defined)
                if type(step_data) == 'table' and step_data.route_to then
                    if ui_settings.route_section_expanded then
                        -- Load pathfinding to calculate route lines
                        local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')
                        if pathfinding_ok then
                            local party = AshitaCore:GetMemoryManager():GetParty()
                            if party then
                                local player_zone_id = party:GetMemberZone(0)
                                if player_zone_id and player_zone_id > 0 then
                                    local zones_db = require('data.zones')
                                    local current_zone = pathfinding.getCurrentZone(player_zone_id, zones_db)

                                    if current_zone then
                                        local path = pathfinding.findPath(current_zone, step_data.route_to)
                                        if path then
                                            local route_str = pathfinding.formatPath(path, current_zone, step_data.destination_highlight)
                                            -- Count lines in route string (each "\n" is a new line)
                                            local route_lines = 1  -- Start with header line "Route (X zones):"
                                            for _ in route_str:gmatch("\n") do
                                                route_lines = route_lines + 1
                                            end
                                            -- Add header (30px) + route lines * 20px per line
                                            items_height = items_height + 30 + (route_lines * 20)
                                        else
                                            -- No path found message: header + 2 lines
                                            items_height = items_height + 30 + (2 * 20)
                                        end
                                    end
                                end
                            end
                        end
                    else
                        -- Collapsed route header only
                        items_height = items_height + 30
                    end
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

    -- Set window size with fixed width (600) and dynamic height based on collapsed/expanded mode
    -- Apply UI scale setting (ui_scale already defined at top of function)
    local scaled_width = 600 * ui_scale
    local scaled_height = window_height * ui_scale

    -- Use ImGuiCond_Always to enforce size constraints every frame
    imgui.SetNextWindowSize({scaled_width, scaled_height}, ImGuiCond_Always)

    local mainFlags = bit.bor(
        ImGuiWindowFlags_NoCollapse,
        ImGuiWindowFlags_NoTitleBar,
        ImGuiWindowFlags_NoResize  -- Disable manual resizing
    )
    local window_open = imgui.Begin('Quest Helper', nil, mainFlags)

    -- Apply font scaling for the entire window
    imgui.SetWindowFontScale(ui_scale)

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

        -- Navigation back buttons and toggles
        if current_mission then
            -- Collapse/Expand Steps Toggle
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

            -- Back to Missions button
            imgui.SameLine()
            if imgui.Button("Back##BackToMissions") then
                new_current_mission = nil
            end
        elseif currentSubfile then
            -- Back to Subfiles button (when viewing mission list)
            imgui.SameLine()
            if imgui.Button("< Back##BackToSubfiles") then
                new_currentSubfile = nil
            end
        elseif currentTopCategory then
            -- Back to Categories button (when viewing subfile list)
            imgui.SameLine()
            if imgui.Button("< Back##BackToCategories") then
                new_currentTopCategory = nil
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
                    -- Minimal header when collapsed: mission name + step progress
                    imgui.Text('Mission: ' .. current_mission)

                    -- Show completed steps and total (matching expanded mode format)
                    local pct, done, tot = quest_state.calculateProgress(currentTopCategory, currentSubfile, current_mission, quest_data)

                    -- Compact progress bar and step counter
                    local barCount = 0
                    if tot > 0 then barCount = math.floor((pct / 100) * 20); if barCount > 20 then barCount = 20 end end
                    imgui.Text('[' .. string.rep('|', barCount) .. string.rep(' ', 20 - barCount) .. '] ' .. string.format("%.0f%% (%d/%d steps)", pct, done, tot))
                    imgui.Separator()

                    -- Step navigation buttons in collapsed mode (before items/keyitems)
                    local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)

                    -- Initialize viewed step to current step if not set OR auto-advance if user completed steps
                    if not collapsed_viewed_step or collapsed_viewed_step < 1 or collapsed_viewed_step > #steps then
                        collapsed_viewed_step = math.min(current_step_index, #steps)
                    elseif collapsed_viewed_step < current_step_index then
                        -- Auto-advance: user completed steps, follow the current step forward
                        collapsed_viewed_step = math.min(current_step_index, #steps)
                    end
                    -- Note: We don't auto-rewind when user unchecks earlier steps
                    -- This allows manual navigation with prev/next buttons to work properly

                    if #steps > 1 then
                        -- Previous button
                        if collapsed_viewed_step > 1 then
                            if imgui.SmallButton("< Prev##CollapsedPrev") then
                                collapsed_viewed_step = collapsed_viewed_step - 1
                            end
                            imgui.SameLine()
                        end

                        imgui.Text(string.format("Step %d/%d", collapsed_viewed_step, #steps))
                        imgui.SameLine()

                        -- Next button
                        if collapsed_viewed_step < #steps then
                            if imgui.SmallButton("Next >##CollapsedNext") then
                                collapsed_viewed_step = collapsed_viewed_step + 1
                            end
                        end

                        imgui.Separator()
                    end
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
                                local bestCount = 0
                                local bestLocations = {}
                                local hasAny = false
                                local bestMatch = nil

                                for _, alt in ipairs(alternatives) do
                                    local altName, altQty

                                    -- Parse alternative format
                                    if type(alt) == 'string' then
                                        -- Simple string: "Meteorite"
                                        altName = alt
                                        altQty = 1
                                    elseif type(alt) == 'table' then
                                        if alt.item then
                                            -- {item = "Meteorite", quantity = 1}
                                            altName = alt.item
                                            altQty = alt.quantity or 1
                                        elseif alt[1] then
                                            -- {"Meteorite", 1}
                                            altName = alt[1]
                                            altQty = alt[2] or 1
                                        end
                                    end

                                    if altName then
                                        local hasItem, count, locations = inventory_module.hasItem(altName, true)
                                        if hasItem then
                                            -- Calculate progress: how many "sets" of this alternative we have
                                            local progress = math.floor(count / altQty)
                                            -- If this alternative is better, use it
                                            if progress > math.floor(bestCount / (bestMatch and bestMatch.qty or 1)) then
                                                hasAny = true
                                                bestCount = count
                                                bestLocations = locations or {}
                                                bestMatch = { name = altName, qty = altQty }
                                            end
                                        end
                                    end
                                end

                                results[itemName] = {
                                    hasItem = hasAny,
                                    count = bestCount,
                                    locations = bestLocations,
                                    alternative_match = bestMatch  -- Store which alternative matched
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
                    -- Track the expanded state for dynamic height calculation
                    local items_header_expanded = imgui.CollapsingHeader("Items Needed:", ui_settings.items_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if items_header_expanded ~= ui_settings.items_section_expanded then
                        ui_settings.items_section_expanded = items_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if items_header_expanded then
                        for _, itemData in ipairs(itemsNeeded) do
                            local itemName = itemData.name
                            local qtyNeeded = itemData.quantity
                            local result = inventory_results[current_mission] and inventory_results[current_mission][itemName]

                            if result and result.hasItem then
                                -- If this is an alternative match, show which one we found
                                local displayName = itemName
                                local displayQty = qtyNeeded
                                if result.alternative_match then
                                    displayName = result.alternative_match.name
                                    displayQty = result.alternative_match.qty
                                end

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

                                -- Check if we have enough
                                local hasEnough = result.count >= displayQty

                                -- Display main line
                                if hasEnough then
                                    if inInventory then
                                        -- GREEN - Item in Inventory (ready!)
                                        imgui.TextColored({0, 1, 0, 1}, string.format("  [x] %s x%d (have %d)", displayName, displayQty, result.count))
                                    else
                                        -- YELLOW - Item in storage (need to retrieve)
                                        imgui.TextColored({1, 1, 0, 1}, string.format("  [!] %s x%d (have %d)", displayName, displayQty, result.count))
                                    end
                                else
                                    -- ORANGE - Have some but not enough
                                    imgui.TextColored({1, 0.5, 0, 1}, string.format("  [~] %s x%d (have %d)", displayName, displayQty, result.count))
                                end

                                -- Display storage locations on one line
                                if locationStr ~= "" then
                                    local color = hasEnough and (inInventory and {0, 1, 0, 1} or {1, 1, 0, 1}) or {1, 0.5, 0, 1}
                                    imgui.TextColored(color, locationStr)
                                end
                            else
                                -- RED - Don't have it
                                -- If this has alternatives, the display name already includes quantity info
                                if itemData.alternatives then
                                    imgui.TextColored({1, 0, 0, 1}, string.format("  [ ] %s", itemName))
                                else
                                    imgui.TextColored({1, 0, 0, 1}, string.format("  [ ] %s x%d", itemName, qtyNeeded))
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Key Items Needed Section (collapsible, open by default)
                local keyItemsNeeded = utils.getAllKeyItemsNeeded(missionData, keyitems_db)
                if #keyItemsNeeded > 0 and keyitem_module then
                    -- Track the expanded state for dynamic height calculation
                    local keyitems_header_expanded = imgui.CollapsingHeader("Key Items Needed:", ui_settings.keyitems_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if keyitems_header_expanded ~= ui_settings.keyitems_section_expanded then
                        ui_settings.keyitems_section_expanded = keyitems_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if keyitems_header_expanded then
                        -- Check if key item tracking is initialized
                        if not keyitem_module.isInitialized() then
                            imgui.TextColored({1, 1, 0, 1}, "  [!] Key item tracking not ready yet")
                            imgui.TextColored({0.7, 0.7, 0.7, 1}, "  This will require a zone to update.")
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

                -- Prerequisites Section (collapsible, open by default)
                local prerequisites = getAllPrerequisites(missionData)
                if #prerequisites > 0 then
                    -- Track the expanded state for dynamic height calculation
                    local prereq_header_expanded = imgui.CollapsingHeader("Prerequisites:", ui_settings.prerequisites_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if prereq_header_expanded ~= ui_settings.prerequisites_section_expanded then
                        ui_settings.prerequisites_section_expanded = prereq_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if prereq_header_expanded then
                        for idx, prereq in ipairs(prerequisites) do
                            -- Check if the prerequisite quest/mission is complete
                            local isComplete = quest_state.isMissionComplete(prereq.category, prereq.subfile, prereq.name, quest_data)

                            -- Set button color based on completion status
                            if isComplete then
                                -- GREEN - Completed
                                imgui.PushStyleColor(ImGuiCol_Button,        {0, 0.5, 0, 0.5})
                                imgui.PushStyleColor(ImGuiCol_ButtonHovered, {0, 0.7, 0, 0.7})
                                imgui.PushStyleColor(ImGuiCol_ButtonActive,  {0, 0.9, 0, 0.9})
                                imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                            else
                                -- RED - Not completed
                                imgui.PushStyleColor(ImGuiCol_Button,        {0.5, 0, 0, 0.5})
                                imgui.PushStyleColor(ImGuiCol_ButtonHovered, {0.7, 0, 0, 0.7})
                                imgui.PushStyleColor(ImGuiCol_ButtonActive,  {0.9, 0, 0, 0.9})
                                imgui.PushStyleColor(ImGuiCol_Text,          {1, 1, 1, 1})
                            end

                            local buttonLabel = string.format("%s %s: %s##prereq_%d",
                                isComplete and "[x]" or "[ ]",
                                prereq.category,
                                prereq.name,
                                idx)

                            if imgui.Button(buttonLabel) then
                                -- Navigate to the prerequisite quest/mission
                                new_currentTopCategory = prereq.category
                                new_currentSubfile = prereq.subfile
                                new_current_mission = prereq.name
                            end

                            imgui.PopStyleColor(4)
                        end
                        imgui.Separator()
                    end
                end

                -- Get current step for route display optimization
                local current_step_index = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)

                -- Route Section (collapsible, shows route for current step)
                -- In collapsed mode: use viewed step, in expanded mode: use current step
                local route_step_index = ui_settings.show_all_steps and current_step_index or collapsed_viewed_step
                local route_step_data = steps[route_step_index]
                if route_step_data and type(route_step_data) == 'table' and route_step_data.route_to then
                    -- Track the expanded state for dynamic height calculation
                    local route_header_expanded = imgui.CollapsingHeader("Route:", ui_settings.route_section_expanded and ImGuiTreeNodeFlags_DefaultOpen or 0)

                    -- Update state if it changed
                    if route_header_expanded ~= ui_settings.route_section_expanded then
                        ui_settings.route_section_expanded = route_header_expanded
                        settings.save('QuestHelper_settings', quest_state.settings)
                    end

                    if route_header_expanded then
                        -- Load pathfinding module on demand
                        local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')

                        if pathfinding_ok then
                            -- Get player's current zone (Ashita API)
                            local party = AshitaCore:GetMemoryManager():GetParty()
                            if party then
                                local player_zone_id = party:GetMemberZone(0)
                                if player_zone_id and player_zone_id > 0 then
                                    local zones_db = require('data.zones')
                                    local current_zone = pathfinding.getCurrentZone(player_zone_id, zones_db)

                                    if current_zone then
                                        local destination = route_step_data.route_to
                                        local path = pathfinding.findPath(current_zone, destination)

                                        if path then
                                            local route_str = pathfinding.formatPath(path, current_zone, route_step_data.destination_highlight)
                                            local distance = pathfinding.getRouteDistance(path)

                                            if distance == 0 then
                                                -- Already at destination
                                                imgui.TextColored({0, 1, 0, 1}, "  " .. route_str)
                                            elseif pathfinding.isLongRoute(path) then
                                                -- Long route warning
                                                imgui.TextColored({1, 1, 0, 1}, string.format("  %d zones:", distance))
                                                -- Display each zone on its own line with indent
                                                for line in route_str:gmatch("[^\n]+") do
                                                    imgui.TextColored({1, 1, 1, 1}, "  " .. line)
                                                end
                                            else
                                                -- Normal route
                                                imgui.TextColored({0.7, 0.7, 1, 1}, string.format("  %d zones:", distance))
                                                -- Display each zone on its own line with indent
                                                for line in route_str:gmatch("[^\n]+") do
                                                    imgui.TextColored({1, 1, 1, 1}, "  " .. line)
                                                end
                                            end
                                        else
                                            -- No path found
                                            imgui.TextColored({1, 0, 0, 1}, "  No route found to " .. destination)
                                            imgui.TextColored({0.7, 0.7, 0.7, 1}, "  (Zone graph incomplete)")
                                        end
                                    else
                                        -- Current zone not in database
                                        imgui.TextColored({1, 0.5, 0, 1}, "  Current zone not mapped")
                                    end
                                end
                            end
                        end
                    end
                    imgui.Separator()
                end

                -- Steps
                -- Determine which steps to display based on show_all_steps setting
                local steps_to_show = {}

                if ui_settings.show_all_steps then
                    -- Show all steps
                    for i = 1, #steps do
                        table.insert(steps_to_show, i)
                    end
                else
                    -- Collapsed mode: show the viewed step (navigation buttons are above)
                    if collapsed_viewed_step and collapsed_viewed_step >= 1 and collapsed_viewed_step <= #steps then
                        table.insert(steps_to_show, collapsed_viewed_step)
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

                    -- Calculate estimated text height for collapse mode scrolling
                    local use_scrollable_text = false
                    local estimated_text_height = 0

                    if not ui_settings.show_all_steps then
                        -- Estimate text height: Count newlines + account for line wrapping
                        -- Each line wraps at ~55 chars (to account for scrollbar), each line is ~20px tall
                        local lines = 1
                        local current_line_length = 0
                        local wrap_chars = 55  -- Use 55 to match rendering with scrollbar

                        for j = 1, #text do
                            local char = text:sub(j, j)
                            if char == '\n' then
                                lines = lines + 1
                                current_line_length = 0
                            else
                                current_line_length = current_line_length + 1
                                if current_line_length >= wrap_chars then
                                    lines = lines + 1
                                    current_line_length = 0
                                end
                            end
                        end

                        estimated_text_height = lines * 20

                        -- Use scrollable container if text height exceeds 350px
                        -- Scale the threshold with UI scale
                        local scroll_threshold = 350 * ui_scale
                        if estimated_text_height > scroll_threshold then
                            use_scrollable_text = true
                        end
                    end

                    -- Begin scrollable container if text is too long in collapse mode
                    if use_scrollable_text then
                        -- Scale container height with UI scale
                        local container_height = 350 * ui_scale
                        imgui.BeginChild("##StepTextScroll", {-1, container_height}, true, 0)
                        -- Apply font scaling to child window
                        imgui.SetWindowFontScale(ui_scale)
                    end

                    -- Render the step text
                    -- Use narrower wrap width when scrollbar is present to prevent text cutoff
                    local wrap_width = use_scrollable_text and 55 or 60
                    if ref[1] then
                        imgui.TextColored({0,1,0,1}, utils.wrap_text(text, wrap_width))
                    else
                        imgui.Text(utils.wrap_text(text, wrap_width))
                    end

                    -- End scrollable container if we started one
                    if use_scrollable_text then
                        imgui.EndChild()
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

                        -- Show enemy types if specified (one per line to prevent text overflow)
                        if kill_req.enemies and #kill_req.enemies > 0 then
                            for _, enemy_name in ipairs(kill_req.enemies) do
                                imgui.TextColored({0.7,0.7,0.7,1}, "  - " .. enemy_name)
                            end
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
        -- Scale settings window to match main UI
        local settings_ui_scale = ui_settings.ui_scale or 1.0
        imgui.SetNextWindowSize({320 * settings_ui_scale, 400 * settings_ui_scale}, ImGuiCond_Always)
        if imgui.Begin("QuestHelper Settings", true, 0) then
            -- Apply font scaling for settings window
            imgui.SetWindowFontScale(settings_ui_scale)
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

            -- Map scale slider
            imgui.Text("Map Size:")
            if not ui_settings.map_scale then
                ui_settings.map_scale = 1.0  -- Initialize default
            end
            local scale_ref = { ui_settings.map_scale }
            if imgui.SliderFloat("##MapScale", scale_ref, 0.25, 1.0, "%.2f") then
                ui_settings.map_scale = scale_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
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
            imgui.Text("UI Display Settings")
            imgui.Separator()

            -- UI scale slider
            imgui.Text("UI Scale (Window & Font Size):")
            if not ui_settings.ui_scale then
                ui_settings.ui_scale = 1.0  -- Initialize default
            end
            local ui_scale_ref = { ui_settings.ui_scale }
            if imgui.SliderFloat("##UIScale", ui_scale_ref, 0.6, 1.0, "%.2f") then
                ui_settings.ui_scale = ui_scale_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Scale the main window and font size for smaller screens")
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
            imgui.Text("Developer Settings")
            imgui.Separator()

            -- Dev mode toggle
            local dev_mode_ref = { ui_settings.dev_mode }
            if imgui.Checkbox("Developer Mode", dev_mode_ref) then
                ui_settings.dev_mode = dev_mode_ref[1]
                settings.save('QuestHelper_settings', quest_state.settings)
                if ui_settings.dev_mode then
                    print("\30\106[QH]\30\01 Developer mode enabled - Debug output active")
                else
                    print("\30\106[QH]\30\01 Developer mode disabled - Debug output hidden")
                end
            end
            if imgui.IsItemHovered() then
                imgui.SetTooltip("Shows debug messages in chat log for troubleshooting")
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

    -- Reset collapsed viewed step if mission changed
    if new_current_mission ~= current_mission then
        collapsed_viewed_step = nil
    end

    return window_open, mainX, mainY, mainW, mainH, new_showImagesDrawer,
           new_currentTopCategory, new_currentSubfile, new_current_mission
end

return ui_main
