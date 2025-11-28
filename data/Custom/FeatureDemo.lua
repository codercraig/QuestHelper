-- addons/QuestHelper/data/Custom/FeatureDemo.lua
return {
    ["Feature Demo"] = {
        steps = {
            {
                text = "Walk into the glowing square to begin the demo.",
                trigger_zones = {
                    { type = 'square', center = { x = 26, y = 0, z = -81 }, size = 5 },
                    { type = 'square', center = { x = 0,  y = 0, z = -81 }, size = 2 },
                    { type = 'line', start = { x = 50, y = 0, z = -81 }, stop = { x = 50, y = -5, z = -71 } }
                },
                zone = "Bastok Mines"
            },
            {
                text = "This is a line. It connects two points.",
                draw_type = 'line',
                start_pos = { x = 26, y = 0, z = -81 },
                end_pos = { x = 36, y = 0, z = -81 },
                zone = "Bastok Mines"
            },
            {
                text = "This is a square. It is drawn at the specified center.",
                draw_type = 'square',
                center = { x = -10, y = -3.0, z = -115 },
                size = 3,
                zone = "Bastok Mines"
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
