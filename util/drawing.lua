--[[
    drawing.lua
    QuestHelper
]]

local helpers = require('util.helpers')

-- Create the module
local drawingModule = {}

local d3d8dev       = require('d3d8').get_device()
local ffi           = require('ffi')
local C             = ffi.C

ffi.cdef[[
    struct LineVertFormat {
        float x, y, z, rhw;
        unsigned int diffuse;
    };
]]
local lineVertSize = ffi.sizeof('struct LineVertFormat')

local VERTEX_FORMAT = bit.bor(C.D3DFVF_XYZRHW, C.D3DFVF_DIFFUSE)
local function drawLine(start_pos, end_pos, color)
    local _, view = d3d8dev:GetTransform(C.D3DTS_VIEW)
    local _, projection = d3d8dev:GetTransform(C.D3DTS_PROJECTION)

    local p1_x, p1_y, p1_z = helpers.worldToScreen(start_pos.x, start_pos.y, start_pos.z, view, projection)
    local p2_x, p2_y, p2_z = helpers.worldToScreen(end_pos.x, end_pos.y, end_pos.z, view, projection)

    if p1_x == nil or p2_x == nil then
        return
    end

    -- Check if points are behind the camera
    if p1_z < 0 or p1_z > 1 or p2_z < 0 or p2_z > 1 then
        return
    end

    local vertices = ffi.new('struct LineVertFormat[2]', {
        {p1_x, p1_y, 0.5, 1.0, color},
        {p2_x, p2_y, 0.5, 1.0, color},
    })
    d3d8dev:SetTexture(0, nil)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLOROP, C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_COLORARG1, C.D3DTA_DIFFUSE)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAOP, C.D3DTOP_SELECTARG1)
    d3d8dev:SetTextureStageState(0, C.D3DTSS_ALPHAARG1, C.D3DTA_DIFFUSE)
    d3d8dev:SetRenderState(C.D3DRS_ZENABLE, 0)
    d3d8dev:SetRenderState(C.D3DRS_ALPHABLENDENABLE, 1)
    d3d8dev:SetRenderState(C.D3DRS_SRCBLEND, C.D3DBLEND_SRCALPHA)
    d3d8dev:SetRenderState(C.D3DRS_DESTBLEND, C.D3DBLEND_INVSRCALPHA)

    d3d8dev:SetVertexShader(VERTEX_FORMAT)
    d3d8dev:DrawPrimitiveUP(C.D3DPT_LINESTRIP, 1, vertices, lineVertSize)
end

function drawingModule.drawSquare(center, size, color)
    local half_size = size / 2
    local corners = {
        {x = center.x - half_size, y = center.y, z = center.z - half_size},
        {x = center.x + half_size, y = center.y, z = center.z - half_size},
        {x = center.x + half_size, y = center.y, z = center.z + half_size},
        {x = center.x - half_size, y = center.y, z = center.z + half_size}
    }

    drawLine(corners[1], corners[2], color)
    drawLine(corners[2], corners[3], color)
    drawLine(corners[3], corners[4], color)
    drawLine(corners[4], corners[1], color)
end

function drawingModule.drawLine(p1, p2, color)
    drawLine(p1, p2, color)
end

function drawingModule.drawLineWithArrow(p1, p2, color, head_size)
    drawLine(p1, p2, color)
    local hs = head_size or 1.8
    local dx = p2.x - p1.x
    local dz = p2.z - p1.z
    local len = math.sqrt(dx*dx + dz*dz)
    if len < 0.001 then return end
    local nx, nz = dx / len, dz / len
    local wing1 = { x = p2.x - nx*hs + (-nz)*hs*0.5, y = p2.y, z = p2.z - nz*hs + nx*hs*0.5 }
    local wing2 = { x = p2.x - nx*hs - (-nz)*hs*0.5, y = p2.y, z = p2.z - nz*hs - nx*hs*0.5 }
    drawLine(p2, wing1, color)
    drawLine(p2, wing2, color)
end

