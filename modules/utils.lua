-- Utility functions module
local utils = {}

-- Text wrapping for UI display
function utils.wrap_text(text, max_length)
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

-- Returns sorted keys from a table
function utils.get_sorted_keys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    return keys
end

-- Gets images for a specific quest step
function utils.get_images_for_step(topCat, subfile, mission, stepIndex, quest_data)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then return {} end
    local step_data = mdata.steps[stepIndex]

    -- If step has manually-defined images, use those (existing functionality)
    if type(step_data) == 'table' and step_data.images then
        local matched = {}
        for _, image_info in ipairs(step_data.images) do
            if (image_info.state == stepIndex) or (image_info.state == nil) then
                table.insert(matched, image_info)
            end
        end
        return matched
    end

    -- NEW: Auto-generate route maps if route_to is defined
    if type(step_data) == 'table' and step_data.route_to then
        -- Load pathfinding module on demand
        local pathfinding_ok, pathfinding = pcall(require, 'modules.pathfinding')
        if pathfinding_ok then
            -- Get player's current zone (Ashita API)
            local party = AshitaCore:GetMemoryManager():GetParty()
            if party then
                local player_zone_id = party:GetMemberZone(0)
                if player_zone_id and player_zone_id > 0 then
                    local zones_db = require('data.zones')
                    local current_zone = nil

                    -- Find zone name from zone ID
                    for zone_name, zone_id in pairs(zones_db) do
                        if zone_id == player_zone_id then
                            current_zone = zone_name
                            break
                        end
                    end

                    if current_zone then
                        local destination = step_data.route_to
                        local path = pathfinding.findPath(current_zone, destination)

                        if path then
                            -- Generate route images with exit highlights
                            -- Optional: destination_highlight for marking NPCs/targets at final destination
                            local dest_highlight = step_data.destination_highlight
                            local route_images = pathfinding.generateRouteImages(path, current_zone, dest_highlight)
                            return route_images
                        end
                    end
                end
            end
        end
    end

    return {}
end

-- Collects all unique key items needed for entire quest
-- Returns: { {id = 1234, name = "Mystical Canteen"}, ... }
--
-- Supported formats:
--   keyitems_needed = {1234}  -- Just key item ID
--   keyitems_needed = {"Kindred Crest"}  -- Key item name (looked up from database)
--   keyitems_needed = {{id = 1234, name = "Mystical Canteen"}}  -- Explicit ID+name
function utils.getAllKeyItemsNeeded(missionData, keyitems_db)
    local allKeyItems = {}
    local kiData = {}  -- { ki_id = name }

    if not missionData or not missionData.steps then return allKeyItems end

    for _, step_data in ipairs(missionData.steps) do
        if type(step_data) == 'table' and step_data.keyitems_needed then
            local keyitems = step_data.keyitems_needed

            if type(keyitems) == 'table' then
                for _, ki in ipairs(keyitems) do
                    if type(ki) == 'number' then
                        -- Simple ID format
                        if not kiData[ki] then
                            -- Try to get name from database
                            local ki_name = keyitems_db and keyitems_db.getName(ki)
                            kiData[ki] = ki_name
                        end
                    elseif type(ki) == 'string' then
                        -- Name format - look up ID from database
                        if keyitems_db then
                            local ki_id = keyitems_db.getId(ki)
                            if ki_id and not kiData[ki_id] then
                                kiData[ki_id] = ki
                            end
                        end
                    elseif type(ki) == 'table' and ki.id then
                        -- Object format: { id = 1234, name = "Name" }
                        if not kiData[ki.id] then
                            kiData[ki.id] = ki.name
                        end
                    end
                end
            end
        end
    end

    -- Convert to array
    for ki_id, ki_name in pairs(kiData) do
        table.insert(allKeyItems, {
            id = ki_id,
            name = ki_name or string.format("Key Item #%d", ki_id)
        })
    end

    -- Sort by ID for consistency
    table.sort(allKeyItems, function(a, b) return a.id < b.id end)

    return allKeyItems
end

return utils
