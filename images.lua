------------------------------------------------------------------
----- All credit to atom0s for providing texture loading code ----
------------------------------------------------------------------
-- File: images.lua
require 'common'
local ffi     = require('ffi')
local d3d     = require('d3d8')
local C       = ffi.C
local d3d8dev = d3d.get_device()

ffi.cdef[[
HRESULT __stdcall D3DXCreateTextureFromFileA(
    IDirect3DDevice8* pDevice,
    const char* pSrcFile,
    IDirect3DTexture8** ppTexture
);
]]

local images = {}
local loaded_textures = {}

-- Helper function to load one texture by filename.
local function load_texture(filename)
    local tex_ptr = ffi.new('IDirect3DTexture8*[1]')
    -- Path to /images/ folder inside your addon
    local path = string.format('%s/images/%s', addon.path, filename)
    local res  = C.D3DXCreateTextureFromFileA(d3d8dev, path, tex_ptr)
    if (res ~= C.S_OK) then
        print(string.format('Failed to load image (%s): %08X', path, res))
        return nil
    end

    local texture = ffi.new('IDirect3DTexture8*', tex_ptr[0])
    d3d.gc_safe_release(texture) -- ensures safe GC
    return texture
end

-- Public function to retrieve a texture by filename.
function images.GetTexture(filename)
    if not filename or filename == '' then
        return nil
    end
    if loaded_textures[filename] == nil then
        loaded_textures[filename] = load_texture(filename)
    end
    return loaded_textures[filename]
end

return images
