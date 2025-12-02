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

-- Unload a specific texture from memory
function images.UnloadTexture(filename)
    if loaded_textures[filename] then
        -- Release the texture (D3D will handle cleanup via GC)
        loaded_textures[filename] = nil
    end
end

-- Cleanup textures not in the provided list of filenames
-- Parameters:
--   keep_list: table/array of filenames to keep loaded
function images.CleanupUnused(keep_list)
    -- Build a set of filenames to keep
    local keep_set = {}
    if keep_list then
        for _, filename in ipairs(keep_list) do
            if filename and filename ~= '' then
                keep_set[filename] = true
            end
        end
    end

    -- Unload textures not in the keep list
    local unloaded_count = 0
    for filename, _ in pairs(loaded_textures) do
        if not keep_set[filename] then
            loaded_textures[filename] = nil
            unloaded_count = unloaded_count + 1
        end
    end

    return unloaded_count
end

-- Get count of currently loaded textures (for debugging)
function images.GetLoadedCount()
    local count = 0
    for _ in pairs(loaded_textures) do
        count = count + 1
    end
    return count
end

return images
