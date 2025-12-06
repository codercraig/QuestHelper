-- Floor State Debug Command
-- Use /qh_test_floors to output detailed floor detection state

local floor_debug = {}

function floor_debug.get_state_report(player_module, zone_data, floor_mappings, map_db, step_imgs)
    local report = {}

    table.insert(report, "=== FLOOR DETECTION STATE ===")
    table.insert(report, string.format("Player Zone: %s (ID: %d)",
        player_module.zoneName or "Unknown",
        player_module.zoneId or 0))

    -- Get player floor info
    local raw_floor = player_module.getFloorId(nil) -- No mapping, get raw
    local mapped_floor = player_module.getFloorId(floor_mappings)
    table.insert(report, string.format("Player Floor: Raw=%s, Mapped=%s",
        tostring(raw_floor),
        tostring(mapped_floor)))

    -- Check floor mapping
    local has_floor_mapping = floor_mappings and floor_mappings[player_module.zoneId] ~= nil
    table.insert(report, string.format("Has Floor Mapping: %s", tostring(has_floor_mapping)))
    if has_floor_mapping then
        table.insert(report, "  Floor Mappings:")
        for raw_id, map_num in pairs(floor_mappings[player_module.zoneId]) do
            table.insert(report, string.format("    [%s] = %s", tostring(raw_id), tostring(map_num)))
        end
    end

    table.insert(report, "")
    table.insert(report, "=== IMAGES IN CURRENT STEP ===")

    if not step_imgs or #step_imgs == 0 then
        table.insert(report, "No images in current step")
        return report
    end

    -- Count images per zone
    local zone_counts = {}
    local zone_images = {}

    for idx, img in ipairs(step_imgs) do
        local zone_name = img.zone_name or "Unknown"
        zone_counts[zone_name] = (zone_counts[zone_name] or 0) + 1

        if not zone_images[zone_name] then
            zone_images[zone_name] = {}
        end

        local floor_num = img.file and img.file:match("_(%d+)%.png$")
        table.insert(zone_images[zone_name], {
            index = idx,
            file = img.file or "unknown",
            floor = floor_num and tonumber(floor_num) or zone_counts[zone_name]
        })
    end

    table.insert(report, string.format("Total Images: %d", #step_imgs))
    table.insert(report, string.format("Unique Zones: %d",
        (function()
            local count = 0
            for _ in pairs(zone_counts) do count = count + 1 end
            return count
        end)()))
    table.insert(report, "")

    for zone_name, images in pairs(zone_images) do
        local zone_id = zone_data[zone_name]
        local is_current_zone = zone_id and (zone_id == player_module.zoneId)
        local img_count = #images

        table.insert(report, string.format("Zone: %s (ID: %s) %s",
            zone_name,
            tostring(zone_id),
            is_current_zone and "[CURRENT]" or ""))

        table.insert(report, string.format("  Image Count: %d", img_count))

        -- Determine multi-floor detection
        local map_db_multi = map_db[zone_name] and map_db[zone_name][1] ~= nil
        local mapping_multi = floor_mappings and zone_id and floor_mappings[zone_id] ~= nil
        local count_multi = img_count > 1

        local is_multi_floor = map_db_multi or mapping_multi or count_multi

        table.insert(report, string.format("  Is Multi-Floor: %s", tostring(is_multi_floor)))
        table.insert(report, string.format("    - Via map_db: %s", tostring(map_db_multi)))
        table.insert(report, string.format("    - Via floor_mappings: %s", tostring(mapping_multi)))
        table.insert(report, string.format("    - Via image count: %s", tostring(count_multi)))

        table.insert(report, "  Images:")
        for _, img_info in ipairs(images) do
            local should_draw = "NO"
            local reason = "zone_mismatch"

            if is_current_zone then
                if is_multi_floor then
                    if mapped_floor and img_info.floor == mapped_floor then
                        should_draw = "YES"
                        reason = "floor_match"
                    else
                        should_draw = "NO"
                        reason = string.format("floor_mismatch (img_floor=%s, player_floor=%s)",
                            tostring(img_info.floor),
                            tostring(mapped_floor))
                    end
                else
                    -- Single floor, always draw if in zone
                    should_draw = "YES"
                    reason = "single_floor_zone"
                end
            else
                reason = "different_zone"
            end

            table.insert(report, string.format("    [%d] %s → Floor %s | Arrow: %s (%s)",
                img_info.index,
                img_info.file,
                tostring(img_info.floor),
                should_draw,
                reason))
        end
        table.insert(report, "")
    end

    return report
end

return floor_debug
