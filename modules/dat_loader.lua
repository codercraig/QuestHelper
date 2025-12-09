--------------------------------------------------------------------------------
-- DAT Map Texture Loader
-- Loads map textures directly from FFXI ROM DAT files
-- Based on boussole by loonsies - Credit: https://github.com/loonsies/boussole
-- Saves ~110MB by using in-game map textures instead of bundled PNGs
--------------------------------------------------------------------------------

local ffi = require('ffi')
local d3d = require('d3d8')
local bit = require('bit')
local C = ffi.C  -- Access to C library functions and constants

local dat_loader = {}

-- Get D3D8 device
local d3d8dev = d3d.get_device()

--------------------------------------------------------------------------------
-- FFI Definitions
--------------------------------------------------------------------------------

ffi.cdef[[
    // File I/O functions
    typedef void FILE;
    int fopen_s(FILE** pFile, const char* filename, const char* mode);
    int fclose(FILE* file);
    int fseek(FILE* file, long offset, int origin);
    long ftell(FILE* file);
    size_t fread(void* buffer, size_t size, size_t count, FILE* file);
    size_t fwrite(const void* buffer, size_t size, size_t count, FILE* file);

    // D3DX texture loading (supports PNG, DDS, BMP, etc.)
    typedef struct IDirect3DDevice8 IDirect3DDevice8;
    typedef struct IDirect3DTexture8 IDirect3DTexture8;
    int __stdcall D3DXCreateTextureFromFileInMemory(
        IDirect3DDevice8* pDevice,
        const void* pSrcData,
        uint32_t SrcDataSize,
        IDirect3DTexture8** ppTexture
    );
    int __stdcall D3DXCreateTextureFromFileA(
        IDirect3DDevice8* pDevice,
        const char* pSrcFile,
        IDirect3DTexture8** ppTexture
    );

    // FFXI Map Entry Structure (0x0E bytes = 14 bytes)
    typedef struct {
        uint16_t zone_id;        // +0x00
        uint8_t  floor_id;       // +0x02
        uint8_t  floor_index;    // +0x03
        uint8_t  flags;          // +0x04
        uint8_t  scale;          // +0x05
        uint8_t  key_item;       // +0x06
        uint8_t  unknown;        // +0x07
        uint16_t dat_offset;     // +0x08
        int16_t  offset_x;       // +0x0A (SIGNED)
        int16_t  offset_y;       // +0x0C (SIGNED)
    } MapEntry;

    // Image Header at offset 0x41 in DAT files (from boussole)
    typedef struct {
        uint32_t structLength;            // +0x00
        int32_t width;                    // +0x04
        int32_t height;                   // +0x08
        uint16_t planes;                  // +0x0C
        uint16_t bitCount;                // +0x0E (color depth: 8, 16, 24, 32)
        uint32_t compression;             // +0x10
        uint32_t imageSize;               // +0x14
        uint32_t horizontalResolution;    // +0x18
        uint32_t verticalResolution;      // +0x1C
        uint32_t usedColors;              // +0x20
        uint32_t importantColors;         // +0x24
        uint32_t type;                    // +0x28
    } ImageHeader;

    // D3D8 Locked Rect for texture writing
    typedef struct {
        int32_t Pitch;
        void*   pBits;
    } D3DLOCKED_RECT;
]]

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local SEEK_SET = 0
local SEEK_END = 2

-- D3D8 Format constants
local D3DFMT_A8R8G8B8 = 21
local D3DFMT_DXT1 = 827611204  -- 'DXT1'
local D3DFMT_DXT2 = 844388420  -- 'DXT2'
local D3DFMT_DXT3 = 861165636  -- 'DXT3'
local D3DFMT_DXT4 = 877942852  -- 'DXT4'
local D3DFMT_DXT5 = 894720068  -- 'DXT5'

local D3DPOOL_MANAGED = 1

--------------------------------------------------------------------------------
-- Map Table Pointer (cached after first scan)
--------------------------------------------------------------------------------

local map_table_ptr = nil
local map_table_initialized = false

