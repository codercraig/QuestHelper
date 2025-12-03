-- Key Item tracking module
local keyitem = {}

local ffi = require('ffi')
local struct = require('struct')

-- Storage for key item states
keyitem.owned_keyitems = T{}  -- Set of key item IDs the player owns

-- Track if we've done initial scan
local initialized = false

--- Checks if player has a specific key item
--- @param ki_id number - Key item ID
--- @return boolean - true if player has the key item
function keyitem.hasKeyItem(ki_id)
    return keyitem.owned_keyitems[ki_id] == true
end

--- Checks if player has all key items from a list
--- @param ki_list table - Array of key item IDs or names
--- @return boolean - true if player has all key items
function keyitem.hasAllKeyItems(ki_list)
    if not ki_list or #ki_list == 0 then
        return true
    end

    for _, ki in ipairs(ki_list) do
        local ki_id = type(ki) == 'table' and ki.id or ki
        if not keyitem.hasKeyItem(ki_id) then
            return false
        end
    end

    return true
end

--- Get count of how many key items player has from a list
--- @param ki_list table - Array of key item IDs
--- @return number, number - (owned_count, total_count)
function keyitem.getKeyItemCount(ki_list)
    if not ki_list or #ki_list == 0 then
        return 0, 0
    end

    local owned = 0
    local total = #ki_list

    for _, ki in ipairs(ki_list) do
        local ki_id = type(ki) == 'table' and ki.id or ki
        if keyitem.hasKeyItem(ki_id) then
            owned = owned + 1
        end
    end

    return owned, total
end

--- Packet handler for key item updates (0x55)
--- Call this from your main packet_in event handler
function keyitem.handlePacket(e)
    if e.id == 0x55 then
        -- Packet 0x55 contains key item data
        -- The key items are stored as bits in the packet
        local offset = struct.unpack('B', e.data, 0x84 + 1) * 512

        -- Process all possible key items in this packet chunk (512 bits)
        for ki_id = offset, offset + 511 do
            local has_ki = (ashita.bits.unpack_be(e.data_raw, 0x04, ki_id - offset, 1) == 1)

            if has_ki then
                keyitem.owned_keyitems[ki_id] = true
            else
                keyitem.owned_keyitems[ki_id] = nil
            end
        end

        initialized = true
    end
end

--- Reset key item tracking (useful on zone change or logout)
function keyitem.reset()
    keyitem.owned_keyitems = T{}
    initialized = false
end

--- Check if key item system has been initialized
function keyitem.isInitialized()
    return initialized
end

--- Debug function to list all owned key items
function keyitem.listOwnedKeyItems()
    local count = 0
    local items = {}

    for ki_id, _ in pairs(keyitem.owned_keyitems) do
        table.insert(items, ki_id)
        count = count + 1
    end

    table.sort(items)
    return items, count
end

return keyitem
