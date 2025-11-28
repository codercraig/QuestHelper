-- Image drawer UI module
local ui_images = {}

local imgui = require('imgui')
local ffi = require('ffi')
local bit = require('bit')

-- Renders the images drawer window attached to the main window
function ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH, currentTopCategory, currentSubfile, current_mission,
                          quest_state, quest_data, utils, image_loader, map_renderer, player_module, zone_data, map_db)

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

        for _, img_data in ipairs(step_imgs) do
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
                if not cal and img_data.zone_name and map_db[img_data.zone_name] then
                    cal = map_db[img_data.zone_name]
                end

                -- Draw player arrow on map (only if in matching zone)
                if cal and img_data.zone_name then
                    if zone_data[img_data.zone_name] and player_module.zoneId == zone_data[img_data.zone_name] then
                        local playerHeading = player_module.getHeading()
                        map_renderer.drawPlayerArrow(imageX, imageY, w, h,
                                                    player_module.posX, player_module.posY_height,
                                                    playerHeading, cal)
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