-- Debug mode (enabled by /qh_datcheck command)
local debug_mode = false

local function debug_print(...)
    if debug_mode then
        print(...)
    end
end

--------------------------------------------------------------------------------
-- Helper: Get FFXI Install Path
--------------------------------------------------------------------------------

local function get_ffxi_path()
    -- Remove trailing "Ashita\" from install path and add Game\FINAL FANTASY XI\ for CatsXI
    local ashita_path = AshitaCore:GetInstallPath()
    local base_path = ashita_path:gsub("Ashita\\*$", "")

    -- CatsXI structure: <base>\Game\FINAL FANTASY XI\ROM\
    -- Retail structure: <base>\ROM\
    -- Try CatsXI structure first
    local catsxi_path = base_path .. "Game\\FINAL FANTASY XI\\"
    return catsxi_path
end

--------------------------------------------------------------------------------
-- Find Map Table in Memory
--------------------------------------------------------------------------------

local function find_map_table()
    if map_table_initialized then
        return map_table_ptr
    end

    debug_print('[QuestHelper-DAT] Starting map table search...')

    -- Signature from boussole addon (exact format: no spaces, lowercase)
    -- Matches: 8A 0D ?? ?? ?? ?? 53 33 C0 56 84 C9 57 74 ?? 8A 54 24 18 8B 74 24 14 8B 7C 24 10 B9
    local signature = '8A0D????????5333C05684C95774??8A5424188B7424148B7C2410B9'

    debug_print(string.format('[QuestHelper-DAT] Searching FFXiMain.dll for signature'))

    local ptr = ashita.memory.find('FFXiMain.dll', 0, signature, 0, 0)

    if ptr == 0 then
        debug_print('[QuestHelper-DAT] ERROR: Could not find map table signature in FFXiMain.dll')
        debug_print('[QuestHelper-DAT] Use /qh_datcheck for detailed diagnostics')
        map_table_initialized = true
        return nil
    end

    debug_print(string.format('[QuestHelper-DAT] Signature found at: 0x%08X', ptr))

    -- Read pointer at offset 0x1C (28 bytes) from signature (exactly like boussole)
    local map_table_base = ashita.memory.read_uint32(ptr + 0x1C)

    debug_print(string.format('[QuestHelper-DAT] Map table base pointer: 0x%08X', map_table_base))

    if map_table_base == 0 then
        debug_print('[QuestHelper-DAT] ERROR: Map table pointer is null')
        map_table_initialized = true
        return nil
    end

    map_table_ptr = ffi.cast('MapEntry*', map_table_base)
    map_table_initialized = true

    debug_print(string.format('[QuestHelper-DAT] SUCCESS: Map table initialized at 0x%08X', map_table_base))

    -- Debug: Read and print first map entry
    if map_table_ptr then
        local first_entry = map_table_ptr[0]
        debug_print(string.format('[QuestHelper-DAT] First map entry: zone_id=%d, floor_id=%d',
            first_entry.zone_id, first_entry.floor_id))
    end

    return map_table_ptr
end

--------------------------------------------------------------------------------
-- Read Map Entry for Zone/Floor
--------------------------------------------------------------------------------

