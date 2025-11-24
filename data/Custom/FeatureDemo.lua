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
                text = "Now, go obtain a Faded Crystal. You can get one from a 'Tunnel Worm'.",
                trigger_on_item_obtain = "flint stone",
                trigger_on_talk = "flint stone",
            },
            {
                text = "Congratulations! You have completed the feature demo."
            }
        }
    }
}
