--[[
    drawing.lua
    QuestHelper
]]

local helpers = require('helpers')

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

return drawingModule
