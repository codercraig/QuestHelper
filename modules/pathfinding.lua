-- Pathfinding module for calculating routes between zones
local pathfinding = {}

-- Load zone connections
local zone_connections = require('data.zone_connections')

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
-- Returns: images array compatible with quest step format
function pathfinding.generateRouteImages(path, current_zone)
    if not path or type(path) ~= "table" or #path == 0 then
        return {}
    end

    -- If already at destination, no maps needed
    if #path == 1 and path[1] and not path[1].exit then
        return {}
    end

    local images = {}

    -- Add current zone map with first exit highlighted
    if current_zone and path[1] and path[1].exit then
        local norm_zone = normalizeZoneName(current_zone)
        if norm_zone then
            images[#images + 1] = {
                zone_name = norm_zone,
                width = 512,
                height = 512,
                highlights = {
                    {position = path[1].exit, offsetX = 16, offsetY = 16}
                }
            }
        end
    end

    -- Add intermediate zone maps with their exits highlighted
    for i = 1, #path - 1 do
        local current_step = path[i]
        local next_step = path[i + 1]

        if current_step and current_step.zone and next_step and next_step.exit then
            local norm_zone = normalizeZoneName(current_step.zone)
            if norm_zone then
                images[#images + 1] = {
                    zone_name = norm_zone,
                    width = 512,
                    height = 512,
                    highlights = {
                        {position = next_step.exit, offsetX = 16, offsetY = 16}
                    }
                }
            end
        end
    end

    -- Add final destination map (no highlight needed)
    if #path > 0 and path[#path] and path[#path].zone then
        local norm_zone = normalizeZoneName(path[#path].zone)
        if norm_zone then
            images[#images + 1] = {
                zone_name = norm_zone,
                width = 512,
                height = 512
            }
        end
    end

    return images
end

return pathfinding
