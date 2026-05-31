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
    --Phoniuna Aqueducts
    [27] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
    },
    -- [30] = {
    --     [2] = 1,
    -- },
    [68] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [69] = 8,
    },
    -- Beadeaux
    [147] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Giddeus
    [145] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Ghelsba Outpost
    [140] = {
        [1] = 1,   -- Upper floor
    },
    [142] = {
        [1] = 1,   -- Upper floor
        [15] = 2,  -- Lower floor
    },
    -- Palboruough Mines
    [143] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,  -- Lower floor
    },
    [144] = {
        [1] = 1,
    },
    [151] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,  -- Lower floor
        [4] = 4,  -- Lower floor
        [5] = 5,  -- Lower floor
        [6] = 6,  -- Lower floor
        [15] = 7,  -- Lower floor
    },
    -- Middle Delkfutt's Tower
    [157] = {
        [4] = 1,   -- Upper floor
        [5] = 2,  -- Lower floor
        [6] = 3,  -- Lower floor
        [7] = 4,  -- Lower floor
        [8] = 5,  -- Lower floor
        [9] = 6,  -- Lower floor
    },
    [158] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
    },
    --Temple of Ugg
    [159] = {
        [1] = 1,   -- Upper floor
        [2] = 2,  -- Lower floor
        [3] = 3,
    },
    [161] = {
        [1] = 1,
        [2] = 2,
        [15] = 3,
        [16] = 4,
        [162] = 5,
    },
    [172] = {
        [0] = 1,
    },
    -- Kuftal Tunnel
    [174] = {
        [1] = 1,
        [2] = 2,
    },
    [176] = {
        [1] = 1,
    },
    [178] = {
        [1] = 1,
    },
    [191] = {
        [1] = 1,
    },
    [196] = {
        [1] = 1,
        [14] = 2,
    },
    [204] = {
        [1] = 1,
        [15] = 2,
    },
    -- Ifrit's Cauldron
    [205] = {
        [1] = 1,
    },
    -- Quicksand Caves
    [208] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [8] = 8,
    },
    [238] = {
        [1] = 1,
        [2] = 2,
    },
    --Hall of the Gods
    [251] = {
        [1] = 1,
    },
    -- [184] removed - uses auto-increment (sequential floor IDs)
    -- If floors don't increment properly, run /qh_checkfloor on each floor
    -- and add the actual raw IDs here

    -- Add more zones here as you discover them
    -- Example: Delkfutt's Tower
    -- [184] = {
    --     [0] = 1,   -- Floor 1
    --     [1] = 2,   -- Floor 2
    --     [2] = 3,   -- Floor 3
    --     -- etc...
    -- },
}
