-- addons/QuestHelper/data/Custom/FeatureDemo.lua
return {
    ["Feature Demo"] = {
        steps = {
            {
                text = "Walk into the glowing square to begin the demo.\n" ..
                       "[DAT LOADING TEST] This map is loaded from FFXI's ROM DAT files!\n" ..
                       "No PNG required - saves space and uses your in-game maps!",
                images = {
                {
                    -- DAT loading is automatic when zone_name is present!
                    -- Map is loaded from FFXI ROM DAT files - no PNG required!
                    zone_name = "Bastok Mines",
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    -- DAT loading enabled - loads map from FFXI ROM files
                    -- use_dat_map = true,
                    -- zone_id  = 235,
                    -- floor_id = 0,

                    -- PNG fallback if DAT loading fails
                    file     = "maps/bastok_mines.png",
                    width    = 512,
                    height   = 512,
                    zone_name = "Bastok Markets",
                    --state    = 3,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                },
                trigger_zones = {
                    { type = 'square', center = { x = 2, y = 0, z = -79 }, size = 2 },
                     { type = 'square', center = { x = 26, y = 0, z = -81 }, size = 5 },
                    { type = 'square', center = { x = 0,  y = 0, z = -81 }, size = 2 },
                    { type = 'line', start = { x = 50, y = 0, z = -81 }, stop = { x = 50, y = -5, z = -71 } }
                },
                visual_zones = {
                    -- Cardinal directions
                    { type = 'arrow', center = { x = -10, y = 0, z = -79 }, size = 4, direction = 'up' },      -- North
                    { type = 'arrow', center = { x = -20, y = 0, z = -79 }, size = 4, direction = 'down' },    -- South
                    { type = 'arrow', center = { x = -10, y = 0, z = -90 }, size = 4, direction = 'left' },    -- West
                    { type = 'arrow', center = { x = -20, y = 0, z = -90 }, size = 4, direction = 'right' },   -- East

                    -- Diagonal directions
                    { type = 'arrow', center = { x = -30, y = 0, z = -79 }, size = 4, direction = 'ne' },      -- Northeast
                    { type = 'arrow', center = { x = -40, y = 0, z = -79 }, size = 4, direction = 'nw' },      -- Northwest
                    { type = 'arrow', center = { x = -30, y = 0, z = -90 }, size = 4, direction = 'se' },      -- Southeast
                    { type = 'arrow', center = { x = -40, y = 0, z = -90 }, size = 4, direction = 'sw' },      -- Southwest
                },
                zone_name = "Bastok Mines"
            },
            {
                text = "This is a line. It connects two points.",
                zone = "Bastok Mines",
                trigger_zones = {
                    { type = 'line', start = { x = 26, y = 0, z = -81 }, stop =  { x = 36, y = 0, z = -81 } }
                },
            },
            {
                text = "Auto Map Switch Demo: Go to Beadeaux! \n" ..
                       "Maps automatically switch every 5 seconds when you change floors. \n" ..
                       "Try walking between the upper and lower floors - the map will auto-update!",
                zone = "Beadeaux",
                images = {
                {
                    zone_name = "Beadeaux",
                    floor_id = 1,
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    zone_name = "Beadeaux",
                    floor_id = 15,
                    width    = 512,
                    height   = 512,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                },
            },
            },
            {
                text = "Auto-Calibration 6-Floor Test: Aydeewa Subterrane! \n" ..
                       "This zone has 6 floors - all using AUTO-CALIBRATION! \n" ..
                       "Walk between floors and watch the arrow switch between all 6 maps automatically!",
                zone = "Aydeewa Subterrane",
                images = {
                {
                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 1,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 2,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 3,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 4,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 5,
                },
                {

                    width    = 512,
                    height   = 512,
                    zone_name = "Aydeewa Subterrane",
                    floor_id = 6,
                },
            },
            },
            {
                text = "Auto-Calibration Test: Dangruf Wadi! \n" ..
                       "This map uses AUTO-CALIBRATION from mapinfo. No manual calibration needed! \n" ..
                       "The red arrow should appear automatically.",
                zone = "Dangruf Wadi",
                images = {
                    {
                        file     = "maps/dangruf_wadi.png",
                        width    = 512,
                        height   = 512,
                        zone_name = "Dangruf Wadi",
                        floor_id = 1,
                        -- NO map_calibration defined - will use auto-calibration!
                    },
                },
                draw_type = 'square',
                center = { x = -10, y = -3.0, z = -115 },
                size = 3,
            },
            {
                text = "Now, go obtain some stuff. You can get them outside.",
                -- [NEW] This line turns the list below into a mandatory checklist
                require_all_items = true,

                -- I corrected "quadava" to "quadav" here to ensure it matches the game text
                trigger_on_item_obtain = {
                    "copper ore",
                    "honey"
                },
                -- Key items needed (displayed in UI, not required for step completion)
                keyitems_needed = {75},  -- Gustaberg Supplies (ID from LSB)
            },
            {
                text = "Key Item Trigger Test: Get the Gustaberg Supplies key item! \n" ..
                       "You can obtain this from any Bastokan Guard NPC. \n" ..
                       "This step will auto-complete when you have the key item.",
                -- Trigger step completion when player gets this key item
                trigger_on_keyitem_obtain = {78},  -- Gustaberg Supplies (ID from LSB)
            },
            {
                text = "Kill Counter Demo: Defeat 5 enemies in Bastok Mines! \n" ..
                       "This will count ANY enemy you defeat. Try killing bees or worms outside the city.",
                kill_requirement = {
                    count = 5,
                    -- No specific enemies specified, so any kill counts
                    zone = "South Gustaberg"
                },
            },
            {
                text = "Kill Counter Demo 2: Defeat 3 Stone Eaters! \n" ..
                       "This will count Stone Eater kills by you, your trusts, and party members.",
                kill_requirement = {
                    count = 100,
                    enemies = {"Stone Eater", "Huge Hornet", "Tunnel Worm"},  -- Only Stone Eater kills count
                    zone = "South Gustaberg",
                    count_party_kills = true,  -- Count kills from party members and trusts
                    reset_on_zone_entry = true
                },
            },
            {
                text = "Kill Counter Demo 2: Defeat 3 Stone Eaters! \n" ..
                       "This will count Stone Eater kills by you, your trusts, and party members.",
                onmob_enemy = "Locus Colibri",
                kill_requirement = {
                    count = 100,
                    enemies = {"Locus Colibri"},  -- Only Stone Eater kills count
                    zone = "Bhaflau Thickets",
                    count_party_kills = true,  -- Count kills from party members and trusts
                    reset_on_zone_entry = true
                },
            },
            {
                text = "whaaaat",
                -- [NEW] This line turns the list below into a mandatory checklist
                require_all_items = false,

                -- I corrected "quadava" to "quadav" here to ensure it matches the game text
                trigger_on_item_obtain = "flint stone",
            },
            {
                text = "Pathfinding Demo: Travel to Valkurm Dunes! \n" ..
                       "This step uses AUTOMATIC ROUTE CALCULATION. \n" ..
                       "The route shown below changes based on YOUR CURRENT ZONE! \n \n" ..
                       "Try this: \n" ..
                       "1. Note the route shown below \n" ..
                       "2. Zone to a different city (Jeuno, San d'Oria, Windurst) \n" ..
                       "3. Come back to this quest and see the route update!",
                --route_to = "Valkurm Dunes"
                route_to = "Dangruf Wadi"
            },
            {
                text = "Pathfinding Demo 2: Go to Beadeaux! \n" ..
                       "Another auto-route example - notice how it calculates from your position.",
                route_to = "Beadeaux"
            },
            {
                text = "Congratulations! You have completed the feature demo."
            }
        }
    }
}
