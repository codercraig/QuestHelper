-- Map renderer module for drawing player markers on map images
local map_renderer = {}

local imgui = require('imgui')

-- Helper function to convert polar to cartesian with rotation
local function polarToXY(radius, angle)
    local x = radius * math.cos(angle - math.pi/2)
    local y = radius * math.sin(angle - math.pi/2)
    return x, y
end

-- Draws a rotating arrow at the player's position on the map
-- Parameters:
--   imageX, imageY: Top-left corner of the map image
--   w, h: Width and height of the map image
--   playerPosX, playerPosY_height: Player's world position
--   playerHeading: Player's heading in radians
--   calibration: Map calibration data {origin_x, origin_y, scale_x, scale_y}
function map_renderer.drawPlayerArrow(imageX, imageY, w, h, playerPosX, playerPosY_height, playerHeading, calibration)
    if not calibration then return end

    -- 1. Map X (Left/Right) uses Player X
    local relX = (playerPosX - calibration.origin_x) * calibration.scale_x

    -- 2. Map Y (Up/Down)
    local relY = (playerPosY_height - calibration.origin_y) * calibration.scale_y

    -- Check if marker is within bounds
    if relX >= 0 and relX <= w and relY >= 0 and relY <= h then
        local markerX = imageX + relX
        local markerY = imageY + relY

        -- Arrow size and angles
        local arrowLength = 12
        local arrowWidth = 6
        local lookAngle = playerHeading + math.pi/2

        -- Calculate arrow tip (pointing forward)
        local tipX, tipY = polarToXY(arrowLength, lookAngle)

        -- Calculate base vertices (left and right wings)
        local leftX, leftY = polarToXY(arrowWidth, lookAngle + math.pi * 0.6)
        local rightX, rightY = polarToXY(arrowWidth, lookAngle - math.pi * 0.6)

        -- Get draw list
        local dl = imgui.GetWindowDrawList()

        -- Draw filled triangle (red arrow)
        dl:AddTriangleFilled(
            {markerX + tipX, markerY + tipY},    -- Tip
            {markerX + leftX, markerY + leftY},  -- Left wing
            {markerX + rightX, markerY + rightY}, -- Right wing
            0xFF0000FF -- Red
        )

        -- Draw black outline
        dl:AddTriangle(
            {markerX + tipX, markerY + tipY},
            {markerX + leftX, markerY + leftY},
            {markerX + rightX, markerY + rightY},
            0xFF000000, -- Black
            2.0 -- Line thickness
        )
    end
end

-- Draws highlights on the map (grid-based positioning)
-- Parameters:
--   imageX, imageY: Top-left corner of the map image
--   w, h: Width and height of the map image
--   highlights: Array of highlight data {position, offsetX, offsetY}
function map_renderer.drawHighlights(imageX, imageY, w, h, highlights)
    if not highlights then return end

    local drawList = imgui.GetWindowDrawList()

    for _, highlight in ipairs(highlights) do
        local letter, numStr = highlight.position:match("([A-Za-z])%-(%d+)")
        if letter and numStr then
            local colIndex = (letter:byte() - 65) + 1
            local rowIndex = tonumber(numStr)
            local cellW, cellH = w / 16, h / 16
            local offsetX, offsetY = highlight.offsetX or 0, highlight.offsetY or 0
            local centerX = imageX + (colIndex - 0.5) * cellW + offsetX
            local centerY = imageY + (rowIndex - 0.5) * cellH + offsetY
            local halfBox = 16
            local x1, y1 = centerX - halfBox, centerY - halfBox
            local x2, y2 = centerX + halfBox, centerY + halfBox
            local colorFill, colorOutline = 0x5500FF00, 0xFFFFFFFF
            drawList:AddRectFilled({x1, y1}, {x2, y2}, colorFill)
            drawList:AddRect({x1, y1}, {x2, y2}, colorOutline)
        end
    end
end

return map_renderer