function dat_loader.get_map_entry(zone_id, floor_id)
    debug_print(string.format('[QuestHelper-DAT] Looking for map entry: zone_id=%d, floor_id=%d', zone_id, floor_id or 0))

    local map_table = find_map_table()
    if not map_table then
        debug_print('[QuestHelper-DAT] Map table not available')
        return nil, "Map table not found"
    end

    floor_id = floor_id or 0

    -- Search through map table for matching zone_id and floor_id
    local index = 0
    local entries_scanned = 0
    while index < 2000 do  -- Safety limit
        local entry = map_table[index]

        -- End of table
        if entry.zone_id == 0 then
            debug_print(string.format('[QuestHelper-DAT] Reached end of map table after scanning %d entries', entries_scanned))
            break
        end

        entries_scanned = entries_scanned + 1

        -- Debug: Print first 5 entries
        if index < 5 then
            debug_print(string.format('[QuestHelper-DAT] Entry %d: zone_id=%d, floor_id=%d, dat_offset=0x%04X',
                index, entry.zone_id, entry.floor_id, entry.dat_offset))
        end

        -- Found matching entry
        if entry.zone_id == zone_id and entry.floor_id == floor_id then
            debug_print(string.format('[QuestHelper-DAT] FOUND match at index %d!', index))
            debug_print(string.format('[QuestHelper-DAT]   zone_id=%d (0x%04X), floor_id=%d, floor_index=%d',
                entry.zone_id, entry.zone_id, entry.floor_id, entry.floor_index))
            debug_print(string.format('[QuestHelper-DAT]   scale=%d, flags=0x%02X, dat_offset=0x%04X (%d)',
                entry.scale, entry.flags, entry.dat_offset, entry.dat_offset))
            debug_print(string.format('[QuestHelper-DAT]   offset_x=%d, offset_y=%d',
                entry.offset_x, entry.offset_y))

            -- Debug: Dump raw bytes of this map entry to verify structure
            local entry_ptr = ffi.cast('uint8_t*', map_table + index)
            local hex_dump = ""
            for byte_idx = 0, 13 do
                hex_dump = hex_dump .. string.format("%02X ", entry_ptr[byte_idx])
            end
            debug_print(string.format('[QuestHelper-DAT]   Raw entry bytes: %s', hex_dump))

            return {
                zone_id = entry.zone_id,
                floor_id = entry.floor_id,
                floor_index = entry.floor_index,
                flags = entry.flags,
                scale = entry.scale,
                dat_offset = entry.dat_offset,
                offset_x = entry.offset_x,
                offset_y = entry.offset_y,
            }
        end

        index = index + 1
    end

    debug_print(string.format('[QuestHelper-DAT] No match found after scanning %d entries', entries_scanned))
    return nil, string.format("No map entry found for zone %d floor %d", zone_id, floor_id)
end



--------------------------------------------------------------------------------
-- Load DAT File from FFXI ROM (using Ashita ResourceManager like boussole)
--------------------------------------------------------------------------------

local function load_dat_file(dat_index)
    -- Use Ashita's ResourceManager to get file path (like boussole)
    -- This handles XIPivot, CatsXI paths, and DAT overrides automatically
    local resourceMgr = AshitaCore:GetResourceManager()
    if not resourceMgr then
        return nil, "Failed to get Ashita ResourceManager"
    end

    local path = resourceMgr:GetFilePath(dat_index)
    if not path or path == '' then
        return nil, string.format("Failed to get DAT path for index %d from ResourceManager", dat_index)
    end

    debug_print(string.format('[QuestHelper-DAT] ResourceManager path: %s', path))
    debug_print(string.format('[QuestHelper-DAT]   DAT index: %d', dat_index))

    -- Open file
    local file_ptr = ffi.new('FILE*[1]')
    local result = ffi.C.fopen_s(file_ptr, path, 'rb')

    if result ~= 0 or file_ptr[0] == nil then
        debug_print(string.format('[QuestHelper-DAT] ERROR: Failed to open DAT file (error code: %d)', result))
        return nil, string.format("Failed to open DAT: %s (error %d)", path, result)
    end

    debug_print('[QuestHelper-DAT] DAT file opened successfully')

    local file = file_ptr[0]

    -- Get file size
    ffi.C.fseek(file, 0, SEEK_END)
    local size = ffi.C.ftell(file)
    ffi.C.fseek(file, 0, SEEK_SET)

    if size <= 0 or size > 50 * 1024 * 1024 then  -- Sanity check: max 50MB (some map DATs are large)
        ffi.C.fclose(file)
        return nil, string.format("Invalid DAT file size: %d bytes", size)
    end

    -- Read entire file into memory
    local buffer = ffi.new('uint8_t[?]', size)
    local read_count = ffi.C.fread(buffer, 1, size, file)
    ffi.C.fclose(file)

    if read_count ~= size then
        return nil, string.format("Failed to read complete DAT file: %d/%d bytes", read_count, size)
    end

    -- Convert to Lua string (like boussole does) for easier byte access
    local data = ffi.string(buffer, size)

    return data, size
