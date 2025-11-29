-- Player position and heading tracking module
local player = {}
local ffi = require("ffi")

-- FFI definition for CheckFloorNumber function
ffi.cdef[[
    typedef int32_t (__thiscall* CheckFloorNumber_f)(void* pThis, float X, float Y, float Z);
]]

-- Player position (updated each frame)
player.posX = 0
player.posY_height = 0
player.posZ_depth = 0
player.zoneId = 0
player.name = ""
player.floorId = 0  -- Map floor/layer ID

-- Floor detection data (initialized on first use)
local floorData = {
    initialized = false,
    ptrs = {
        func = nil,
        this = nil,
    },
    func = nil,
    this = nil,
}

-- Updates player position from memory
-- Returns: true if successful, false otherwise
function player.updatePosition(mem)
    if not mem then return false end

    -- Get Player Name via GetPlayerEntity
    local playerInfo = GetPlayerEntity()
    if playerInfo and playerInfo.Name then
        player.name = playerInfo.Name
    end

    -- Position tracking is working via Movement.LocalPosition

    local party = mem:GetParty()
    local entityMgr = mem:GetEntity()
    if not party or not entityMgr then return false end

    player.zoneId = party:GetMemberZone(0)
    local playerIndex = party:GetMemberTargetIndex(0)
    local pActorPointer = 0

    if playerIndex == 0xFFFF or playerIndex == nil then
        local playerObj = mem:GetPlayer()
        if playerObj and playerObj:GetActorPointer() ~= 0 then
            pActorPointer = playerObj:GetActorPointer()
        else
            return false
        end
    else
        pActorPointer = entityMgr:GetActorPointer(playerIndex)
    end

    if pActorPointer == 0 then return false end

    -- Try using GetPlayerEntity() first (most reliable in Ashita v4)
    if playerInfo and playerInfo.Movement and playerInfo.Movement.LocalPosition then
        local pos = playerInfo.Movement.LocalPosition
        player.posX = pos.X
        player.posZ_depth = pos.Z
        player.posY_height = pos.Y
    elseif playerInfo and playerInfo.X and playerInfo.Z and playerInfo.Y then
        -- Fallback: Direct fields (if they exist)
        player.posX = playerInfo.X
        player.posZ_depth = playerInfo.Z
        player.posY_height = playerInfo.Y
    else
        -- Final fallback: Memory reading
        player.posX = ashita.memory.read_float(pActorPointer + 0x678)
        player.posZ_depth = ashita.memory.read_float(pActorPointer + 0x67C)
        player.posY_height = ashita.memory.read_float(pActorPointer + 0x680)
    end

    return true
end

-- Gets player heading/rotation
-- Returns: heading in radians, or 0 if unavailable
function player.getHeading()
    local playerEntity = GetPlayerEntity()
    if playerEntity then
        return playerEntity.Heading
    end
    return 0
end

-- Initialize floor detection (finds memory signatures)
-- Returns: true if successful, false otherwise
local function initializeFloorDetection()
    if floorData.initialized then
        return true
    end

    -- Find CheckFloorNumber function pointer
    floorData.ptrs.func = ashita.memory.find('FFXiMain.dll', 0, '8B542408568D4424108BF18B4C2410508B44240C', 0, 0)
    if not floorData.ptrs.func or floorData.ptrs.func == 0 then
        return false
    end

    -- Find 'this' pointer
    floorData.ptrs.this = ashita.memory.find('FFXiMain.dll', 0, '8B7424148B4424108B7C240C8B0D', 0x0E, 0)
    if not floorData.ptrs.this or floorData.ptrs.this == 0 then
        return false
    end

    -- Cast function pointer
    floorData.func = ffi.cast('CheckFloorNumber_f', floorData.ptrs.func)

    -- Read and cast 'this' pointer
    local thisPtr = ashita.memory.read_uint32(ashita.memory.read_uint32(floorData.ptrs.this))
    floorData.this = ffi.cast('void*', thisPtr)

    floorData.initialized = true
    return true
end

-- Gets player's current floor/map ID from memory using CheckFloorNumber
-- Returns: mapped floor/map number or raw floor ID if no mapping exists
-- Parameters:
--   floor_mappings (optional) - mapping table from floor_mappings.lua
function player.getFloorId(floor_mappings)
    -- Initialize if needed
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    -- Get player position
    local playerInfo = GetPlayerEntity()
    if not playerInfo or not playerInfo.Movement or not playerInfo.Movement.LocalPosition then
        return nil
    end

    local pos = playerInfo.Movement.LocalPosition

    -- Call CheckFloorNumber (X, Z, Y order - note Z and Y are swapped!)
    local rawFloorId = floorData.func(floorData.this, pos.X, pos.Z, pos.Y)

    -- If we have mappings for this zone, use them
    if floor_mappings and floor_mappings[player.zoneId] then
        local zoneMapping = floor_mappings[player.zoneId]
        if zoneMapping[rawFloorId] then
            player.floorId = zoneMapping[rawFloorId]
            return player.floorId
        end
    end

    -- No mapping found, return raw ID + 1 (1-based)
    player.floorId = rawFloorId + 1
    return player.floorId
end

-- Debug: Get raw floor ID for testing (0-based as game returns it)
function player.getFloorIdRaw()
    if not floorData.initialized then
        if not initializeFloorDetection() then
            return nil
        end
    end

    local playerInfo = GetPlayerEntity()
    if not playerInfo or not playerInfo.Movement or not playerInfo.Movement.LocalPosition then
        return nil
    end

    local pos = playerInfo.Movement.LocalPosition
    return floorData.func(floorData.this, pos.X, pos.Z, pos.Y)
end

return player