function drawingModule.drawArrow(center, size, direction, color, outline)
    -- direction can be: 'up', 'down', 'left', 'right', 'north', 'south', 'east', 'west'
    -- and diagonals: 'northeast', 'northwest', 'southeast', 'southwest', 'ne', 'nw', 'se', 'sw'
    -- outline: optional boolean, if true draws a black outline for better visibility
    -- Normalize direction to lowercase
    local dir = string.lower(direction or 'up')

    -- Arrow dimensions
    local head_length = size * 0.4
    local head_width = size * 0.5

    -- For diagonals, use sqrt(2) to maintain proper length
    local diagonal_factor = 0.707  -- 1/sqrt(2)

    local points = {}

    -- Define arrow points based on direction
    -- Arrow points up (north) by default
    if dir == 'up' or dir == 'north' then
        -- Tip of arrow (top/north)
        points.tip = {x = center.x, y = center.y, z = center.z + size/2}
        -- Base of shaft (bottom/south)
        points.base = {x = center.x, y = center.y, z = center.z - size/2}
        -- Left arrowhead
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z + size/2 - head_length}
        -- Right arrowhead
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z + size/2 - head_length}

    elseif dir == 'down' or dir == 'south' then
        -- Tip of arrow (bottom/south)
        points.tip = {x = center.x, y = center.y, z = center.z - size/2}
        -- Base of shaft (top/north)
        points.base = {x = center.x, y = center.y, z = center.z + size/2}
        -- Left arrowhead
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z - size/2 + head_length}
        -- Right arrowhead
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z - size/2 + head_length}

    elseif dir == 'left' or dir == 'west' then
        -- Tip of arrow (left)
        points.tip = {x = center.x - size/2, y = center.y, z = center.z}
        -- Base of shaft (right)
        points.base = {x = center.x + size/2, y = center.y, z = center.z}
        -- Top arrowhead
        points.left = {x = center.x - size/2 + head_length, y = center.y, z = center.z - head_width/2}
        -- Bottom arrowhead
        points.right = {x = center.x - size/2 + head_length, y = center.y, z = center.z + head_width/2}

    elseif dir == 'right' or dir == 'east' then
        -- Tip of arrow (right)
        points.tip = {x = center.x + size/2, y = center.y, z = center.z}
        -- Base of shaft (left)
        points.base = {x = center.x - size/2, y = center.y, z = center.z}
        -- Top arrowhead
        points.left = {x = center.x + size/2 - head_length, y = center.y, z = center.z - head_width/2}
        -- Bottom arrowhead
        points.right = {x = center.x + size/2 - head_length, y = center.y, z = center.z + head_width/2}

    -- Diagonal directions
    elseif dir == 'northeast' or dir == 'ne' then
        -- Tip of arrow (northeast)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x + offset, y = center.y, z = center.z + offset}
        points.base = {x = center.x - offset, y = center.y, z = center.z - offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x - head_offset - head_perp, y = center.y, z = points.tip.z - head_offset + head_perp}
        points.right = {x = points.tip.x - head_offset + head_perp, y = center.y, z = points.tip.z - head_offset - head_perp}

    elseif dir == 'northwest' or dir == 'nw' then
        -- Tip of arrow (northwest)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x - offset, y = center.y, z = center.z + offset}
        points.base = {x = center.x + offset, y = center.y, z = center.z - offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x + head_offset - head_perp, y = center.y, z = points.tip.z - head_offset - head_perp}
        points.right = {x = points.tip.x + head_offset + head_perp, y = center.y, z = points.tip.z - head_offset + head_perp}

    elseif dir == 'southeast' or dir == 'se' then
        -- Tip of arrow (southeast)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x + offset, y = center.y, z = center.z - offset}
        points.base = {x = center.x - offset, y = center.y, z = center.z + offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x - head_offset + head_perp, y = center.y, z = points.tip.z + head_offset + head_perp}
        points.right = {x = points.tip.x - head_offset - head_perp, y = center.y, z = points.tip.z + head_offset - head_perp}

    elseif dir == 'southwest' or dir == 'sw' then
        -- Tip of arrow (southwest)
        local offset = size/2 * diagonal_factor
        points.tip = {x = center.x - offset, y = center.y, z = center.z - offset}
        points.base = {x = center.x + offset, y = center.y, z = center.z + offset}
        -- Arrowhead points perpendicular to diagonal
        local head_offset = head_length * diagonal_factor
        local head_perp = head_width/2 * diagonal_factor
        points.left = {x = points.tip.x + head_offset + head_perp, y = center.y, z = points.tip.z + head_offset - head_perp}
        points.right = {x = points.tip.x + head_offset - head_perp, y = center.y, z = points.tip.z + head_offset + head_perp}

    else
        -- Default to up if invalid direction
        points.tip = {x = center.x, y = center.y, z = center.z + size/2}
        points.base = {x = center.x, y = center.y, z = center.z - size/2}
        points.left = {x = center.x - head_width/2, y = center.y, z = center.z + size/2 - head_length}
        points.right = {x = center.x + head_width/2, y = center.y, z = center.z + size/2 - head_length}
    end

    -- Draw thick outline if requested (black border for visibility)
    if outline then
        local black_color = 0xFF000000  -- Solid black
        local outline_thickness = 0.08  -- Thickness of outline in world units

        -- Draw multiple offset lines to create thick outline effect
        for offset_y = -outline_thickness, outline_thickness, outline_thickness/2 do
            -- Offset points in Y direction (up/down in world space)
            local base_offset = {x = points.base.x, y = points.base.y + offset_y, z = points.base.z}
            local tip_offset = {x = points.tip.x, y = points.tip.y + offset_y, z = points.tip.z}
            local left_offset = {x = points.left.x, y = points.left.y + offset_y, z = points.left.z}
            local right_offset = {x = points.right.x, y = points.right.y + offset_y, z = points.right.z}

            drawLine(base_offset, tip_offset, black_color)
            drawLine(tip_offset, left_offset, black_color)
            drawLine(tip_offset, right_offset, black_color)
        end
    end

    -- Draw the arrow shaft
    drawLine(points.base, points.tip, color)

    -- Draw the arrowhead (two lines forming a V)
    drawLine(points.tip, points.left, color)
    drawLine(points.tip, points.right, color)
end

return drawingModule
