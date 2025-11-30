-- Floor ID to Map Number Mappings
-- Maps the raw floor IDs returned by CheckFloorNumber to logical map numbers (1, 2, 3, etc.)
-- Assume that every zone goes up incrementally, however some do not and we need an override here.
--
-- To add a new zone:
-- 1. Go to the zone
-- 2. Run /qh_checkfloor on each floor/map
-- 3. Note the "Floor ID (raw/0-based)" value
-- 4. Add mapping: [raw_id] = map_number
--
-- Example:
-- [147] = {  -- Beadeaux (Zone ID 147)
--     [1] = 1,   -- Raw floor ID 1 = Map 1 (upper floor)
--     [15] = 2,  -- Raw floor ID 15 = Map 2 (lower floor)
-- },

return {
    -- Beadeaux
    [147] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },

    -- Add more zones here as you discover them
    -- Example: Delkfutt's Tower
    -- [184] = {
    --     [0] = 1,   -- Floor 1
    --     [1] = 2,   -- Floor 2
    --     [2] = 3,   -- Floor 3
    --     -- etc...
    -- },
}
