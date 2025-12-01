-- Image drawer UI module
local ui_images = {}

local imgui = require('imgui')
local ffi = require('ffi')
local bit = require('bit')

-- Track last zone to reset auto-calibration message
ui_images.last_zone_id = nil

-- Renders the images drawer window attached to the main window
function ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH, currentTopCategory, currentSubfile, current_mission,
                          quest_state, quest_data, utils, image_loader, map_renderer, player_module, zone_data, map_db, floor_mappings)

    -- Reset auto-cal message when zone changes
    if ui_images.last_zone_id ~= player_module.zoneId then
        ui_images.auto_cal_msg_shown = false
        ui_images.last_zone_id = player_module.zoneId
    end

    local attachX = lastMainX - lastMainW + 50
    local attachY = lastMainY
    imgui.SetNextWindowPos({attachX, attachY}, ImGuiCond_Always)
    imgui.SetNextWindowSizeConstraints({200, 100}, {800, 600})
    local drawerFlags = bit.bor(
        ImGuiWindowFlags_NoTitleBar, ImGuiWindowFlags_NoResize, ImGuiWindowFlags_NoMove,
        ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoBackground,
        ImGuiWindowFlags_NoDecoration, ImGuiWindowFlags_AlwaysAutoResize
    )

    if imgui.Begin("##ImagesDrawer", true, drawerFlags) then
        local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
        local step_imgs = utils.get_images_for_step(currentTopCategory, currentSubfile, current_mission, step_idx, quest_data)

        -- Pre-calculate floor numbers for each image within its zone
        -- This handles travel routes where the same zone appears multiple times
        local zone_occurrence_count = {}
        local img_floor_numbers = {}

        for img_index, img_data in ipairs(step_imgs) do
            local zone = img_data.zone_name
            if zone then
                zone_occurrence_count[zone] = (zone_occurrence_count[zone] or 0) + 1
                img_floor_numbers[img_index] = zone_occurrence_count[zone]
            else
                img_floor_numbers[img_index] = 1
            end
        end

        for img_index, img_data in ipairs(step_imgs) do
            local tex_ptr = image_loader.GetTexture(img_data.file)
            if tex_ptr then
                local tex_id = tonumber(ffi.cast('uintptr_t', tex_ptr))
                local w = img_data.width or 200
                local h = img_data.height or 100

                -- Get position BEFORE rendering image
                local imageX, imageY = imgui.GetCursorScreenPos()

                -- Render the image first
                imgui.Image(tex_id, {w, h})

                -- Now draw overlays using the saved position
                local cal = img_data.map_calibration

                -- Get this image's floor number within its zone
                local this_img_floor = img_floor_numbers[img_index] or 1

                if not cal and img_data.zone_name and map_db[img_data.zone_name] then
                    local zone_config = map_db[img_data.zone_name]

                    -- Check if this is a multi-floor zone (has numeric indices)
                    if zone_config[1] then
                        -- Multi-floor zone: use this image's floor number to select calibration
                        cal = zone_config[this_img_floor] or zone_config[1] -- Fallback to map 1
                    else
                        -- Single-floor zone: use calibration directly
                        cal = zone_config
                    end
                end

                -- Final fallback: Try auto-calibration from mapinfo
                -- For multi-floor zones, only auto-calibrate the image matching current floor
                if not cal and img_data.width then
                    -- Check if we're in this image's zone
                    local in_this_zone = img_data.zone_name and zone_data[img_data.zone_name] and
                                        player_module.zoneId == zone_data[img_data.zone_name]

                    -- Check if this zone has multiple floors
                    local this_zone_config = map_db[img_data.zone_name]
                    local has_multiple_floors = this_zone_config and this_zone_config[1] ~= nil

                    local should_auto_cal = true
                    if in_this_zone and has_multiple_floors then
                        -- Only auto-cal if this is the player's current floor
                        local player_floor = quest_state.getCurrentMap(player_module.zoneId)
                        should_auto_cal = (this_img_floor == player_floor)
                    end

                    if should_auto_cal then
                        cal = player_module.getAutoCalibration(img_data.width)
                        if cal then
                            -- Debug message (only shown once per zone load)
                            if not ui_images.auto_cal_msg_shown then
                                local floor_info = has_multiple_floors and string.format(" (floor %d)", this_img_floor) or ""
                                print(string.format("\30\106[QH]\30\01 Using auto-calibration for %s%s", img_data.zone_name or "unknown zone", floor_info))
                                ui_images.auto_cal_msg_shown = true
                            end
                        end
                    end
                end

                -- Draw player arrow on map
                if cal and img_data.zone_name then
                    if zone_data[img_data.zone_name] and player_module.zoneId == zone_data[img_data.zone_name] then
                        -- Check if player is in the correct zone
                        local should_draw_arrow = true

                        -- Check if THIS specific image's zone has multiple floors
                        -- First check map_db, then fall back to floor_mappings
                        local this_zone_id = zone_data[img_data.zone_name]
                        local this_zone_config = map_db[img_data.zone_name]
                        local is_this_image_multi_floor = (this_zone_config and this_zone_config[1] ~= nil) or
                                                          (floor_mappings and this_zone_id and floor_mappings[this_zone_id] ~= nil)

                        if is_this_image_multi_floor then
                            -- This image is from a multi-floor zone, check floor number
                            -- Compare this image's floor number with player's current floor
                            local player_floor = quest_state.getCurrentMap(player_module.zoneId)
                            should_draw_arrow = (this_img_floor == player_floor)
                        end
                        -- For single-floor images, should_draw_arrow stays true

                        if should_draw_arrow then
                            local playerHeading = player_module.getHeading()
                            map_renderer.drawPlayerArrow(imageX, imageY, w, h,
                                                        player_module.posX, player_module.posY_height,
                                                        playerHeading, cal)
                        end
                    end
                end

                -- Draw highlights (always drawn regardless of zone)
                if img_data.highlights then
                    map_renderer.drawHighlights(imageX, imageY, w, h, img_data.highlights)
                end

                imgui.Spacing()
            else
                imgui.TextColored({1,0,0,1}, "(Missing image: " .. tostring(img_data.file) .. ")")
            end
        end
    end
    imgui.End()
end

return ui_images
