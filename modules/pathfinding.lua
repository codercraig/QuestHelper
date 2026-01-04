-- Pathfinding module for calculating routes between zones
local pathfinding = {}

-- Load zone connections
local zone_connections = require('data.zone_connections')

-- Helper function to get ALL floor_ids for a zone (for multi-floor zones)
-- Returns: array of floor_ids sorted in ascending order, or {0} if not found
local function getAllFloorIds(zone_id)
    -- Lazy-load dependencies to avoid circular dependencies
    local floor_mappings_ok, floor_mappings = pcall(require, 'data.floor_mappings')
    if not floor_mappings_ok or not floor_mappings then
        return {0}
    end

    -- Check if this zone has floor mappings
    local zone_floors = floor_mappings[zone_id]
    if not zone_floors or type(zone_floors) ~= 'table' then
        return {0}
    end

    -- Collect all floor_ids
    local floor_ids = {}
    for floor_id, _ in pairs(zone_floors) do
        if type(floor_id) == 'number' then
            table.insert(floor_ids, floor_id)
        end
    end

    -- Sort in ascending order
    table.sort(floor_ids)

    -- Return floor_ids, or {0} if no valid floors found
    return (#floor_ids > 0) and floor_ids or {0}
end

-- BFS (Breadth-First Search) to find shortest path between zones
-- Returns: path table with {zone, exit} entries, or nil if no path found
function pathfinding.findPath(start_zone, end_zone)
    -- Edge cases
    if not start_zone or not end_zone then
        return nil
    end

    if start_zone == end_zone then
        return {{zone = start_zone, exit = nil}}  -- Already at destination
    end

    if not zone_connections[start_zone] then
        return nil  -- Start zone not in graph
    end

    -- BFS setup
    local queue = {{zone = start_zone, path = {}}}
    local visited = {[start_zone] = true}

    while #queue > 0 do
        -- Dequeue
        local current = table.remove(queue, 1)
        local current_zone = current.zone
        local current_path = current.path

        -- Check neighbors
        local neighbors = zone_connections[current_zone]
        if neighbors then
            for _, neighbor in ipairs(neighbors) do
                local next_zone = neighbor.zone

                -- Found the destination?
                if next_zone == end_zone then
                    -- Build final path
                    local final_path = {}
                    for _, step in ipairs(current_path) do
                        table.insert(final_path, step)
                    end
                    table.insert(final_path, {zone = next_zone, exit = neighbor.exit})
                    return final_path
                end

                -- Not visited yet? Add to queue
                if not visited[next_zone] then
                    visited[next_zone] = true
                    local new_path = {}
                    for _, step in ipairs(current_path) do
                        table.insert(new_path, step)
                    end
                    table.insert(new_path, {zone = next_zone, exit = neighbor.exit})
                    table.insert(queue, {zone = next_zone, path = new_path})
                end
            end
        end
    end

    -- No path found
    return nil
end

-- Normalize zone name for display (strip directional suffixes)
-- "North Gustaberg (East)" -> "North Gustaberg"
local function normalizeZoneName(zone_name)
    if not zone_name then return zone_name end
    -- Strip (East), (West), etc. suffixes for display
    return zone_name:gsub("%s*%(East%)$", ""):gsub("%s*%(West%)$", "")
end

-- Format a path into a readable string
-- Returns: formatted route string with current zone and exit coordinates
-- Format: "Current Zone (Exit) ->\nNext Zone (Exit) ->\nDestination"
function pathfinding.formatPath(path, current_zone)
    if not path or type(path) ~= "table" or #path == 0 then
        return "No route found"
    end

    -- If only one entry, player is already at destination
    if #path == 1 and path[1] and not path[1].exit then
        return "You're already here!"
    end

    local parts = {}

    -- Add the starting zone with the first exit coordinate
    if current_zone and #path > 0 and path[1] and path[1].exit then
        local norm_zone = normalizeZoneName(current_zone)
        if norm_zone then
            parts[#parts + 1] = string.format("%s (%s)", norm_zone, path[1].exit)
        end
    end

    -- Show subsequent zones with their exit coordinates
    -- Each zone shows the exit coordinate to reach the NEXT zone
    for i = 1, #path - 1 do
        local current_step = path[i]
        local next_step = path[i + 1]

        if current_step and next_step and next_step.exit then
            -- Show the zone you'll be in, with the exit to reach the next zone
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                parts[#parts + 1] = string.format("%s (%s)", norm_zone, next_step.exit)
            end
        elseif current_step and current_step.zone then
            -- Next zone is the destination (no exit needed from current)
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                parts[#parts + 1] = norm_zone
            end
        end
    end

    -- Add final destination
    if #path > 0 and path[#path] and path[#path].zone then
        local norm_zone = normalizeZoneName(path[#path].zone)
        if norm_zone then
            parts[#parts + 1] = norm_zone
        end
    end

    if #parts == 0 then
        return "You're already here!"
    end

    return table.concat(parts, " ->\n")
end

-- Get route distance (number of zones to travel through)
function pathfinding.getRouteDistance(path)
    if not path or #path == 0 then
        return 0
    end

    -- If already at destination
    if #path == 1 and not path[1].exit then
        return 0
    end

    return #path
end

-- Check if a route is considered "long" (more than 5 zones)
function pathfinding.isLongRoute(path)
    return pathfinding.getRouteDistance(path) > 5
end

-- Generate images array for displaying route maps with exit highlights
-- Shows ALL exits that lead toward the destination (same minimum distance)
-- Returns: images array compatible with quest step format
-- Parameters:
--   path: The route path from BFS
--   current_zone: Player's current zone name
--   destination_highlight: Optional highlight for final destination (e.g., {position = "H-8", offsetX = 16, offsetY = 16})
function pathfinding.generateRouteImages(path, current_zone, destination_highlight)
    if not path or type(path) ~= "table" or #path == 0 then
        return {}
    end

    -- Load zone database for zone_id lookups (needed for floor_id)
    local zones_db_ok, zones_db = pcall(require, 'data.zones')
    if not zones_db_ok then
        zones_db = {}
    end

    local images = {}
    local destination = path[#path] and path[#path].zone

    -- If already at destination, show destination map with highlight (player needs to see where NPC is)
    if #path == 1 and path[1] and not path[1].exit then
        if destination and destination_highlight then
            -- Create a simple map entry for the destination zone with the NPC/target highlight
            table.insert(images, {
                zone_name = destination,
                floor_id = 0,  -- Default floor, will be auto-detected by map system
                width = 512,
                height = 512,
                highlights = {destination_highlight}
            })
        end
        return images
    end

    -- Helper: Get all exits from current_zone that lead toward destination
    -- Returns: table of {floor_id = {highlights}, ...} or {[0] = {highlights}} if no floor_id
    local function getExitsTowardDestinationByFloor(from_zone)
        local exits_by_floor = {}

        if not from_zone or not destination then
            return exits_by_floor
        end

        -- Get zone connections to check for floor_id
        local connections = zone_connections[from_zone]
        if not connections then
            return exits_by_floor
        end

        -- Calculate BFS distance from each neighbor to destination
        local min_distance = math.huge
        local zone_distances = {}

        -- First pass: calculate minimum distance
        for _, conn in ipairs(connections) do
            if conn.zone then
                local path_to_dest = pathfinding.findPath(conn.zone, destination)
                if path_to_dest then
                    local distance = pathfinding.getRouteDistance(path_to_dest)
                    if not zone_distances[conn.zone] or distance < zone_distances[conn.zone] then
                        zone_distances[conn.zone] = distance
                    end
                    if distance < min_distance then
                        min_distance = distance
                    end
                end
            end
        end

        -- Second pass: collect exits that have minimum distance, grouped by floor_id
        for _, conn in ipairs(connections) do
            if conn.zone and zone_distances[conn.zone] == min_distance and conn.exit then
                -- Use 0 as sentinel for "no floor_id specified" (can't use nil as table key in Lua)
                local floor_id = conn.floor_id or 0
                if not exits_by_floor[floor_id] then
                    exits_by_floor[floor_id] = {}
                end
                table.insert(exits_by_floor[floor_id], {position = conn.exit, offsetX = 16, offsetY = 16})
            end
        end

        return exits_by_floor
    end

    -- Add current zone map with ALL exits toward destination
    if current_zone then
        local norm_zone = normalizeZoneName(current_zone)
        if norm_zone then
            local exits_by_floor = getExitsTowardDestinationByFloor(current_zone)

            -- Get zone_id to determine available floors
            local zone_id = zones_db[norm_zone]

            -- Process exits grouped by floor_id
            for floor_id, highlights in pairs(exits_by_floor) do
                if floor_id == 0 then
                    -- No floor_id specified in zone_connections: show all floors with same highlights
                    local floor_ids = zone_id and getAllFloorIds(zone_id) or {0}
                    for _, fid in ipairs(floor_ids) do
                        images[#images + 1] = {
                            zone_name = norm_zone,
                            width = 512,
                            height = 512,
                            floor_id = fid,
                            highlights = highlights
                        }
                    end
                else
                    -- floor_id IS specified: only show that specific floor
                    images[#images + 1] = {
                        zone_name = norm_zone,
                        width = 512,
                        height = 512,
                        floor_id = floor_id,
                        highlights = highlights
                    }
                end
            end
        end
    end

    -- Add intermediate zone maps with ALL exits toward destination
    for i = 1, #path - 1 do
        local current_step = path[i]

        if current_step and current_step.zone then
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                local exits_by_floor = getExitsTowardDestinationByFloor(current_step.zone)

                -- Get zone_id to determine available floors
                local zone_id = zones_db[norm_zone]

                -- Process exits grouped by floor_id
                for floor_id, highlights in pairs(exits_by_floor) do
                    if floor_id == 0 then
                        -- No floor_id specified in zone_connections: show all floors with same highlights
                        local floor_ids = zone_id and getAllFloorIds(zone_id) or {0}
                        for _, fid in ipairs(floor_ids) do
                            images[#images + 1] = {
                                zone_name = norm_zone,
                                width = 512,
                                height = 512,
                                floor_id = fid,
                                highlights = highlights
                            }
                        end
                    else
                        -- floor_id IS specified: only show that specific floor
                        images[#images + 1] = {
                            zone_name = norm_zone,
                            width = 512,
                            height = 512,
                            floor_id = floor_id,
                            highlights = highlights
                        }
                    end
                end
            end
        end
    end

    -- Add final destination map with optional custom highlight
    if destination then
        local norm_zone = normalizeZoneName(destination)
        if norm_zone then
            -- Get zone_id and all floor_ids for this zone
            local zone_id = zones_db[norm_zone]
            local floor_ids = zone_id and getAllFloorIds(zone_id) or {0}

            -- Add a map for EACH floor of the destination zone
            for _, floor_id in ipairs(floor_ids) do
                local final_map = {
                    zone_name = norm_zone,
                    width = 512,
                    height = 512,
                    floor_id = floor_id
                }

                -- Add custom highlight if provided (e.g., NPC location)
                if destination_highlight then
                    final_map.highlights = {destination_highlight}
                end

                images[#images + 1] = final_map
            end
        end
    end

    return images
end

return pathfinding
