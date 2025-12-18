-- Key Items Database
-- Reference: https://github.com/LandSandBoat/server/blob/base/scripts/enum/key_item.lua
--
-- This database maps key item IDs to their display names.
-- You can use IDs directly in your quest files - names are optional for better display.
-- Just add entries as needed instead of storing all 3000+ key items.
--
-- Usage in quest files:
--   keyitems_needed = {78}  -- Display in UI only (shows "KI: Gustaberg Supplies")
--
--   trigger_on_keyitem_obtain = {78}  -- Auto-complete step when obtained
--   trigger_on_keyitem_obtain = {78, 79}  -- Any ONE key item triggers completion
--   trigger_on_keyitem_obtain = {78, 79}, require_all_keyitems = true  -- Need BOTH key items

local keyitems = {}

-- Key item ID to name mapping
local id_to_name = {
    [14] = "Magicite Optistone",
    [15] = "Magicite Aurastone",
    [16] = "Magicite Orastone",
    [20] = "Yagudo Torch",
    [21] = "Crest of Davoi",
    [46] = "Coruscant Rosary",
    [47] = "Black Matinee Necklace",
    [74] = "Shadow Fragment",
    [78] = "Gustaberg Supplies",
    [266] = "Altepa Moonpebble",
    [289] = "Reinforced Cermet",
    [290] = "Letter From Werei",
    [477] = "Miracle Salt",

    -- Add more key items as needed:
    -- [ID] = "Key Item Name",
}

-- Key item name to ID mapping (auto-generated from above)
local name_to_id = {}
for id, name in pairs(id_to_name) do
    name_to_id[name:lower()] = id
end

--- Get key item name from ID
--- @param ki_id number - Key item ID
--- @return string|nil - Key item name, or nil if not found
function keyitems.getName(ki_id)
    return id_to_name[ki_id]
end

--- Get key item ID from name (case-insensitive)
--- @param ki_name string - Key item name
--- @return number|nil - Key item ID, or nil if not found
function keyitems.getId(ki_name)
    if type(ki_name) ~= 'string' then return nil end
    return name_to_id[ki_name:lower()]
end

--- Check if a key item exists in the database
--- @param id_or_name number|string - Key item ID or name
--- @return boolean - true if key item exists
function keyitems.exists(id_or_name)
    if type(id_or_name) == 'number' then
        return id_to_name[id_or_name] ~= nil
    elseif type(id_or_name) == 'string' then
        return name_to_id[id_or_name:lower()] ~= nil
    end
    return false
end

--- Add a new key item to the database at runtime
--- @param ki_id number - Key item ID
--- @param ki_name string - Key item name
function keyitems.add(ki_id, ki_name)
    id_to_name[ki_id] = ki_name
    name_to_id[ki_name:lower()] = ki_id
end

return keyitems
