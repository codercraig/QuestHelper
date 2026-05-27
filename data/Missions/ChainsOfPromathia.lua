return {
    ["CoP 1-1: The Rites of Life"] = {
        steps = {
            {
                text = "Step 1: Head to Qufim Island and enter Lower Delkfutt's Tower.\n \n" ..
                       "The cutscene triggers automatically on zone-in — you MUST enter from Qufim Island for it to fire.\n \n" ..
                       "A long opening cutscene will play, beginning the Chains of Promathia storyline.\n \n",
                route_to = "Qufim Island",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
                zone_trigger = "Lower Delkfutt's Tower",
            },
            {
                text = "Step 2: After the cutscene, head to Upper Jeuno for a second cutscene.\n \n" ..
                       "The cutscene triggers automatically on zone-in.\n \n",
                route_to = "Upper Jeuno",
                zone_trigger = "Upper Jeuno",
                trigger_on_event_id = {2},
            },
            {
                text = "Step 3: Speak to Monberaux (G-10) inside the Infirmary in Upper Jeuno for the final cutscene.\n \n" ..
                       "You will receive the Key Item: Mysterious Amulet on completion.\n \n" ..
                       "Note: There are two more people in Jeuno you will need to speak to during the next mission (CoP 1-2), so stay in Jeuno!\n \n",
                route_to = "Upper Jeuno",
                onmob_target = "Monberaux",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {207},
            },
        },
        reward = {
            text = "Key Item: Mysterious Amulet\nNext: Below the Arks (CoP 1-2)",
        }
    },

    ["CoP 1-2: Below the Arks"] = {
        steps = {
            {
                text = "Step 1: Still in Jeuno from CoP 1-1 — speak to Monberaux (G-10) in the Upper Jeuno Infirmary for additional dialogue.\n \n" ..
                       "Then head to Ru'Lude Gardens and speak to Pherimociel (G-6) inside the Grand Duchy's Palace Guard Post for the main cutscene.\n \n" ..
                       "Optional: Speak to Rainhard upstairs in the Palace for extra comments.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Pherimociel",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {24},
            },
            {
                text = "Step 2: Head to Harith (H-5) in the Archduke's House.\n \n" ..
                       "Take the back entrance of the Grand Duchy's Palace — behind the large staircase near Maat. Harith will mumble about Emptiness, unlocking access to the Promyvion zones.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Harith",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 3: Head to Konschtat Highlands and examine the Shattered Telepoint (I-8).\n \n" ..
                       "A cutscene triggers and warps you into the Hall of Transference.\n \n",
                route_to = "Konschtat Highlands",
                onmob_target = "konschtat-highlands-shattered-telepoint",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {913},
            },
            {
                text = "Step 4: Inside the Hall of Transference, use the Large Apparatus on the left to enter Promyvion-Dem - If you have completed this Promyvion before just use the big door! \n \n" ..
                       "Note: If you leave a Promyvion without clearing it, you retain a 'memory' of the zone. To enter a different Promyvion next time, use the Large Apparatus again — this will seal your current memory.\n \n" ..
                       "For this guide we have used Promyvion-Dem as the starting point, if your group is starting with another Promyvion it has been split in the next section accordingly so just force complete when you are on 'The Mothercrystals'.\n \n",
                zone_name = "Hall of Transference",
                onmob_target = "hall-of-transference-dem-large-apparatus",
                trigger_on_event_id = {125},
                zone_trigger = "Promyvion - Dem",
            },
        },
        reward = {
            text = "Access to Promyvion-Mea, Promyvion-Holla, and Promyvion-Dem\nNext: The Mothercrystals (CoP 1-3)",
        }
    },

    ["CoP 1-3: The Mothercrystals - Promyvion-Dem"] = {
        steps = {
            {
                text = "Step 1: [Floor 1 - Easy Prey to Decent Challenge]\n \n" ..
                       "Note: Sneak/Invisible does NOT work - all mobs are True Sight.\n \n" ..
                       "Defeat the Memory Receptacle near J-12 to spawn the teleporter. Use it to ascend to Floor 2.\n \n",
                zone_name = "Promyvion - Dem",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {30},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "J-12", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Dem",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 2: [Floor 2 - Even Match to Tough]\n \n" ..
                       "Find and defeat a Memory Receptacle at one of the marked locations to spawn the teleporter to Floor 3.\n \n" ..
                       "Possible spawn points: G-10, E-11, D-8, G-7.\n \n",
                zone_name = "Promyvion - Dem",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {34, 35, 36, 37},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                            { position = "D-8",  offsetX = 16, offsetY = 16 },
                            { position = "G-7",  offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Dem",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 3: [Floor 3 - Very Tough to Incredibly Tough]\n \n" ..
                       "Two possible third islands depending on your Memory Stream — check the marked locations for the Memory Receptacle.\n \n" ..
                       "Possible spawn points: I-11, G-11, G-13, H-4, G-7, D-6.\n \n",
                zone_name = "Promyvion - Dem",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {31, 32, 33, 38, 39, 40},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                            { position = "G-13", offsetX = 16, offsetY = 16 },
                            { position = "H-4",  offsetX = 16, offsetY = 16 },
                            { position = "G-7",  offsetX = 16, offsetY = 16 },
                            { position = "D-6",  offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Dem",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 4: [Floor 4 - Incredibly Tough and above]\n \n" ..
                       "Make your way to the Spire of Dem entrance and enter to fight the boss.\n \n" ..
                       "On defeat you receive the Key Item: Light of Dem.\n \n",
                zone_trigger = "Spire of Dem",
                visual_zones = {
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 257.4, y = 0.0, z = 404.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 245.5, y = 0.0, z = 326.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 234.6, y = 0.0, z = 286.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 164.6, y = 0.0, z = 271.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 122.2, y = 0.0, z = 203.0 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 101.9, y = 0.0, z = 148.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 65.3, y = 0.0, z = 82.3 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Dem", type = 'arrow', center = { x = 20.6, y = 0.0, z = 68.6 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Dem",
                        floor_id = 0,
                    },
                },
                --trigger_on_event_id = {32001},
            },
            {
                text = "Step 5: [Spire of Dem] Boss: Progenerator (Gorger)\n \n" ..
                       "In the Spire of Dem, when ready examine the 'Web of Recollections' this will spawn you in the boss room! \n \n" ..
                       "- Stand BEHIND the boss at all times - Vanity Drive is a directional frontal AoE.\n" ..
                       "- Fission: Spawns pets (most common at 50% HP). Max 6 pets, share hate with boss. Sleep/Bind the pets - boss is immune to both.\n" ..
                       "- Stygian Flatus: AoE Paralyze - cast Barparalyzra before engaging.\n" ..
                       "- Spirit Absorption: Drains 200 HP, ignores Utsusemi.\n" ..
                       "- Promyvion Barrier: Defense Boost (dispel if possible).\n" ..
                       "- Quadratic Continuum: Single target damage.\n \n" ..
                       "On defeat you receive the Key Item: Light of Dem.\n \n",
                kill_requirement = {
                    count = 1,
                    enemies = {"Progenerator"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                onmob_enemy = {"Progenerator"},
                onmob_enemy_size = 6,
                trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Key Item: Light of Dem\nComplete the other two Promyvions to unlock CoP 2-1.",
        }
    },

    ["CoP 1-3: The Mothercrystals - Promyvion-Holla"] = {
        steps = {
            {
                text = "Step 1: Head to La Theine Plateau and examine the Shattered Telepoint (G-5) to enter the Hall of Transference.\n \n",
                route_to = "La Theine Plateau",
                onmob_target = "Shattered Telepoint",
                destination_highlight = {position = "G-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {202},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            {position = "G-5", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "La Theine Plateau",
                    },
                },
            },
            {
                text = "Step 2: Use the Large Apparatus in the Hall of Transference to enter Promyvion-Holla.\n \n",
                zone_name = "Hall of Transference",
                trigger_on_event_id = {122},
            },
            {
                text = "Step 3: Navigate to the top and defeat the boss in the Spire of Holla.\n \n" ..
                       "- Collect Recollections from enemies to activate floor teleporters.\n" ..
                       "- Use Sneak/Invisible between fights.\n" ..
                       "- Examine the Spire of Holla entrance at the top and defeat the boss.\n" ..
                       "- On defeat you receive the Key Item: Light of Holla.\n \n",
                zone_trigger = "Spire of Holla",
                trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Key Item: Light of Holla\nComplete the other two Promyvions to unlock CoP 1-4.",
        }
    },

    ["CoP 1-3: The Mothercrystals - Promyvion-Mea"] = {
        steps = {
            {
                text = "Step 1: Head to Tahrongi Canyon and examine the Shattered Telepoint (G-8) to enter the Hall of Transference.\n \n",
                route_to = "Tahrongi Canyon",
                onmob_target = "Shattered Telepoint",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {913},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            {position = "G-8", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Tahrongi Canyon",
                    },
                },
            },
            {
                text = "Step 2: Use the Large Apparatus in the Hall of Transference to enter Promyvion-Mea.\n \n",
                zone_name = "Hall of Transference",
                trigger_on_event_id = {128},
            },
            {
                text = "Step 3: Navigate to the top and defeat the boss in the Spire of Mea.\n \n" ..
                       "- Collect Recollections from enemies to activate floor teleporters.\n" ..
                       "- Use Sneak/Invisible between fights.\n" ..
                       "- Examine the Spire of Mea entrance at the top and defeat the boss.\n" ..
                       "- On defeat you receive the Key Item: Light of Mea.\n \n",
                zone_trigger = "Spire of Mea",
                trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Key Item: Light of Mea\nComplete all three Promyvions to unlock CoP 1-4.",
        }
    },
}
