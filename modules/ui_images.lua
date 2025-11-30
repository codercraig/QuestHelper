-- Image drawer UI module
local ui_images = {}

local imgui = require('imgui')
local ffi = require('ffi')
local bit = require('bit')

-- Track last zone to reset auto-calibration message
ui_images.last_zone_id = nil

-- Renders the images drawer window attached to the main window
function ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH, currentTopCategory, currentSubfile, current_mission,
                          quest_state, quest_data, utils, image_loader, map_renderer, player_module, zone_data, map_db)

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
                local is_multi_floor = (#step_imgs > 1)

                -- Get current map number for multi-floor zones (regardless of calibration source)
                local current_map_num = 1 -- Default to map 1
                if is_multi_floor then
                    current_map_num = quest_state.getCurrentMap(player_module.zoneId)
                end

                if not cal and img_data.zone_name and map_db[img_data.zone_name] then
                    local zone_config = map_db[img_data.zone_name]

                    -- Check if this is a multi-floor zone (has numeric indices)
                    if zone_config[1] then
                        -- Multi-floor zone: use current_map to select calibration
                        cal = zone_config[current_map_num] or zone_config[1] -- Fallback to map 1
                    else
                        -- Single-floor zone: use calibration directly
                        cal = zone_config
                    end
                end

                -- Final fallback: Try auto-calibration from mapinfo
                -- For multi-floor zones, only auto-calibrate the image matching current floor
                if not cal and img_data.width then
                    local should_auto_cal = not is_multi_floor or (img_index == current_map_num)

                    if should_auto_cal then
                        cal = player_module.getAutoCalibration(img_data.width)
                        if cal then
                            -- Debug message (only shown once per zone load)
                            if not ui_images.auto_cal_msg_shown then
                                local floor_info = is_multi_floor and string.format(" (floor %d)", current_map_num) or ""
                                print(string.format("\30\106[QH]\30\01 Using auto-calibration for %s%s", img_data.zone_name or "unknown zone", floor_info))
                                ui_images.auto_cal_msg_shown = true
                            end
                        end
                    end
                end

                -- Draw player arrow on map (only if in matching zone AND matching map number)
                if cal and img_data.zone_name then
                    if zone_data[img_data.zone_name] and player_module.zoneId == zone_data[img_data.zone_name] then
                        -- For multi-map zones, only draw arrow on the current map's image
                        if img_index == current_map_num then
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
