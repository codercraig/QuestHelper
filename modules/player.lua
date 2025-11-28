-- Player position and heading tracking module
local player = {}

-- Player position (updated each frame)
player.posX = 0
player.posY_height = 0
player.posZ_depth = 0
player.zoneId = 0
player.name = ""

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

return player
