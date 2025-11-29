-- addons/QuestHelper/data/Custom/FeatureDemo.lua
return {
    ["Feature Demo"] = {
        steps = {
            {
                text = "Walk into the glowing square to begin the demo.",
                trigger_zones = {
                    { type = 'square', center = { x = 2, y = 0, z = -79 }, size = 2 },
                     { type = 'square', center = { x = 26, y = 0, z = -81 }, size = 5 },
                    { type = 'square', center = { x = 0,  y = 0, z = -81 }, size = 2 },
                    { type = 'line', start = { x = 50, y = 0, z = -81 }, stop = { x = 50, y = -5, z = -71 } }
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
                    file     = "maps/beadeaux_1.png",
                    width    = 512,
                    height   = 512,
                    zone_name = "Beadeaux",
                    --state    = 3,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    file     = "maps/beadeaux_2.png",
                    width    = 512,
                    height   = 512,
                    zone_name = "Beadeaux",
                    --state    = 1,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                },
            },
            },
            {
                text = "This is a square. It is drawn at the specified center.",
                draw_type = 'square',
                center = { x = -10, y = -3.0, z = -115 },
                size = 3,
                zone = "Dangruf Wadi",
            },
            {
                text = "Now, go obtain a some stuff. You can get them outside.",
                -- [NEW] This line turns the list below into a mandatory checklist
                require_all_items = true,

                -- I corrected "quadava" to "quadav" here to ensure it matches the game text
                trigger_on_item_obtain = {
                    "copper ore",
                    "honey"
                },
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
                    count = 3,
                    enemies = {"Stone Eater"},  -- Only Stone Eater kills count
                    zone = "South Gustaberg",
                    count_party_kills = true  -- Count kills from party members and trusts
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
                text = "Congratulations! You have completed the feature demo."
            }
        }
    }
}
