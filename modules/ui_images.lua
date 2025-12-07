-- Image drawer UI module
local ui_images = {}

local imgui = require('imgui')
local ffi = require('ffi')
local bit = require('bit')

-- Track last zone to reset auto-calibration message
ui_images.last_zone_id = nil

-- Track last step for texture cleanup
ui_images.last_step_key = nil

-- Track for auto-scroll feature
ui_images.last_auto_scroll_zone = nil
ui_images.last_auto_scroll_floor = nil

-- Renders the images drawer window attached to the main window
function ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH, currentTopCategory, currentSubfile, current_mission,
                          quest_state, quest_data, utils, image_loader, map_renderer, player_module, zone_data, map_db, floor_mappings, ui_main_settings)

    -- Reset auto-cal message when zone changes
    if ui_images.last_zone_id ~= player_module.zoneId then
        ui_images.auto_cal_msg_shown = false
        ui_images.last_zone_id = player_module.zoneId
    end

    -- Detached draggable window - use saved position or center on first launch
    if ui_main_settings.map_pos_x and ui_main_settings.map_pos_y then
        -- Use saved position
        imgui.SetNextWindowPos({ui_main_settings.map_pos_x, ui_main_settings.map_pos_y}, ImGuiCond_FirstUseEver)
    else
        -- Center on screen on first launch
        imgui.SetNextWindowPos({100, 100}, ImGuiCond_FirstUseEver)
    end

    -- Fixed size for 512x512 maps + scrollbar + padding
    imgui.SetNextWindowSize({540, 530}, ImGuiCond_Always)

    -- Window flags: Draggable (removed NoMove), no title bar, no resize
    local drawerFlags = bit.bor(
        ImGuiWindowFlags_NoTitleBar, ImGuiWindowFlags_NoResize,
        ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoBackground,
        ImGuiWindowFlags_AlwaysAutoResize
    )

    if imgui.Begin("##ImagesDrawer", true, drawerFlags) then
        -- Use a scrollable child window for the images
        -- This allows programmatic scrolling via SetScrollY
        -- Add NoBackground flag to make child window transparent
        imgui.BeginChild("##ImagesScrollRegion", {0, 0}, false, ImGuiWindowFlags_NoBackground)

        local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
        local step_imgs = utils.get_images_for_step(currentTopCategory, currentSubfile, current_mission, step_idx, quest_data)

        -- Track current step and cleanup old textures when step changes
        local current_step_key = string.format("%s|%s|%s|%d",
            currentTopCategory or "", currentSubfile or "", current_mission or "", step_idx or 0)

        if ui_images.last_step_key ~= current_step_key then
            -- Step changed, cleanup old textures
            local keep_files = {}
            for _, img_data in ipairs(step_imgs) do
                if img_data.file then
                    table.insert(keep_files, img_data.file)
                end
            end

            local unloaded = image_loader.CleanupUnused(keep_files)
            if unloaded > 0 then
                print(string.format("\30\106[QH]\30\01 Cleaned up %d unused texture(s), keeping %d for current step",
                    unloaded, #keep_files))
            end

            ui_images.last_step_key = current_step_key
        end

        -- Pre-calculate floor numbers for each image within its zone
        -- Extract floor index from filename (_1, _2, etc.) and map to actual floor IDs
        local zone_occurrence_count = {}
        local img_floor_numbers = {}
        local zone_image_counts = {}  -- Track how many images per zone

        for img_index, img_data in ipairs(step_imgs) do
            local zone = img_data.zone_name
            if zone then
                -- Count images per zone for multi-floor detection
                zone_image_counts[zone] = (zone_image_counts[zone] or 0) + 1

                -- Try to extract floor index from filename (e.g., "zonename_2.png" -> index 2)
                local floor_index = img_data.file and img_data.file:match("_(%d+)%.png$")
                if floor_index then
                    -- Use the filename index directly (corresponds to map_db index)
                    img_floor_numbers[img_index] = tonumber(floor_index)
                else
                    -- No floor index in filename, fall back to occurrence counting
                    zone_occurrence_count[zone] = (zone_occurrence_count[zone] or 0) + 1
                    img_floor_numbers[img_index] = zone_occurrence_count[zone]
                end
            else
                img_floor_numbers[img_index] = 1
            end
        end

        -- Auto-scroll feature: scroll to current zone/floor when changed
        local current_player_floor = player_module.getFloorId(floor_mappings)
        local should_auto_scroll = false
        local target_image_index = nil

        -- Check if zone or floor changed (trigger auto-scroll)
        -- Only auto-scroll if enabled in settings
        local auto_scroll_enabled = ui_main_settings and ui_main_settings.auto_scroll_enabled or true
        if auto_scroll_enabled and (ui_images.last_auto_scroll_zone ~= player_module.zoneId or
           ui_images.last_auto_scroll_floor ~= current_player_floor) then
            should_auto_scroll = true
            ui_images.last_auto_scroll_zone = player_module.zoneId
            ui_images.last_auto_scroll_floor = current_player_floor

            print(string.format("\30\106[QH-DEBUG]\30\01 Zone/floor changed: ZoneID=%d, Floor=%s",
                player_module.zoneId or 0, tostring(current_player_floor)))

            -- Find the matching image for current zone/floor
            for idx, img in ipairs(step_imgs) do
                local img_zone_id = img.zone_name and zone_data[img.zone_name]
                if img_zone_id == player_module.zoneId then
                    local img_floor = img_floor_numbers[idx] or 1

                    -- Check if multi-floor or single-floor zone
                    local zone_img_count = zone_image_counts[img.zone_name] or 1
                    if zone_img_count > 1 then
                        -- Multi-floor: match specific floor
                        if img_floor == current_player_floor then
                            target_image_index = idx
                            print(string.format("\30\106[QH-DEBUG]\30\01 Found target: Image #%d, Floor %d matches player floor %s",
                                idx, img_floor, tostring(current_player_floor)))
                            break
                        end
                    else
                        -- Single-floor: just match zone
                        target_image_index = idx
                        print(string.format("\30\106[QH-DEBUG]\30\01 Found target: Image #%d (single-floor zone)", idx))
                        break
                    end
                end
            end

            if not target_image_index then
                print(string.format("\30\68[QH-DEBUG]\30\01 No matching image found for zone %d, floor %s",
                    player_module.zoneId or 0, tostring(current_player_floor)))
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

                -- Auto-scroll: Set cursor position BEFORE rendering this image
                -- This tells ImGui to scroll to make this position visible
                if should_auto_scroll and img_index == target_image_index then
                    local current_scroll = imgui.GetScrollY()
                    local max_scroll = imgui.GetScrollMaxY()

                    -- Determine scroll alignment based on position
                    local scroll_ratio
                    local total_images = #step_imgs

                    if img_index == 1 then
                        -- First image: align near top
                        scroll_ratio = 0.0
                    elseif img_index >= total_images - 1 then
                        -- Last or second-to-last image: scroll to absolute bottom
                        -- Use a very high value to ensure we scroll as far down as possible
                        scroll_ratio = 0.0
                    elseif total_images <= 2 then
                        -- Only 2 images: scroll to bottom
                        scroll_ratio = 1.0
                    else
                        -- Middle images: center the image more prominently
                        -- 0.8 scrolls down significantly, centering the target map
                        scroll_ratio = 0.0
                    end

                    imgui.SetScrollHereY(scroll_ratio)

                    print(string.format("\30\106[QH]\30\01 Auto-scrolled to %s (floor %d)",
                        img_data.zone_name or "unknown",
                        img_floor_numbers[img_index] or 1))
                    print(string.format("\30\106[QH-DEBUG]\30\01 Scroll: img %d/%d, ratio=%.2f, current=%.0f, max=%.0f",
                        img_index, total_images, scroll_ratio, current_scroll, max_scroll))
                end

                -- Apply opacity setting to map images
                local map_opacity = ui_main_settings and ui_main_settings.map_opacity or 1.0

                -- Render the image with opacity
                imgui.Image(tex_id, {w, h}, {0, 0}, {1, 1}, {1, 1, 1, map_opacity})

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

                    -- Check if this zone has multiple floors (from map_db, floor_mappings, or image count)
                    local this_zone_id = zone_data[img_data.zone_name]
                    local this_zone_config = map_db[img_data.zone_name]
                    local has_multiple_floors = (this_zone_config and this_zone_config[1] ~= nil) or
                                               (floor_mappings and this_zone_id and floor_mappings[this_zone_id] ~= nil) or
                                               (zone_image_counts[img_data.zone_name] and zone_image_counts[img_data.zone_name] > 1)

                    local should_auto_cal = true
                    if in_this_zone and has_multiple_floors then
                        -- Only auto-cal if this is the player's current floor
                        -- Use actual floor from game, not saved preference
                        local player_floor = player_module.getFloorId(floor_mappings)
                        if player_floor then
                            should_auto_cal = (this_img_floor == player_floor)
                        else
                            -- Can't determine player floor, allow auto-cal anyway
                            should_auto_cal = true
                        end
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
                        -- First check map_db, then floor_mappings, then count images in current step
                        local this_zone_id = zone_data[img_data.zone_name]
                        local this_zone_config = map_db[img_data.zone_name]
                        local is_this_image_multi_floor = (this_zone_config and this_zone_config[1] ~= nil) or
                                                          (floor_mappings and this_zone_id and floor_mappings[this_zone_id] ~= nil) or
                                                          (zone_image_counts[img_data.zone_name] and zone_image_counts[img_data.zone_name] > 1)

                        if is_this_image_multi_floor then
                            -- This image is from a multi-floor zone, check floor number
                            -- Compare this image's floor number with player's ACTUAL current floor
                            local player_floor = player_module.getFloorId(floor_mappings)
                            if player_floor then
                                should_draw_arrow = (this_img_floor == player_floor)
                            else
                                -- Can't determine floor, default to not drawing to avoid duplicates
                                should_draw_arrow = false
                            end
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

        imgui.EndChild()  -- End scrollable child window

        -- Save map position when window is moved
        local current_x, current_y = imgui.GetWindowPos()
        if ui_main_settings.map_pos_x ~= current_x or ui_main_settings.map_pos_y ~= current_y then
            ui_main_settings.map_pos_x = current_x
            ui_main_settings.map_pos_y = current_y
            -- Save settings (using quest_state's settings object)
            local settings = require('settings')
            settings.save('QuestHelper_settings', quest_state.settings)
        end
    end
    imgui.End()
end

return ui_images
