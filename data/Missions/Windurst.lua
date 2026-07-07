return {
    ["1-1: The Horutoto Ruins Experiment"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        zone_name = "Windurst Waters North",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Walls",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: (Home Point #1) Go to the Orastery in Port Windurst and talk to Hakkuru-Rinkuru (E-7) for a cutscene. \n \n",
                onmob_target = {"Hakkuru-Rinkuru"},
                trigger_on_event_id = {90},
                route_to = "Port Windurst",
                destination_highlight = {position = "E-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to East Sarutabaruta (J-7) and enter the Inner Horutoto Ruins (Lily Tower). \n" ..
                       "There is a Survival Guide teleport if you have unlocked it. \n \n" ..
                       "Inside, go down the stairs to the main room and circle South to find the cracked South wall at (H-9) - marked 'W' on map. \n \n" ..
                       "Pass through and head East to click the Gate: Magical Gizmo at (I-10) for a cutscene with the Minister - marked 'G' on map. \n \n",
                onmob_target = {"inner-horutoto-ruins-gate-magical-gizmo"},
                trigger_on_event_id = {42},
                route_to = "Inner Horutoto Ruins",
                destination_highlight = {
                    {position = "H-9", offsetX = 16, offsetY = 16,label = "W"},
                    {position = "I-10", offsetX = 16, offsetY = 16, label = "G"}
                },
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 348.9, y = -13.5, z = 98.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 379.0, y = -13.3, z = 100.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --survival guide
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 453.0, y = -8.0, z = 182.3 }, size = 1, floor_id = 1, colour = "green" },

                    --Inner Horutoto Ruins
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 380.0, y = -2.08, z = 15.8 }, size = 4, floor_id = 1, colour = "cyan", vertical = true },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 379.8, y = 0.5, z = 21.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 381.3, y = 0.0, z = -19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Search the six Ancient Magical Gizmos at (G-8), (G-9), (H-8), (H-9), (I-8) and (I-9). \n" ..
                       "One will give you the KI:Cracked Mana Orb - the correct Gizmo is randomly assigned per party member. \n \n",
                onmob_target = {"inner-horutoto-ruins-ancient-magical-gizmo-1",
                                "inner-horutoto-ruins-ancient-magical-gizmo-2",
                                "inner-horutoto-ruins-ancient-magical-gizmo-3",
                                "inner-horutoto-ruins-ancient-magical-gizmo-4",
                                "inner-horutoto-ruins-ancient-magical-gizmo-5",
                                "inner-horutoto-ruins-ancient-magical-gizmo-6"},
                trigger_on_event_id = {48, 50, 52, 54, 56, 58},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 415.5, y = 0.0, z = -19.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 379.6, y = -0.0, z = -16.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 380.0, y = -2.08, z = 15.8 }, size = 4, floor_id = 1, colour = "cyan", vertical = true },

                    --Gizmos
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 340.2, y = 0.4, z = 59.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 344.9, y = 0.5, z = 25.5 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 414.9, y = 0.5, z = 25.1 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 418.3, y = 0.5, z = 60.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 415.0, y = 0.5, z = 94.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 346.6, y = 0.5, z = 93.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Hakkuru-Rinkuru (E-7) in the Orastery, Port Windurst to complete the mission! \n \n",
                onmob_target = {"Hakkuru-Rinkuru"},
                trigger_on_event_id = {94},
                route_to = "Port Windurst",
                destination_highlight = {position = "E-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!",
        }
    },

    ["1-2: The Heart of the Matter"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "1-1: The Horutoto Ruins Experiment"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n" ..
                       "Note: There is aggro in this mission. Bring Sneak/Invisible or be around level 15-18. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: (Home Point #3) Go to the Manustery in Windurst Woods and talk to Apururu (H-9). \n" ..
                       "She will give you 6 KI:Dark Mana Orbs and tell you to go to the Outer Horutoto Ruins. \n \n",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {137},
                route_to = "Windurst Woods",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 40,
                visual_zones = {
                   { zone_name = "Windurst Woods", type = 'arrow', center = { x = -40.6, y = -1.5, z = -9.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Travel to East Sarutabaruta and talk to Pore-Ohre (J-11) at the Marguerite Tower. \n" ..
                       "He will give you the KI:Southeastern Star Charm. \n",
                onmob_target = {"Pore-Ohre"},
                trigger_on_event_id = {46},
                zone_max_distance = 40,
                route_to = "Outer Horutoto Ruins",
                --destination_highlight = {position = "J-11", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 259.6, y = -17.2, z = -440.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Head inside the Outer Horutoto Ruins, go South then West to the main square room. \n" ..
                       "Place all 6 KI:Dark Mana Orbs into the Ancient Magical Gizmos: \n" ..
                       "- 4 Gizmos are in the corners of the room. \n" ..
                       "- 2 Gizmos are in secret rooms on the North and South walls - click their targetable doors to open them. \n" ..
                       "Note: There is a Bomb in the room, kill it or it will aggro unless you are high level. \n \n",
                onmob_target = {"outer-horutoto-ruins-ancient-magical-gizmo-1",
                                "outer-horutoto-ruins-ancient-magical-gizmo-2",
                                "outer-horutoto-ruins-ancient-magical-gizmo-3",
                                "outer-horutoto-ruins-ancient-magical-gizmo-4",
                                "outer-horutoto-ruins-ancient-magical-gizmo-5",
                                "outer-horutoto-ruins-ancient-magical-gizmo-6"},
                zone_max_distance = 40,
                visual_zones = {
                    -- East Sarutabaruta
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 260.0, y = -17.3, z = -457.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },

                    --Cracked Walls
                    { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 500.0, y = -1.9, z = -708.2 }, size = 4, floor_id = 3, colour = "cyan", vertical = true },
                    { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 500.0, y = -1.8, z = -611.8 }, size = 4, floor_id = 3, colour = "cyan", vertical = true },
                },
                trigger_on_talk = {"You have set all of the dark Mana Orbs in place"},
                images = {
                    {
                        zone_name = "Outer Horutoto Ruins",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                    },
                },
            },
            {
                text = "Step 5: Once all orbs are placed, head East to the crack in the outer wall and examine the Gate: Magical Gizmo for a cutscene. \n \n",
                onmob_target = {"outer-horutoto-ruins-gate-magical-gizmo"},
                trigger_on_event_id = {44},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Outer Horutoto Ruins", type = 'arrow', center = { x = 537.3, y = -0.0, z = -660.2 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 548.3, y = -1.9, z = -660.0 }, size = 4, floor_id = 3, colour = "cyan", vertical = true, vertical_axis = 'z' },
                },
                images = {
                    {
                        zone_name = "Outer Horutoto Ruins",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                    },
                },
            },
            {
                text = "Step 6: Recollect all 6 KI:Glowing Mana Orbs from the Gizmos - click each one again. \n \n" ..
                       "(Optional): Zone back into East Sarutabaruta for an extra cutscene with the Ace Cardians. \n" ..
                       "Note: The Cardians will steal the orbs if you zone out but the mission can still be completed via a different cutscene with Apururu. \n \n",
                onmob_target = {"outer-horutoto-ruins-ancient-magical-gizmo-1",
                                "outer-horutoto-ruins-ancient-magical-gizmo-2",
                                "outer-horutoto-ruins-ancient-magical-gizmo-3",
                                "outer-horutoto-ruins-ancient-magical-gizmo-4",
                                "outer-horutoto-ruins-ancient-magical-gizmo-5",
                                "outer-horutoto-ruins-ancient-magical-gizmo-6"},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Outer Horutoto Ruins", type = 'arrow', center = { x = 557.4, y = -0.0, z = -660.2 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                   -- { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 548.3, y = -1.9, z = -660.0 }, size = 4, floor_id = 3, colour = "cyan", vertical = true, vertical_axis = 'z' },
                   --North Wall
                    { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 500.0, y = -1.8, z = -611.8 }, size = 4, floor_id = 3, colour = "cyan", vertical = true },
                    { zone_name = "Outer Horutoto Ruins", type = 'square', center = { x = 500.0, y = -1.9, z = -708.2 }, size = 4, floor_id = 3, colour = "cyan", vertical = true },
                },
                keyitems_needed = {59, 60, 61, 62, 63, 64},
                trigger_on_keyitem_obtain = {59, 60, 61, 62, 63, 64},
                require_all_keyitems = true,
                images = {
                    {
                        zone_name = "Outer Horutoto Ruins",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                    },
                },
            },
            {
                text = "Step 7: Return to Apururu (H-9) in the Manustery, Windurst Woods to complete the mission! \n \n",
                onmob_target = {"Apururu"},
                zone_max_distance = 40,
                visual_zones = {
                   { zone_name = "Windurst Woods", type = 'arrow', center = { x = -40.6, y = -1.5, z = -9.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {143, 145},
                route_to = "Windurst Woods",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!",
        }
    },

    ["1-3: The Price of Peace"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "1-2: The Heart of the Matter"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                keyitems_needed = {17,18},
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Walls",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: (Home Point #3) Go to the Rhinostery in Windurst Waters (South) and talk to Leepe-Hoppe (J-9) on the roof. \n" ..
                       "He will give you the KI:Food Offering and KI:Drink Offering. \n" ..
                       "(Optional): Talk to Ohbiru-Dohbiru inside the Rhinostery. \n \n",
                onmob_target = {"Leepe-Hoppe"},
                trigger_on_event_id = {140},
                route_to = "Windurst Waters South",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Windurst Waters South", type = 'arrow', center = { x = 3.9, y = -4.0, z = -207.5 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Travel through West Sarutabaruta and enter Giddeus via (F-8). \n" ..
                       "Note: The Outpost in West Sarutabaruta (H-6) is near the entrance. \n \n",
                zone_trigger = "Giddeus",
                route_to = "Giddeus",
            },
            {
                text = "Step 4: Inside Giddeus, at all intersections take the left-hand choice. \n" ..
                       "Talk to Laa Mozi (H-7) to give the KI:Food Offering. \n \n",
                onmob_target = {"Laa Mozi"},
                trigger_on_event_id = {45},
                images = {
                    {
                        zone_name = "Giddeus",
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        floor_id  = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Head back to (G-7) and talk to Ghoo Pakya to give the KI:Drink Offering. \n \n",
                onmob_target = {"Ghoo Pakya"},
                trigger_on_event_id = {49},
                images = {
                    {
                        zone_name = "Giddeus",
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        floor_id  = 1,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return to the roof of the Rhinostery in Windurst Waters (South) for another cutscene. \n \n",
                trigger_on_event_id = {146},
                route_to = "Windurst Waters South",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -5.0, y = -4.0, z = -183.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Windurst Waters South", type = 'arrow', center = { x = 8.4, y = -4.0, z = -207.1 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Windurst Waters South", type = 'square', center = { x = 21.7, y = -9.8, z = -198.6 }, size = 4, floor_id = 2, colour = "cyan" },
                },
            },
            {
                text = "Step 7: Talk to any Windurstian Gate Guard to complete the mission. \n" ..
                       "Note: Any gate guard will work, not just the one you started with. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_event_id = {114, 116, 148, 154},
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Walls",
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 2, 1000g!",
        }
    },

    ["2-1: Lost for Words"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "1-3: The Price of Peace"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n" ..
                       "Note: Trade at least 1 crystal to any War Warlock (W.W.) at the city gates to unlock this mission. Trading 7 caps your rank points for Rank 2. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    -- {
                    --     zone_name = "Windurst Walls",
                    --     width     = 512,
                    --     height    = 512,
                    --     state     = 1,
                    --     highlights = {
                    --         { position = "H-7", offsetX = 16, offsetY = 16 },
                    --     },
                    -- },
                },
            },
            {
                text = "Step 2: (Home Point #1) Go to the Optistery in Windurst Waters (North) and talk to Tosuka-Porika (G-8) in the East Wing. \n" ..
                       "Note: You may need to talk to him twice if you have started the quest 'Past Reflections'. \n \n",
                onmob_target = {"Tosuka-Porika"},
                trigger_on_event_id = {160},
                route_to = "Windurst Waters North",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Windurst Woods and talk to Nanaa Mihgo (J-3) at the very north. \n" ..
                       "You will obtain the KI:Lapis Monocle. \n \n",
                onmob_target = {"Nanaa Mihgo"},
                trigger_on_event_id = {165},
                route_to = "Windurst Woods",
                destination_highlight = {position = "J-3", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Travel to Maze of Shakhrami. \n" ..
                       "Players under level 35 need Sneak and Invisible - Goblins sight-aggro, Scorpions and Ghouls sound-aggro. \n \n" ..
                       "[1] Inside, go to (G-6) and follow the yellow arrows - there is 3 Fossil Rocks, but a chance none will contain the Lapis Coral Keyitem. \n \n" ..
                       "[2] If those 3 do NOT contain the keyitem, head back and follow the blue arrows to the 2nd location where there is 2 more Fossil Rocks. \n \n" ..
                       "Note: Cancel Invisible to examine rocks but keep Sneak active. Warp out once obtained. \n \n",
                --dismiss_on_approach = 6,
                onmob_target = {"maze-of-shakhrami-fossil-rock-h5-1",
                                "maze-of-shakhrami-fossil-rock-h5-2",
                                "maze-of-shakhrami-fossil-rock-h5-3",
                                "maze-of-shakhrami-fossil-rock-i8-1",
                                "maze-of-shakhrami-fossil-rock-i8-2"},
                keyitems_needed = {68},
                zone_max_distance = 40,
                trigger_on_keyitem_obtain = {68},
                visual_zones = {
                    --survival guide
                    { zone_name = "Maze of Shakhrami", type = 'square', center = { x = -338.0, y = -12.2, z = -179.0 }, size = 1, floor_id = 15, colour = "green" },

                    --map 1
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -266.8, y = 0.7, z = -111.3 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -156.1, y = 0.0, z = 0.4 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -120.6, y = 0.0, z = -1.8 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -80.7, y = 0.0, z = 2.4 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -48.5, y = -3.4, z = 14.7 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -34.7, y = 0.1, z = 44.1 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 18.7, y = 20.2, z = 146.9 }, size = 4, direction = "up", floor_id = 16, colour = "yellow" },

                    --reverse back
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -34.1, y = 0.0, z = 37.3 }, size = 4, direction = "down", floor_id = 15, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -56.9, y = -3.9, z = 7.1 }, size = 4, direction = "left", floor_id = 15, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 21.3, y = 20.5, z = 150.0 }, size = 4, direction = "down", floor_id = 16, colour = "cyan" },

                    -- to 2nd location
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -82.2, y = 0.0, z = 0.4 }, size = 4, direction = "right", floor_id = 15, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -21.0, y = -0.2, z = -5.4 }, size = 4, direction = "right", floor_id = 15, colour = "cyan" },
                    { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = 78.8, y = 20.4, z = -110.7 }, size = 4, direction = "right", floor_id = 16, colour = "cyan" },
                },
                images = {
                    {
                        zone_name = "Maze of Shakhrami",
                        floor_id  = 15,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-8", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                    {
                        zone_name = "Maze of Shakhrami",
                        floor_id  = 16,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "I-8", offsetX = 16, offsetY = 16, label = "2" },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Nanaa Mihgo (J-3) in Windurst Woods. \n" ..
                       "She will take the KI:Lapis Coral and KI:Lapis Monocle and give you the KI:Hideout Key. \n \n",
                onmob_target = {"Nanaa Mihgo"},
                trigger_on_event_id = {169},
                route_to = "Windurst Woods",
                destination_highlight = {position = "J-3", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 6: Head to East Sarutabaruta (J-7) and enter the Inner Horutoto Ruins (Lily Tower). \n" ..
                       "Note: There is a Survival Guide at this entrance. \n \n" ..
                       "Inside, go to (G-9) in the lower-left of the main ring room and pass through the Cracked Wall into Beetle's Burrow. \n" ..
                       "Navigate west then north along the western wall to reach the Mahogany Door at (G-8) and click it for a cutscene. \n" ..
                       "Note: Beetles and bats here do not aggro. Hug the western wall near the end to avoid any Goblins or Skeletons. \n \n",
                onmob_target = {"inner-horutoto-ruins-mahogany-door-g8"},
                trigger_on_event_id = {46},
                zone_max_distance = 40,
                visual_zones = {
                    --arrow into the Inner Horutoto Ruins
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 356.2, y = -13.3, z = 100.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --survival guide
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 453.0, y = -8.0, z = 182.3 }, size = 1, floor_id = 1, colour = "green" },

                    --nav to cracked wall
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 348.2, y = 0.5, z = 26.6 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 299.8, y = -0.0, z = 15.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 300.0, y = -2.0, z = 9.7 }, size = 4, floor_id = 1, colour = "cyan", vertical = true },

                    --beyond tha wall!
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 259.0, y = -0.2, z = -25.0 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 216.6, y = -0.2, z = 20.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 181.8, y = -0.2, z = 5.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 134.7, y = 0.1, z = -21.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 100.0, y = 1.3, z = 2.3 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 59.2, y = -0.4, z = 49.5 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 32.9, y = -0.0, z = 71.0 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 4.9, y = 0.9, z = 21.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: (Home Point #1) Warp back and head to Windurst Walls. \n" ..
                       "Go to the very north (G-3) to find the House of the Hero and click on the front door for a cutscene. \n \n",
                onmob_target = {"Door: House-of-the-Hero"},
                trigger_on_event_id = {337},
                route_to = "Windurst Walls",
                destination_highlight = {position = "G-3", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 8: (Home Point #1) Return to Tosuka-Porika (G-8) at the Optistery in Windurst Waters (North) to complete the mission! \n \n",
                onmob_target = {"Tosuka-Porika"},
                trigger_on_event_id = {168},
                route_to = "Windurst Waters North",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!",
        }
    },

    ["2-2: Testing Time"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "2-1: Lost for Words"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n" ..
                       "Note: This mission is skippable! Trade 1 crystal to any War Warlock (W.W.) at the city gates to unlock it, or 3 crystals to skip it entirely. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    -- {
                    --     zone_name = "Windurst Walls",
                    --     width     = 512,
                    --     height    = 512,
                    --     state     = 1,
                    --     highlights = {
                    --         { position = "H-7", offsetX = 16, offsetY = 16 },
                    --     },
                    -- },
                },
            },
            {
                text = "Step 2: Head to the Aurastery in Windurst Waters (North) and talk to Moreno-Toeno (L-6). \n" ..
                       "He will give you the KI:Creature Counter Magic Doll. \n" ..
                       "Note: You may need to speak to him twice to trigger the cutscene. \n \n",
                onmob_target = {"Moreno-Toeno"},
                trigger_on_event_id = {182, 687},
                route_to = "Windurst Waters North",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Kill 30-35 monsters in Tahrongi Canyon (first run) or Buburimu Peninsula (repeat). \n" ..
                       "Route: East Sarutabaruta (J-4) -> Tahrongi Canyon; repeat runs continue east to Buburimu (K-8). \n" ..
                       "You have 1 game day (first) or 2 game days (repeat) to kill and return to Moreno-Toeno. \n" ..
                       "Trust kills count. Pet kills don't. Don't exceed ~60 kills or the mission fails. \n \n",
                route_to = "Tahrongi Canyon",
                onmob_enemy = {
                    "Canyon Rarab", "Strolling Sapling", "Pygmaioi",
                    "Yagudo Acolyte", "Yagudo Initiate", "Yagudo Scribe", "Yagudo Mendicant", "Yagudo Persecutor", "Yagudo Piper",
                    "Goblin Thug", "Goblin Weaver", "Goblin Ambusher", "Goblin Butcher", "Goblin Digger", "Goblin Tinkerer",
                    "Killer Bee", "Akbaba", "Canyon Crawler", "Wild Dhalmel", "Barghest",
                    "Skeleton Sorcerer", "Skeleton Warrior", "Ghost", "Grenade", "Poltergeist",
                    "Air Elemental", "Earth Elemental",
                },
                onmob_enemy_zone = "Tahrongi Canyon",
                kill_requirement = {
                    count = 35,
                    zone = "Tahrongi Canyon",
                    count_party_kills = true,
                },
            },
            {
                text = "Step 4: Return to Moreno-Toeno (L-6) at the Aurastery in Windurst Waters (North) to complete the mission! \n" ..
                       "Note: He will only assess you in the final game hour before your deadline. \n \n",
                onmob_target = {"Moreno-Toeno"},
                trigger_on_event_id = {200, 201, 206, 209},
                route_to = "Windurst Waters North",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points!",
        }
    },
    ["2-3a: The Three Kingdoms - Introduction"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "2-1: Lost for Words"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n" ..
                       "Note: Trade 1 crystal to any War Warlock (W.W.) at the city gates to unlock this mission. Trading 6 crystals after 'Lost for Words' also works. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    -- {
                    --     zone_name = "Windurst Walls",
                    --     width     = 512,
                    --     height    = 512,
                    --     state     = 1,
                    --     highlights = {
                    --         { position = "H-7", offsetX = 16, offsetY = 16 },
                    --     },
                    -- },
                },
            },
            {
                text = "Step 2: Head to Heavens Tower in Windurst Walls (H-6/H-7) and enter the Door: Clerical Chamber. \n \n" ..
                       "Talk to Kupipi behind the counter - she will hand you the KI:Letter to the Consuls. \n \n" ..
                       "You can now go to either the 'San d'Oria -> Bastok' guide OR the 'Bastok -> San d'Oria' guide. Do NOT do both! \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {95},
                route_to = "Heavens Tower"
            },
        },
        reward = {
            text = "Nothing yet - follow one of the path guides below!"
        }
    },

    ["2-3b: The Three Kingdoms - San d'Oria -> Bastok"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "2-3a: The Three Kingdoms - Introduction"},
        },
        steps = {
            {
                text = "Step 1: Travel to Northern San d'Oria and talk to Heruze-Moruze (H-9) in the Consulate of Windurst. \n \n",
                onmob_target = {"Heruze-Moruze"},
                trigger_on_event_id = {582},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -32.6, y = 0.0, z = 36.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = -45.1, y = -3.5, z = 36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                }
            },
            {
                text = "Step 2: Talk to Kasaroro (H-9) in the back room of the Consulate of Windurst in Northern San d'Oria. \n \n",
                onmob_target = {"Kasaroro"},
                trigger_on_event_id = {546},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Go to Chateau d'Oraguille and talk to Halver (I-9). \n" ..
                       "Note: You will receive Cipher:Halver if you have the KI:Rhapsody in White. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {502},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Defeat the NM Warchief Vatgit in Ghelsba Outpost (H-7). \n" ..
                       "Tip: Fort Ghelsba Survival Guide drops you right next to the NM area. \n \n" ..
                       "Family: Orc | Level: 16 | Job: Warrior \n" ..
                       "Sometimes followed by Bloody Vrukwuk (Orc Paladin 14) or Fogweaver Mozzfuzz (Orc BLM 14). \n" ..
                       "Recommended: Soloable at level 20+. You must speak to Halver first for the kill to count! \n \n",
                kill_requirement = {
                    count = 1,
                    enemies = {"Warchief Vatgit"},
                    zone = "Ghelsba Outpost",
                    count_party_kills = true,
                },
                onmob_enemy = {"Warchief Vatgit"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 23.8, y = -0.5, z = 62.2 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -12.6, y = 0.0, z = 83.4 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -46.6, y = -0.8, z = 99.8 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -74.3, y = -9.4, z = 100.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -103.2, y = -10.2, z = 111.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -101.5, y = -10.0, z = 158.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -137.6, y = 0.1, z = 207.5 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -150.1, y = -1.0, z = 227.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -131.8, y = -6.1, z = 233.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -158.2, y = -10.0, z = 249.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -111.9, y = -10.0, z = 257.8 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -98.9, y = -12.3, z = 292.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -100.3, y = -19.0, z = 312.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -108.4, y = -19.5, z = 343.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -98.5, y = -20.5, z = 374.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -63.1, y = -19.8, z = 406.3 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -29.0, y = -21.8, z = 421.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 16.6, y = -30.1, z = 420.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 50.6, y = -29.8, z = 414.9 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 58.9, y = -30.0, z = 394.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 60.5, y = -32.3, z = 339.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 34.6, y = -29.4, z = 307.8 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 13.0, y = -32.9, z = 282.4 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -17.3, y = -32.8, z = 263.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        zone_name = "Ghelsba Outpost",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 4,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Kasaroro (H-9) in the Consulate of Windurst in Northern San d'Oria. \n" ..
                       "The San d'Oria portion is now complete! \n \n",
                onmob_target = {"Kasaroro"},
                trigger_on_event_id = {550},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -32.6, y = 0.0, z = 36.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = -45.1, y = -3.5, z = 36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                }
            },
            {
                text = "Step 6: Travel to Bastok and talk to Patt-Pott (I-7) at the Consulate of Windurst in Metalworks. \n" ..
                       "Tip: Unity Warp to South Gustaberg then head to Bastok Markets (J-7) to reach Metalworks. \n \n",
                onmob_target = {"Patt-Pott"},
                trigger_on_event_id = {256},
                route_to = "Metalworks",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = 23.6, y = -14.0, z = 13.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = 23.0 }, width = 3.75, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 7: Talk to Pius (J-8) in the Department of Industry (President's Office) in Metalworks. \n \n",
                onmob_target = {"Pius"},
                trigger_on_event_id = {355},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = 88.9, y = -19.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = 88.8, y = -21.7, z = -6.9 }, width = 2.25, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 8: Talk to Grohm (H-9) in the Craftsmen's Eatery in Metalworks. \n" ..
                       "He will direct you to find the Burning Circle deep within Palborough Mines. \n \n",
                onmob_target = {"Grohm"},
                trigger_on_event_id = {426},
                route_to = "Metalworks",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = -35.2, y = -10.0, z = -12.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = -29.7, y = -11.6, z = -18.3 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                }
            },
            {
                text = "Step 9: Navigate to floor 3 of Palborough Mines and enter Waughroon Shrine at (H-10). \n" ..
                       "Take the elevator at (I-8) on floor 1 or navigate up through the mine. \n" ..
                       "Note: Sneak recommended! \n \n",
                zone_trigger = "Waughroon Shrine",
                route_to = "Palborough Mines 3",
                onmob_target = {"palborough-mines-elevator-lever-i8"},
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    --to elevator
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.0, y = 0.4, z = 66.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.0, y = 0.2, z = 99.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 19.2, y = 0.1, z = 118.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 62.0, y = 0.9, z = 140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -0.1, z = 135.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.5, y = -0.1, z = 87.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = 0.2, z = 58.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = -7.8, z = -2.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 130.7, y = -8.0, z = -20.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 140.4, y = -9.5, z = 10.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.1, y = -14.5, z = 19.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 220.3, y = -9.3, z = 33.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 206.9, y = -1.2, z = 59.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 186.7, y = 0.3, z = 63.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    --floor 3
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 186.4, y = -32.0, z = 61.4 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.7, y = -32.0, z = 64.9 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.4, y = -32.0, z = 99.4 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 216.7, y = -32.0, z = 140.3 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.6, y = -32.0, z = 139.6 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.9, y = -32.0, z = 139.8 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 111.5, y = -32.0, z = 141.1 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 89.9, y = -32.1, z = 143.0 }, size = 4, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.3, y = -32.1, z = 127.2 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.5, y = -31.3, z = 96.7 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 67.8, y = -31.6, z = 59.6 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.4, y = -32.0, z = 59.1 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.4, y = -31.7, z = 36.6 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.8, y = -31.7, z = 3.2 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 90.3, y = -32.0, z = -19.6 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.3, y = -32.0, z = -30.7 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 66.0, y = -32.0, z = -60.0 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.8, y = -32.0, z = -62.3 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.3, y = -32.2, z = -89.8 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 101.0, y = -32.8, z = -124.5 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 104.8, y = -38.4, z = -146.9 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },

                    --home point
                    { zone_name = "Palborough Mines", type = 'square', center = { x = 109.0, y = -38.4, z = -147.0 }, size = 1, floor_id = 3, colour = "green" },
                }
            },
            {
                text = "Step 10: Click the Burning Circle and enter the battlefield. You will face Dark Dragon and Seeker. \n" ..
                       "Recommended: Level 35+ solo. Alter Egos may be summoned inside. \n \n" ..
                       "===== Dark Dragon ===== \n" ..
                       "Family: Dragon | Level: 27 \n \n" ..
                       "===== Seeker ===== \n" ..
                       "Family: Bigeye | Level: 25 \n \n" ..
                       "Sleep/Bind the Dragon and kill the Seeker first! \n" ..
                       "After winning, you will receive the KI:Kindred Crest. \n \n",
                onmob_target = {"waughroon-shrine-burning-circle"},
                --onmob_enemy = {"Dark Dragon","Seeker"},
                --onmob_enemy_size = 3,
                kill_requirement = {
                    count = 2,
                    enemies = {"Dark Dragon","Seeker"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 11: Return to Patt-Pott (I-7) in Metalworks to receive the KI:Kindred Report. \n \n",
                onmob_target = {"Patt-Pott"},
                trigger_on_event_id = {257},
                route_to = "Metalworks",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Metalworks", type = 'arrow', center = { x = 23.6, y = -14.0, z = 13.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Metalworks", type = 'rect', center = { x = 24.0, y = -17.4, z = 23.0 }, width = 3.75, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 12: Return to Kupipi in Heavens Tower in Windurst Walls (H-6/H-7) to complete the mission! \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {101},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Cipher:Halver & Cipher:Semih!"
        }
    },

    ["2-3b: The Three Kingdoms - Bastok -> San d'Oria"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "2-3a: The Three Kingdoms - Introduction"},
        },
        steps = {
            {
                text = "Step 1: Travel to Bastok and talk to Patt-Pott (I-7) at the Consulate of Windurst in Metalworks. \n",
                onmob_target = {"Patt-Pott"},
                trigger_on_event_id = {254},
                route_to = "Metalworks",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 2: Talk to Pius (J-8) in the Department of Industry (President's Office) in Metalworks. \n \n",
                onmob_target = {"Pius"},
                trigger_on_event_id = {355},
                route_to = "Metalworks",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Talk to Grohm (H-9) in the Craftsmen's Eatery in Metalworks. \n \n" ..
                       "He will give you Pickaxes and direct you to mine in Palborough Mines. \n \n" ..
                       "Tip: Buy extra Pickaxes as they can break. Pick up the Map of Palborough Mines if you need it. \n \n",
                onmob_target = {"Grohm"},
                trigger_on_event_id = {423},
                route_to = "Metalworks",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                         { zone_name = "Metalworks", type = 'rect', center = { x = -29.7, y = -11.6, z = -18.3 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                         { zone_name = "Metalworks", type = 'arrow', center = { x = -32.9, y = -10.0, z = -15.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                }
            },
            {
                text = "Step 4: Head to Palborough Mines and mine Mythril Seams until you obtain Mine Gravel. \n \n" ..
                       "Seam locations: (I-8) floor 1 west of river, (I-8) floor 2 south room, (I-9) floor 3. \n \n" ..
                       "Note: Sneak recommended — Quadavs aggro by sight. \n" ..
                       "(Optional): Mine Gravel can be purchased from the Auction House [ Others -> Misc.]. \n \n",
                route_to = "Palborough Mines 1",
                destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                onmob_target = {"palborough-mines-mythril-seam"},
                items_needed = {"Mine Gravel"},
                trigger_on_item_obtain = {"Mine Gravel"},
                zone_max_distance = 40,
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 59.7, y = 0.2, z = 69.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 60.1, y = 0.2, z = 99.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 62.1, y = 0.9, z = 139.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 100.3, y = -0.1, z = 133.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 101.5, y = 0.1, z = 60.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 167.6, y = -0.1, z = 66.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                },
            },
            {
                text = "Step 5: On floor 3 of Palborough Mines, go to (I-6) and trade Mine Gravel to the Refiner Lid. \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-elevator-lever-i8",
                                "palborough-mines-refiner-lid"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                --Put in the refiner machine lid
                trigger_on_event_id = {19},
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 169.2, y = -1.2, z = 92.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 163.1, y = 0.2, z = 59.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.9, y = 0.1, z = 55.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 99.3, y = -6.1, z = 9.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 139.0, y = -8.1, z = -7.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 179.3, y = -14.5, z = 20.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 220.9, y = -7.9, z = 39.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 200.5, y = 0.2, z = 59.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                    --3rd floor
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 187.0, y = -32.0, z = 61.1 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.3, y = -32.0, z = 66.2 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.4, y = -32.0, z = 99.6 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 218.5, y = -32.0, z = 139.7 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 179.5, y = -32.0, z = 141.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                }
            },
            {
                text = "Step 6: Pull the Refiner Lever! \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-refiner-lever"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {17},
            },
            {
                text = "Step 7: Drop down and pull the second lever. \n \n" ..
                       "You will receive an Onze of Mythril Sand. \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-refiner-lever-2"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_item_obtain = {"Mythril Sand"},
                visual_zones = {
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 180.9, y = -32.3, z = 167.6 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 175.3, y = -31.8, z = 176.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.4, y = -31.8, z = 177.9 }, stop = { x = 175.6, y = -23.5, z = 179.2 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.6, y = -23.5, z = 179.2 }, stop = { x = 175.4, y = -23.5, z = 184.1 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'line', start = { x = 175.4, y = -23.5, z = 184.1 }, stop = { x = 175.3, y = -15.7, z = 185.3 }, floor_id = 2, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 174.1, y = -15.8, z = 182.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                }
            },
            {
                text = "Step 8: Warp out and go to Patt-Pott (I-7) in Metalworks and trade him the Onze of Mythril Sand. \n \n" ..
                       "The Bastok portion is now complete! \n \n",
                onmob_target = {"Patt-Pott"},
                trigger_on_event_id = {255},
                route_to = "Metalworks",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 9: Travel to Northern San d'Oria and talk to Kasaroro (H-9) in the Consulate of Windurst. \n" ..
                       "Tip: Teleport-Holla from Crag of Holla, or Unity Warp to East Ronfaure. \n \n",
                onmob_target = {"Kasaroro"},
                trigger_on_event_id = {547},
                zone_max_distance = 40,
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -29.4, y = 0.0, z = 36.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = -45.1, y = -3.5, z = 36.0 }, width = 3.00, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                }
            },
            {
                text = "Step 10: Go to Chateau d'Oraguille and talk to Halver (I-9). \n" ..
                       "Note: You will receive Cipher:Halver if you have the KI:Rhapsody in White. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {504},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 11: Travel to Horlais Peak for the BCNM battle. \n" ..
                       "Note: Orcs sight-aggro, Bats sound-aggro. Sneak and Invisible recommended for lower levels. \n \n" ..
                       "West Ronfaure  : Go to (E-4) -> Ghelsba Outpost. \n" ..
                       "Ghelsba Outpost: Go to (H-11) -> Yughott Grotto (exit 1). \n" ..
                       "Yughott Grotto : Go to (K-5) -> Fort Ghelsba (exit 3). \n" ..
                       "Fort Ghelsba   : Go to (J-8) -> Yughott Grotto (exit 4). \n" ..
                       "Yughott Grotto : Enter Horlais Peak (J-6). \n \n" ..
                       "Shortcut: Yughott Grotto Home Point #1 if unlocked. \n \n",
                zone_max_distance = 35,
                zone_trigger = "Horlais Peak",
                visual_zones = {
                        --Ghelsba Outpost
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 28.1, y = 0.1, z = 62.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = -4.4, y = 0.0, z = 26.6 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 19.9, y = 0.1, z = -4.8 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Ghelsba Outpost", type = 'arrow', center = { x = 45.9, y = 0.0, z = -58.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        -- Yughotto Grott 1 to K-4
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -225.1, y = -0.2, z = -91.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -191.8, y = -1.0, z = -87.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -141.4, y = -0.2, z = -60.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -103.5, y = -0.0, z = -56.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -92.0, y = -0.6, z = -38.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -78.9, y = 0.0, z = -9.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = -21.5, y = -0.2, z = -25.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 18.8, y = -0.2, z = 2.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 56.4, y = -0.2, z = 32.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 137.1, y = -12.9, z = 61.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 139.8, y = -12.4, z = 113.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 203.8, y = -12.0, z = 121.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 236.9, y = -12.2, z = 125.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 292.9, y = -23.7, z = 171.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 317.5, y = -24.2, z = 180.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 329.4, y = -24.4, z = 215.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 335.4, y = -24.1, z = 239.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 322.3, y = -24.1, z = 251.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        -- Fort Ghelsba 2
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 207.9, y = -45.8, z = 100.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 151.4, y = -44.0, z = 116.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 93.8, y = -52.0, z = 116.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 96.9, y = -59.8, z = 66.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 101.0, y = -60.0, z = 1.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 109.9, y = -63.6, z = -51.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 146.6, y = -68.5, z = -62.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 184.1, y = -75.7, z = -49.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 177.5, y = -83.9, z = -3.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 166.4, y = -84.6, z = 20.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 176.7, y = -86.4, z = 20.6 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 185.2, y = -86.4, z = 24.3 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Fort Ghelsba", type = 'arrow', center = { x = 198.8, y = -86.2, z = 19.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                        --Yughott Grotto 2
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 283.4, y = -39.7, z = 148.5 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 320.8, y = -40.3, z = 135.1 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 315.1, y = -40.1, z = 105.0 }, size = 4, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 330.6, y = -42.1, z = 109.8 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 374.5, y = -40.3, z = 105.9 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 400.5, y = -40.2, z = 118.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 405.5, y = -40.1, z = 148.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Yughott Grotto", type = 'arrow', center = { x = 436.7, y = -40.1, z = 169.2 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },

                        --Home point
                        { zone_name = "Yughott Grotto", type = 'square', center = { x = 434.0, y = -40.0, z = 171.0 }, size = 1, floor_id = 2, colour = "green" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
                          highlights = {
                              { position = "H-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 1,
                          highlights = {
                              { position = "K-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Fort Ghelsba",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 2,
                          highlights = {
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 12: Click the Burning Circle and enter the battlefield. You will face Dread Dragon and Spotter. \n" ..
                       "Recommended: Level 35+ solo. Alter Egos may be summoned inside. \n \n" ..
                       "===== Dread Dragon ===== \n" ..
                       "Family: Dragon | Level: 27 \n \n" ..
                       "===== Spotter ===== \n" ..
                       "Family: Bigeye | Level: 25 \n \n" ..
                       "Sleep/Bind the Dragon and kill the Spotter first! \n" ..
                       "After winning, you will receive the KI:Kindred Crest. \n \n",
                onmob_target = "horlais-peak-burning-circle",
                -- onmob_enemy = {"Dread Dragon","Spotter"},
                -- onmob_enemy_zone = "Horlais Peak",
                kill_requirement = {
                    count = 2,
                    enemies = {"Dread Dragon","Spotter"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 13: Return to Kasaroro (H-9) in the Consulate of Windurst in Northern San d'Oria. \n" ..
                       "You will receive the KI:Kindred Report. \n \n",
                onmob_target = {"Kasaroro"},
                trigger_on_event_id = {551},
                route_to = "Northern San d'Oria",
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Northern San d'Oria", type = 'arrow', center = { x = -29.4, y = 0.0, z = 36.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Northern San d'Oria", type = 'rect', center = { x = -45.1, y = -3.5, z = 36.0 }, width = 3.00, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                }
            },
            {
                text = "Step 14: Return to Kupipi in Heavens Tower in Windurst Walls (H-6/H-7) to complete the mission! \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {101},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Cipher:Halver & Cipher:Semih!"
        }
    },
    ["3-1: To Each His Own Right"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "2-3b: The Three Kingdoms - San d'Oria -> Bastok"},
            {category = "Missions", subfile = "Windurst", name = "2-3b: The Three Kingdoms - Bastok -> San d'Oria"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city \n \n" ..
                       "Note: Trade 6 crystals to unlock the next mission at the W.W(Marked with green sqaures)! \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Head to Heavens Tower in Windurst Walls (H-6/H-7) and talk to Kupipi. \n" ..
                       "She will give you the KI:Starway Stairway Bauble. \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {103},
                route_to = "Heavens Tower",
            },
            {
                text = "Step 3: While still in Heavens Tower, go through the glowing doorway to the left of Kupipi. \n \n" ..
                       "Climb the Starway Stairway to the highest floor and talk to Rhy Epocan for a cutscene. \n \n" ..
                       "Note: After the cutscene, use the blue Transporter near Foo Beibo to warp back to the first floor. \n \n",
                onmob_target = {"Rhy Epocan"},
                zone_max_distance = 17,
                visual_zones = {
                    --To the Starway Stairway
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -1.7, y = 0.5, z = 29.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'rect', center = { x = -13.7, y = -1.5, z = 28.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },

                    --Up the 2 flights of stairs to Rhy Eopcan
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.2, y = -1.0, z = 23.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.8, y = -6.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -21.3, y = -11.5, z = -22.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.8, y = -16.0, z = -31.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 23.0, y = -21.2, z = -21.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 31.7, y = -25.2, z = -4.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 13.9, y = -26.0, z = 5.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 3.2, y = -26.0, z = 18.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 2.4, y = -26.0, z = 30.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.7, y = -31.5, z = 21.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.9, y = -36.5, z = -1.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.0, y = -41.5, z = -23.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.5, y = -45.0, z = -30.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.1, y = -47.0, z = -9.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {107},
            },
            {
                text = "Step 4: (Home Point #1) Talk to Hakkuru-Rinkuru (E-7) in the Orastery in Port Windurst. \n" ..
                       "He will inform you that the minister has gone to Castle Oztroja. \n \n",
                onmob_target = {"Hakkuru-Rinkuru"},
                trigger_on_event_id = {147},
                route_to = "Port Windurst",
                destination_highlight = {position = "E-7", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Port Windurst", type = 'arrow', center = { x = -93.0, y = -3.0, z = 119.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Port Windurst", type = 'rect', center = { x = -99.2, y = -4.7, z = 119.1 }, width = 2.00, height = 2.75, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                }
            },
            {
                text = "Step 5: Travel to Castle Oztroja. \n" ..
                       "Tip: Use the Castle Oztroja or Meriphataud Mountains Survival Guide for a faster route. \n \n" ..
                       "Inside, go to Map 1 and find the Brass Door at (I-8). \n \n" ..
                       "Stand between the two levers flanking the door and pull one - you will drop through a trap door for a cutscene. \n" ..
                       "If the door opens, simply click the other one! \n \n" ..
                       "After the cutscene, click the round trap door in the floor to receive the KI:Old Ring (for quest: Onion Rings). \n" ..
                       "Click the trap door a second time to fall through and exit. \n \n",
                onmob_target = {"castle-oztroja-handle-1-i8","castle-oztroja-handle-2-i8"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -180.5, y = 0.3, z = -13.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -169.7, y = 0.3, z = 20.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -122.6, y = 0.3, z = 19.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -61.1, y = 0.2, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -28.5, y = 0.3, z = 18.1 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -21.0, y = 0.3, z = -16.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 5.4, y = 0.3, z = -16.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },

                    -- Onion ring Keyitem
                    { zone_name = "Castle Oztroja", type = 'square', center = { x = 19.7, y = 24.1, z = -25.4 }, size = 2, floor_id = 7, colour = "green" },
                },
                trigger_on_event_id = {43},
                images = {
                    {
                        zone_name = "Castle Oztroja",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return to Rhy Epocan in Heavens Tower in Windurst Walls (H-6/H-7) to complete the mission! \n \n" ..
                       "Before you Warp - remember to Grab the KI:Old Ring (for quest: Onion Rings) - Marked a sqaure on the ground. \n \n",
                onmob_target = {"Rhy Epocan"},
                trigger_on_event_id = {114},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                    -- Old Ring before you leave the trap door.
                     { zone_name = "Castle Oztroja", type = 'square', center = { x = 19.7, y = 24.1, z = -25.4 }, size = 2, floor_id = 7, colour = "green" },

                     --Starway again
                      --To the Starway Stairway
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -1.7, y = 0.5, z = 29.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'rect', center = { x = -13.7, y = -1.5, z = 28.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },

                    --Up the 2 flights of stairs to Rhy Eopcan
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.2, y = -1.0, z = 23.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.8, y = -6.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -21.3, y = -11.5, z = -22.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.8, y = -16.0, z = -31.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 23.0, y = -21.2, z = -21.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 31.7, y = -25.2, z = -4.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 13.9, y = -26.0, z = 5.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 3.2, y = -26.0, z = 18.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 2.4, y = -26.0, z = 30.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.7, y = -31.5, z = 21.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.9, y = -36.5, z = -1.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.0, y = -41.5, z = -23.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.5, y = -45.0, z = -30.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.1, y = -47.0, z = -9.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                }
            },
        },
        reward = {
            text = "Rank Points!",
        }
    },

    ["3-2: Written in the Stars"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "3-1: To Each His Own Right"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n \n" ..
                      "W.W marked with a green sqaure, trade 6 crystals to unlock this mission. \n \n" ..
                      "Note: Buy a Rolanberry off the Auction House: [Food -> Ingredients] \n \n" ..
                      "Otherwise,Rolanberries can be purchased for ~120g at Duty Free in Port Jeuno or M&P's Market in Upper Jeuno at your convenience. \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Head to Heavens Tower in Windurst Walls (H-6/H-7) and talk to Zubaba on the second floor. \n \n" ..
                       "She will give you the KI:Charm of Light. \n \n",
                onmob_target = {"Zubaba"},
                trigger_on_event_id = {121, 257},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -3.6, y = 0.2, z = 29.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = -13.7, y = -1.5, z = 28.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -23.2, y = -1.5, z = 21.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.3, y = -6.5, z = -1.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -21.9, y = -11.2, z = -22.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -4.0, y = -15.5, z = -32.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 20.3, y = -20.5, z = -24.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 31.4, y = -25.0, z = -6.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 24.4, y = -26.0, z = 4.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 7.2, y = -25.5, z = 8.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                }
            },
            {
                text = "Step 3: Travel to Inner Horutoto Ruins and click the Gate of Light (G-7). \n \n" ..
                       "Note (REPEAT RUN): If you are repeating, skip this step - return 3 Rusty Daggers to Zubaba instead. \n \n" ..
                       "Enter Lily Tower via East Sarutabaruta (J-7).\n \n" ..
                       "Route A: Via Three Mage Gate (requires BLM + WHM + RDM, or KI:Portal Charm)\n \n " ..
                       "Navigate to (G-8), pass through the Cracked Wall at (G-9) into the west section. \n \n" ..
                       "Head to (E-10) and click the Magical Gate of Horutoto. \n \n" ..
                       "Continue west to the Cracked Door at (D-10) and go through. \n \n" ..
                       "Follow the path to the large room at (H-9) and find the Sealed Portal (Three Mage Gate). \n \n" ..
                       "BLM stands on the dark circle, WHM on the light circle, RDM on the red circle to open it. \n \n" ..
                       "If someone has KI:Portal Charm they can open it solo by clicking the portal. \n" ..
                       "Everyone must pass through quickly - the door cannot be reopened from inside! \n \n" ..
                       "Once in Rose Tower Map 2, find the Gate of Light in the small room at (G-7). Click it for a cutscene. \n \n",
                onmob_target = {"inner-horutoto-ruins-gate-of-light"},
                trigger_on_event_id = {41},
                zone_max_distance = 35,
                visual_zones = {
                    --Arrow into the Ruins (J-7)
                    { zone_name = "East Sarutabaruta", type = 'arrow', center = { x = 357.7, y = -13.3, z = 100.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --survival guide
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = 453.0, y = -8.0, z = 182.3 }, size = 1, floor_id = 1, colour = "green" },

                    -- route
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 380.3, y = 0.0, z = 137.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 379.4, y = 0.5, z = 84.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 342.5, y = 0.5, z = 82.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 347.9, y = 0.5, z = 21.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 323.0, y = -0.0, z = 20.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 305.8, y = -0.1, z = 16.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'rect', center = { x = 300.0, y = -2.0, z = 9.7 }, width = 4.00, height = 4.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 301.9, y = -0.1, z = -17.5 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 281.0, y = 0.4, z = -29.8 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 259.6, y = -0.1, z = -23.3 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 256.8, y = 0.2, z = 19.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 215.6, y = -0.2, z = 21.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 181.2, y = 0.1, z = 18.1 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 174.0, y = 0.2, z = -19.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 139.8, y = -0.1, z = -27.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 121.2, y = 0.0, z = -60.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 86.2, y = 6.9, z = -59.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 60.9, y = 8.1, z = -66.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = 45.8, y = 8.1, z = -114.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -9.3, y = 8.0, z = -125.5 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -30.9, y = 8.0, z = -139.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -48.1, y = 6.6, z = -144.3 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -60.8, y = 8.0, z = -162.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -76.1, y = 8.0, z = -180.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -98.5, y = 8.5, z = -176.3 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -106.0, y = 8.0, z = -140.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -142.8, y = 3.0, z = -140.5 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -157.6, y = 0.0, z = -140.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                    --Magic Gate of Horutoto
                    { zone_name = "Inner Horutoto Ruins", type = 'rect', center = { x = -175.7, y = -2.3, z = -140.0 }, width = 4.00, height = 3.75, floor_id = 2, colour = "cyan", vertical_axis = 'z' },

                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -183.4, y = 0.5, z = -139.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -214.5, y = 0.5, z = -139.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -236.9, y = 0.5, z = -139.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                    --Cracked wall
                    { zone_name = "Inner Horutoto Ruins", type = 'rect', center = { x = -264.3, y = -2.0, z = -140.0 }, width = 4.00, height = 4.00, floor_id = 2, colour = "cyan", vertical_axis = 'z' },

                    -- to the door
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -270.4, y = 0.0, z = -139.9 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -299.5, y = 0.0, z = -139.1 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -300.0, y = -0.0, z = -99.7 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -293.8, y = 0.5, z = -53.0 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -277.5, y = 0.5, z = -47.6 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = -260.0, y = 0.5, z = -29.6 }, size = 4, floor_id = 3, colour = "red" },
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = -263.3, y = 0.5, z = -24.1 }, size = 4, floor_id = 3, colour = "white" },
                    { zone_name = "Inner Horutoto Ruins", type = 'square', center = { x = -256.9, y = 0.5, z = -24.0 }, size = 4, floor_id = 3, colour = "black" },

                    --Sealed Portal
                    { zone_name = "Inner Horutoto Ruins", type = 'rect', center = { x = -260.1, y = -2.3, z = -15.6 }, width = 4.50, height = 4.25, floor_id = 3, colour = "cyan", vertical_axis = 'ns' },

                    -- beyond
                        { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -260.4, y = 0.0, z = -6.1 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -259.8, y = -0.0, z = 18.8 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -269.0, y = 0.0, z = 28.4 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -293.2, y = 0.0, z = 36.3 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -300.1, y = -0.0, z = 77.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },

                    --to gate of light
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -300.0, y = 0.0, z = 89.2 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -301.2, y = 0.5, z = 116.9 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Inner Horutoto Ruins", type = 'arrow', center = { x = -304.6, y = 0.5, z = 140.1 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                },
                --route_to = "Inner Horutoto Ruins",
                images = {
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 2,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 3,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Inner Horutoto Ruins",
                        floor_id  = 4,
                        width     = 512,
                        height    = 512,
                        state     = 3,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Warp out, and return to Zubaba in Heavens Tower to complete the mission! \n \n" ..
                       "Note: To receive KI:Portal Charm (lets you open the Three Mage Gate solo in future) trade a Rolanberry to Kupipi in the same room. \n \n",
                onmob_target = {"Zubaba"},
                items_needed = {
                    { item = "Rolanberry", quantity = 1, optional = true },
                },
                trigger_on_event_id = {135, 151},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -3.6, y = 0.2, z = 29.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = -13.7, y = -1.5, z = 28.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -23.2, y = -1.5, z = 21.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.3, y = -6.5, z = -1.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -21.9, y = -11.2, z = -22.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -4.0, y = -15.5, z = -32.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 20.3, y = -20.5, z = -24.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 31.4, y = -25.0, z = -6.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 24.4, y = -26.0, z = 4.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = 7.2, y = -25.5, z = 8.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                }
            },
        },
        reward = {
            text = "Rank Points! Trade a Rolanberry to Kupipi for KI:Portal Charm.",
        }
    },

    ["3-3: A New Journey"] = {
        prerequisites = {
            {category = "Missions", subfile = "Windurst", name = "3-2: Written in the Stars"},
        },
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard. They can be found at the entrance gates to the city. \n" ..
                       "You will immediately receive the KI:Star Crested Summons upon accepting. \n \n" ..
                       "Note: Trade 6 more crystals to the W.W to be eligible for this mission! \n \n",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                visual_zones = {
                    --Windurst Woods
                    { zone_name = "Windurst Woods", type = 'square', center = { x = 107.0, y = -5.0, z = -49.1 }, size = 1, floor_id = 0, colour = "green" },
                    --Port Windurst
                    { zone_name = "Port Windurst", type = 'square', center = { x = -227.2, y = -8.0, z = 209.3 }, size = 1, floor_id = 0, colour = "green" },
                    --Windurst Waters
                    { zone_name = "Windurst Waters North", type = 'square', center = { x = -30.7, y = -4.9, z = 226.5 }, size = 1, floor_id = 1, colour = "green" },
                },
                images = {
                    {
                        zone_name = "Windurst Waters",
                        floor_id  = 1,
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Port Windurst",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        zone_name = "Windurst Woods",
                        width     = 512,
                        height    = 512,
                        state     = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Head to Heavens Tower in Windurst Walls (H-6/H-7) and climb to the top floor. \n" ..
                       "Click on the Vestal Chamber Door for a cutscene with the Star Sibyl. \n" ..
                       "You will receive the KI:Letter to the Ambassador. \n \n",
                onmob_target = {"Door: Vestal-chamber"},
                trigger_on_event_id = {153},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {

                    --enter Clerical Chamber
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 0.3, y = 0.8, z = 13.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },

                    --To the Starway Stairway
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -1.7, y = 0.5, z = 29.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'rect', center = { x = -13.7, y = -1.5, z = 28.9 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'z' },

                    --Up the 2 flights of stairs to Rhy Eopcan
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.2, y = -1.0, z = 23.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.8, y = -6.5, z = -0.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -21.3, y = -11.5, z = -22.4 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.8, y = -16.0, z = -31.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 23.0, y = -21.2, z = -21.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 31.7, y = -25.2, z = -4.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 13.9, y = -26.0, z = 5.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 3.2, y = -26.0, z = 18.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 2.4, y = -26.0, z = 30.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.7, y = -31.5, z = 21.2 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -30.9, y = -36.5, z = -1.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -22.0, y = -41.5, z = -23.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.5, y = -45.0, z = -30.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.1, y = -47.0, z = -9.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 0.1, y = -47.0, z = 13.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Heavens Tower", type = 'arrow', center = { x = 0.2, y = -49.0, z = 28.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 3: Travel to Ru'Lude Gardens in Jeuno and speak with Pakh Jatalfih (I-9) at the Embassy of Windurst. \n" ..
                       "Tip: Unity Warp to Batallia Downs (Level 125 category) drops you right outside Upper Jeuno. \n \n",
                onmob_target = {"Pakh Jatalfih"},
                trigger_on_event_id = {43},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 25,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 0.1, y = 3.0, z = -4.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = -0.4, y = 9.0, z = -36.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 25.4, y = 7.4, z = -36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
            },
            {
                text = "Step 4: Travel to Qufim Island and enter Lower Delkfutt's Tower (F-6). \n" ..
                       "Note: If you already have a Delkfutt Key or KI:Delkfutt Key from another nation, skip to Step 8. \n" ..
                       "Tip: Unity Warp/Outpost Warp/Home Point to Qufim Island for quickness. \n \n",
                zone_trigger = "Lower Delkfutt's Tower",
                route_to = "Qufim Island",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Navigate Delkfutt's Tower to Floor 10 - Upper Delkfutt's Tower. \n" ..
                       "Recommended: Level 40+ with Sneak and Invisible, or level 50+. \n \n" ..
                       "1st Floor : Go to (E-6/F-6) Stairs (NW). \n" ..
                       "2nd Floor : (I-9/J-9) Stairs - avoid (H-9). \n" ..
                       "3rd Floor : (G-6) Teleporter. \n" ..
                       "4th Floor : (I-6) Stairs - long way around. \n" ..
                       "5th Floor : (H-9) Stairs. \n" ..
                       "6th Floor : (J-10) Teleporter. \n" ..
                       "7th Floor : (F-6/F-7) Stairs (NW). \n" ..
                       "8th Floor : (1st pass) (I-6) Stairs. \n" ..
                       "9th Floor : (1st pass) (J-10) - do NOT drop at (H-10). \n" ..
                       "8th Floor : (2nd pass) (F-9/G-10) -> 9th Floor. \n" ..
                       "9th Floor : (2nd pass) (F-6) -> 10th Floor Teleport. \n \n",
                zone_trigger = "Upper Delkfutt's Tower",
                zone_max_distance = 35,
                visual_zones = {
                    --Survival Guide
                    { zone_name = "Lower Delkfutt's Tower", type = 'square', center = { x = 464.0, y = 0.0, z = -51.0 }, size = 1, floor_id = 1, colour = "green" },
                    --1st floor
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 460.7, y = 0.0, z = -59.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 529.3, y = 0.1, z = -76.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 542.3, y = 0.0, z = -51.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 569.9, y = 0.1, z = -36.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.5, y = 0.0, z = -8.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.3, y = 0.0, z = 20.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 577.5, y = 0.0, z = 67.0 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 548.1, y = -0.0, z = 95.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 515.4, y = 0.0, z = 130.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 460.2, y = 0.0, z = 139.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 412.8, y = 0.0, z = 139.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 396.1, y = 0.6, z = 118.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 394.4, y = 0.6, z = 92.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 391.1, y = 0.5, z = 74.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 378.5, y = 0.4, z = 73.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 350.8, y = -7.7, z = 82.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --2nd floor
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 377.1, y = -15.9, z = 95.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 405.5, y = -15.5, z = 100.1 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 459.3, y = -16.0, z = 109.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 474.1, y = -16.0, z = 140.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 514.6, y = -16.0, z = 131.3 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 538.5, y = -16.0, z = 107.3 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 558.3, y = -16.0, z = 99.6 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 578.9, y = -16.0, z = 94.0 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.7, y = -16.0, z = 61.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 580.6, y = -16.0, z = 18.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 569.8, y = -16.0, z = -58.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 528.4, y = -16.0, z = -50.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 516.1, y = -27.0, z = -50.3 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },

                    --1st teleporter
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 529.5, y = -32.0, z = -36.5 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 539.0, y = -32.0, z = -11.8 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 540.1, y = -31.6, z = 20.9 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 530.5, y = -32.0, z = 71.9 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 472.9, y = -31.6, z = 69.8 }, size = 4, direction = "sw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 440.6, y = -31.5, z = 44.6 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 409.9, y = -31.4, z = 59.7 }, size = 4, direction = "nw", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 395.1, y = -31.5, z = 75.1 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 403.0, y = -33.8, z = 82.5 }, size = 4, direction = "ne", floor_id = 3, colour = "yellow" },

                    --middle delkfutts tower
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -41.6, y = -47.9, z = 70.3 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -59.1, y = -48.0, z = 55.9 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -48.5, y = -48.0, z = 21.4 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -19.8, y = -48.0, z = 20.0 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -32.5, y = -47.7, z = -37.1 }, size = 4, direction = "down", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -21.9, y = -48.0, z = -59.6 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 20.5, y = -47.6, z = -59.9 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 73.4, y = -48.0, z = -60.9 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.3, y = -48.0, z = -51.9 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 94.8, y = -48.0, z = -19.5 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 59.0, y = -48.0, z = -19.5 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 64.3, y = -48.0, z = 20.3 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.3, y = -47.6, z = 27.2 }, size = 4, direction = "up", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 96.0, y = -48.0, z = 70.8 }, size = 4, direction = "left", floor_id = 4, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 80.6, y = -56.2, z = 88.8 }, size = 4, direction = "right", floor_id = 4, colour = "yellow" },

                    -- middle delkfutts 2nd floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 71.7, y = -63.7, z = 62.2 }, size = 4, direction = "left", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.2, y = -64.0, z = 60.6 }, size = 4, direction = "left", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -25.7, y = -64.0, z = 60.4 }, size = 4, direction = "nw", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -48.5, y = -63.8, z = 76.5 }, size = 4, direction = "sw", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -60.0, y = -64.0, z = 41.0 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -59.7, y = -64.0, z = 13.7 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -29.4, y = -64.0, z = -6.0 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -20.3, y = -64.0, z = -28.7 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -8.1, y = -70.0, z = -60.1 }, size = 4, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.9, y = -72.0, z = -61.3 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 19.9, y = -76.6, z = -38.1 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },

                    --middle delkfutts 3rd floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 22.8, y = -80.0, z = -20.1 }, size = 4, direction = "ne", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 53.0, y = -80.0, z = 8.5 }, size = 4, direction = "ne", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 71.6, y = -80.0, z = 20.3 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 99.9, y = -79.6, z = 18.6 }, size = 4, direction = "down", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 100.9, y = -80.0, z = -23.1 }, size = 4, direction = "sw", floor_id = 6, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = 76.4, y = -79.5, z = -36.7 }, size = 4, direction = "se", floor_id = 6, colour = "yellow" },

                    --middle delkfutts tower 4th floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -364.1, y = -95.6, z = -46.4 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -399.2, y = -95.4, z = -18.2 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -439.9, y = -95.4, z = -15.6 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -464.9, y = -95.4, z = 23.9 }, size = 4, direction = "nw", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -485.5, y = -95.5, z = 44.1 }, size = 4, direction = "up", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -488.4, y = -95.7, z = 59.6 }, size = 4, direction = "ne", floor_id = 7, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -485.6, y = -105.2, z = 89.2 }, size = 4, direction = "sw", floor_id = 7, colour = "yellow" },

                    --middle delkfutts tower 5th floor
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -471.7, y = -111.4, z = 64.3 }, size = 4, direction = "right", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -430.5, y = -111.4, z = 49.5 }, size = 4, direction = "right", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -385.1, y = -111.4, z = 45.0 }, size = 4, direction = "ne", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -366.9, y = -111.4, z = 61.7 }, size = 4, direction = "ne", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -368.1, y = -121.7, z = 89.2 }, size = 4, direction = "down", floor_id = 8, colour = "yellow" },

                    -- back down
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -350.5, y = -128.0, z = 74.5 }, size = 4, direction = "se", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -339.6, y = -128.0, z = 40.0 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -341.0, y = -128.0, z = -4.4 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -348.7, y = -128.0, z = -43.7 }, size = 4, direction = "sw", floor_id = 9, colour = "yellow" },

                    -- back up
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -354.7, y = -118.7, z = -31.9 }, size = 4, direction = "se", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -364.2, y = -111.9, z = -49.3 }, size = 4, direction = "sw", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -386.5, y = -112.0, z = -60.0 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -419.7, y = -111.6, z = -63.8 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -450.2, y = -112.0, z = -59.8 }, size = 4, direction = "left", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -470.3, y = -112.0, z = -50.6 }, size = 4, direction = "up", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -489.5, y = -118.7, z = -34.8 }, size = 4, direction = "down", floor_id = 8, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'square', center = { x = -419.9, y = -111.6, z = -59.9 }, size = 4, floor_id = 8, colour = "red" },

                    -- teleporter
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -470.0, y = -128.0, z = -35.3 }, size = 4, direction = "ne", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -449.7, y = -128.0, z = -5.2 }, size = 4, direction = "up", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -444.8, y = -127.5, z = 35.4 }, size = 4, direction = "ne", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -419.6, y = -128.0, z = 53.8 }, size = 4, direction = "up", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -421.2, y = -128.0, z = 85.4 }, size = 4, direction = "nw", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -433.8, y = -127.9, z = 100.5 }, size = 4, direction = "left", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -472.4, y = -128.0, z = 95.3 }, size = 4, direction = "down", floor_id = 9, colour = "yellow" },
                    { zone_name = "Middle Delkfutt's Tower", type = 'arrow', center = { x = -477.5, y = -127.4, z = 77.9 }, size = 4, direction = "nw", floor_id = 9, colour = "yellow" },

                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 7,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 8,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 9,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Kill Porphyrion at (H-8) on Floor 10 to obtain a Delkfutt Key. \n \n" ..
                       "Porphyrion drops 6 keys and respawns in ~10 minutes. \n \n" ..
                       "Note: Uses Eagle Eye Shot - be careful! Recommended level 50+. \n" ..
                       "After defeating it, click the ??? that appears to receive the KI:Delkfutt Key. \n \n",
                items_needed = {"Delkfutt Key"},
                trigger_on_item_obtain = {"Delkfutt Key"},
                onmob_enemy = {"Porphyrion"},
                onmob_enemy_size = 4,
                zone_max_distance = 35,
                visual_zones = {
                    --upper delk
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -354.8, y = -144.0, z = 69.9 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -300.8, y = -144.0, z = 59.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'rect', center = { x = -291.6, y = -146.5, z = 51.8 }, width = 5.75, height = 5.00, floor_id = 1, colour = "cyan", vertical_axis = 'nw' },
                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Trade the Delkfutt Key to the circular Elevator at (H-8) in the same room. \n" ..
                       "This will take you down a winding stairwell to the basement. \n \n",
                trigger_on_event_id = {1, 6},
                onmob_target = {"Elevator"},
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 7,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: In Lower Delkfutt's Tower, go to (E-8) on floor 1 and enter the basement through the Cermet Door. \n" ..
                       "Use your Delkfutt Key (or KI:Delkfutt Key) to open it. \n" ..
                       "Cross the large basement room and click the Cermet Door at (L-7) for a cutscene. \n \n",
                onmob_target = {"lower-delkfutt-tower-cermet-door-l7"},
                trigger_on_event_id = {2,"Lower Delkfutt's Tower"},
                zone_max_distance = 20,
                visual_zones = {
                    --Down the tower 4 id
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -309.7, y = -116.1, z = 21.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = -290.6, y = -106.7, z = 24.8 }, size = 4, direction = "nw", floor_id = 4, colour = "yellow" },

                    --5
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 9.7, y = -100.7, z = 23.3 }, size = 4, direction = "down", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 29.6, y = -93.5, z = 13.3 }, size = 4, direction = "up", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 10.5, y = -82.7, z = 15.1 }, size = 4, direction = "se", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 13.9, y = -65.2, z = 9.6 }, size = 4, direction = "right", floor_id = 5, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 25.8, y = -46.5, z = 11.7 }, size = 4, direction = "ne", floor_id = 5, colour = "yellow" },

                    --6
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 250.1, y = -37.5, z = 26.6 }, size = 4, direction = "down", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 264.3, y = -25.0, z = 29.9 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 262.9, y = -8.7, z = 29.4 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 257.8, y = 8.5, z = 29.9 }, size = 4, direction = "left", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 272.9, y = 19.1, z = 20.6 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'arrow', center = { x = 313.4, y = 16.0, z = 19.7 }, size = 4, direction = "right", floor_id = 6, colour = "yellow" },
                    { zone_name = "Upper Delkfutt's Tower", type = 'rect', center = { x = 320.0, y = 13.5, z = 20.0 }, width = 5.50, height = 5.00, floor_id = 6, colour = "cyan", vertical_axis = 'z' },

                    -- final door for mission
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 525.8, y = 16.0, z = 20.0 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 541.1, y = 16.0, z = 19.1 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 558.8, y = 16.6, z = 33.3 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 605.4, y = 16.0, z = 50.1 }, size = 4, direction = "ne", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 619.3, y = 16.0, z = 60.5 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 637.3, y = 16.0, z = 60.2 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                    { zone_name = "Lower Delkfutt's Tower", type = 'rect', center = { x = 640.5, y = 13.5, z = 60.0 }, width = 5.25, height = 5.00, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 8,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 9: Return to Pakh Jatalfih (I-9) at the Embassy of Windurst in Ru'Lude Gardens. \n \n",
                onmob_target = {"Pakh Jatalfih"},
                trigger_on_event_id = {141},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 11.0, y = 9.0, z = -35.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 25.4, y = 7.4, z = -36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
            },
            {
                text = "Step 10: Click on the Embassy door next to Pakh Jatalfih (I-9) in Ru'Lude Gardens to complete the mission! \n \n",
                onmob_target = {"Door: Windurstian Embassy"},
                trigger_on_event_id = {40},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 36.1, y = 7.5, z = -26.1 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                images = {
                    {
                        width     = 512,
                        height    = 512,
                        state     = 10,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 4, 5000g!"
        }
    },

    ["4-1: Magicite"] = {
        prerequisites = {
            {category = "Quests", subfile = "Lower Jeuno", name = "Tenshodo Membership"},
        },
        steps = {
            -- PREREQUISITES
            {
                text = "Step 1: This mission requires Rank 4. Ensure your Rank Points are high (nearly or completely full) by completing repeatable missions or trading 4 crystals to a Conquest Overseer. \n \n" ..
                       "Morlepiche (H-10) in upper Ru'Lude Gardens accepts crystals. \n \n" ..
                       "Go to the Windurst Embassy and speak with Pakh Jatalfih (I-9) to start the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards.",
                onmob_target = {"Pakh Jatalfih"},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'square', center = { x = -4.9, y = 0.0, z = -79.3 }, size = 1, floor_id = 0, colour = "green" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 2.7, y = 9.0, z = -36.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 25.4, y = 7.4, z = -36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                trigger_on_event_id = {50},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },

            -- MISSION START
            {
                text = "Step 2: Next check the Windurst Embassy door at (I-9). \n \n" ..
                       "You will receive KI:Archducal Audience Permit.",
                onmob_target = {"Door: Windurstian Embassy"},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 36.1, y = 7.5, z = -26.1 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = {131},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: In Ru'Lude Gardens, check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Letter to Aldo.",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {128},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Travel to Lower Jeuno and talk to Aldo (J-8) inside Neptune's Spire Inn. \n \n" ..
                       "You will receive KI:Silver Bell. \n \n" ..
                       "NOTE: To access Tenshodo HQ, you need KI:Tenshodo Member's Card from the quest 'Tenshodo Membership' OR trade a Tenshodo Invite to Ghebi Damomohe (I-7). \n \n" ..
                       "You can buy a Tenshodo Invite off the Auction House in the Others > Misc.1 section \n \n" ..
                       "Once you have a Tenshodo Invite simply trade it to Ghebi Damomohe (I-7) - she is behind the counter at the entrance! \n" ..
                       "If on CoP mission 'A Vessel Without a Captain', that scene appears first - talk to Aldo twice. \n \n",
                onmob_target = {"Aldo"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.3, y = 1.9, z = -57.8 }, width = 2.25, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 18.6, y = 2.3, z = -51.9 }, width = 2.50, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
                trigger_on_event_id = {152},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            -- YAGUDO TORCH
            {
                text = "Step 5: Talk to Paya-Sabya (I-8) in Upper Jeuno. \n" ..
                "Notes: Home Point #3 closest teleport. \n \n",
                onmob_target = {"Paya-Sabya"},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "I-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {80},
                keyitems_needed = {20,21,46,47},
            },
            {
                text = "Step 6: Talk to Muckvix (H-9) teleport to Home Point#1 in Lower Jeuno and head inside Muckvix's Junk Shop. \n \n" ..
                       "You will receive KI:Yagudo Torch. \n \n",
                onmob_target = {"Muckvix"},
                zone_max_distance = 35,
                route_to = "Lower Jeuno",
                visual_zones = {
                        { zone_name = "Lower Jeuno", type = 'arrow', center = { x = -65.9, y = 6.0, z = -100.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Lower Jeuno", type = 'rect', center = { x = -56.7, y = 4.3, z = -109.7 }, width = 2.25, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'nw' },
                },
                destination_highlight = {position = "H-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {184},
            },

            -- CREST OF DAVOI
            {
                text = "Step 7: Talk to Baudin at (G-7) southwest corner in Upper Jeuno. \n \n",
                onmob_target = {"Baudin"},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {174},
            },
            {
                text = "Step 8: Obtain Coeurl Meat by: \n \n" ..
                       "Purchasing from Auction House: Food > Ingredients section! \n \n" ..
                       "Defeating Coeurls (drops from all Coeurls, including in Sauromugue Champaign/Meriphataud Mountains) \n \n",
                items_needed = {
                    "Coeurl Meat"
                },
                trigger_on_item_obtain = {"Coeurl Meat"},
                route_to = "Sauromugue Champaign",
                onmob_enemy = {"Champaign Coeurl"},
                destination_highlight = {
                    {position = "J-6", offsetX = 16, offsetY = 16},
                    {position = "K-10", offsetX = 16, offsetY = 16},
                }
            },
            {
                text = "Step 9: Trade Coeurl Meat to Baudin (G-7) in Upper Jeuno. \n \n" ..
                       "You will receive KI:Crest of Davoi. (Completes quest 'Crest of Davoi') \n \n",
                onmob_target = {"Baudin"},
                trigger_on_event_id = {171},
                route_to = "Upper Jeuno",
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },

            -- BEADEAUX KEY ITEMS
            {
                text = "Step 10: Talk to Sattal-Mansal (J-8) in Lower Jeuno (outside Aldo's room in basement of Neptune's Spire). \n \n" ..
                       "This initiates quests: 'Mysteries of Beadeaux I' and 'Mysteries of Beadeaux II'. \n \n" ..
                       "He will request: Quadav Charm (Rare/Ex) and Quadav Augury Shell (Rare). \n \n",
                onmob_target = {"Sattal-Mansal"},
                route_to = "Lower Jeuno",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {89},
            },
            {
                text = "Step 11: Travel to Beadeaux. \n \n" ..
                       "Fastest route: Survival Guide to Beadeaux directly, or Outpost to Passhow Marshlands. \n \n",
                zone_trigger = "Beadeaux",
                route_to = "Pashhow Marshlands",
                destination_highlight = {position = "K-11", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 12: In Beadeaux Map 1, head to ramp at (H-7) to enter Map 2. \n \n" ..
                       "In Map 2, examine 'The Mute' at (G-7) to receive Silence effect. \n \n" ..
                       "This allows you to pass 'The Afflictor' without being Cursed. \n \n",
                trigger_on_buff = 6,
                zone_name = "Beadeaux",
                onmob_target = {"The Mute1"},
                zone_max_distance = 35,
                visual_zones = {
                        -- survival guide
                        { zone_name = "Beadeaux", type = 'square', center = { x = -264.0, y = 1.6, z = 107.0 }, size = 1, floor_id = 1, colour = "green" },

                        -- to h5 map 1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.2, y = 0.7, z = 96.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -181.2, y = 0.7, z = 101.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -167.6, y = 1.0, z = 140.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -118.7, y = 1.0, z = 135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.8, y = 1.0, z = 139.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = 1.4, z = 97.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                        -- to mute1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -58.7, y = 22.4, z = 90.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -62.3, y = 24.1, z = 63.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -95.8, y = 24.2, z = 62.4 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -99.3, y = 24.1, z = 86.1 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 13: Whilst Silenced, you can walk through 'The Afflictor' to avoid being CURSED! \n \n" ..
                       "Make your way to (F-8) and back to Map 1. \n \n" ..
                       "Now go to (E-10) and up the ramp to the 2nd Level on Map 1. \n \n",
                trigger_zones = {
                    { type = 'square', center = {  x = -259.9, y = 1, z = -137 }, size = 3  }
                },
                zone_max_distance = 35,
                visual_zones = {
                    -- to ramp 1
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -100.8, y = 24.2, z = 95.4 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -91.4, y = 23.9, z = 59.7 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -99.0, y = 24.1, z = 42.5 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -103.0, y = 24.0, z = 23.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -140.4, y = 24.3, z = 26.3 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -156.7, y = 24.1, z = 59.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -199.1, y = 24.2, z = 59.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -203.4, y = 17.9, z = 20.4 }, size = 4, direction = "ne", floor_id = 2, colour = "yellow" },

                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.6, y = 1.0, z = 13.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -220.3, y = 1.0, z = -39.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -210.4, y = 0.8, z = -65.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -175.7, y = 1.0, z = -67.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -176.2, y = 1.2, z = -90.3 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -204.9, y = 1.0, z = -117.9 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Beadeaux", type = 'arrow', center = { x = -231.5, y = 1.0, z = -139.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                },
                onmob_target = {"Ramp 1"},
                zone = "Beadeaux",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 14: Defeat De'Vyu Headhunter (I-9) to obtain Quadav Charm (drops up to 4). \n \n" ..
                       "Defeat Go'Bhu Gascon (F-6) to obtain Quadav Augury Shell (drops up to 4). \n \n" ..
                       "Notes: Stay on the 2nd level and run around to the shown coordinates - follow the arrows to each boss! \n \n",
                require_all_items = true,
                zone_max_distance = 35,
                visual_zones = {
                        --up ramp to 1st boss
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -262.8, y = -0.4, z = -134.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -275.3, y = -3.4, z = -128.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -280.2, y = -3.0, z = -183.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -279.6, y = -3.0, z = -216.7 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -244.3, y = -3.0, z = -234.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -171.5, y = -3.0, z = -224.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -146.8, y = -3.0, z = -211.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -114.0, y = -3.1, z = -206.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -76.9, y = -3.3, z = -197.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -44.8, y = -3.3, z = -196.9 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = 5.4, y = -3.2, z = -158.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },

                        -- continue to 2nd boss
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = 14.4, y = -3.1, z = -120.5 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -23.8, y = -3.1, z = -78.2 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -67.8, y = -3.2, z = -45.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -106.4, y = -3.4, z = -47.0 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -147.7, y = -3.2, z = -46.4 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -185.6, y = -3.0, z = -32.8 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -187.4, y = -3.0, z = 8.3 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -179.3, y = -3.0, z = 30.5 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -121.3, y = -3.3, z = 36.7 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -87.1, y = -3.0, z = 52.2 }, size = 4, direction = "ne", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -59.5, y = -3.2, z = 81.5 }, size = 4, direction = "ne", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -37.6, y = -3.4, z = 109.4 }, size = 4, direction = "up", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -39.4, y = -3.0, z = 144.4 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = -3.2, z = 162.7 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -87.0, y = -3.4, z = 162.1 }, size = 4, direction = "nw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -114.1, y = -3.0, z = 171.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -157.6, y = -3.3, z = 162.5 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -193.6, y = -3.4, z = 158.3 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                },
                items_needed = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                trigger_on_item_obtain = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                onmob_enemy = {"De'Vyu Headhunter", "Go'Bhu Gascon"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                             { position = "I-9", offsetX = 16, offsetY = 16, label = "D", color = "yellow" },
                             { position = "F-6", offsetX = 16, offsetY = 16, label = "G", color = "cyan" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 15: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                       "Trade Quadav Charm -> receive KI:Coruscant Rosary (completes 'Mysteries of Beadeaux I'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {91},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
            },
            {
                text = "Step 16: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                        "Trade Quadav Augury Shell -> receive KI:Black Matinee Necklace (completes 'Mysteries of Beadeaux II'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {92},
                route_to = "Lower Jeuno",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 13.8, y = -1.5, z = -2.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw',  rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 38.1, y = -1.5, z = -16.6 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'nw', rotation = 15 },
                    { zone_name = "Lower Jeuno", type = 'rect', center = { x = 34.4, y = 2.4, z = -36.4 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ne', rotation = 15 },
                },
            },
            -- DAVOI - OPTISTONE
            {
                text = "Step 17: Travel to Davoi! \n \n" ..
                       "Fastest route: Unity Warp to Jugner Forest, go to (G-12). OR Outpost to Norvallen > Davoi. \n \n",
                route_to = "Jugner Forest",
                destination_highlight = {position = "G-12", offsetX = 16, offsetY = 16},
                zone_trigger = "Davoi",
            },
            {
                text = "Step 18: Navigate to Wall of Dark Arts (G-7) and click! \n \n" ..
                       "You will need the KI:Crest of Davoi to get through. \n \n" ..
                       "Click Yes... Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                onmob_target = {"Wall of Dark Arts"},
                trigger_on_event_id = 54,
                zone_max_distance = 35,
                visual_zones = {
                    --surivial guide
                    { zone_name = "Davoi", type = 'square', center = { x = 223.0, y = -0.3, z = -10.0 }, size = 1, floor_id = 0, colour = "green" },

                    -- to wall of dark arts
                    { zone_name = "Davoi", type = 'arrow', center = { x = 216.3, y = -0.5, z = -13.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 218.7, y = -0.0, z = -43.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 214.9, y = 4.0, z = -76.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 156.6, y = 4.0, z = -77.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 139.6, y = 0.0, z = -41.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 134.8, y = -0.1, z = -19.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 76.2, y = -0.2, z = -18.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = 30.3, y = -0.4, z = -25.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -5.6, y = -0.0, z = -22.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -20.5, y = -0.2, z = -20.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Davoi", type = 'arrow', center = { x = -21.9, y = 0.7, z = -48.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 18,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 19: Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 19,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 20: In Monastic Cavern, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Optistone. \n \n",
                keyitems_needed = {14},
                trigger_on_keyitem_obtain = {14},
                onmob_target = {"Magicite-Monastic"},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Monastic Cavern", type = 'arrow', center = { x = -152.0, y = -8.5, z = -52.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 20,
                        zone_name = "Monastic Cavern",
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- BEADEAUX - AURASTONE
            {
                text = "Step 21: Return to Beadeaux! \n \n" ..
                       "Use the Survival Guide or Outpost [Derfland] in Pashhow Marshlands to get there! \n \n",
                zone_trigger = "Beadeaux",
                route_to = "Pashhow Marshlands",
                destination_highlight = {position = "K-11", offsetX = 16, offsetY = 16},
            },
             {
                text = "Step 22: Map 1 go to (H-7). \n \n" ..
                       "Navigate to Qulun Dome entrance at (I-7). \n \n",
                zone_trigger = "Qulun Dome",
                zone_max_distance = 35,
                visual_zones = {
                        -- survival guide
                        { zone_name = "Beadeaux", type = 'square', center = { x = -264.0, y = 1.6, z = 107.0 }, size = 1, floor_id = 1, colour = "green" },

                        -- to h5 map 1
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -216.2, y = 0.7, z = 96.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -181.2, y = 0.7, z = 101.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -167.6, y = 1.0, z = 140.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -118.7, y = 1.0, z = 135.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.8, y = 1.0, z = 139.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -61.3, y = 1.4, z = 97.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                        { zone_name = "Beadeaux", type = 'arrow', center = { x = -59.2, y = 23.8, z = 62.9 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 22,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 22,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 23: In Qulun Dome, check the Door (G-8). \n \n" ..
                       "Open the door - you need: KI:Silver Bell, KI:Coruscant Rosary, KI:Black Matinee Necklace. \n \n" ..
                       "Might have to click it twice, till an option: 'Investigate the door?' -  Click Yes! \n \n",
                onmob_target = {"Qulun Door 1"},
                trigger_on_talk = {" shine brightly!"},
                zone = "Qulun Dome",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 23,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 24: In Qulun Dome, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Aurastone. \n \n",
                keyitems_needed = {15},
                trigger_on_keyitem_obtain = {15},
                onmob_target = {"Magicite-Qulun"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 24,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- CASTLE OZTROJA - ORASTONE
            {
                text = "Step 25: Travel to Castle Oztroja. \n \n"..
                       "Fastest route: Survival Guide to Aragoneu > Castle Oztroja OR outpost to Meriphataud Mountains! \n \n",
                route_to = "Meriphataud Mountains",
                destination_highlight = {position = "L-8", offsetX = 16, offsetY = 16},
                zone_trigger = "Castle Oztroja",
            },
            {
                text = "Step 26: Castle Oztroja Route: \n \n" ..
                       "Navigate through: \n \n" ..
                       "Map 1 (I-8)    -> \n" ..
                       "Map 2 (G-7)    -> \n" ..
                       "Map 6 (I-7)    -> \n" ..
                       "Map 7 (H-9/10) -> Yagudo Torch! \n \n" ..
                       "Notes: One lever opens door, other triggers trapdoor. Correct lever changes each Vana'diel day. \n \n" ..
                       "Stand on trapdoor to use the lever. To avoid trap: Click lever and then RUN off trapdoor immediately. \n \n" ..
                       "If you fall follow the map and click the other lever until you get through! \n \n",
                trigger_on_event_id = {11},
                onmob_target = {"castle-oztroja-handle-1-i8","castle-oztroja-handle-2-i8"},
                zone_name = "Castle Oztroja",
                zone_max_distance = 35,
                visual_zones = {
                    --map 1
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -216.0, y = 0.3, z = -18.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.6, y = 0.3, z = -12.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -178.7, y = 0.3, z = 24.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.1, y = 0.3, z = 56.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -139.7, y = 0.3, z = 58.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -141.6, y = 0.1, z = 16.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -95.5, y = 0.2, z = 18.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -56.6, y = 0.3, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -20.9, y = 0.3, z = 11.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -18.5, y = 0.3, z = -17.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },


                    -- map 2
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 19.7, y = 0.3, z = 17.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 59.2, y = -4.0, z = 19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 100.3, y = -12.0, z = 19.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 97.7, y = -15.8, z = -19.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 61.8, y = -15.8, z = -20.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 20.7, y = -15.8, z = -22.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 22.1, y = -15.8, z = 36.5 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = 13.0, y = -15.8, z = 59.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -31.8, y = -15.7, z = 59.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -71.0, y = -15.8, z = 60.3 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.4, y = -15.8, z = 48.1 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -101.7, y = -16.0, z = 27.6 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -150.9, y = -15.8, z = 20.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -180.8, y = -15.8, z = 21.8 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -176.5, y = -15.7, z = 61.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.3, y = -15.8, z = 65.8 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -140.4, y = -15.7, z = 101.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                    --map 6
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -173.4, y = -16.1, z = 103.4 }, size = 4, direction = "up", floor_id = 6, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.0, y = -16.0, z = 157.9 }, size = 4, direction = "up", floor_id = 6, colour = "yellow" },

                    --map 7
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -169.9, y = -15.8, z = 219.2 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -124.7, y = -15.8, z = 219.6 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.6, y = -12.0, z = 219.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = -1.0, z = 167.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.0, y = 4.0, z = 139.4 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.9, y = 12.0, z = 138.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -59.0, y = 24.3, z = 72.1 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -63.2, y = 24.3, z = 23.9 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -123.2, y = 24.3, z = 20.6 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -175.9, y = 24.3, z = 20.2 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -179.1, y = 24.3, z = -24.9 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -181.4, y = 24.3, z = -60.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -172.4, y = 24.3, z = -98.7 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -119.9, y = 24.3, z = -99.1 }, size = 4, direction = "right", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -99.7, y = 24.3, z = -99.8 }, size = 4, direction = "down", floor_id = 7, colour = "yellow" },

                    --map 7 torches
                    {
                        zone_name = "Castle Oztroja",
                        type = 'square',
                        center = { x = -102.9, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15
                    },
                    {
                        zone_name = "Castle Oztroja",
                        type = 'square',
                        center = { x = -97.3, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15
                    },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 1,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 2,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 5,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 6,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 27: Now proceed to the Altar Room! \n \n" ..
                       "You'll have to go through another Brass Door! \n \n",
                zone_trigger = "Altar Room",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -102.3, y = 24.3, z = -137.3 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -147.9, y = 24.3, z = -139.7 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },

                    --brass door
                    { zone_name = "Castle Oztroja", type = 'rect', center = { x = -155.2, y = 20.4, z = -140.0 }, width = 6.25, height = 7.75, floor_id = 7, colour = "cyan", vertical_axis = 'z' },

                    -- keep runnin
                    { zone_name = "Castle Oztroja", type = 'arrow', center = { x = -160.6, y = 24.3, z = -140.2 }, size = 4, direction = "left", floor_id = 7, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 27,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 28: In Altar Room, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Orastone. \n \n" ..
                       "NOTE: If you spoke to Paya-Sabya and Muckvix, you get Fickblix cutscene. If repeating mission and skipped them, cutscene is skipped. \n \n",
                keyitems_needed = {16},
                trigger_on_keyitem_obtain = {16},
                onmob_target = {"Magicite-Altar"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 28,
                        zone_name = "Altar Room",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- MISSION COMPLETION
            {
                text = "Step 29: After obtaining all THREE Magicites, return to Ru'Lude Gardens (Home Point #1) and check the Audience Chamber door (_6r9) at (H-6). \n \n" ..
                       "You will receive KI:Airship Pass (or 20,000 gil if you already have one). \n \n" ..
                       "You will also receive title: 'Have Wings, Will Fly'. \n \n",
                onmob_target = {"_6r9"},
                trigger_on_event_id = {60},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 30: Talk to Pakh_Jatalfih (I-9) at the Windurst Embassy in Ru'Lude Gardens to complete the mission. \n \n" ..
                       "Rewards: Rank 5, KI:Message to Jeuno, 10,000 gil. \n \n" ..
                       "Mission 5-1 'Darkness Rising' begins immediately. You cannot change allegiance until completing or rejecting 5-1. \n \n",
                onmob_target = {"Pakh_Jatalfih"},
                trigger_on_event_id = {37},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 5, Airship Pass (or 20,000 gil), Message to Jeuno KI, 10,000 gil, Title: Have Wings Will Fly"
        }
    },

    ["5-1: The Final Seal"] = {
        steps = {
            {
                text = "Step 1: Proceed to Heavens Tower in Windurst Walls and climb to the top floor (Vestal Chamber). \n \n" ..
                       "Examine the Vestal Chamber door (_6q2) to receive KI:New Fei'Yin Seal and begin the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards. \n \n" ..
                       "Optional: The Star Sibyl's guards and Zubaba nearby have additional dialogue at this point.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {166, 190},
                route_to = "Heavens Tower",
            },
            {
                text = "Step 2: Zone into Fei'Yin for a cutscene with Zeid. \n \n" ..
                       "Multiple ways to reach Fei'Yin: \n \n" ..
                       "Home Point #1 teleport (if unlocked) \n" ..
                       "Unity Concord warp \n" ..
                       "Warp to Qu'Bia Arena via Domenic (J-7) in Lower Jeuno (if completed Beyond Infinity), then walk out \n \n" ..
                       "Note: If cutscene doesn't trigger, zone out to Beaucedine Glacier and back in. \n \n",
                trigger_on_event_id = {1},
                route_to = "Fei'Yin 1",
            },
            {
                text = "Step 3: Travel to Qu'Bia Arena entrance at (K-8) in Fei'Yin.",
                zone_trigger = "Qu'Bia Arena",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Examine the Burning Circle to enter BCNM 'The Rank 5 Mission'. \n \n" ..
                       "Requirements: \n \n" ..
                       "- Party members must be Rank 5+ and have watched Fei'Yin cutscene \n" ..
                       "- Level cap: 99 \n" ..
                       "- Time limit: 15 minutes \n" ..
                       "- Buffs wear upon entry \n \n" ..
                       "Defeat Archlich Taber'quoan (Black Mage skeleton): \n \n" ..
                       "- Spawns with 2 Ancient Sorcerers \n" ..
                       "- Ancient Warriors periodically spawn in pairs \n" ..
                       "- Uses Sleepga II, Freeze, and Manafont \n" ..
                       "- Susceptible to Silence and most enfeebles \n" ..
                       "- Skeletons can be Slept but easier with Bard Lullaby light based spells! \n \n" ..
                       "Victory: Title 'Archmage Assassin', KI:Burnt Seal",
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 5: Return to the Vestal Chamber (_6q2) at the top of Heavens Tower to complete the mission.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {192},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "600 Rank Points"
        }
    },

    ["5-2: The Shadow Awaits"] = {
        steps = {
            {
                text = "Step 1: Trade 3 crystals to a Conquest Overseer to build Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission. \n \n" ..
                       "You will receive KI:Star Crested Summons.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Return to Heavens Tower and examine the Vestal Chamber door (_6q2) for a cutscene with the Star Sibyl. \n \n" ..
                       "You will receive title: 'Star-ordained Warrior' and your KI:Star Crested Summons will be consumed. \n \n" ..
                       "Optional: The Star Sibyl's guards and Zubaba have additional dialogue at this point.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {214},
                route_to = "Heavens Tower",
            },
            {
                text = "Step 3: Travel to Castle Zvahl Baileys! \n \n" ..
                       "Outpost: Fauregandi/Valdeaunia if possible. \n \n" ..
                       "If walking, a good route is from San d'Oria via Ranguemont Pass > Beaucedine Glacier > Xarcabard.",
                zone_trigger = "Castle Zvahl Baileys",
                route_to = "Xarcabard",
                destination_highlight = {position = "D-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Route through Castle Zvahl Baileys -> Castle Zvahl Keep! \n \n" ..
                       "Map 1: Go to (G-8) staying on the lower level and take a first Right!(North)\n \n" ..
                       "Follow the arrows on the ground will lead you to (F-8) - Map 2! \n \n" ..
                       "Map 2: Jump down the Goblin Pitt, there will be an arrow to indicate where to go. \n \n" ..
                       "Map 3: Run down the hall and run up the stairs back to Map 2. \n \n" ..
                       "Map 2: Follow the arrows end goal is (F-8) to Castle Zvhal Keep. \n \n" ..
                       "Aggro: Demons/Beastmen (sight), Ahriman (sight+sound), up to Lv53. Use Sneak/Invis if below Lv70. \n \n",
                visual_zones = {
                    -- Floor 1
                    { type = 'arrow', center = { x = 179.9, y = -24.1, z = 19.5 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = 87.9, y = -20.1, z = 100.6 }, size = 4, direction = 'down', floor_id = 1 },
                    { type = 'arrow', center = { x = 99.8, y = -20.1, z = 72.7 }, size = 4, direction = 'left', floor_id = 1 },
                    -- Floor 2
                    { type = 'arrow', center = { x = 31.2, y = -20, z = 59.7 }, size = 4, direction = 'up', floor_id = 2 },
                    { type = 'arrow', center = { x = 20.8, y = -20, z = 150.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 2 },
                    { type = 'arrow', center = { x = -61, y = -20, z = 110.2 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -92, y = -20, z = 89.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -91.8, y = -19.5, z = 51.5 }, size = 4, direction = 'right', floor_id = 2 },
                    { type = 'arrow', center = { x = -76.1, y = -19.5, z = 52.1 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -77.4, y = -24, z = 20.2 }, size = 4, direction = 'left', floor_id = 2 },
                    -- Floor 15
                    { type = 'arrow', center = { x = -6.5, y = 4, z = 126.5 }, size = 4, direction = 'nw', floor_id = 15 },
                    { type = 'arrow', center = { x = -59.7, y = 4, z = 179.2 }, size = 4, direction = 'down', floor_id = 15 },
                    { type = 'arrow', center = { x = 12.8, y = -24, z = 133.4 }, size = 4, direction = 'sw', floor_id = 15 },
                },
                zone_name = "Castle Zvahl Baileys",
                zone_trigger = "Castle Zvahl Keep",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 2,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Castle Zvahl Baileys",
                        floor_id = 15,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Castle Zvahl Keep -> Throne Room of the Shadow Lord! \n \n" ..
                       "Follow the arrows, there is a lot of door opening here! \n" ..
                       "Map 1 -> (H-6) \n" ..
                       "Map 2 -> (E-8) \n" ..
                       "Map 3 -> Run on the teleporters when a glowing image appears \n" ..
                       "Keep doing this until you reach Map 4!! \n" ..
                       "Map 4 -> (G-7) to Throne Room and grab the Home Point! \n \n",
                visual_zones = {
                    -- Floor 1
                    { type = 'arrow', center = { x = -30, y = 0, z = -22.3 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = -32.4, y = 0.6, z = 48.7 }, size = 4, direction = 'right', floor_id = 1 },
                    { type = 'arrow', center = { x = -10.1, y = 0.6, z = 69.4 }, size = 4, direction = 'up', floor_id = 1 },
                    { type = 'arrow', center = { x = -10.1, y = 0.6, z = 90.2 }, size = 4, direction = 'left', floor_id = 1 },
                    { type = 'arrow', center = { x = -69, y = 0.6, z = 107.8 }, size = 4, direction = 'up', floor_id = 1 },
                    -- Floor 2
                    { type = 'arrow', center = { x = -69.7, y = -15.4, z = 86.4 }, size = 4, direction = 'down', floor_id = 2 },
                    { type = 'arrow', center = { x = -60.4, y = -15.4, z = 48.5 }, size = 4, direction = 'down', floor_id = 2 },
                    -- Floor 3 (teleporters)
                    { type = 'square', center = { x = -300, y = -49.1, z = -20 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -272.6, y = -53.2, z = 4.9 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -272.9, y = -53.2, z = -44.6 }, size = 4, floor_id = 3 },
                    { type = 'square', center = { x = -326.5, y = -53.2, z = -45 }, size = 4, floor_id = 3 },
                },
                zone_name = "Castle Zvahl Keep",
                zone_trigger = "Throne Room",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 1,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 3,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Zvahl Keep",
                        floor_id = 4,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Examine the Throne Room door (_4l1) to enter BCNM 'The Shadow Lord Battle'. \n \n" ..
                       "Shadow Lord (2 phases): \n" ..
                       "Phase 1: \n" ..
                       "- Alternates between Magic Stance (physical immunity) and Melee Stance (magic immunity) \n" ..
                       "- Switches every 5 minutes or after 1000 damage \n" ..
                       "- Magic Stance: Tier 2 elementals, debuffs, Dark Nova weaponskill before switching \n" ..
                       "- Melee Stance: Giga Slash, Kick Back, Umbra Smash weaponskills \n" ..
                       "- Monks: Use Formless Strikes to bypass physical immunity \n" ..
                       "Phase 2 (after cutscene): Spams Implosion \n" ..
                       "- Lower-level parties should zerg him so save your 2hours for this phase! \n \n" ..
                       "Victory: KI:Shadow Fragment. You will be warped back to Baileys entrance.",
                onmob_target = {"_4l1"},
                trigger_on_event_id = {7},
            },
            {
                text = "Step 7: Return to Heavens Tower and examine the Vestal Chamber door (_6q2) to report to the Star Sibyl and complete the mission.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {216},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "Rank 6, 20,000 gil, Zilart Mission 1 'The New Frontier' unlocked"
        }
    },

    ["6-1: Full Moon Fountain"] = {
        steps = {
            {
                text = "Step 1: Trade 4 crystals to a Conquest Overseer to fill Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission. \n \n" ..
                       "WARNING: Get Trust: Ajido-Marujido BEFORE starting this mission or you will lose access to him until Rank 10!",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to the Orastery in Port Windurst and talk to Hakkuru-Rinkuru (E-7). \n \n" ..
                       "You will receive KI:Southwestern Star Charm and be told to go to the southwestern tower in West Sarutabaruta.",
                onmob_target = {"Hakkuru-Rinkuru"},
                trigger_on_event_id = {456},
                route_to = "Port Windurst",
                destination_highlight = {position = "E-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Head to the southwestern tower of Outer Horutoto Ruins at (F-11) in West Sarutabaruta. \n \n" ..
                       "Inside, navigate to the Gate: Magical Gizmo (_5eb) at (J-8). \n \n" ..
                       "Examine it to spawn 4 Jack Cardians (level 62). \n \n" ..
                       "TIP: Use Sneak before examining to avoid immediate aggro. You only need to kill ONE Jack — pull it away and wait ~2-3 minutes for the other three to despawn before killing it.",
                onmob_target = {"_5eb"},
                zone_trigger = "Outer Horutoto Ruins",
                route_to = "West Sarutabaruta",
                destination_highlight = {position = "F-11", offsetX = 16, offsetY = 16},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Outer Horutoto Ruins",
                        floor_id = 1,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Defeat the Jack Cardians: \n \n" ..
                       "Jack of Batons (BLM) | Jack of Coins (RDM) | Jack of Cups (WHM) | Jack of Swords (PLD) \n \n" ..
                       "You only need 1 kill — pull one with a ranged attack or pet, wait ~2-3 min for the other 3 to despawn, then kill. \n \n" ..
                       "NOTE: They detect magic, so pulling via spell will aggro all four unless cast from far enough away.",
                kill_requirement = {
                    enemies = {"Jack_of_Batons", "Jack_of_Coins", "Jack_of_Cups", "Jack_of_Swords"},
                    zone = "Outer Horutoto Ruins",
                    count = 1,
                    count_party_kills = true,
                },
            },
            {
                text = "Step 5: Once the Jacks are gone, examine the Gate: Magical Gizmo (_5eb) at (J-8) again for a cutscene. \n \n" ..
                       "Your KI:Southwestern Star Charm will be consumed.",
                onmob_target = {"_5eb"},
                trigger_on_event_id = {68},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Outer Horutoto Ruins",
                        floor_id = 1,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Head to Full Moon Fountain for a cutscene to complete the mission. \n \n" ..
                       "Fastest routes: \n \n" ..
                       "1. Home Point: Toraimarai Canal HP#1 (Sarutabaruta region) -> head north \n \n" ..
                       "2. Survival Guide: Toraimarai Canal -> head east, hug left at canal split, cross bridge at H-6, hug right wall -> stairs down -> right at intersection -> up stairs -> north -> south fork -> hug right to tunnel at F-8 -> down past skeletons -> Large Stone Door \n \n" ..
                       "3. Rhinostery Certificate: Priming Gate (H-3) Windurst Walls -> Toraimarai Canal -> follow path to Large Stone Door at F-8 -> zone at G-7 \n \n" ..
                       "4. Portal Charm / 3-Mage Gate: East Sarutabaruta J-7 tower -> Inner Horutoto Ruins -> cracked wall G-8 -> Magic Gate E-10 -> cracked wall D-10 -> Three Mage Gate H-9 -> false wall H-8 -> Toraimarai Canal door at H-6 (left tunnel) -> Large Stone Door",
                zone_trigger = "Full Moon Fountain",
                route_to = "Toraimarai Canal",
            },
        },
        reward = {
            text = "650 Rank Points"
        }
    },

    ["6-2: Saintly Invitation"] = {
        steps = {
            {
                text = "Step 1: Trade 4 crystals to a Conquest Overseer to fill Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to the top of Heavens Tower and examine the Vestal Chamber door (_6q2). \n \n" ..
                       "You will receive KI:Holy One's Invitation and title: 'Hero on Behalf of Windurst'. \n \n" ..
                       "Optional: Sibyl Guards, Kupipi, Zubaba, and the Orastery NPCs have additional dialogue.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {310},
                route_to = "Heavens Tower",
            },
            {
                text = "Step 3: Travel to Giddeus and head to Balga's Dais at (F-12). \n \n" ..
                       "Fastest routes: Domenic warp in Lower Jeuno (if Beyond Infinity complete) OR Home Point to G-12 in Giddeus right outside Balga's Dais. \n \n" ..
                       "Enter the Burning Circle for BCNM 'Saintly Invitation'.",
                zone_trigger = "Balga's Dais",
                route_to = "Giddeus",
                destination_highlight = {position = "F-12", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Defeat the 4 Yagudo (all level 64, ~3100 HP each): \n \n" ..
                       "Chaa Paqa the Profound (SMN) | Juu Zeni the Poisonmist (NIN) | Buu Xolo the Bloodfaced (SAM) | Nuu Kofu the Gentle (WHM) \n \n" ..
                       "Recommended kill order: SMN first (stops Astral Flow), NIN, SAM, WHM last (prevents Benediction from waking the others). \n \n" ..
                       "All can be slept. \n \n" ..
                       "Victory: KI:Balga Champion Certificate + title 'Victor of the Balga Contest'.",
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 5: Travel to Castle Oztroja and navigate to Kaa_Toru_the_Just. \n \n" ..
                       "You need a Judgment Key: farmed from Yagudo Flagellants on Floor 4. \n \n" ..
                       "Route: Navigate up to Map 7 (H-9/10, same as mission 3-1 torch run). \n \n" ..
                       "Touch a torch at G-7, G-8, H-7, or H-8 to open the Brass Door, then enter 3 passwords on the wooden platform behind it to open the trapdoor. \n \n" ..
                       "Password locations: #1 Floor 1 (H-9), #2 Basement 1 (H-9), #3 Floor 2 (I-8) \n" ..
                       "All possible passwords: Buxu, Deggi, Domi, Duxo, Duzu, Gadu, Haqa, Misu, Mjuu, Mong, Ouzi, Ovzi, Puqu, Quu, Xalmo, Xicu, Zhuu \n \n" ..
                       "Fall through trapdoor -> proceed to Brass Door at H-5/H-6 -> trade Judgment Key to open it -> talk to Kaa_Toru_the_Just. \n \n" ..
                       "NOTE: Yagudo High Priest and Yagudo Templar have True Sight — Invisible will NOT protect you! \n \n" ..
                       "You will receive KI:Holy One's Oath and Ashura Necklace.",
                onmob_target = {"Kaa_Toru_the_Just"},
                trigger_on_event_id = {45},
                route_to = "Castle Oztroja",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Oztroja",
                        floor_id = 1,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return to Heavens Tower and examine the Vestal Chamber door (_6q2) to complete the mission.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {312},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "Rank 7, 40,000 gil, Ashura Necklace"
        }
    },
    ["7-1: The Sixth Ministry"] = {
        steps = {
            {
                text = "Step 1: Trade 4 crystals to a Conquest Overseer to fill Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Speak with Tosuka-Porika at the Optistery in northern Windurst Waters (G-8). \n \n" ..
                       "You will receive KI:Optistery Ring and be told to go to Toraimarai Canal. \n \n" ..
                       "Optional: NPCs inside both Optistery buildings have additional dialogue.",
                onmob_target = {"Tosuka-Porika"},
                trigger_on_event_id = {715},
                route_to = "Windurst Waters",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Toraimarai Canal and navigate to Map 2. \n \n" ..
                       "Fastest routes: \n" ..
                       "- Home Point: Toraimarai Canal HP#1 -> make your way east to exit C at J-9 to reach Map 2 \n" ..
                       "- Priming Gate (H-3) in Windurst Walls -> zone into Toraimarai Canal \n \n" ..
                       "On Map 2 find the large room (G-8) containing 4 Hinge Oils. \n \n" ..
                       "Defeat all 4 Hinge Oils. \n \n" ..
                       "WARNING: Oils are immune to Sleep but susceptible to Bind/Gravity. They have a short-range AoE Fluid Spread. They respawn in ~16 minutes — all 4 must be dead simultaneously for the Marble Door to open.",
                kill_requirement = {
                    enemies = {"Hinge_Oil"},
                    zone = "Toraimarai Canal",
                    count = 4,
                    count_party_kills = true,
                },
                route_to = "Toraimarai Canal",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Toraimarai Canal",
                        floor_id = 2,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: With all Hinge Oils dead, examine the Marble Door (_4pc) on the far side of the room up the staircase at H-8 to enter. \n \n" ..
                       "Inside, examine the 'Tome of Magic' on the floor to the LEFT of the door you entered through for a cutscene. \n \n" ..
                       "NOTE: The other Tomes on the walls do not trigger the mission cutscene — only the one on the floor.",
                onmob_target = {"_4pc", "Tome_of_Magic"},
                trigger_on_event_id = {69},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Toraimarai Canal",
                        floor_id = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Tosuka-Porika at the Optistery (G-8) in Windurst Waters to complete the mission. \n \n" ..
                       "You will receive KI:Blank Book of the Gods.",
                onmob_target = {"Tosuka-Porika"},
                trigger_on_event_id = {724},
                route_to = "Windurst Waters",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "700 Rank Points, KI:Blank Book of the Gods"
        }
    },

    ["7-2: Awakening of the Gods"] = {
        steps = {
            {
                text = "Step 1: Trade 6 crystals to a Conquest Overseer to fill Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to the Rhinostery in southern Windurst Waters (J-9). \n \n" ..
                       "First: speak with Leepe-Hoppe on the roof (second floor). \n \n" ..
                       "Then: speak with Kerutoto inside. \n \n" ..
                       "Make sure you get the MISSION cutscene from Kerutoto — the correct one begins: 'The truth of it is, Minister Rukususu made an importantaru discovery in Fei'Yen...' \n \n" ..
                       "NOTE: If you have quest 'Tuning In' started, Kerutoto may not give the correct cutscene. Accept that quest first, then talk to her twice to activate this mission's cutscene.",
                onmob_target = {"Leepe-Hoppe", "Kerutoto"},
                trigger_on_event_id = {736},
                route_to = "Windurst Waters",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Kazham and speak with Romaa Mihgo (H-11) at Mihgo's Residence.",
                onmob_target = {"Romaa_Mihgo"},
                trigger_on_event_id = {266},
                route_to = "Kazham",
                destination_highlight = {position = "H-11", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Speak with Vanono (G-7) near the airship dock boarding counter in Kazham.",
                onmob_target = {"Vanono"},
                trigger_on_event_id = {264},
                destination_highlight = {position = "G-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Travel to Temple of Uggalepih and obtain a Cursed Key from Bonze Marberry (level 66 Tonberry NM). \n \n" ..
                       "Fastest route: Unity warp to Yhoator Jungle (Level 122) -> Den of Rancor at J-7 -> follow right wall into Temple -> Bonze Marberry at J-9 on that map. \n \n" ..
                       "Alternate: Temple of Uggalepih entrance in Yhoator Jungle (J-11) -> navigate to the NM room. \n \n" ..
                       "IMPORTANT: Bonze Marberry uses Everyone's Rancor (10x normal grudge damage) below 25% HP. Burst him from over 25% to 0 to avoid it. \n \n" ..
                       "Don't kill Tonberries on the way — use Call for Help to avoid rancor buildup! \n \n" ..
                       "Bonze Marberry drops 2 Cursed Keys — every Windurstian on the mission needs one.",
                trigger_on_item_obtain = {"Cursed Key"},
                items_needed = {"Cursed Key"},
                route_to = "Yhoator Jungle",
            },
            {
                text = "Step 6: With your Cursed Key, head to the Granite Door (_4fx) at J-6 on Map 3 of Temple of Uggalepih. \n \n" ..
                       "Trade the Cursed Key to the door for a cutscene with Rukususu. \n \n" ..
                       "Your KI:Blank Book of the Gods is consumed and you receive KI:Book of the Gods. \n \n" ..
                       "NOTE: Yagudo High Priest and Yagudo Templar have True Sight — Invisible will NOT protect you. \n \n" ..
                       "Optional: Read the three extra Tomes of Magic in this room for lore.",
                onmob_target = {"_4fx"},
                trigger_on_event_id = {23},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 3,
                        highlights = {
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Return to Leepe-Hoppe at the Rhinostery roof (J-9) in southern Windurst Waters to complete the mission.",
                onmob_target = {"Leepe-Hoppe"},
                trigger_on_event_id = {742},
                route_to = "Windurst Waters",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 8, 60,000 gil"
        }
    },

    ["8-1: Vain"] = {
        steps = {
            {
                text = "Step 1: Trade 6 crystals to a Conquest Overseer to fill Rank Bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to the Aurastery in northern Windurst Waters and speak to Moreno-Toeno (L-6). \n \n" ..
                       "You will receive KI:Star Seeker and title: 'Fugitive Minister Bounty Hunter'.",
                onmob_target = {"Moreno-Toeno"},
                trigger_on_event_id = {752},
                route_to = "Windurst Waters",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Travel to Ro'Maeve and examine the Qu'Hau Spring at (H-6) for a cutscene. \n \n" ..
                       "Fastest routes: Survival Guide to Ro'Maeve OR Unity warp (Level 125 category). \n \n" ..
                       "NOTE: Every monster in Ro'Maeve aggros to Magic — use Silent Oil or non-magic Sneak. \n" ..
                       "After the cutscene, Cursed Puppets may aggro — run north to Hall of the Gods if needed.",
                onmob_target = {"QuHau_Spring"},
                trigger_on_event_id = {2},
                route_to = "Ro'Maeve",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Travel to Davoi and speak to Sedal-Godjal (J-8). \n \n" ..
                       "Route to Sedal-Godjal: Enter Davoi via the H-11 entrance into Monastic Cavern -> hug the right wall to (I-8) -> exit back into Davoi -> Sedal-Godjal is at J-8. \n \n" ..
                       "He will drain your KI:Star Seeker into KI:Magic-drained Star Seeker and mention an Orc disrupting him.",
                onmob_target = {"Sedal-Godjal"},
                trigger_on_event_id = {118},
                route_to = "Davoi",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Obtain a Curse Wand by defeating Dirtyhanded Gochakzuk (level 71 BLM NM) in Davoi. \n \n" ..
                       "From Sedal-Godjal, use the elevator at H-8 to reach the house level. \n" ..
                       "Dirtyhanded Gochakzuk is inside the house behind two sets of Oak Doors. He links with 3 nearby Orcs and has True Sight through the inner door. \n \n" ..
                       "Drops 2 Curse Wands — every Windurstian on the mission needs one. Respawns in 16-30 min. \n \n" ..
                       "NOTE: If you already have a Curse Wand in storage, you can skip this fight.",
                onmob_target = {"Dirtyhanded_Gochakzuk"},
                trigger_on_item_obtain = {"Curse Wand"},
                items_needed = {"Curse Wand"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Trade the Curse Wand to Sedal-Godjal (J-8) in Davoi for a cutscene.",
                onmob_target = {"Sedal-Godjal"},
                trigger_on_event_id = {120},
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 7: Return to Moreno-Toeno (L-6) at the Aurastery in northern Windurst Waters to complete the mission.",
                onmob_target = {"Moreno-Toeno"},
                trigger_on_event_id = {758},
                route_to = "Windurst Waters",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "750 Rank Points"
        }
    },

    ["8-2: The Jester Who'd Be King"] = {
        steps = {
            {
                text = "Step 1: Fill at least 80% of your Rank Points bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = { { position = "L-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = { { position = "E-7", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = { { position = "I-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = { { position = "G-8", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            {
                text = "Step 2: Speak with Apururu at the Manustery in Windurst Woods. \n \n" ..
                       "You will receive KI:Manustery Ring.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {588},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 3: Collect KI:Optistery Ring from Tosuka-Porika (G-8) at the Optistery in northern Windurst Waters. \n \n" ..
                       "NOTE: Steps 3, 4, and 5 can be completed in any order.",
                onmob_target = {"Tosuka-Porika"},
                trigger_on_event_id = {801},
                route_to = "Windurst Waters",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Collect KI:Aurastery Ring from Sedal-Godjal (J-8) in Davoi. \n \n" ..
                       "Route: Survival Guide to Davoi OR enter via H-11 into Monastic Cavern -> hug right wall to I-8 -> exit back into Davoi. \n \n" ..
                       "NOTE: Steps 3, 4, and 5 can be completed in any order.",
                onmob_target = {"Sedal-Godjal"},
                trigger_on_event_id = {122},
                route_to = "Davoi",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 5: Collect KI:Rhinostery Ring from Rukususu (_no4) at (F-6) on Map 2 in Fei'Yin. \n \n" ..
                       "Fastest route: Home Point #2 in Fei'Yin. \n \n" ..
                       "NOTE: Steps 3, 4, and 5 can be completed in any order.",
                onmob_target = {"_no4"},
                trigger_on_event_id = {22},
                route_to = "Fei'Yin 1",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Fei'Yin",
                        floor_id = 2,
                        highlights = { { position = "F-6", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            {
                text = "Step 6: Return to Apururu at the Manustery in Windurst Woods with all 3 rings.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {601},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 7: Speak with Kupipi in Heavens Tower. Any answer continues the mission.",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {326},
                route_to = "Heavens Tower",
            },
            {
                text = "Step 8: Travel to Outer Horutoto Ruins at (F-4) in West Sarutabaruta. \n \n" ..
                       "Inside: go through Cracked Wall at (I-6) on Map 1 to reach Map 2. \n \n" ..
                       "Examine Cracked Wall (_5e5) at (G-8) on Map 2 to spawn 2 level 72 Cardians: \n \n" ..
                       "Queen of Coins (RDM) and Queen of Swords (PLD). \n \n" ..
                       "Defeat both. They are immune to Sleep and Silence but susceptible to Bind and Gravity. \n" ..
                       "They use 2-hours (Chainspell / Invincible). Examine _5e5 again after they die to get KI:Orastery Ring. \n \n" ..
                       "WARNING: Fuligos in this area aggro and are level 84-85 — use Sneak! \n \n" ..
                       "NOTE: If one Cardian dies before the other despawns, wait ~3 minutes and retry.",
                onmob_target = {"_5e5"},
                trigger_on_event_id = {71},
                route_to = "West Sarutabaruta",
                destination_highlight = {position = "F-4", offsetX = 16, offsetY = 16},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Outer Horutoto Ruins",
                        floor_id = 1,
                        highlights = { { position = "I-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Outer Horutoto Ruins",
                        floor_id = 2,
                        highlights = { { position = "G-8", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            {
                text = "Step 9: Return to Apururu at the Manustery in Windurst Woods.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {590},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 10: Speak with Shantotto (K-7) in Windurst Walls. \n \n" ..
                       "You will receive KI:Glove of Perpetual Twilight. You may need to speak to her several times.",
                onmob_target = {"Shantotto"},
                trigger_on_event_id = {397},
                route_to = "Windurst Walls",
                destination_highlight = {position = "K-7", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 11: Return to Apururu at the Manustery in Windurst Woods.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {592},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 12: Travel to the Gate of Darkness (_5cb) at (I-7) in Inner Horutoto Ruins (Map 4 / Rose Tower). \n \n" ..
                       "Three routes to reach it: \n \n" ..
                       "1. Survival Guide: Toraimarai Canal -> Inner Horutoto Ruins entrance (fastest if unlocked) \n \n" ..
                       "2. Rhinostery Certificate: Priming Gate (H-3) Windurst Walls -> Toraimarai Canal -> navigate to Gate of Darkness area \n \n" ..
                       "3. Portal Charm / 3-Mage Gate: East Sarutabaruta J-7 tower -> Inner Horutoto Ruins -> cracked wall G-8 -> Magic Gate E-10 -> cracked wall D-10 -> Three Mage Gate H-9 -> false wall H-8 -> Gate of Darkness at I-7 (southern door in SE corner of Rose Tower) \n \n" ..
                       "NOTE: Ensure you get the mission cutscene, not the KI:Irradiant Strand cutscene (quest 'The Forbidden Path').",
                onmob_target = {"_5cb"},
                trigger_on_event_id = {75},
                route_to = "Toraimarai Canal",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Inner Horutoto Ruins",
                        floor_id = 4,
                        highlights = { { position = "I-7", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            {
                text = "Step 13: Return to Apururu at the Manustery in Windurst Woods to complete the mission. \n \n" ..
                       "Optional: Speak to Shantotto in Windurst Walls for additional story dialogue.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {609},
                route_to = "Windurst Woods",
            },
        },
        reward = {
            text = "Rank 9, 80,000 gil"
        }
    },

    ["9-1: Doll of the Dead"] = {
        steps = {
            {
                text = "Step 1: Fill approximately 1/3 of your Rank Points bar. \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = { { position = "L-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = { { position = "E-7", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = { { position = "I-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = { { position = "G-8", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            {
                text = "Step 2: Speak with Apururu at the Manustery in Windurst Woods (H-9).",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {619},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 3: Zone into Heavens Tower for an automatic cutscene. \n \n" ..
                       "Optional: Kupipi, Sibyl Guards, Zubaba, and the ladies-in-waiting have additional dialogue.",
                zone_trigger = "Heavens Tower",
                route_to = "Heavens Tower",
            },
            {
                text = "Step 4: Head to the top of Heavens Tower and examine the Vestal Chamber door (_6q2) for a cutscene with the Star Sibyl.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {362},
            },
            {
                text = "Step 5: Return to Apururu at the Manustery in Windurst Woods for a cutscene about helping her father. \n \n" ..
                       "Optional: Speak with Yoran-Oran (E-5) inside Yoran-Oran's Manor in Windurst Walls for extra dialogue.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {620},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 6: Obtain Goobbue Humus (Rare/Ex) by killing: \n \n" ..
                       "Goobbue Gardeners in The Sanctuary of Zi'Tah OR Old Goobbues in The Boyahda Tree. \n \n" ..
                       "Bring Treasure Hunter if possible — drop rate can be low.",
                trigger_on_item_obtain = {"Goobbue Humus"},
                items_needed = {"Goobbue Humus"},
                route_to = "The Boyahda Tree",
            },
            {
                text = "Step 7: In The Boyahda Tree on Map 1, find the Mandragora Warden at (E-4). \n \n" ..
                       "NOTE: The two Mandragora Wardens at (F-5) only have normal dialogue — only the one at (E-4) accepts the trade. \n \n" ..
                       "Trade the Goobbue Humus to the Mandragora Warden for a long cutscene (~3 minutes). \n \n" ..
                       "You will receive KI:Letter from Zonpa-Zippa.",
                onmob_target = {"Mandragora_Warden"},
                trigger_on_event_id = {13},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "The Boyahda Tree",
                        floor_id = 1,
                        highlights = {
                            { position = "E-4", offsetX = 16, offsetY = 16 },
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: Return to Apururu at the Manustery in Windurst Woods. \n \n" ..
                       "Your KI:Letter from Zonpa-Zippa will be consumed.",
                onmob_target = {"Apururu"},
                trigger_on_event_id = {621},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 9: Head to Full Moon Fountain for an automatic cutscene to complete the mission. \n \n" ..
                       "Fastest route: Toraimarai Canal Home Point #1 -> head north to Full Moon Fountain entrance.",
                zone_trigger = "Full Moon Fountain",
                route_to = "Toraimarai Canal",
            },
        },
        reward = {
            text = "800 Rank Points, Title: Guiding Star"
        }
    },

    ["9-2: Moon Reading"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Fill approximately 90% of your Rank Points bar (trade 9 regular crystals or 4 light/dark crystals to any gate guard). \n \n" ..
                       "Talk to any Windurst Gate Guard to accept the mission.",
                onmob_target = {"Mokyokyo", "Janshura-Rashura", "Rakoh-Buuma", "Zokima-Rokima"},
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Waters",
                        highlights = { { position = "L-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Port Windurst",
                        highlights = { { position = "E-7", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Woods",
                        highlights = { { position = "I-6", offsetX = 16, offsetY = 16 } },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Windurst Walls",
                        highlights = { { position = "G-8", offsetX = 16, offsetY = 16 } },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Heavens Tower and examine the Vestal Chamber door on the top floor for a cutscene. \n \n" ..
                       "Optional: The Sibyl Guards, Zubaba, and Kupipi have additional dialogue.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {384},
                route_to = "Heavens Tower",
            },
            { -- Step 3
                text = "Step 3: Collect 3 Ancient Verses in any order (Steps 3-5). \n \n" ..
                       "Ro'Maeve - Head to the Qu'Hau Spring at (H-6). Use a non-magical Sneak source (Silent Oil) to avoid magic aggro. \n" ..
                       "Examine the spring for a cutscene and receive the Key Item: Ancient Verse of Ro'Maeve.",
                onmob_target = {"QuHau_Spring"},
                trigger_on_event_id = {4},
                route_to = "Ro'Maeve",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 4
                text = "Step 4: Chamber of Oracles (Western Altepa Desert) - Enter Quicksand Caves from Western Altepa Desert at (D-12). Sneak is required throughout. \n \n" ..
                       "Navigate to the weight-controlled door at (I-9): requires combined party weight ≥3 (Galka=3, Hume/Elvaan/Mithra=2, Tarutaru=1) or a Key Item: Loadstone held by anyone standing in the center circle. \n" ..
                       "Continue to a second door at (H-7), then fall to the lower sand level and head left into the Chamber of Oracles. \n" ..
                       "The Key Item: Ancient Verse of Altepa is obtained automatically upon entering. \n \n" ..
                       "(Shortcut: Quicksand Caves Home Point #1 is near the Chamber of Oracles entrance.)",
                zone_trigger = "Chamber of Oracles",
                route_to = "Quicksand Caves",
            },
            { -- Step 5
                text = "Step 5: Temple of Uggalepih - Obtain an Uggalepih Key from Tonberry Cutters inside the temple. Invisible is required throughout. \n \n" ..
                       "Navigate to (E-8) on Map 2 and examine the ??? at the top of the stairs between the 4 bookshelves for a cutscene. \n" ..
                       "Receive the Key Item: Ancient Verse of Uggalepih. \n \n" ..
                       "(Fastest: Unity Warp to Temple of Uggalepih Lv.125 and head west.) \n" ..
                       "(Alt: Enter from Yhoator Jungle J-12, hug right wall to re-zone at F-5, re-enter hugging left wall.)",
                onmob_target = {"qm_windy_9_2"},
                trigger_on_event_id = {68},
                route_to = "Temple of Uggalepih",
                destination_highlight = {position = "E-8", offsetX = 16, offsetY = 16},
                images = {
                    {
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                        highlights = { { position = "E-8" } },
                    },
                },
            },
            { -- Step 6
                text = "Step 6: Return to Heavens Tower and examine the Vestal Chamber door on the top floor with all 3 Ancient Verses for a cutscene.",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {385},
                route_to = "Heavens Tower",
            },
            { -- Step 7
                text = "Step 7: Travel to the Full Moon Fountain via Toraimarai Canal. \n \n" ..
                       "Fastest routes: \n \n" ..
                       "1. Home Point: Toraimarai Canal HP#1 (Sarutabaruta region) -> head north \n \n" ..
                       "2. Survival Guide: Toraimarai Canal -> head east, hug left at canal split, cross bridge at H-6, hug right wall -> stairs down -> right at intersection -> up stairs -> north -> south fork -> hug right to tunnel at F-8 -> down past skeletons -> Large Stone Door \n \n" ..
                       "3. Rhinostery Certificate: Priming Gate (H-3) Windurst Walls -> Toraimarai Canal -> follow path to Large Stone Door at F-8 -> zone at G-7 \n \n" ..
                       "4. Portal Charm / 3-Mage Gate: East Sarutabaruta J-7 tower -> Inner Horutoto Ruins -> cracked wall G-8 -> Magic Gate E-10 -> cracked wall D-10 -> Three Mage Gate H-9 -> false wall H-8 -> Toraimarai Canal door at H-6 (left tunnel) -> Large Stone Door \n \n" ..
                       "NOTE: Only characters currently on this mission (or who have completed it) can enter the battlefield.",
                zone_trigger = "Full Moon Fountain",
                route_to = "Toraimarai Canal",
            },
            { -- Step 8
                text = "Step 8: Defeat the enemies in the Full Moon Fountain battlefield. Buffs are removed on entry (food and Finishing Moves remain). \n \n" ..
                       "Phase 1 - Kill 4 Ace Cardians in order: Ace of Batons (BLM) → Ace of Coins (RDM) → Ace of Swords (PLD) → rest until full → Ace of Cups (WHM). Cardians can be Silenced and Slept. \n \n" ..
                       "Phase 2 - Ajido-Marujido appears. Kill Vyala (Manticore) and Tatzlwurm (Wyvern). \n" ..
                       "CRITICAL: Keep Ajido-Marujido alive — if he dies, you fail! He has ~500-600 HP. Buff him with Stoneskin/Phalanx (Scholar Accession works on him). \n \n" ..
                       "Tatzlwurm uses Radiant Breath (Silence) — bring Echo Drops. Vyala uses Slowga. \n" ..
                       "WARNING: Wyvern is highly resistant/immune to sleep. Avoid AOE near sleeping Cardians. \n \n" ..
                       "(Recommended: ~75 party. Soloable with Trusts at 85+.)",
                trigger_on_event_id = {32001},
            },
            { -- Step 9
                text = "Step 9: Return to Heavens Tower and examine the Vestal Chamber door on the top floor TWICE for two cutscenes to complete the mission and receive your reward. \n \n" ..
                       "NOTE: You must have an empty inventory slot to receive the Windurstian Flag. If full, free a slot and click the blank target at the Heavens Tower entrance. \n \n" ..
                       "Windurst missions complete! Title: Vestal Chamberlain",
                onmob_target = {"_6q2"},
                trigger_on_event_id = {407},
                route_to = "Heavens Tower",
            },
        },
        reward = {
            text = "Rank 10, 100,000 gil, Windurstian Flag, Title: Vestal Chamberlain"
        }
    },
}