end

--------------------------------------------------------------------------------
-- Helper Functions to Read Bytes from Lua String (like boussole)
--------------------------------------------------------------------------------

local function read_u8(data, offset)
    return string.byte(data, offset + 1)  -- Lua strings are 1-indexed
end

local function read_u32(data, offset)
    local b0 = read_u8(data, offset)
    local b1 = read_u8(data, offset + 1)
    local b2 = read_u8(data, offset + 2)
    local b3 = read_u8(data, offset + 3)
    return b0 + b1 * 256 + b2 * 65536 + b3 * 16777216
end

--------------------------------------------------------------------------------
-- Parse Image Header at offset 0x41
--------------------------------------------------------------------------------

local function parse_image_header(data, size)
    if size < 0x41 + 48 then  -- Header starts at 0x41, is 48 bytes
        return nil, "DAT file too small for image header"
    end

    -- Debug: Print bytes at offset 0x41 to see the actual header
    if debug_mode then
        debug_print('[QuestHelper-DAT] Header bytes at offset 0x41 (first 64 bytes):')
        local hex_str = ""
        for i = 0, 63 do
            local byte_val = read_u8(data, 0x41 + i)
            hex_str = hex_str .. string.format("%02X ", byte_val)
            if (i + 1) % 16 == 0 then
                debug_print(string.format('[QuestHelper-DAT]   0x%02X: %s', 0x41 + i - 15, hex_str))
                hex_str = ""
            end
        end
    end

    -- Cast string data to ImageHeader pointer (Lua string is valid pointer)
    local header_ptr = ffi.cast('const ImageHeader*', ffi.cast('const char*', data) + 0x41)
    local header = header_ptr[0]

    -- Read ACTUAL values from header
    local actual_width = header.width
    local actual_height = header.height
    local actual_bitcount = header.bitCount      -- This is color depth!
    local actual_compression = header.compression

    debug_print(string.format('[QuestHelper-DAT] Raw header values at 0x41:'))
    debug_print(string.format('[QuestHelper-DAT]   width=%d, height=%d', actual_width, actual_height))
    debug_print(string.format('[QuestHelper-DAT]   bitCount=%d, compression=0x%08X', actual_bitcount, actual_compression))

    -- Use ACTUAL values from header (not hardcoded!)
    debug_print(string.format('[QuestHelper-DAT] Using actual header values: %dx%d, %d-bit',
        actual_width, actual_height, actual_bitcount))
    debug_print(string.format('[QuestHelper-DAT] structLength: %d', header.structLength))

    return {
        width = actual_width,
        height = actual_height,
        color_depth = actual_bitcount,
        compression = actual_compression,
        struct_length = header.structLength,
        type = 0,
    }
end

--------------------------------------------------------------------------------
-- Decompress Uncompressed Bitmap (8/16/24/32-bit)
--------------------------------------------------------------------------------

local function decompress_bitmap(data, data_size, header, header_struct_length)
    -- Use actual dimensions from header
    local width = header.width
    local height = header.height

    debug_print(string.format('[QuestHelper-DAT] Decompressing bitmap: %dx%d, %d-bit',
        width, height, header.color_depth))

    -- Calculate data offset (EXACTLY like boussole: 0x41 + sizeof(ImageHeader))
    local header_size = ffi.sizeof('ImageHeader')
    local data_offset = 0x41 + header_size

    debug_print(string.format('[QuestHelper-DAT] ffi.sizeof(ImageHeader) = %d bytes', header_size))
    debug_print(string.format('[QuestHelper-DAT] Data offset: 0x41 + %d = 0x%X (%d)', header_size, data_offset, data_offset))

    -- Debug: Show a few bytes at the palette offset to verify we're reading correctly
    if debug_mode then
        debug_print('[QuestHelper-DAT] First 32 bytes at palette offset:')
        local hex = ""
        for i = 0, 31 do
            hex = hex .. string.format("%02X ", read_u8(data, data_offset + i))
            if (i + 1) % 16 == 0 then
                debug_print(string.format('[QuestHelper-DAT]   %s', hex))
                hex = ""
            end
        end
    end

    -- Read palette for 8-bit images (using string.byte like boussole)
    local palette = nil
    if header.color_depth == 8 then
        if data_size < data_offset + 1024 then
            return nil, "DAT file too small for palette"
        end

        -- Read 256 BGRA colors (4 bytes each = 1024 bytes total)
        palette = {}
        for i = 0, 255 do
            local offset = data_offset + i * 4
            local b = read_u8(data, offset)
            local g = read_u8(data, offset + 1)
            local r = read_u8(data, offset + 2)
            local a = read_u8(data, offset + 3)
            palette[i] = {r = r, g = g, b = b, a = a}
        end
        data_offset = data_offset + 1024

        -- Debug: Print first 8 palette colors
        debug_print('[QuestHelper-DAT] First 8 palette colors:')
        for i = 0, 7 do
            local c = palette[i]
            debug_print(string.format('[QuestHelper-DAT]   Color %d: R=%d G=%d B=%d A=%d', i, c.r, c.g, c.b, c.a))
        end
    end

    -- Calculate expected data size
    local bytes_per_pixel = math.floor(header.color_depth / 8)
    local expected_size = width * height * bytes_per_pixel

    if data_size < data_offset + expected_size then
        return nil, string.format("DAT file too small for image data: need %d, have %d",
            data_offset + expected_size, data_size)
    end

    -- Create D3D8 texture (using colon operator like boussole)
    local hr, texture = d3d8dev:CreateTexture(
        width,
        height,
        1,
        0,
        C.D3DFMT_A8R8G8B8,
        C.D3DPOOL_MANAGED
    )

    if hr ~= C.S_OK then
        return nil, string.format("Failed to create texture: 0x%08X", hr)
    end

    -- Make texture GC-safe
    d3d.gc_safe_release(texture)

    -- Lock texture for writing (using colon operator)
    local lock_hr, locked_rect = texture:LockRect(0, nil, 0)

    if lock_hr ~= C.S_OK then
        return nil, string.format("Failed to lock texture: 0x%08X", lock_hr)
    end

    -- Use uint8_t* for byte-level writes (like boussole)
    local dst = ffi.cast('uint8_t*', locked_rect.pBits)
    local pitch = locked_rect.Pitch  -- Row stride in bytes

    debug_print(string.format('[QuestHelper-DAT] Texture pitch: %d bytes', pitch))
    debug_print(string.format('[QuestHelper-DAT] Pixel data starts at offset: 0x%X', data_offset))

    -- Copy pixel data (boussole's method)
    -- Bitmaps are stored bottom-to-top, so we flip Y
    local pixel_count = width * height
    for pixel_idx = 0, pixel_count - 1 do
        local x = pixel_idx % width
        local y = math.floor(pixel_idx / width)
        local flipped_y = height - 1 - y

        local r, g, b, a = 0, 0, 0, 0

        if header.color_depth == 8 then
            -- 8-bit palettized - read byte from string and lookup in palette
            local index = read_u8(data, data_offset + pixel_idx)
            local color = palette[index]
            if color then
                r = color.r
                g = color.g
                b = color.b
                a = color.a
            else
                r, g, b, a = 0, 0, 0, 0
            end

        elseif header.color_depth == 16 then
            -- 16-bit RGB565 - read from string
            local byte_offset = data_offset + pixel_idx * 2
            local b0 = read_u8(data, byte_offset)
            local b1 = read_u8(data, byte_offset + 1)
            local rgb565 = b0 + b1 * 256
            r = bit.rshift(bit.band(rgb565, 0xF800), 8)
            g = bit.rshift(bit.band(rgb565, 0x07E0), 3)
            b = bit.lshift(bit.band(rgb565, 0x001F), 3)
            a = 255

        elseif header.color_depth == 24 then
            -- 24-bit BGR - read from string
            local byte_offset = data_offset + pixel_idx * 3
            b = read_u8(data, byte_offset)
            g = read_u8(data, byte_offset + 1)
            r = read_u8(data, byte_offset + 2)
            a = 255

        elseif header.color_depth == 32 then
            -- 32-bit BGRA - read from string
            local byte_offset = data_offset + pixel_idx * 4
            b = read_u8(data, byte_offset)
            g = read_u8(data, byte_offset + 1)
            r = read_u8(data, byte_offset + 2)
            a = read_u8(data, byte_offset + 3)
        end

        -- Convert alpha: nonzero becomes 255, zero stays 0 (like boussole)
        a = (a > 0) and 255 or 0

        -- Write BGRA bytes to texture using pitch (like boussole)
        local surface_offset = flipped_y * pitch + x * 4
        dst[surface_offset + 0] = b
        dst[surface_offset + 1] = g
        dst[surface_offset + 2] = r
        dst[surface_offset + 3] = a
    end

    -- Unlock texture
    texture:UnlockRect(0)

    -- Make texture GC-safe for Ashita
    d3d.gc_safe_release(texture)

    return texture
end

local function get_dat_index(entry)
    -- DAT index calculation (EXACTLY like boussole - check low 4 bits of flags)
    local low = bit.band(entry.flags, 0x0F)
    local dat_index

    if low == 0 then
        dat_index = entry.dat_offset + 5312
    elseif low == 1 then
        dat_index = entry.dat_offset + 53295
    elseif low == 2 then
        dat_index = entry.dat_offset + 54295
    else
        dat_index = 5522  -- Default fallback
    end

    debug_print(string.format('[QuestHelper-DAT] DAT index: dat_offset=%d, flags=0x%02X, low=0x%X, result=%d',
        entry.dat_offset, entry.flags, low, dat_index))

    return dat_index
end

--------------------------------------------------------------------------------
-- Main: Load Map Texture from DAT
--------------------------------------------------------------------------------
function dat_loader.load_map_texture(zone_id, floor_id)
    debug_print(string.format('[QuestHelper-DAT] ========================================'))
    debug_print(string.format('[QuestHelper-DAT] Loading map texture for zone %d, floor %d', zone_id, floor_id or 0))
    debug_print(string.format('[QuestHelper-DAT] ========================================'))

    -- 1. Find map entry
    local map_entry, err = dat_loader.get_map_entry(zone_id, floor_id)
    if not map_entry then
        debug_print(string.format('[QuestHelper-DAT] FAILED: %s', err))
        return nil, err
    end

    -- 2. Calculate DAT index
    local dat_index = get_dat_index(map_entry)
    debug_print(string.format('[QuestHelper-DAT] Calculated DAT index: %d', dat_index))

    -- 3. Load DAT file (returns FFI buffer and size)
    local dat_data, size_or_error = load_dat_file(dat_index)
    if not dat_data then
        debug_print(string.format('[QuestHelper-DAT] FAILED to load DAT: %s', size_or_error))
        return nil, size_or_error
    end
    debug_print(string.format('[QuestHelper-DAT] DAT file loaded: %d bytes', size_or_error))

    -- DEBUG: Scan for multiple ImageHeaders in ENTIRE DAT file
    debug_print('[QuestHelper-DAT] About to scan for images...')
    local scan_ok, scan_err = pcall(function()
        debug_print('[QuestHelper-DAT] Scanning ENTIRE DAT file for ImageHeader signatures...')
        local scan_limit = size_or_error - 48  -- Scan entire file (minus header size)
        debug_print(string.format('[QuestHelper-DAT] Scan limit: %d bytes (file size: %d)', scan_limit, size_or_error))

        local found_count = 0
        local images_found = {}

        -- Scan every 4-byte boundary (ImageHeaders are typically aligned)
        for scan_offset = 0, scan_limit, 4 do
            -- Look for valid width/height values (likely between 64-2048)
            local test_header_ptr = ffi.cast('const ImageHeader*', ffi.cast('const char*', dat_data) + scan_offset)
            local test_header = test_header_ptr[0]

            -- Check if this looks like a valid ImageHeader
            if test_header.width >= 64 and test_header.width <= 2048 and
               test_header.height >= 64 and test_header.height <= 2048 and
               test_header.bitCount > 0 and test_header.bitCount <= 32 then
                found_count = found_count + 1
                table.insert(images_found, {
                    offset = scan_offset,
                    width = test_header.width,
                    height = test_header.height,
                    bitCount = test_header.bitCount,
                    compression = test_header.compression
                })
                debug_print(string.format('[QuestHelper-DAT]   Image #%d at offset 0x%X: %dx%d, %d-bit, comp=0x%X',
                    found_count, scan_offset, test_header.width, test_header.height, test_header.bitCount, test_header.compression))
            end
        end

        debug_print(string.format('[QuestHelper-DAT] Scan complete: found %d potential images', found_count))

        -- If we found multiple images, show a summary
        if found_count > 1 then
            debug_print('[QuestHelper-DAT] Summary of all images found:')
            for i, img in ipairs(images_found) do
                debug_print(string.format('[QuestHelper-DAT]   #%d: 0x%X -> %dx%d (%d-bit)',
                    i, img.offset, img.width, img.height, img.bitCount))
            end
        end
    end)

    if not scan_ok then
        debug_print(string.format('[QuestHelper-DAT] Scan error: %s', tostring(scan_err)))
    end

    -- 4. Parse image header
    local image_header_info, err = parse_image_header(dat_data, size_or_error)
    if not image_header_info then
        debug_print(string.format('[QuestHelper-DAT] FAILED to parse header: %s', err))
        return nil, err
    end

    debug_print(string.format('[QuestHelper-DAT] Parsed Header: W=%d, H=%d, Depth=%d, Comp=0x%08X',
        image_header_info.width, image_header_info.height,
        image_header_info.color_depth, image_header_info.compression))

    -- 5. Decompress and Create Texture
    if image_header_info.compression == 0 then
        -- This calls the robust, multi-depth decompress_bitmap function
        local texture, err = decompress_bitmap(dat_data, size_or_error, image_header_info, image_header_info.struct_length)

        if not texture then
            debug_print(string.format('[QuestHelper-DAT] FAILED to decompress bitmap: %s', err))
            return nil, err
        end
        debug_print('[QuestHelper-DAT] SUCCESS: Texture loaded via bitmap decompression!')
        return texture
    else
        -- 6. Handle compressed formats (e.g., DXT)
        return nil, "Compressed image formats (DXT) not yet supported."
    end
end

--------------------------------------------------------------------------------
-- Enable Debug Mode (called by /qh_datcheck command)
--------------------------------------------------------------------------------

function dat_loader.set_debug_mode(enabled)
    debug_mode = enabled
    if enabled then
        -- Reset initialization to force re-scan with debug output
        map_table_initialized = false
        map_table_ptr = nil
    end
end

--------------------------------------------------------------------------------
-- Get Map Calibration Data from Entry
--------------------------------------------------------------------------------

function dat_loader.get_map_calibration(zone_id, floor_id)
    local map_entry, err = dat_loader.get_map_entry(zone_id, floor_id)
    if not map_entry then
        return nil
    end

    -- Calculate divisor for coordinate conversion
    -- Formula: 2560.0 / scale
    local divisor = 2560.0 / map_entry.scale

    return {
        offset_x = map_entry.offset_x,
        offset_y = map_entry.offset_y,
        divisor = divisor,
        scale = map_entry.scale,
    }
end

--------------------------------------------------------------------------------
-- List All Available Floors for a Zone
--------------------------------------------------------------------------------

function dat_loader.get_available_floors(zone_id)
    local map_table = find_map_table()
    if not map_table then
        return {}
    end

    local floors = {}
    local index = 0

    while index < 2000 do
        local entry = map_table[index]

        if entry.zone_id == 0 then
            break
        end

        if entry.zone_id == zone_id then
            table.insert(floors, {
                floor_id = entry.floor_id,
                floor_index = entry.floor_index,
            })
        end

        index = index + 1
    end

    return floors
end

return dat_loader
