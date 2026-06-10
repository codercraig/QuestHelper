return {
    ["CoP 1-1: The Rites of Life"] = {
        steps = {
            {
                text = "Step 1: Head to Qufim Island and enter Lower Delkfutt's Tower.\n \n" ..
                       "The cutscene triggers automatically on zone-in - you MUST enter from Qufim Island for it to fire.\n \n" ..
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
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 1-1: The Rites of Life"},
        },
        steps = {
            {
                text = "Step 1: Still in Jeuno from CoP 1-1 - speak to Monberaux (G-10) in the Upper Jeuno Infirmary for additional dialogue.\n \n" ..
                       "Then head to Ru'Lude Gardens and speak to Pherimociel (G-6) inside the Grand Duchy's Palace Guard Post for the main cutscene.\n \n" ..
                       "Optional: Speak to Rainhard upstairs in the Palace for extra comments.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Pherimociel",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {24},
            },
            {
                text = "Step 2: Head to Harith (H-5) in the Archduke's House.\n \n" ..
                       "Take the back entrance of the Grand Duchy's Palace - behind the large staircase near Maat. Harith will mumble about Emptiness, unlocking access to the Promyvion zones.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Harith",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {111},
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
                       "Note: If you leave a Promyvion without clearing it, you retain a 'memory' of the zone. To enter a different Promyvion next time, use the Large Apparatus again - this will seal your current memory.\n \n" ..
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
                       "Two possible third islands depending on your Memory Stream - check the marked locations for the Memory Receptacle.\n \n" ..
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
                       "Make your way to the Spire of Dem entrance, \n \n" ..
                       "Careful in this zone - if you aggroe too many just follow arrows and RUN to the spire!!\n \n",
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
                    display_only = true,
                },
                onmob_enemy = {"Progenerator"},
                onmob_enemy_size = 6,
                trigger_on_keyitem_obtain = 591,
            },
        },
        reward = {
            text = "Key Item: Light of Dem\nComplete the other two Promyvions to unlock CoP 2-1.",
        }
    },

    ["CoP 1-3: The Mothercrystals - Promyvion-Holla"] = {
        steps = {
            {
                text = "Step 1: Head to La Theine Plateau and examine the Shattered Telepoint to enter the Hall of Transference.\n \n",
                route_to = "La Theine Plateau",
                onmob_target = "la-theine-plateau-shattered-telepoint",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {202},
                zone_trigger = "Promyvion - Holla",
            },
            {
                text = "Step 2: Use the Large Apparatus in the Hall of Transference to enter Promyvion-Holla.\n \n" ..
                       "If you are helping others who already have a memory, just run up the stairs through the big door instead.\n \n",
                zone_name = "Hall of Transference",
                onmob_target = "hall-of-transference-holla-large-apparatus",
                zone_trigger = "Promyvion - Holla",
            },
            {
                text = "Step 3: [Floor 1 - Easy Prey to Decent Challenge]\n \n" ..
                       "Note: Sneak/Invisible does NOT work - all mobs are True Sight.\n \n" ..
                       "Defeat the Memory Receptacle to spawn the teleporter. Use it to ascend to Floor 2.\n \n" ..
                       "Possible spawn points: I-6.\n \n",
                zone_name = "Promyvion - Holla",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {37},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Holla",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 4: [Floor 2 - Even Match to Tough]\n \n" ..
                       "Find and defeat a Memory Receptacle at one of the marked locations to spawn the teleporter to Floor 3.\n \n" ..
                       "The portal you use determines whether you arrive on Floor 3 West or East - both lead to the Spire.\n \n" ..
                       "Possible spawn points: I-9, G-11, E-9, F-8.\n \n",
                zone_name = "Promyvion - Holla",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {33, 34, 35, 36},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "I-9",  offsetX = 16, offsetY = 16 },
                            { position = "G-11",  offsetX = 16, offsetY = 16 },
                            { position = "E-9",  offsetX = 16, offsetY = 16 },
                            { position = "F-8",  offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Holla",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 5: [Floor 3 - Very Tough to Incredibly Tough]\n \n" ..
                       "You will arrive on either Floor 3 West or Floor 3 East depending on the portal used in Floor 2.\n \n" ..
                       "Find and defeat the Memory Receptacle on your side to spawn the teleporter to Floor 4.\n \n" ..
                       "Possible spawn points: K-3, M-6, I-4, D-5, D-7, F-5.\n \n",
                zone_name = "Promyvion - Holla",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {30, 31, 32, 38, 39, 40},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "K-3",  offsetX = 16, offsetY = 16 },
                            { position = "M-6",  offsetX = 16, offsetY = 16 },
                            { position = "I-4", offsetX = 16, offsetY = 16 },
                            { position = "D-5",  offsetX = 16, offsetY = 16 },
                            { position = "D-7",  offsetX = 16, offsetY = 16 },
                            { position = "F-5",  offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Holla",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 6: [Floor 4 - Incredibly Tough and above]\n \n" ..
                       "Make your way to the Spire of Holla entrance and enter to fight the boss.\n \n",
                zone_trigger = "Spire of Holla",
                visual_zones = {
                    { zone_name = "Promyvion - Holla", type = 'arrow', center = { x = 71.0, y = 0.0, z = -237.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Holla", type = 'arrow', center = { x = 3.6, y = 0.0, z = -194.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Holla", type = 'arrow', center = { x = 38.9, y = 0.0, z = -134.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Holla", type = 'arrow', center = { x = 100.6, y = -0.0, z = -41.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Holla", type = 'arrow', center = { x = 180.1, y = 0.0, z = -32.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Holla",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 7: [Spire of Holla] Boss: Ponderer (Gorger)\n \n" ..
                       "Examine the 'Web of Recollections' when ready to spawn into the boss room.\n \n" ..
                       "- Stand BEHIND the boss - Vanity Drive is a directional frontal AoE.\n" ..
                       "- Fission: Spawns pets at ~50% HP. Sleep/Bind the pets - boss is immune to both.\n" ..
                       "- Stygian Flatus: AoE Paralyze - cast Barparalyzra before engaging.\n" ..
                       "- Spirit Absorption: Drains 200 HP, ignores Utsusemi.\n" ..
                       "- Promyvion Barrier: Defense Boost (dispel if possible).\n \n" ..
                       "On defeat you receive the Key Item: Light of Holla.\n \n",
                kill_requirement = {
                    count = 1,
                    enemies = {"Wreaker"},
                    count_party_kills = true,
                    --reset_on_zone_entry = true,
                    display_only = true,
                },
                onmob_enemy = {"Wreaker"},
                onmob_enemy_size = 5,
                trigger_on_keyitem_obtain = 590,
            },
        },
        reward = {
            text = "Key Item: Light of Holla",
        }
    },

    ["CoP 1-3: The Mothercrystals - Promyvion-Mea"] = {
        steps = {
            {
                text = "Step 1: Head to Tahrongi Canyon and examine the Shattered Telepoint to enter the Hall of Transference.\n \n",
                route_to = "Tahrongi Canyon",
                onmob_target = "tahrongi-canyon-shattered-telepoint",
                zone_trigger = "Promyvion - Mea",
                destination_highlight = {position = "I-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {913},
            },
            {
                text = "Step 2: Use the Large Apparatus in the Hall of Transference to enter Promyvion-Mea.\n \n" ..
                       "If you are helping others who already have a memory, just run up the stairs through the big door instead.\n \n",
                zone_name = "Hall of Transference",
                onmob_target = "hall-of-transference-mea-large-apparatus",
                zone_trigger = "Promyvion - Mea",
                trigger_on_event_id = {128},
            },
            {
                text = "Step 3: [Floor 1 - Easy Prey to Decent Challenge]\n \n" ..
                       "Note: Sneak/Invisible does NOT work - all mobs are True Sight.\n \n" ..
                       "Defeat the Memory Receptacle to spawn the teleporter. Use it to ascend to Floor 2.\n \n" ..
                       "Possible spawn points: D-5.\n \n",
                zone_name = "Promyvion - Mea",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {30},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "D-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Mea",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 4: [Floor 2 - Even Match to Tough]\n \n" ..
                       "Find and defeat a Memory Receptacle at one of the marked locations to spawn the teleporter to Floor 3.\n \n" ..
                       "The portal you use determines whether you arrive on Floor 3 West or East - both lead to the Spire.\n \n" ..
                       "Possible spawn points: G-8, C-11, G-11, I-10.\n \n",
                zone_name = "Promyvion - Mea",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {33, 37, 38, 39},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "G-9",  offsetX = 16, offsetY = 16 },
                            { position = "D-13", offsetX = 16, offsetY = 16 },
                            { position = "H-12", offsetX = 16, offsetY = 16 },
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Mea",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 5: [Floor 3 - Very Tough to Incredibly Tough]\n \n" ..
                       "You will arrive on either Floor 3 West or Floor 3 East depending on the portal used in Floor 2.\n \n" ..
                       "Find and defeat the Memory Receptacle on your side to spawn the teleporter to Floor 4.\n \n" ..
                       "Possible spawn points: C-9, D-8, F-8, I-7, K-8, J-10.\n \n",
                zone_name = "Promyvion - Mea",
                onmob_enemy = {"Memory Receptacle"},
                trigger_on_event_id = {31, 32, 34, 35, 36, 40},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "H-8",  offsetX = 16, offsetY = 16 },
                            { position = "D-8",  offsetX = 16, offsetY = 16 },
                            { position = "E-9",  offsetX = 16, offsetY = 16 },
                            { position = "K-8",  offsetX = 16, offsetY = 16 },
                            { position = "M-9", offsetX = 16, offsetY = 16 },
                            { position = "K-12", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Mea",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 6: [Floor 4 - Incredibly Tough and above]\n \n" ..
                       "Make your way to the Spire of Mea entrance and enter to fight the boss. \n \n" ..
                       "Careful with truesight mobs, if you aggroe too many just follow arrows and RUN to the spire!!\n \n",
                zone_trigger = "Spire of Mea",
                visual_zones = {
                        { zone_name = "Promyvion - Mea", type = 'arrow', center = { x = -37.2, y = 0.0, z = 282.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Mea", type = 'arrow', center = { x = 29.0, y = 0.0, z = 258.7 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Mea", type = 'arrow', center = { x = 99.4, y = 0.0, z = 190.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Mea",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 7: [Spire of Mea] Boss: Agonizer (Gorger)\n \n" ..
                       "Examine the 'Web of Recollections' when ready to spawn into the boss room.\n \n" ..
                       "- Stand BEHIND the boss - Vanity Drive is a directional frontal AoE.\n" ..
                       "- Fission: Spawns pets at ~50% HP. Sleep/Bind the pets - boss is immune to both.\n" ..
                       "- Stygian Flatus: AoE Paralyze - cast Barparalyzra before engaging.\n" ..
                       "- Spirit Absorption: Drains 200 HP, ignores Utsusemi.\n" ..
                       "- Promyvion Barrier: Defense Boost (dispel if possible).\n \n" ..
                       "On defeat you receive the Key Item: Light of Mea.\n \n" ..
                       "Congratulations on completing the 3 Promyvions! You will get a cutscene and end up in Lufaise Meadows. \n \n",
                keyitems_needed = {590,591,592},
                kill_requirement = {
                    count = 1,
                    enemies = {"Delver"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                onmob_enemy = {"Delver"},
                onmob_enemy_size = 4,
                trigger_on_keyitem_obtain = {590,591,592},
                require_all_keyitems = true
                --trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Key Item: Light of Mea\nCompleted all three Promyvions to unlock CoP 2-1.",
        }
    },

    ["CoP 2-1: An Invitation West"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 1-3: The Mothercrystals - Promyvion-Dem"},
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 1-3: The Mothercrystals - Promyvion-Holla"},
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 1-3: The Mothercrystals - Promyvion-Mea"},
        },
        steps = {
            {
                text = "Step 1: Head west through Lufaise Meadows to the Tavnazian Safehold entrance at E-8 or F-10.\n \n" ..
                       "WARNING: Orcs and Gigas aggro to sight and link. Bugards aggro to sound. Be careful if under level 50.\n \n" ..
                       "Zone into the Tavnazian Safehold - a cutscene will play and the mission will complete.\n \n" ..
                       "Tip: Access the Survival Guide and Home Point at the front of the Safehold before moving on.\n \n",
                route_to = "Tavnazian Safehold 2",
                zone_trigger = "Tavnazian Safehold",
                trigger_on_event_id = {101},
            },
        },
        reward = {
            text = "Title: Dead Body\nNext: The Lost City (CoP 2-2)",
        }
    },
    ["CoP 2-2: The Lost City"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-1: An Invitation West"},
        },
        steps = {
            {
                text = "Step 1: Head to the Tavnazian Safehold top floor at K-10.\n \n" ..
                       "Talk to Despachiaire, hes behind the Walnut Door. .\n \n",
                route_to = "Tavnazian Safehold 1",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
                --zone_trigger = "Tavnazian Safehold",
                onmob_target = "Despachiaire",
                trigger_on_event_id = {102},
            },
            {
                text = "Step 2: Examine the Sewer entrance at the basement level (I-7).\n \n" ..
                       "Click to proceed when ready! \n \n",
                route_to = "Tavnazian Safehold 3",
                onmob_target = "tavnazian-safehold-sewer-entrance",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                --zone_trigger = "Tavnazian Safehold",
                trigger_on_event_id = {103},
            },
        },
        reward = {
            text = "Title: Dead Body\nNext: Distant Beliefs (CoP 2-3)",
        }
    },

    ["CoP 2-3: Distant Beliefs"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-2: The Lost City"},
        },
        steps = {
            {
                text = "Step 1: Enter Phomiuna Aqueducts via the Sewer Entrance in the basement of Tavnazian Safehold (I-7).\n \n",
                route_to = "Tavnazian Safehold 3",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                onmob_target = "tavnazian-safehold-sewer-entrance",
                zone_trigger = "Phomiuna Aqueducts",
            },
            {
                text = "Step 2: Make your way to the second map (J-3) and defeat the Minotaur, click on the highlighted ladders to get a Resident Evil ladder climb!\n \n" ..
                       "WARNING: The Minotaur has roughly triple the normal sight aggro range and will Draw In your entire party if it aggros from outside its small area, followed immediately by a TP attack.\n \n" ..
                       "Mortal Ray is a gaze attack that inflicts Doom - turn away from it fast, or attack from behind your Trust NPCs. Use Cursna or Holy Water if it lands.\n \n" ..
                       "The Minotaur will not aggro players level 58+ (reports suggest this may be higher in current builds).\n \n",
                onmob_enemy = {"Minotaur"},
                visual_zones = {
                        { zone_name = "Phomiuna Aqueducts", type = 'square', center = { x = 101.9, y = 0.0, z = -101.9 }, size = 2, floor_id = 1, colour = "yellow" },
                        { zone_name = "Phomiuna Aqueducts", type = 'square', center = { x = 21.9, y = -0.0, z = 138.1 }, size = 2, floor_id = 2, colour = "yellow" },
                },
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Minotaur"},
                    count_party_kills = true,
                    reset_on_zone_entry = false,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "J-2", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 3: Defeat Fomors in the aqueducts to obtain a Bronze Key.\n \n" ..
                       "A good spot is around (E-5), marked F on the map.\n \n" ..
                       "If your party has a Thief (main job only - sub-job will NOT work), they can pick the lock instead using Thief's Tools.\n \n",
                zone_name = "Phomiuna Aqueducts",
                onmob_enemy = {"Fomor Bard","Fomor Paladin","Fomor Monk","Fomor Ninja","Fomor Samurai","Fomor Dark Knight","Fomor Ranger","Fomor Black Mage","Fomor Red Mage"},
                items_needed = {
                    { item = "Bronze Key", quantity = 1 },
                    { item = "Thief's Tools", quantity = 1, optional = true },
                },
                trigger_on_item_obtain = {"Bronze Key", "Thief's Tools"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16, label = "F" },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 4: Make your way to the Iron Gate at (G-8) and trade the Bronze Key to open it - it breaks in the process.\n \n" ..
                       "Do NOT approach (G-8) from the south - there is a ledge you cannot climb.\n \n" ..
                       "Then examine the Wooden Ladder at (E-8) for a cutscene.\n \n",
                zone_name = "Phomiuna Aqueducts",
                onmob_target = "phomiuna-aqueducts-wooden-ladder",
                trigger_on_event_id = {35},
                visual_zones = {
                    { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -63.4, y = 0.0, z = 65.5 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -85.2, y = -0.0, z = 60.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "E-8", offsetX = 16, offsetY = 16, label = "2" },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 5: Climb up the Wooden Ladder and on the next map take the north corridor.\n \n" ..
                       "WARNING: Two Stegotaurs in the corridor have True Sight and are very difficult to evade below level 59.\n \n" ..
                       "Navigate to the southwest corner of the room and click the ??? at (F-7) to open a hidden door  - should see a yellow square on where to click from and a bigger blue sqaure where the secret door is,in the south wall.\n \n" ..
                       "Do NOT click the ??? in the east wall - it is a one-way trapdoor exit. If you fall in with no one to rescue you, you must obtain a new Bronze Key and start again.\n \n",
                zone_name = "Phomiuna Aqueducts",
                onmob_target = {"phomiuna-aqueducts-wooden-ladder","phomiuna-aqueducts-???"},
               --trigger_on_event_id = {51},
                visual_zones = {
                        { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -73.1, y = -24.0, z = 100.3 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                        { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -47.3, y = -24.0, z = 98.7 }, size = 4, direction = "down", floor_id = 3, colour = "yellow" },
                        { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -49.0, y = -24.0, z = 89.5 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                        { zone_name = "Phomiuna Aqueducts", type = 'arrow', center = { x = -60.0, y = -24.0, z = 88.2 }, size = 4, direction = "down", floor_id = 3, colour = "cyan" },
                        { zone_name = "Phomiuna Aqueducts", type = 'square', center = { x = -75.3, y = -24.0, z = 90.5 }, size = 1, floor_id = 3, colour = "yellow" },
                },
                trigger_zones = {
                        { zone_name = "Phomiuna Aqueducts", type = 'square', center = { x = -59.9, y = -24.0, z = 78.1 }, size = 6, floor_id = 3, colour = "cyan" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 3,
                    },
                },
            },
            {
                text = "Step 6: Solve the Oil Lamp puzzle in the passage at F-8.\n \n" ..
                       "Activate both lamps matching the current Vana'diel day - the correct pair is highlighted!\n \n" ..
                       "Check both lamps within a short time of each other. The lamps at either end of the hallway open outside doors and should be ignored.\n \n" ..
                       "Firesday    : Fire + Ice \n" ..
                       "Iceday      : Ice  + Wind \n" ..
                       "Windsday    : Wind + Earth\n" ..
                       "Earthsday   : Earth + Thunder\n" ..
                       "Lightningday: Thunder + Water\n" ..
                       "Watersday   : Water + Fire\n" ..
                       "Lightsday   : Light + Dark\n" ..
                       "Darksday    : Dark + Light\n \n" ..
                       "Run through the open door to the west after clicking the above combination.\n \n",
                zone_name = "Phomiuna Aqueducts",
                trigger_zones = {
                        { zone_name = "Phomiuna Aqueducts", type = 'square', center = { x = -68.8, y = -24.0, z = 60.2 }, size = 6,floor_id = 3, colour = "cyan" },
                },
                vday_targets = {
                    ["Firesday"]      = {"phomiuna-aqueducts-fire-oil-lamp",      "phomiuna-aqueducts-ice-oil-lamp"},
                    ["Iceday"]        = {"phomiuna-aqueducts-ice-oil-lamp",        "phomiuna-aqueducts-wind-oil-lamp"},
                    ["Windsday"]      = {"phomiuna-aqueducts-wind-oil-lamp",       "phomiuna-aqueducts-earth-oil-lamp"},
                    ["Earthsday"]     = {"phomiuna-aqueducts-earth-oil-lamp",      "phomiuna-aqueducts-thunder-oil-lamp"},
                    ["Lightningday"]  = {"phomiuna-aqueducts-thunder-oil-lamp",    "phomiuna-aqueducts-water-oil-lamp"},
                    ["Watersday"]     = {"phomiuna-aqueducts-water-oil-lamp",      "phomiuna-aqueducts-fire-oil-lamp"},
                    ["Lightsday"]     = {"phomiuna-aqueducts-light-oil-lamp",      "phomiuna-aqueducts-darkness-oil-lamp"},
                    ["Darksday"]      = {"phomiuna-aqueducts-darkness-oil-lamp",   "phomiuna-aqueducts-light-oil-lamp"},
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 3,
                    },
                },
            },
            {
                text = "Step 7: Pass through the Ornate Gates.\n \n" ..
                       "The second gate will trigger a cutscene. \n \n",
                onmob_target = "phomiuna-aqueducts-ornate-gate",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "F-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16},
                        },
                        zone_name = "Phomiuna Aqueducts",
                        floor_id = 3,
                    },
                },
                trigger_on_event_id = {36},
            },
            {
                text = "Step 8: Return to Tavnazian Safehold - use Escape/Warp to exit (warning: Escape may land you in Misareaux Coast instead).\n \n" ..
                       "Speak to Justinius at J-6 on the upper level (Home Point #3) to complete the mission.\n \n" ..
                       "WARNING: The following cutscene must be viewed at the game's standard 30Hz frame rate or it will glitch - Print Screen can move it along if it gets stuck.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Justinius",
                destination_highlight = {position = "J-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {113},
            },
        },
        reward = {
            text = "Next: An Eternal Melody (CoP 2-4)",
        }
    },

    ["CoP 2-4: An Eternal Melody"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-3: Distant Beliefs"},
        },
        steps = {
            {
                text = "Step 1: Head to the top floor of Tavnazian Safehold and examine the Walnut Door at (K-7) for a cutscene.\n \n" ..
                       "The Mysterious Amulet key item will be returned to you.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "tavnazian-safehold-walnut-door",
                destination_highlight = {position = "K-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {104},
            },
            {
                text = "Step 2: Speak with Justinius at J-6 to learn of Ulmia's whereabouts.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Justinius",
                destination_highlight = {position = "J-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {127},
            },
            {
                text = "Step 3: Exit Tavnazian Safehold via the southwest exit at (G-6).\n \n" ..
                       "Head to Misareaux Coast and examine the Dilapidated Gate at (I-11) for a cutscene.\n \n",
                route_to = "Misareaux Coast",
                onmob_target = "misareaux-coast-dilapidated-gate",
                destination_highlight = {position = "I-11", offsetX = 16, offsetY = 16},
                visual_zones = {
                        { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 290.0, y = 24.5, z = -388.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {5},
            },
            {
                text = "Step 4: Return to Tavnazian Safehold and walk towards the Bridge for a final cutscene to complete the mission.\n \n",
                route_to = "Tavnazian Safehold 2",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Tavnazian Safehold", type = 'square', center = { x = -0.0, y = -22.3, z = 14.2 }, size = 4, floor_id = 2, colour = "cyan" },
                },
                trigger_on_event_id = {105},
            },
        },
        reward = {
            text = "Access to Riverne - Site A01\nNext: Ancient Vows (CoP 2-5)",
        }
    },

    ["CoP 2-5: Ancient Vows"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-4: An Eternal Melody"},
        },
        steps = {
            {
                text = "Step 1: Exit Tavnazian Safehold via the northwest exit at (G-5).\n \n" ..
                       "Head to Misareaux Coast and examine the Dilapidated Gate at (F-7) for a cutscene.\n \n" ..
                       "NOTE: This is a DIFFERENT gate from CoP 2-4 - it is to the northwest. The Survival Guide puts you on the wrong side of the mountains, use Unity warp 128 to land right at it.\n \n",
                route_to = "Misareaux Coast",
                items_needed = {
                    { item = "Yellow Liquid", quantity = 1, optional = true},
                },
                onmob_target = "misareaux-coast-dilapidated-gate-f7",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 428.4, y = -15.7, z = 200.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 292.6, y = -15.5, z = 187.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 250.3, y = -15.5, z = 151.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 18.8, y = -15.1, z = 43.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -83.8, y = -16.1, z = 40.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -164.1, y = -32.1, z = 113.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -239.6, y = -32.0, z = 204.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {6},
            },
            {
                text = "Step 2: After the cutscene you will be placed next to a Spatial Displacement at (D-6).\n \n" ..
                       "Click it to enter Riverne - Site #A01. A cutscene will play on entry.\n \n",
                route_to = "Misareaux Coast",
                destination_highlight = {position = "D-6", offsetX = 16, offsetY = 16},
                onmob_target = "misareaux-coast-spatial-displacement",
                zone_trigger = "Riverne - Site #A01",
            },
            {
                text = "Step 3: Defeat Firedrakes(Highlighted Monsters!) along the way to (G-10) to collect 2 Giant Scales - you will need them at the Unstable Displacements ahead.\n \n" ..
                       "There's also a homepoint to pickup at (I-9) will which be useful for a return trip later.\n \n" ..
                       "Notes: Try and gather some Hippogryph Tailfeathers along the way for mission (CoP 4-2) whilst we are here, i'll highlight the Hippogryphs for this reason. \n \n",
                onmob_enemy = {"Firedrake","Hippogryph","Cloud Hippogryph"},
                onmob_enemy_size = 4,
                items_needed = {
                    { item = "Giant Scale", quantity = 2, on_the_way = true },
                    { item = "Hippogryph Tailfeather", quantity = 8, on_the_way = true, optional = true},
                },
                trigger_on_item_obtain = {{item = "Giant Scale", quantity = 2}},
                onmob_target = "riverne-site-a01-spatial-displacement-l8",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Riverne - Site #A01",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 4: After attaining both Giant Scales: \n \n" ..
                       "[1] At the NE corner of (G-10), trade one Giant Scale at the Unstable Displacement to grow it and pass through.\n \n" ..
                       "[2] Continue to (E-10) and trade the second Giant Scale at the Unstable Displacement there, once it grows after trading you will be able enter.\n \n" ..
                       "[3] Follow the Spatial Displacements at (D-9) NE corner \n \n" ..
                       "[4] Continue to (E-8) NE tip - the (E-8) one says 'majestic presence of a terrestrial avatar' and takes you into Monarch Linn.\n \n",
                onmob_target = {"riverne-site-a01-unstable-displacement-g10",
                                "riverne-site-a01-unstable-displacement-e10",
                                "riverne-site-a01-spatial-displacement-d9",
                                "riverne-site-a01-spatial-displacement-e8"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "E-10", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "D-9", offsetX = 16, offsetY = 16, label = "3" },
                            { position = "E-8", offsetX = 16, offsetY = 16, label = "4" },
                        },
                        zone_name = "Riverne - Site #A01",
                        floor_id = 2,
                    },
                },
                zone_trigger = "Monarch Linn",
            },
            {
                text = "Step 5: Use the Spatial Displacement to enter the Ancient Vows battlefield (cap: 99, 6 players, 30 min, buffs wear on entry).\n \n" ..
                       "Defeat 3x Mammet-19 Epsilon (~3800 HP each). They can be Slept.\n \n" ..
                       "They switch forms by changing weapons - watch for:\n \n" ..
                       "TRANSMOGRIFICATION (Hand Form) - absorbs ALL physical damage for ~30s. Call it out immediately and stop attacking.\n \n" ..
                       "MIND WALL (Staff Form) - absorbs magic ~30s. Silence the Staff Form if possible.\n \n" ..
                       "Sword Form attacks very fast - hard to maintain Utsusemi.\n \n" ..
                       "Polearm Form is slow - preferred for tanking/kiting.\n \n" ..
                       "Yellow Liquid (AH: Medicines) locks a Mammet into its current form for 30s.\n \n" ..
                       "On victory your party is teleported to South Gustaberg.\n \n" ..
                       "If you die without reraise, you will have to collect 2 more Giant Scales and navigate through the mission again so be carefu! \n \n",
                zone_name = "Monarch Linn",
                onmob_target = "monarch-linn-spatial-displacement",
                onmob_enemy = {"Mammet-19 Epsilon"},
                kill_requirement = {
                    count = 3,
                    enemies = {"Mammet-19 Epsilon"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                },
                trigger_on_event_id = {32001},
            },
        },
        reward = {
            text = "Title: Tavnazian Traveler\n1000 EXP\nNext: The Call of the Wyrmking (CoP 3-1)",
        }
    },

    ["CoP 3-1: The Call of the Wyrmking"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-5: Ancient Vows"},
        },
        steps = {
            {
                text = "Step 1: Head to Port Bastok and approach the Departures Entrance of the Air Travel Agency at (F-7) for a cutscene.\n \n" ..
                       "Tip: Use Home Point #3 in Port Bastok to land nearby.\n \n" ..
                       "Note: If the cutscene does not trigger, zone out and back in.\n \n",
                route_to = "Port Bastok",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Port Bastok", type = 'arrow', center = { x = -119.0, y = -1.0, z = -9.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {305},
            },
            {
                text = "Step 2: Head to the Metalworks and talk to Cid (H-8) for the final cutscene.\n \n",
                route_to = "Metalworks",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                onmob_target = "Cid",
                trigger_on_event_id = {845},
            },
        },
        reward = {
            text = "Next: A Vessel Without a Captain (CoP 3-2)",
        }
    },

    ["CoP 3-2: A Vessel Without a Captain"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 3-1: The Call of the Wyrmking"},
        },
        steps = {
            {
                text = "Step 1: Head to Lower Jeuno and click on the Tenshodo HQ door in Neptune's Spire (H-8) for a cutscene.\n \n" ..
                       "Tip: Use Home Point #2 in Lower Jeuno to land nearby.\n \n",
                route_to = "Lower Jeuno",
                onmob_target = "Door: Neptune's Spire",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {86},
            },
            {
                text = "Step 2: Head to Ru'Lude Gardens and approach the Audience Chamber for the final cutscene.\n \n" ..
                       "Tip: Use Home Point #1 in Ru'Lude Gardens.\n \n" ..
                       "Note: If you are on Rhapsodies mission 'Crashing Waves', you will receive that cutscene here too.\n \n",
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'square', center = { x = -0.0, y = 2.0, z = 31.0 }, size = 6, floor_id = 0, colour = "cyan" },
                },
                trigger_on_event_id = {65},
            },
        },
        reward = {
            text = "Next: The Road Forks (CoP 3-3)",
        }
    },

    ["CoP 3-3: The Road Forks"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 3-2: A Vessel Without a Captain"},
        },
        steps = {
            -- === SAN D'ORIA ROUTE ===
            {
                text = "Step 1 (San d'Oria): Note - this mission has TWO routes (San d'Oria and Windurst) that must both be completed. They can be done in any order or simultaneously.\n \n" ..
                       "Zone into Northern San d'Oria for an automatic cutscene.\n \n" ..
                       "Tip: Home Point #2 or #3 are close to the Cathedral.\n \n",
                route_to = "Northern San d'Oria",
                trigger_on_event_id = {14},
                zone_trigger = "Northern San d'Oria",
            },
            {
                text = "Step 2 (San d'Oria): Talk to Arnau (M-6) on at the far end of the Cathedral main hall.\n \n",
                route_to = "Northern San d'Oria",
                onmob_target = "Arnau",
                destination_highlight = {position = "M-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {51},
            },
            {
                text = "Step 3 (San d'Oria): Talk to Chasalvige in the Manuscript Room (end of the north-west hall).\n \n",
                route_to = "Northern San d'Oria",
                onmob_target = "Chasalvige",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {38},
            },
            {
                text = "Step 4 (San d'Oria): Head to Jugner Forest and enter Carpenters' Landing via the gate at (E-6).\n \n",
                route_to = "Jugner Forest",
                destination_highlight = {position = "E-6", offsetX = 16, offsetY = 16},
                zone_trigger = "Carpenters' Landing",
                visual_zones = {
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -450.5, y = 8.3, z = 280.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Jugner Forest", type = 'arrow', center = { x = -518.6, y = 8.0, z = 320.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 5 (San d'Oria): Find Guilloud at (H-10) beside a boulder and talk to him - this immediately spawns the Overgrown Ivy NM. Be ready to fight!\n \n",
                route_to = "Carpenters' Landing",
                onmob_target = "carpenters-landing-guilloud",
                --onmob_enemy = {"Overgrown Ivy"},
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                trigger_on_talk = "squash another worm!",
                visual_zones = {
                        { zone_name = "Carpenters' Landing", type = 'arrow', center = { x = -298.7, y = -4.1, z = -456.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Carpenters' Landing", type = 'arrow', center = { x = -249.4, y = -5.2, z = -419.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Carpenters' Landing", type = 'arrow', center = { x = -194.1, y = -5.8, z = -445.2 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Carpenters' Landing", type = 'arrow', center = { x = -133.9, y = -5.4, z = -485.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                },
            },
            {
                text = "Step 6 (San d'Oria): Defeat the Overgrown Ivy, then talk to Guilloud again.\n \n" ..
                       "Overgrown Ivy(Morbol): Very fast attack rate(hundred fists like). Spams Bad Breath at ~15percent HP. Susceptible to Head Butt stun. Tolerates Sleep after repeated casts.\n \n",
                route_to = "Carpenters' Landing",
                onmob_enemy = {"Overgrown Ivy"},
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                kill_requirement = {
                    count = 1,
                    enemies = {"Overgrown Ivy"},
                    count_party_kills = true,
                    zone = "Carpenters' Landing",
                },
            },
            {
                text = "Step 7 (San d'Oria): Talk to Guilloud (H-10) once more. \n \n",
                route_to = "Carpenters' Landing",
                onmob_target = "carpenters-landing-guilloud",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {0}
            },
            {
                text = "Step 8 (San d'Oria): Head back to Southern San d'Oria and speak to Hinaree on the second floor of the Count's Manor (B-6).\n \n" ..
                       "Tip: Home Point #4 is closest.\n \n" ..
                       "San d'Oria route complete!\n \n",
                route_to = "Southern San d'Oria",
                onmob_target = "Hinaree",
                destination_highlight = {position = "B-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {23},
            },
            -- === WINDURST ROUTE ===
            {
                text = "Step 9 (Windurst): Zone into Windurst Waters for an automatic cutscene.\n \n",
                route_to = "Windurst Waters South",
                zone_trigger = "Windurst Waters",
                trigger_on_event_id = {871},
            },
            {
                text = "Step 10 (Windurst): Talk to Ohbiru-Dohbiru in the Rhinostery right-hand room (J-9).\n \n" ..
                       "Tip: Home Point #3 is on the south map of Windurst Waters.\n \n",
                route_to = "Windurst Waters South",
                onmob_target = "Ohbiru-Dohbiru",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {872},
            },
            {
                text = "Step 11 (Windurst): Head to Windurst Walls (Home Point #1) and talk to Yoran-Oran (E-5).\n \n",
                route_to = "Windurst Walls",
                onmob_target = "Yoran-Oran",
                destination_highlight = {position = "E-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {469},
            },
            {
                text = "Step 12 (Windurst): Return to Windurst Waters and talk to Kyume-Romeh at the Timbre Timbers Tavern (F-10) near (Home Point #4). You may need to speak twice.\n \n",
                route_to = "Windurst Waters North",
                onmob_target = "Kyume-Romeh",
                destination_highlight = {position = "F-10", offsetX = 16, offsetY = 16},
                visual_zones = {
                       { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -74.0, y = -3.5, z = 16.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                },
                trigger_on_event_id = {873},
            },
            {
                text = "Step 13 (Windurst): Talk to Honoi-Gomoi to receive the Cracked Mimeo Mirror.\n \n" ..
                       "Enter via the back stairs at (E-7) - door marked 'Trader's Home'. (Home Point #3 is closest.)\n \n",
                route_to = "Windurst Waters South",
                onmob_target = "Honoi-Gomoi",
                destination_highlight = {position = "E-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                        { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -204.3, y = -2.7, z = -134.0 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -182.2, y = -3.0, z = -127.0 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -184.4, y = -4.4, z = -101.4 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -183.9, y = -10.1, z = -115.4 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Windurst Waters South", type = 'arrow', center = { x = -194.4, y = -10.1, z = -113.6 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                },
                trigger_on_event_id = {874},
            },
            {
                text = "Step 14 (Windurst): Return to Windurst Walls (Home Point #1) and talk to Yoran-Oran.\n \n" ..
                       "This removes the Cracked Mimeo Mirror. Confirm it is gone in 'Key Items Needed:' before the next step - you cannot spawn the NM with it.\n \n",
                route_to = "Windurst Walls",
                onmob_target = "Yoran-Oran",
                destination_highlight = {position = "E-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {470},
                keyitems_needed = {581},
            },
            {
                text = "Step 15 (Windurst): Travel to Attohwa Chasm.\n \n" ..
                       "Head to the eastern half of the map towards Parradamo Tor mountain. Travel up and around the north side heading eastward to the middle of the intersection at L-8 & K-8.\n \n" ..
                       "Fastest route if you haven't been here before: Unity Concord warp (level 125 section). Otherwise: Tahrongi Canyon > Maze of Shakhrami > Attohwa Chasm.\n \n",
                route_to = "Attohwa Chasm",
                zone_max_distance = 60,
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                visual_zones = {
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -73.6, y = 0.3, z = 7.9 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -33.6, y = -3.5, z = 24.4 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -46.2, y = 0.0, z = 48.3 }, size = 4, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -139.3, y = -9.7, z = 140.1 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },

                        -- Attohwa
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -58.0, y = 34.0, z = -140.6 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -43.8, y = 33.7, z = -110.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -17.6, y = 0.1, z = -219.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 64.1, y = -3.4, z = -167.1 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 119.7, y = 4.7, z = -135.6 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 146.8, y = 17.2, z = -109.9 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 160.9, y = 20.1, z = -46.3 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 163.4, y = 20.0, z = 32.1 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 177.7, y = 19.5, z = 104.7 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 218.6, y = 19.5, z = 172.8 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 268.6, y = 19.7, z = 212.3 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 362.6, y = 20.4, z = 212.0 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 396.7, y = 20.0, z = 197.4 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 465.8, y = 20.6, z = 124.1 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 519.7, y = 20.1, z = 114.4 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 524.8, y = 20.0, z = 72.5 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 508.3, y = 20.4, z = 40.4 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },

                },
                trigger_zones = {
                        { zone_name = "Attohwa Chasm", type = 'square', center = { x = 478.9, y = 20.0, z = 41.7 }, size = 1, floor_id = 0, colour = "cyan" },
                },
                onmob_target = "attohwa-chasm-loose-sand",
            },
            {
                text = "Step 16 (Windurst): Find the Loose Sand at (K-8) and click it to spawn Lioumere (Antlion NM).\n \n" ..
                       "Warning: Lioumere uses Pit Ambush on spawn - have a tank click it.\n \n" ..
                       "Lioumere resets HP if it returns to its spawn point. It will do this after using a weapon skill. Use Bind, Gravity, Sleep, or Desperate Flourish to prevent it - or hit it a couple of times to regain hate and stop it.\n \n",
                route_to = "Attohwa Chasm",
                onmob_enemy = {"Lioumere"},
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                kill_requirement = {
                    count = 1,
                    enemies = {"Lioumere"},
                    count_party_kills = true,
                    zone = "Attohwa Chasm",
                },
            },
            {
                text = "Step 17 (Windurst): Click the Loose Sand at (K-8) one more time to obtain the Mimeo Jewel - after defeating Lioumere. \n \n" ..
                       "A 30-minute timer starts!\n \n",
                route_to = "Attohwa Chasm",
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                visual_zones = {
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -73.6, y = 0.3, z = 7.9 }, size = 4, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -33.6, y = -3.5, z = 24.4 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -46.2, y = 0.0, z = 48.3 }, size = 4, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Maze of Shakhrami", type = 'arrow', center = { x = -139.3, y = -9.7, z = 140.1 }, size = 4, direction = "up", floor_id = 15, colour = "yellow" },

                        -- Attohwa
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -58.0, y = 34.0, z = -140.6 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -43.8, y = 33.7, z = -110.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = -17.6, y = 0.1, z = -219.2 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 64.1, y = -3.4, z = -167.1 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 163.5, y = 20.2, z = -107.3 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 160.9, y = 20.1, z = -46.3 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 163.4, y = 20.0, z = 32.1 }, size = 4, direction = "up", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 177.7, y = 19.5, z = 104.7 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 218.6, y = 19.5, z = 172.8 }, size = 4, direction = "ne", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 268.6, y = 19.7, z = 212.3 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 362.6, y = 20.4, z = 212.0 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 396.7, y = 20.0, z = 197.4 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 465.8, y = 20.6, z = 124.1 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },

                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 519.7, y = 20.1, z = 114.4 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 524.8, y = 20.0, z = 72.5 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 508.3, y = 20.4, z = 40.4 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },

                },
                trigger_on_keyitem_obtain = {586},
                onmob_target = "attohwa-chasm-loose-sand",
            },
            {
                text = "Step 18 (Windurst): Now lets run up Parradamo Tor (K-9) - Quickly!\n \n" ..
                       "Warning: Do NOT mount or zone with the Mimeo Jewel - it will break. (Mounting can also be used intentionally to reset the timer if you fall down the mountain.)\n \n" ..
                       "You have 30minutes to get to the top, otherwise need to kill Lioumere again for another Mimeo Jewel.\n \n" ..
                       "If you fall off, go back to Step 17 and grab another Mimeo Jewel to reset the timer(try find the arrows if you can to get yourself back as you can fall off anywhere!).\n \n" ..
                       "Once at the top of the mountain, click the Cradle of Rebirth to trigger a cutscene and obtain 3 Key Items: Mimeo Feather, Second Mimeo Feather, and Third Mimeo Feather. \n \n ",
                route_to = "Attohwa Chasm",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                zone_max_distance = 20,
                line_arrow_end = true,
                line_arrow_head_size = 0.4,
                trigger_on_event_id = {2},
                visual_zones = {
                    -- Loose Sand -> Start of Climb Paradomo Tor
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 488.2, y = 20.2, z = 38.8 }, size = 4, direction = "right", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 509.1, y = 20.0, z = 35.2 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 512.7, y = 19.9, z = 24.6 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 474.2, y = 19.9, z = 5.8 }, size = 4, direction = "nw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 451.1, y = 20.0, z = 15.5 }, size = 4, direction = "left", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 430.2, y = 20.0, z = 9.6 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 417.2, y = 20.9, z = 0.3 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 405.4, y = 20.0, z = -9.7 }, size = 4, direction = "sw", floor_id = 0, colour = "cyan" },
                    { zone_name = "Attohwa Chasm", type = 'square', center = { x = 392.1, y = 19.9, z = -20.5 }, size = 2, floor_id = 0, colour = "cyan" },
                    -- Lines up
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 391.9, y = 19.9, z = -20.5 }, stop = { x = 386.4, y = 16.6, z = -26.4 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 386.2, y = 16.5, z = -26.1 }, stop = { x = 390.5, y = 15.5, z = -20.5 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 390.8, y = 15.3, z = -20.1 }, stop = { x = 392.5, y = 11.4, z = -14.6 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 392.7, y = 11.4, z = -14.6 }, stop = { x = 390.8, y = 9.0, z = -12.0 }, colour = "cyan" , max_distance = 6 },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 390.7, y = 8.9, z = -12.1 }, stop = { x = 391.0, y = 9.2, z = -14.5 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 391.0, y = 9.2, z = -14.9 }, stop = { x = 390.1, y = 8.7, z = -17.9 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 390.2, y = 8.7, z = -17.8 }, stop = { x = 389.4, y = 8.3, z = -18.9 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 389.4, y = 8.4, z = -18.9 }, stop = { x = 384.1, y = 8.0, z = -23.7 }, colour = "cyan" , max_distance = 6 },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 383.1, y = 7.9, z = -24.0 }, stop = { x = 387.7, y = 5.9, z = -18.8 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 387.8, y = 5.9, z = -18.8 }, stop = { x = 388.7, y = 3.7, z = -15.4 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 388.8, y = 3.5, z = -15.1 }, stop = { x = 388.2, y = 1.9, z = -12.3 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 388.2, y = 1.9, z = -12.3 }, stop = { x = 386.1, y = 0.7, z = -8.7 }, colour = "cyan" ,  max_distance = 6 },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 386.2, y = 0.7, z = -8.8 }, stop = { x = 384.7, y = 0.4, z = -5.8 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 384.7, y = 0.4, z = -5.8 }, stop = { x = 384.3, y = 0.3, z = 2.0 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 384.3, y = 0.3, z = 2.0 }, stop = { x = 383.4, y = 0.1, z = 8.9 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 383.4, y = 0.1, z = 8.8 }, stop = { x = 382.3, y = 1.0, z = 13.2 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 382.2, y = 0.9, z = 13.6 }, stop = { x = 383.5, y = 0.4, z = 17.7 }, colour = "cyan" ,  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 383.6, y = 0.5, z = 17.7 }, stop = { x = 383.7, y = -0.1, z = 22.8 }, colour = "cyan" ,  max_distance = 6 },
                    -- Past first bone
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 383.7, y = 0.0, z = 23.1 }, stop = { x = 388.5, y = 0.8, z = 28.4 }, colour = "cyan",  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 388.5, y = 0.8, z = 28.4 }, stop = { x = 388.3, y = 0.5, z = 33.0 }, colour = "cyan",  max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 388.3, y = 0.5, z = 33.0 }, stop = { x = 385.8, y = 0.3, z = 36.8 }, colour = "cyan" , max_distance = 6 },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 385.0, y = 0.2, z = 37.1 }, stop = { x = 384.4, y = 0.3, z = 42.1 }, colour = "cyan",  max_distance = 6 },
                    --First drop
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 384.7, y = 0.3, z = 42.2 }, stop = { x = 388.1, y = 8.0, z = 42.8 }, colour = "cyan",  max_distance = 6  },
                    --Second drop
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 388.0, y = 7.9, z = 42.9 }, stop = { x = 387.2, y = 7.8, z = 45.6 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 387.2, y = 7.9, z = 45.9 }, stop = { x = 387.0, y = 13.1, z = 49.4 }, colour = "cyan",  max_distance = 6  },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 387.0, y = 13.1, z = 49.4 }, stop = { x = 385.9, y = 11.5, z = 52.5 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 385.9, y = 11.5, z = 52.5 }, stop = { x = 382.6, y = 7.8, z = 59.2 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 382.6, y = 7.8, z = 59.2 }, stop = { x = 380.3, y = 4.8, z = 63.4 }, colour = "cyan",  max_distance = 6  },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 380.1, y = 4.9, z = 63.5 }, stop = { x = 370.4, y = 2.8, z = 65.6 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 370.5, y = 2.9, z = 65.6 }, stop = { x = 370.9, y = 8.2, z = 67.8 }, colour = "cyan",  max_distance = 6  },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 370.9, y = 8.2, z = 67.8 }, stop = { x = 367.8, y = 8.1, z = 68.5 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 367.4, y = 8.1, z = 68.5 }, stop = { x = 356.8, y = 7.9, z = 68.3 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 356.8, y = 7.9, z = 68.3 }, stop = { x = 354.4, y = 7.9, z = 67.9 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 354.4, y = 7.9, z = 67.9 }, stop = { x = 351.8, y = 8.0, z = 65.3 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 351.8, y = 8.0, z = 65.3 }, stop = { x = 352.0, y = 7.7, z = 63.0 }, colour = "cyan",  max_distance = 6  },

                    --second bone up
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 351.9, y = 7.7, z = 63.3 }, stop = { x = 352.5, y = 7.0, z = 59.6 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 352.5, y = 7.0, z = 59.6 }, stop = { x = 351.3, y = 5.9, z = 54.7 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 343.6, y = 3.5, z = 49.6 }, stop = { x = 339.6, y = 1.8, z = 48.3 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 350.8, y = 5.7, z = 53.8 }, stop = { x = 347.2, y = 4.9, z = 51.9 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 347.2, y = 4.9, z = 51.9 }, stop = { x = 343.1, y = 3.2, z = 49.4 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 339.6, y = 1.8, z = 48.2 }, stop = { x = 333.3, y = -1.3, z = 49.8 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 333.3, y = -1.3, z = 49.8 }, stop = { x = 332.3, y = -3.1, z = 55.0 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 332.1, y = -3.2, z = 55.9 }, stop = { x = 329.1, y = -4.0, z = 56.1 }, colour = "cyan",  max_distance = 6  },

                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 329.3, y = -4.0, z = 55.9 }, stop = { x = 323.0, y = -7.2, z = 59.2 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 323.0, y = -7.2, z = 59.2 }, stop = { x = 314.8, y = -7.3, z = 59.3 }, colour = "cyan",  max_distance = 6  },
                    { zone_name = "Attohwa Chasm", type = 'line', start = { x = 314.8, y = -7.3, z = 59.3 }, stop = { x = 308.3, y = -8.3, z = 56.8 }, colour = "cyan",  max_distance = 6  },

                    -- drop
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 308.3, y = -8.3, z = 57.0 }, stop = { x = 307.1, y = -8.5, z = 56.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 305.6, y = -8.7, z = 55.4 }, stop = { x = 304.9, y = -10.5, z = 52.6 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 304.9, y = -10.5, z = 52.6 }, stop = { x = 302.0, y = -9.7, z = 52.6 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 302.0, y = -9.7, z = 52.6 }, stop = { x = 300.1, y = -8.2, z = 54.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 300.1, y = -8.2, z = 54.0 }, stop = { x = 300, y = -3.74, z = 56.1 }, colour = "cyan",  max_distance = 6  },

                    -- drop

                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 300.0, y = -3.7, z = 56.4 }, stop = { x = 296.2, y = -3.6, z = 59.1 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 296.2, y = -3.6, z = 59.1 }, stop = { x = 294.1, y = -3.4, z = 63.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 293.7, y = -3.3, z = 64.1 }, stop = { x = 290.7, y = -3.6, z = 65.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 290.7, y = -3.6, z = 65.5 }, stop = { x = 286.1, y = -5.5, z = 63.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 286.1, y = -5.5, z = 63.4 }, stop = { x = 281.1, y = -7.4, z = 59.3 }, colour = "cyan",  max_distance = 6  },
                    -- drop

                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 281.1, y = -7.4, z = 59.3 }, stop = { x = 279.7, y = -7.4, z = 59.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 279.7, y = -7.4, z = 59.3 }, stop = { x = 276.2, y = -7.3, z = 60.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 276.2, y = -7.3, z = 60.0 }, stop = { x = 274.8, y = -0.3, z = 64.7 }, colour = "cyan",  max_distance = 6  },

                    --route

                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 274.5, y = -0.1, z = 64.7 }, stop = { x = 264.0, y = 2.1, z = 66.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 264.0, y = 2.1, z = 66.3 }, stop = { x = 260.8, y = 3.4, z = 65.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 260.8, y = 3.4, z = 65.2 }, stop = { x = 259.9, y = 4.1, z = 63.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 259.9, y = 4.1, z = 63.3 }, stop = { x = 260.2, y = 6.9, z = 53.1 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 260.2, y = 6.9, z = 53.1 }, stop = { x = 257.7, y = 8.5, z = 48.1 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 257.7, y = 8.5, z = 48.1 }, stop = { x = 252.7, y = 8.3, z = 44.4 }, colour = "cyan",  max_distance = 6  },

                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 252.7, y = 8.3, z = 44.4 }, stop = { x = 250.7, y = 8.1, z = 38.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 250.7, y = 8.1, z = 38.2 }, stop = { x = 245.5, y = 8.3, z = 33.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 245.5, y = 8.3, z = 33.0 }, stop = { x = 245.1, y = 8.4, z = 28.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 245.1, y = 8.4, z = 28.4 }, stop = { x = 253.2, y = 7.6, z = 20.3 }, colour = "cyan",  max_distance = 6  },

                        --drop
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 253.2, y = 7.6, z = 20.3 }, stop = { x = 254.5, y = 7.8, z = 12.7 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 254.5, y = 7.8, z = 12.7 }, stop = { x = 253.1, y = 7.8, z = 7.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 253.1, y = 7.8, z = 7.0 }, stop = { x = 250.7, y = 16.0, z = 7.3 }, colour = "cyan",  max_distance = 6  },

                        --route
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 250.7, y = 16.0, z = 7.3 }, stop = { x = 249.0, y = 15.9, z = 3.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 249.0, y = 15.9, z = 3.2 }, stop = { x = 248.7, y = 15.9, z = -1.6 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 248.7, y = 15.9, z = -1.6 }, stop = { x = 253.2, y = 16.1, z = -8.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 253.2, y = 16.1, z = -8.0 }, stop = { x = 267.1, y = 16.4, z = -12.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 267.1, y = 16.4, z = -12.9 }, stop = { x = 270.0, y = 16.5, z = -17.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 270.0, y = 16.5, z = -17.4 }, stop = { x = 269.4, y = 15.8, z = -23.1 }, colour = "cyan",  max_distance = 6  },
                        --{ zone_name = "Attohwa Chasm", type = 'line', start = { x = 269.4, y = 15.8, z = -23.1 }, stop = { x = 261.6, y = 16.3, z = -29.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 269.4, y = 15.8, z = -22.8 }, stop = { x = 268.5, y = 15.6, z = -24.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 268.5, y = 15.6, z = -24.9 }, stop = { x = 264.0, y = 16.4, z = -29.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 264.0, y = 16.4, z = -29.3 }, stop = { x = 261.6, y = 16.3, z = -29.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 261.6, y = 16.3, z = -29.9 }, stop = { x = 253.3, y = 16.6, z = -30.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 253.3, y = 16.6, z = -30.0 }, stop = { x = 250.1, y = 16.1, z = -31.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 250.1, y = 16.1, z = -31.4 }, stop = { x = 248.1, y = 16.1, z = -35.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 248.1, y = 16.1, z = -35.4 }, stop = { x = 248.7, y = 16.0, z = -45.7 }, colour = "cyan",  max_distance = 6  },

                        --cont route
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 248.6, y = 16.1, z = -45.5 }, stop = { x = 246.1, y = 15.9, z = -54.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 246.1, y = 15.9, z = -54.2 }, stop = { x = 249.7, y = 15.7, z = -61.6 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 249.7, y = 15.7, z = -61.6 }, stop = { x = 248.2, y = 13.5, z = -57.7 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 248.2, y = 13.5, z = -57.7 }, stop = { x = 247.4, y = 11.2, z = -54.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 247.4, y = 11.2, z = -54.3 }, stop = { x = 249.3, y = 8.9, z = -51.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 249.3, y = 8.9, z = -51.4 }, stop = { x = 250.1, y = 8.6, z = -58.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 250.1, y = 8.6, z = -58.3 }, stop = { x = 256.4, y = 7.9, z = -63.7 }, colour = "cyan",  max_distance = 6  },

                        -- cont route
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 256.4, y = 7.9, z = -63.7 }, stop = { x = 251.7, y = 4.7, z = -57.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 251.7, y = 4.7, z = -57.4 }, stop = { x = 251.5, y = 2.6, z = -53.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 251.5, y = 2.6, z = -53.5 }, stop = { x = 254.1, y = 0.5, z = -47.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 254.1, y = 0.5, z = -47.5 }, stop = { x = 255.5, y = 0.3, z = -38.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 255.5, y = 0.3, z = -38.4 }, stop = { x = 254.6, y = -0.3, z = -35.8 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 254.6, y = -0.3, z = -35.8 }, stop = { x = 258.7, y = -0.3, z = -33.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 258.7, y = -0.3, z = -33.3 }, stop = { x = 267.8, y = -0.5, z = -28.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 267.8, y = -0.5, z = -28.9 }, stop = { x = 271.9, y = -2.2, z = -19.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 272.0, y = -2.2, z = -19.3 }, stop = { x = 270.7, y = -3.1, z = -13.2 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 270.7, y = -3.1, z = -13.2 }, stop = { x = 264.5, y = -3.9, z = -11.9 }, colour = "cyan",  max_distance = 6  },

                        --{ zone_name = "Attohwa Chasm", type = 'line', start = { x = 264.5, y = -3.9, z = -11.9 }, stop = { x = 261.1, y = -6.8, z = -4.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 264.5, y = -3.8, z = -11.6 }, stop = { x = 262.9, y = -5.4, z = -6.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 262.9, y = -5.4, z = -6.4 }, stop = { x = 261.1, y = -6.6, z = -4.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 261.1, y = -6.8, z = -4.4 }, stop = { x = 260.2, y = -7.3, z = 4.8 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 260.2, y = -7.3, z = 4.8 }, stop = { x = 263.4, y = -8.4, z = 12.6 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 263.4, y = -8.4, z = 12.6 }, stop = { x = 265.3, y = -8.3, z = 20.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 265.3, y = -8.3, z = 20.3 }, stop = { x = 261.4, y = -8.2, z = 24.2 }, colour = "cyan",  max_distance = 6  },

                        -- finish
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 261.4, y = -8.2, z = 24.2 }, stop = { x = 258.9, y = -3.4, z = 24.4 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 258.9, y = -3.4, z = 24.4 }, stop = { x = 255.3, y = -3.3, z = 27.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 255.3, y = -3.3, z = 27.3 }, stop = { x = 255.7, y = -5.0, z = 33.0 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 255.7, y = -5.0, z = 33.0 }, stop = { x = 260.7, y = -7.4, z = 38.5 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 260.7, y = -7.4, z = 38.5 }, stop = { x = 261.4, y = -7.5, z = 43.7 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 261.4, y = -7.5, z = 43.7 }, stop = { x = 266.3, y = -10.6, z = 53.3 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 266.3, y = -10.6, z = 53.3 }, stop = { x = 277.9, y = -14.2, z = 51.9 }, colour = "cyan",  max_distance = 6  },
                        { zone_name = "Attohwa Chasm", type = 'line', start = { x = 277.9, y = -14.2, z = 51.9 }, stop = { x = 283.0, y = -18.4, z = 44.6 }, colour = "cyan",  max_distance = 6  },

                        --arrows to ???
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 285.7, y = -20.2, z = 38.5 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 308.1, y = -24.4, z = 19.2 }, size = 4, direction = "se", floor_id = 0, colour = "cyan" },
                        { zone_name = "Attohwa Chasm", type = 'arrow', center = { x = 319.5, y = -26.0, z = -3.1 }, size = 4, direction = "down", floor_id = 0, colour = "cyan" },

                },
                onmob_target = "attohwa-chasm-cradle-of-rebirth",
            },
            {
                text = "Step 19 (Windurst): Return to Windurst Walls (Home Point #1)\n \n" ..
                       "Talk to Yoran-Oran to hand over the Mimeo Feathers.\n \n",
                route_to = "Windurst Walls",
                onmob_target = "Yoran-Oran",
                destination_highlight = {position = "E-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {471},
            },
            {
                text = "Step 20 (Windurst): Head to Port Windurst and talk to Yujuju (M-6) \n \n" ..
                       "Can use Home Point #3 and run south just outside the Air Travel Agency.\n \n",
                route_to = "Port Windurst",
                onmob_target = "Yujuju",
                destination_highlight = {position = "M-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {592},
            },
            {
                text = "Step 21 (Windurst): Return to Windurst Waters \n \n" ..
                       "Talk to Tosuka-Porika (G-8, Northern Map) inside the east Optistery.\n \n",
                route_to = "Windurst Waters North",
                onmob_target = "Tosuka-Porika",
                destination_highlight = {position = "G-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {875},
            },
            {
                text = "Step 22 (Windurst): Return to Windurst Walls (Home Point #1) and talk to Yoran-Oran.\n \n" ..
                       "Windurst route complete!\n \n",
                route_to = "Windurst Walls",
                onmob_target = "Yoran-Oran",
                destination_highlight = {position = "E-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {472},
            },
            -- === COMPLETION ===
            {
                text = "Step 23 [Completion]: Both routes complete! Head to the Metalworks and talk to Cid (H-8).\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {847},
            },
        },
        reward = {
            text = "Next: Tending Aged Wounds (CoP 3-4)",
        }
    },

    -----------------------------------
    -- CoP 3-4: Tending Aged Wounds
    -----------------------------------
    ["CoP 3-4: Tending Aged Wounds"] = {
        steps = {
            {
                text = "Step 1: Zone into Lower Jeuno to trigger a cutscene automatically.\n \n" ..
                       "Use Home Point #2 in Lower Jeuno if available.\n \n",
                route_to = "Lower Jeuno",
                zone_trigger = "Lower Jeuno",
                trigger_on_event_id = {70},
            },
            {
                text = "Step 2: Inspect the door of the Tenshodo Headquarters (Neptune's Spire) in Lower Jeuno.\n \n" ..
                       "The door is at (J-7) - look for Neptune's Spire, second door in!\n \n",
                route_to = "Lower Jeuno",
                onmob_target = "Door: Neptune's Spire",
                destination_highlight = {position = "J-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {22},
            },
        },
        reward = {
            text = "Next: Darkness Named (CoP 3-5)",
        }
    },

    -----------------------------------
    -- CoP 3-5: Darkness Named
    -----------------------------------
    ["CoP 3-5: Darkness Named"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 3-4: Tending Aged Wounds"},
        },
        steps = {
            {
                text = "Step 1: Head to Upper Jeuno (Home Point #3) and speak to Monberaux (G-10) in the Infirmary for a cutscene.\n \n" ..
                       "Your Key Item: Mysterious Amulet will be removed.\n \n",
                route_to = "Upper Jeuno",
                onmob_target = "Monberaux",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {82},
            },
            {
                text = "Step 2: Head to Beaucedine Glacier and enter Pso'Xja via the tower at (H-8) - the one nearest to the Survival Guide book.\n \n" ..
                       "Sneak and Invisible are recommended inside.\n \n",
                route_to = "Beaucedine Glacier",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_trigger = "Pso'Xja",
                onmob_target = "beaucedine-glacier-iron-grate-h8",
            },
            {
                text = "Step 3: Kill Diremites inside Pso'Xja to obtain a chip. \n \n" ..
                       "Any colour works: Gray Chip, Carmine Chip, or Cyan Chip. Each character needs one.\n \n" ..
                       "13 Diremites en route to The Shrouded Maw drop Gray Chips.\n \n",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "J-12", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Pso'Xja",
                        floor_id = 8,
                    },
                },
                onmob_enemy = {"Diremite","Snow Lizards"},
                onmob_enemy_size = 4,
                items_needed = {
                    { display = "Gray/Carmine/Cyan Chip", alternatives = {"Gray Chip", "Carmine Chip", "Cyan Chip"} },
                },
                trigger_on_item_obtain = {"Gray Chip", "Carmine Chip", "Cyan Chip"},
            },
            {
                text = "Step 4: Head to Lower Jeuno (Home Point #2) and speak to Ghebi Damomohe inside Neptune's Spire (I-7).\n \n" ..
                       "Speak to her first for a dialogue cutscene, then trade her your chip.\n \n" ..
                       "You will receive 500 Gil and the Key Item: Pso'Xja Pass.\n \n",
                route_to = "Lower Jeuno",
                onmob_target = "Ghebi Damomohe",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_keyitem_obtain = {604},
                keyitems_needed = {604},
                --trigger_on_event_id = {52},
            },
            {
                text = "Step 5: Return to Beaucedine Glacier and re-enter Pso'Xja via the tower at (H-8) - the one nearest to the Survival Guide book.\n \n",
                route_to = "Beaucedine Glacier",
                onmob_target = "beaucedine-glacier-iron-grate-h8",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                zone_trigger = "Pso'Xja",
            },
            {
                text = "Step 6: Navigate through Pso'Xja to The Shrouded Maw - follow the yellow arrows!\n \n" ..
                       "Pass through the smoke walls in order: Red -> Black/Purple -> Red -> Black/Purple.\n \n" ..
                       "In the fourth area, take the elevator down. Go left down the stairs to find the Stone Gate - your Pso'Xja Pass opens it automatically.\n \n" ..
                       "Home Point #1 is just behind the gate. Zone into The Shrouded Maw for a cutscene.\n \n",
                onmob_target = "pso-xja-stone-gate",
                visual_zones = {
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -137.1, y = 0.2, z = 12.1 }, size = 4, direction = "nw", floor_id = 8, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -149.7, y = 0.0, z = 38.3 }, size = 4, direction = "up", floor_id = 8, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -26.1, y = 0.2, z = 230.5 }, size = 4, direction = "right", floor_id = 9, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -4.6, y = 0.2, z = 230.1 }, size = 4, direction = "right", floor_id = 9, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 107.0, y = 0.2, z = 70.3 }, size = 4, direction = "left", floor_id = 10, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 89.9, y = 0.2, z = 67.6 }, size = 4, direction = "down", floor_id = 10, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -29.4, y = 0.2, z = -50.6 }, size = 4, direction = "right", floor_id = 11, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -0.8, y = 0.0, z = -50.1 }, size = 4, direction = "right", floor_id = 11, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -30.0, y = 0.2, z = 70.0 }, size = 4, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -28.9, y = 0.0, z = 34.4 }, size = 4, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -31.1, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 16, colour = "yellow" },

                        -- down elevator
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -20.0, y = 32.2, z = 28.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -21.3, y = 32.0, z = 60.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -59.7, y = 40.0, z = 36.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -60.0, y = 40.0, z = 7.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        -- highlights = {
                        --     { position = "H-7", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 8,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        -- highlights = {
                        --     { position = "H-7", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 9,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        -- highlights = {
                        --     { position = "H-7", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 10,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        -- highlights = {
                        --     { position = "H-7", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 11,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        -- highlights = {
                        --     { position = "H-7", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 16,
                    },
                },
                zone_trigger = "The Shrouded Maw",
                trigger_on_event_id = {2},
            },
            {
                text = "Step 7: Examine the Memento Circle and enter the Darkness Named battlefield.\n \n" ..
                       "Boss: Diabolos (buffs wear on entry, no EXP loss from KO)\n \n" ..
                       "- Noctoshield: Defense buff on Diabolos - dispel if possible.\n" ..
                       "- Ultimate Terror: AoE Terror - spreads fear, followed immediately by Camisado.\n" ..
                       "- Nightmare: Triggers at a random HP% (25-75%) - drops random floor tiles. Players that fall through land in a pit with aggressive Diremites.\n" ..
                       "- Camisado: Always follows Nightmare or Ultimate Terror - single target draw-in.\n" ..
                       "- Below 35 PERCENT HP: Diabolos gains Regain - expect rapid TP move spam.\n" ..
                       "- Immune to: Sleep, Petrify, Silence, Slow, Terror.\n \n" ..
                       "On victory you receive the Title: Transient Dreamer.\n \n",
                zone_name = "The Shrouded Maw",
                onmob_enemy = {"Diabolos"},
                --onmob_target = "the-shrouded-maw-memento-circle",
                kill_requirement = {
                    count = 1,
                    enemies = {"Diabolos"},
                    count_party_kills = true,
                },
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 8: Return to Upper Jeuno (Home Point #3). \n \n" ..
                       "Speak to Monberaux (G-10) in the Infirmary to complete the mission.\n \n",
                route_to = "Upper Jeuno",
                onmob_target = "Monberaux",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {75},
            },
        },
        reward = {
            text = "Title: Transient Dreamer\n1000 EXP\nAccess to Dreamworld Dynamis\nNext: Sheltering Doubt (CoP 4-1)",
        }
    },

    -----------------------------------
    -- CoP 4-1: Sheltering Doubt
    -----------------------------------
    ["CoP 4-1: Sheltering Doubt"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 3-5: Darkness Named"},
        },
        steps = {
            {
                text = "Step 1: Zone into Tavnazian Safehold (Home Point #3) for an automatic cutscene.\n \n" ..
                       "The Tavnazian Safehold Auction House will now become accessible.\n \n",
                route_to = "Tavnazian Safehold 1",
                zone_trigger = "Tavnazian Safehold",
                trigger_on_event_id = {107},
            },
            {
                text = "Step 2: Head to the top floor and speak to Despachiaire (K-9) behind the Walnut Door.\n \n" ..
                       "There are multiple Walnut Doors - the correct one is at (K-9), with Fouagine standing beside the entrance.\n \n" ..
                       "You may need to speak to him twice to trigger the cutscene involving Tenzen.\n \n" ..
                       "Optional: Speak to Justinius (J-6) on the same floor for additional dialogue.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Despachiaire",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {108},
            },
            {
                text = "Step 3: Head to Misareaux Coast and examine the Dilapidated Gate at (I-11) to complete the mission.\n \n" ..
                       "Exit Tavnazian Safehold via the southwest exit at (G-6) to reach Misareaux Coast.\n \n" ..
                       "Note: If the cutscene appears bugged and won't continue, press 'Print Screen' to nudge it along.\n \n",
                route_to = "Misareaux Coast",
                onmob_target = "misareaux-coast-dilapidated-gate",
                destination_highlight = {position = "I-11", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 290.0, y = 24.5, z = -388.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {7},
            },
        },
        reward = {
            text = "Next: The Savage (CoP 4-2)",
        }
    },

    -----------------------------------
    -- CoP 4-2: The Savage
    -----------------------------------
    ["CoP 4-2: The Savage"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 4-1: Sheltering Doubt"},
            {category = "Quests",   subfile = "Tavnazian Safehold", name = "Fly High", recommended = true},
        },
        steps = {
            {
                text = "Step 1: Head to Misareaux Coast and examine the Dilapidated Gate at (F-7) for a cutscene.\n \n" ..
                       "Exit Tavnazian Safehold via the southwest exit at (G-6) to reach Misareaux Coast.\n \n" ..
                       "Tip: Unity warp 128 to Misareaux Coast puts you right at the gate.\n \n",
                route_to = "Misareaux Coast",
                onmob_target = "misareaux-coast-dilapidated-gate-f7",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 428.4, y = -15.7, z = 200.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 292.6, y = -15.5, z = 187.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 250.3, y = -15.5, z = 151.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = 18.8, y = -15.1, z = 43.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -83.8, y = -16.1, z = 40.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -164.1, y = -32.1, z = 113.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Misareaux Coast", type = 'arrow', center = { x = -239.6, y = -32.0, z = 204.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {8},
            },
            {
                text = "Step 2: After the cutscene you will be placed next to a Spatial Displacement.\n \n" ..
                       "Click it to enter Riverne - Site #B01.\n \n",
                route_to = "Misareaux Coast",
                destination_highlight = {position = "D-6", offsetX = 16, offsetY = 16},
                onmob_target = "misareaux-coast-spatial-displacement",
                zone_trigger = "Riverne - Site #B01",
            },
            {
                text = "Step 3: You are now in Riverne - Site #B01. Collect Giant Scales dropped by Wyverns in the area.\n \n" ..
                       "You need at least 1 Giant Scale (2 if you want to unlock the geomagnetic fount).\n \n" ..
                       "Warning: Blazedrakes will sight aggro at any level, and Hippogryphs have truesight - avoid them!\n \n" ..
                       "Trade a Giant Scale to the Unstable Displacement at (G-8)/(H-8) to proceed.\n \n",
                images = {
                        {
                            width = 512,
                            height = 512,
                            state = 3,
                            highlights = {
                                { position = "G-8", offsetX = 16, offsetY = 16 },
                            },
                            zone_name = "Riverne - Site #B01",
                            floor_id = 2,
                        },
                },
                onmob_target = {"riverne-site-b01-spatial-displacement-m9", "riverne-site-b01-unstable-displacement-g8"},
                onmob_enemy = {"Pyrodrake", "Blazedrake","Ignidrake"},
                zone_max_distance = 60,
                onmob_enemy_size = 4,
                visual_zones = {
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 519.9, y = 0.2, z = -647.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 479.5, y = 0.0, z = -605.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 470.6, y = 0.9, z = -542.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },

                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 438.6, y = -0.2, z = -516.8 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 350.1, y = 0.4, z = -478.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 294.6, y = 0.7, z = -485.7 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 250.9, y = 0.3, z = -518.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 205.8, y = 0.1, z = -520.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 169.6, y = 0.3, z = -528.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 121.8, y = 1.4, z = -552.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 80.4, y = 1.0, z = -538.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 53.1, y = 0.7, z = -525.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 6.1, y = 1.8, z = -500.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -44.5, y = 0.4, z = -471.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -54.5, y = -0.2, z = -429.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                },
                items_needed = {
                    { item = "Giant Scale", quantity = 1, on_the_way = true },
                },
                trigger_on_item_obtain = {{item = "Giant Scale", quantity = 1}},
                --zone_trigger = "Monarch Linn",
            },
            {
                text = "Step 4: Trade a Giant Scale to the Unstable Displacement at (G-8)/(H-8) to proceed.\n \n" ..
                       "Next, go to (F-6) and interact with the Spatial Displacement. \n \n" ..
                       "Run south to (E-7) for the final Spatial Displacement in this area.\n \n" ..
                       "Continue south to zone into Monarch Linn at (F-8)! \n \n",
                images = {
                        {
                            width = 512,
                            height = 512,
                            state = 4,
                            highlights = {
                                { position = "G-8", offsetX = 16, offsetY = 16 },
                                { position = "E-8", offsetX = 16, offsetY = 16, label = "ML"  },
                            },
                            zone_name = "Riverne - Site #B01",
                            floor_id = 2,
                        },
                },
                onmob_target = {"riverne-site-b01-spatial-displacement-m9",
                                "riverne-site-b01-unstable-displacement-g8",
                                "riverne-site-b01-spatial-displacement-f6",
                                "riverne-site-b01-spatial-displacement-e7",
                                "riverne-site-b01-spatial-displacement-e8"},
                zone_max_distance = 60,
                visual_zones = {
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 519.9, y = 0.2, z = -647.1 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 479.5, y = 0.0, z = -605.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 470.6, y = 0.9, z = -542.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },

                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 438.6, y = -0.2, z = -516.8 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 350.1, y = 0.4, z = -478.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 294.6, y = 0.7, z = -485.7 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 250.9, y = 0.3, z = -518.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 205.8, y = 0.1, z = -520.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },

                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 169.6, y = 0.3, z = -528.2 }, size = 4, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 121.8, y = 1.4, z = -552.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 80.4, y = 1.0, z = -538.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 53.1, y = 0.7, z = -525.3 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = 6.1, y = 1.8, z = -500.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -44.5, y = 0.4, z = -471.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -54.5, y = -0.2, z = -429.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                        --after giant scale trade
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -193.1, y = 34.5, z = 675.1 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -216.3, y = 32.9, z = 709.2 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -239.3, y = 32.3, z = 728.3 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -295.7, y = 33.7, z = 751.7 }, size = 4, direction = "nw", floor_id = 2, colour = "yellow" },

                        -- to monarch linn island
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -475.3, y = 2.2, z = 765.3 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -489.7, y = 0.5, z = 732.6 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -505.4, y = -0.5, z = 705.3 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -512.2, y = 0.4, z = 691.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -505.6, y = -0.5, z = 668.5 }, size = 4, direction = "se", floor_id = 2, colour = "yellow" },

                        -- on monarch linn island
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -512.6, y = -19.9, z = 553.8 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                        { zone_name = "Riverne - Site #B01", type = 'arrow', center = { x = -528.8, y = -19.5, z = 511.2 }, size = 4, direction = "sw", floor_id = 2, colour = "yellow" },
                },
                zone_trigger = "Monarch Linn",
            },
            {
                text = "Step 5: Enter the battlefield and defeat Ouryu (The Savage).\n \n" ..
                       "Bring 2-6 Mistmelts (obtained via the Fly High quest).\n \n" ..
                       "Ouryu is IMMUNE to earth-based magic and effects.\n \n" ..
                       "Ouryu surrenders at ~30% HP - you only need to inflict ~6000 damage total.\n \n" ..
                       "[PHASES:]\n" ..
                       "Ouryu alternates ground and air every 2 minutes:\n" ..
                       "Ground: physical damage attacks - melee works normally.\n" ..
                       "Air: earth elemental damage, ignores shadows/Invincible/physical reduction - melee MISSES. Use Dragoon Jumps or Mistmelt to force back down.\n \n" ..
                       "[KEY ATTACKS:]\n" ..
                       "Horrid Roar: Dispels up to 15 buffs including food AND resets enmity - expect hate reset.\n" ..
                       "Absolute Terror: Inflicts Terror, halting all actions until it wears.\n" ..
                       "Spike Flail: AoE physical, only used if someone behind has hate - stay in front.\n \n" ..
                       "Invincible may activate between 75-95% HP. High resistance to Stun.\n \n" ..
                       "After winning, use the Spatial Displacement to leave Monarch Linn back to Misareaux Coast.\n \n",
                trigger_on_event_id = {32001},
                onmob_target = "monarch-linn-spatial-displacement",
                onmob_enemy = {"Ouryu"},
                onmob_enemy_size = 6,
            },
            {
                text = "Step 6: Head to Tavnazian Safehold and speak to Justinius (J-6) on the upper level for a cutscene.\n \n" ..
                       "Use Home Point #3 to warp directly to Tavnazian Safehold.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Justinius",
                destination_highlight = {position = "J-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {110},
            },
        },
        reward = {
            text = "1500 EXP\nTitle: Mist Melter or Nag'molada's Underling\nNext: The Secrets of Worship (CoP 4-3)",
        }
    },

    ["CoP 4-3: The Secrets of Worship"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 4-2: The Savage"},
            {category = "Quests",   subfile = "Tavnazian Safehold", name = "A Hard Day's Knight", recommended = true},
        },
        steps = {
            {
                text = "Step 1: Speak to Justinius (J-6) on the upper floor of Tavnazian Safehold.\n \n" ..
                       "Note: You may get an Uninvited Guests cutscene or a Monarch Linn Patrol Permit dialogue - speak to him again to get the mission dialogue.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Justinius",
                destination_highlight = {position = "J-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {131},
            },
            {
                text = "Step 2: Click the Walnut Door (K-7) just up the small ramp from Justinius for a cutscene.\n \n" ..
                       "Parelbriaux stands nearby - the door is right next to him.\n \n",
                route_to = "Tavnazian Safehold 1",
                destination_highlight = {position = "K-7", offsetX = 16, offsetY = 16},
                onmob_target = "tavnazian-safehold-walnut-door",
                trigger_on_event_id = {111},
            },
            {
                text = "Step 3: Head to the Iron Gate at (G-4) in the northern part of Misareaux Coast for a cutscene.\n \n" ..
                       "This grants you access to Sacrarium.\n" ..
                       "Fastest route: Use the Undulating Confluence Home Point in Misareaux Coast.\n \n" ..
                       "Note: For the 'Old Professor Mariselle' fight it is reccomended to bring some Poison Potions, best grab some before you head out off the Auction House. Advise your friends! \n \n",
                route_to = "Misareaux Coast",
                destination_highlight = {position = "G-4", offsetX = 16, offsetY = 16},
                onmob_target = "misareaux-coast-iron-gate",
                trigger_on_event_id = {9},
                items_needed = {
                    { item = "Poison Potion", quantity = 2, optional = true },
                },
            },
            {
                text = "BIG Step 4: Enter Sacrarium and make your way to the locked door at (H-6) on the second map.\n \n" ..
                       "CAUTION: The maze walls on Map 1 shift with each Vana'diel day - always go to (J-10) as you can access everywhere from there.\n \n" ..
                       "Note: If playing SOLO take both keys for yourself, and head back to Tavnazian Safehold to use the Temple Knight Key (from A Hard Day's Knight quest npc ) for solo entry - no keys needed.\n \n" ..
                       "If playing as a group, make sure 1 person has a Coral Crest Key and another has a Sealion Crest Key before proceeding to the locked door.\n \n" ..
                       "[KEYS NEEDED:]\n \n" ..
                       "Coral Crest Key: Dropped by Fomors(Marked) inside Sacrarium.\n \n" ..
                       "Sealion Crest Key: Dropped by Keremet(K on map - Corse NM at the far end of the locked room).\n" ..
                       "- Kill all 12 Skeletons in hallways(Marked) (J-7/8) and (J-8/9) before pulling Keremet!\n" ..
                       "- Keremet uses Danse Macabre (charm) - charmed players MUST be slept.\n \n" ..
                       "[UNLOCKING THE DOOR at H-7 Map 2:]\n \n" ..
                       "Trade Coral Crest Key to the small keyhole and Sealion Crest Key to the large keyhole simultaneously.\n" ..
                       "Coral Crest Key WILL break. Sealion Crest Key is reusable.\n" ..
                       "Tip: Temple Knight Key (from A Hard Day's Knight quest) allows solo entry - no keys needed.\n \n" ..
                       "After unlocking, click the Wooden Gate (G-8) for a cutscene.\n \n",
                --zone_trigger = "Sacrarium",
                trigger_on_event_id = {6},
                onmob_enemy = {"Fomor Bard",
                               "Fomor Ranger",
                               "Fomor Ninja",
                               "Fomor Monk",
                               "Fomor Samurai",
                               "Fomor Red Mage",
                               "Fomor Summoner",
                               "Fomor Dark Knight",
                               "Fomor Paladin",
                               "Fomor Thief",
                               "Fomor Warrior",
                               "Fomor Beastmaster",
                               "Fomor Dragoon",
                               "Fomor Black Mage",
                               "Azren Kuguza",
                               "Azren Kuba",
                               "Keremet"},
                items_needed = {
                    { item = "Coral Crest Key", quantity = 1, on_the_way = true },
                    { item = "Sealion Crest Key", quantity = 1, on_the_way = true },
                },
                keyitems_needed = {2506},
                zone_max_distance = 20,
                onmob_target = {"misareaux-coast-iron-gate",
                                "sacrarium-wooden-gate-1",
                                "sacrarium-wooden-gate-2",
                                "sacrarium-large-keyhole",
                                "sacrarium-small-keyhole",
                                "sacrarium-wooden-gate-g8"},
                visual_zones = {
                    -- Lightsday and Watersday
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -181.1, y = -8.0, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.5, y = -4.0, z = 56.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.1, y = 0.0, z = 35.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.0, y = 0.0, z = 25.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -97.0, y = 0.0, z = 15.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.8, y = 0.0, z = 5.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.8, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.4, y = 0.0, z = -19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.1, y = 0.0, z = -18.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -54.9, y = 0.0, z = -23.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.5, y = 0.0, z = -19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.2, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.6, y = 0.0, z = -36.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --to A(not needed)
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -18.1, y = 0.0, z = -35.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -6.2, y = 0.0, z = -24.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -25.3, y = 0.0, z = -15.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -34.6, y = 0.0, z = 19.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    -- Windsday and Darksday
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -179.9, y = -8.0, z = 59.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -174.8, y = -8.0, z = 19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -137.6, y = 0.0, z = -20.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.3, y = 0.0, z = -20.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = -4.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.3, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.3, y = 0.0, z = 4.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.4, y = 0.0, z = 19.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -64.3, y = 0.0, z = 5.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -55.4, y = 0.0, z = 23.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.3, y = 0.0, z = 20.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -34.5, y = 0.0, z = 21.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    --To A not needed
                    --{ check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -15.5, y = 0.0, z = 34.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -7.3, y = 0.0, z = 24.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.0, y = 0.0, z = 14.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.5, y = 0.0, z = 3.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -22.7, y = 0.0, z = -4.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -18.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.2, y = 0.0, z = -36.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Firesday and Iceday
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.5, y = -8.0, z = 59.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -139.3, y = -8.0, z = 59.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = 35.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.7, y = 0.0, z = 20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.3, y = 0.0, z = 5.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.6, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -86.1, y = 0.0, z = -5.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = -19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -76.0, y = 0.0, z = -20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -61.6, y = 0.0, z = -35.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = -20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -19.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.3, y = 0.0, z = -5.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -5.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -24.6, y = 0.0, z = -15.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -24.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = -36.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Earthsday and Lightningday
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.0, y = -8.0, z = 60.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -177.7, y = -8.0, z = 19.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -138.4, y = 0.0, z = -19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -115.1, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -104.9, y = 0.0, z = -34.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -95.7, y = 0.0, z = -15.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.6, y = 0.0, z = -21.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.4, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.5, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -74.9, y = 0.0, z = 20.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -60.9, y = 0.0, z = 35.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = 34.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.8, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.7, y = 0.0, z = 19.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = 4.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -5.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -6.5, y = 0.0, z = -14.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.4, y = 0.0, z = -25.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = -35.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --wooden gate (g8)
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 98.3, y = -0.0, z = 20.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 59.3, y = -0.0, z = 9.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                },
                images = {
                        {
                            width = 512,
                            height = 512,
                            state = 4,
                            highlights = {
                                -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                { position = "J-10", offsetX = 16, offsetY = 16, label = "B" },
                            },
                            zone_name = "Sacrarium",
                            floor_id = 1,
                        },
                        {
                            width = 512,
                            height = 512,
                            state = 4,
                            highlights = {
                                { position = "L-8", offsetX = 16, offsetY = 16, label = "K" },
                                { position = "H-6", offsetX = 16, offsetY = 16, label = "D" },
                            },
                            zone_name = "Sacrarium",
                            floor_id = 2,
                        },
                },
            },
            {
                text = "Step 5: Search the six classroom ??? spots on the second map to spawn Old Professor Mariselle.\n \n" ..
                       "He spawns in rooms that contain Fomors - check each ??? on the desks.\n \n" ..
                       "Note: Farm another Coral Crest Key if you do NOT have the SOLO key item, as we will need to get back through the locked door after the fight.\n \n" ..
                       "Make sure it is a different person than the one who has the Sealion Crest Key as it will require 2 people.\n \n" ..
                       "Ignore this if you have the 'Temple Knight Key'. \n \n" ..
                       "[FIGHT NOTES:]\n" ..
                       "Do NOT kill Mariselle's Pupils - he will resummon them endlessly.\n" ..
                       "He casts Sleepga II repeatedly - bring Poison Potions!\n" ..
                       "He teleports around the room every ~20-30 seconds.\n" ..
                       "DO NOT use Tractor or the fight resets.\n \n" ..
                       "After defeating him, click any ??? in any classroom to receive the Key Item: Reliquiarium Key.\n",
                zone_max_distance = 20,
                visual_zones = {
                    -- Lightsday and Watersday
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -181.1, y = -8.0, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.5, y = -4.0, z = 56.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.1, y = 0.0, z = 35.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.0, y = 0.0, z = 25.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -97.0, y = 0.0, z = 15.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.8, y = 0.0, z = 5.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.8, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.4, y = 0.0, z = -19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.1, y = 0.0, z = -18.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -54.9, y = 0.0, z = -23.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.5, y = 0.0, z = -19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.2, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.6, y = 0.0, z = -36.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --to A(not needed)
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -18.1, y = 0.0, z = -35.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -6.2, y = 0.0, z = -24.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -25.3, y = 0.0, z = -15.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -34.6, y = 0.0, z = 19.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    -- Windsday and Darksday
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -179.9, y = -8.0, z = 59.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -174.8, y = -8.0, z = 19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -137.6, y = 0.0, z = -20.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.3, y = 0.0, z = -20.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = -4.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.3, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.3, y = 0.0, z = 4.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.4, y = 0.0, z = 19.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -64.3, y = 0.0, z = 5.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -55.4, y = 0.0, z = 23.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.3, y = 0.0, z = 20.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -34.5, y = 0.0, z = 21.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    --To A not needed
                    --{ check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -15.5, y = 0.0, z = 34.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -7.3, y = 0.0, z = 24.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.0, y = 0.0, z = 14.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.5, y = 0.0, z = 3.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -22.7, y = 0.0, z = -4.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -18.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.2, y = 0.0, z = -36.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Firesday and Iceday
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.5, y = -8.0, z = 59.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -139.3, y = -8.0, z = 59.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = 35.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.7, y = 0.0, z = 20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.3, y = 0.0, z = 5.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.6, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -86.1, y = 0.0, z = -5.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = -19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -76.0, y = 0.0, z = -20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -61.6, y = 0.0, z = -35.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = -20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -19.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.3, y = 0.0, z = -5.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -5.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -24.6, y = 0.0, z = -15.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -24.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = -36.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Earthsday and Lightningday
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.0, y = -8.0, z = 60.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -177.7, y = -8.0, z = 19.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -138.4, y = 0.0, z = -19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -115.1, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -104.9, y = 0.0, z = -34.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -95.7, y = 0.0, z = -15.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.6, y = 0.0, z = -21.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.4, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.5, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -74.9, y = 0.0, z = 20.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -60.9, y = 0.0, z = 35.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = 34.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.8, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.7, y = 0.0, z = 19.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = 4.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -5.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -6.5, y = 0.0, z = -14.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.4, y = 0.0, z = -25.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = -35.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --wooden gate (g8)
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 98.3, y = -0.0, z = 20.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 59.3, y = -0.0, z = 9.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                },

                onmob_enemy = {"Fomor Bard",
                               "Fomor Ranger",
                               "Fomor Ninja",
                               "Fomor Monk",
                               "Fomor Samurai",
                               "Fomor Red Mage",
                               "Fomor Summoner",
                               "Fomor Dark Knight",
                               "Fomor Paladin",
                               "Fomor Thief",
                               "Fomor Warrior",
                               "Fomor Beastmaster",
                               "Fomor Dragoon",
                               "Fomor Black Mage",
                               "Old Professor Mariselle"},
                onmob_target = {"misareaux-coast-iron-gate",
                                "sacrarium-wooden-gate-f10",
                                "sacrarium-classroom-???-f11",
                                "sacrarium-classroom-???-g11",
                                "sacrarium-wooden-gate-h10",
                                "sacrarium-classroom-???-h11",
                                "sacrarium-wooden-gate-h6",
                                "sacrarium-classroom-???-h5",
                                "sacrarium-wooden-gate-g6",
                                "sacrarium-classroom-???-g5",
                                "sacrarium-wooden-gate-f6",
                                "sacrarium-classroom-???-f5"
                            },
                kill_requirement = {
                    count = 1,
                    enemies = {"Old Professor Mariselle"},
                    count_party_kills = true,
                    display_only = true,
                },
                images = {
                            {
                                width = 512,
                                height = 512,
                                state = 5,
                                highlights = {
                                    -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                    { position = "J-10", offsetX = 16, offsetY = 16, label = "B" },
                                },
                                zone_name = "Sacrarium",
                                floor_id = 1,
                            },
                            {
                                width = 512,
                                height = 512,
                                state = 5,
                                highlights = {
                                    { position = "F-5", offsetX = 16, offsetY = 16 },
                                    { position = "G-5", offsetX = 16, offsetY = 16 },
                                    { position = "H-5", offsetX = 16, offsetY = 16 },
                                    { position = "F-11", offsetX = 16, offsetY = 16 },
                                    { position = "G-11", offsetX = 16, offsetY = 16 },
                                    { position = "H-11", offsetX = 16, offsetY = 16 },
                                },
                                zone_name = "Sacrarium",
                                floor_id = 2,
                        },
                },
                trigger_on_keyitem_obtain = {582},
            },
            {
                text = "Step 6: Click the Wooden Gate (G-8) again for the final cutscene to complete the mission.\n \n" ..
                       "Note: you will have to unlock the door again at (H-6), I've marked the Fomor's for the Coral Crest Key if you still need it. \n \n",
                trigger_on_event_id = {5},
                zone_max_distance = 20,
                visual_zones = {
                    -- Lightsday and Watersday
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -181.1, y = -8.0, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.5, y = -4.0, z = 56.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -101.1, y = 0.0, z = 35.5 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.0, y = 0.0, z = 25.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -97.0, y = 0.0, z = 15.7 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.8, y = 0.0, z = 5.0 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.8, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.4, y = 0.0, z = -19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.1, y = 0.0, z = -18.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -54.9, y = 0.0, z = -23.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.5, y = 0.0, z = -19.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.2, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Lightsday", "Watersday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.6, y = 0.0, z = -36.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --to A(not needed)
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -18.1, y = 0.0, z = -35.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -6.2, y = 0.0, z = -24.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -25.3, y = 0.0, z = -15.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -34.6, y = 0.0, z = 19.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    -- { check_day = {"Lightsday", "Watersday"},zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    -- Windsday and Darksday
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -179.9, y = -8.0, z = 59.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -174.8, y = -8.0, z = 19.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -137.6, y = 0.0, z = -20.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -114.3, y = 0.0, z = -20.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = -4.1 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -98.3, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.3, y = 0.0, z = 4.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -75.4, y = 0.0, z = 19.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -64.3, y = 0.0, z = 5.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -55.4, y = 0.0, z = 23.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.3, y = 0.0, z = 20.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -34.5, y = 0.0, z = 21.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },

                    --To A not needed
                    --{ check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = 38.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -15.5, y = 0.0, z = 34.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -7.3, y = 0.0, z = 24.9 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.0, y = 0.0, z = 14.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.5, y = 0.0, z = 3.9 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -22.7, y = 0.0, z = -4.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -18.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Windsday", "Darksday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.2, y = 0.0, z = -36.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Firesday and Iceday
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.5, y = -8.0, z = 59.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -139.3, y = -8.0, z = 59.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.2, y = 0.0, z = 35.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -85.7, y = 0.0, z = 20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.3, y = 0.0, z = 5.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -100.6, y = 0.0, z = -4.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -86.1, y = 0.0, z = -5.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = -19.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -76.0, y = 0.0, z = -20.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -61.6, y = 0.0, z = -35.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = -20.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -35.0, y = 0.0, z = -19.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.3, y = 0.0, z = -5.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -5.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -24.6, y = 0.0, z = -15.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -5.7, y = 0.0, z = -24.1 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Firesday", "Iceday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -20.1, y = 0.0, z = -36.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    -- Earthsday and Lightningday
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -180.0, y = -8.0, z = 60.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -177.7, y = -8.0, z = 19.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -138.4, y = 0.0, z = -19.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -115.1, y = 0.0, z = -21.4 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -104.9, y = 0.0, z = -34.9 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -95.7, y = 0.0, z = -15.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.6, y = 0.0, z = -21.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.4, y = 0.0, z = -4.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -99.5, y = 0.0, z = 4.3 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -84.9, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -74.9, y = 0.0, z = 20.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -60.9, y = 0.0, z = 35.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -45.3, y = 0.0, z = 34.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -44.8, y = 0.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -36.7, y = 0.0, z = 19.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = 4.2 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.8, y = 0.0, z = -5.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -6.5, y = 0.0, z = -14.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -25.4, y = 0.0, z = -25.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { check_day = {"Earthsday", "Lightningday"}, zone_name = "Sacrarium", type = 'arrow', center = { x = -19.9, y = 0.0, z = -35.8 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },

                    --wooden gate (g8)
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 98.3, y = -0.0, z = 20.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Sacrarium", type = 'arrow', center = { x = 59.3, y = -0.0, z = 9.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },

                },

                onmob_enemy = {"Fomor Bard",
                               "Fomor Ranger",
                               "Fomor Ninja",
                               "Fomor Monk",
                               "Fomor Samurai",
                               "Fomor Red Mage",
                               "Fomor Summoner",
                               "Fomor Dark Knight",
                               "Fomor Paladin",
                               "Fomor Thief",
                               "Fomor Warrior",
                               "Fomor Beastmaster",
                               "Fomor Dragoon",
                               "Fomor Black Mage"},
                onmob_target = {"misareaux-coast-iron-gate",
                                "sacrarium-wooden-gate-1",
                                "sacrarium-wooden-gate-2",
                                "sacrarium-large-keyhole",
                                "sacrarium-small-keyhole",
                                "sacrarium-wooden-gate-g8"},
                images = {
                            {
                                width = 512,
                                height = 512,
                                state = 6,
                                highlights = {
                                    -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                    { position = "J-10", offsetX = 16, offsetY = 16, label = "B" },
                                },
                                zone_name = "Sacrarium",
                                floor_id = 1,
                            },
                            {
                                width = 512,
                                height = 512,
                                state = 6,
                                highlights = {
                                    { position = "G-8", offsetX = 16, offsetY = 16, label = 'D' },
                                },
                                zone_name = "Sacrarium",
                                floor_id = 2,
                        },
                },
            },
        reward = {
            text = "Key Item: Reliquiarium Key\nAccess to Sacrarium\nTitle: The Lost One\nNext: Slanderous Utterings (CoP 4-4)",
            }
        },
    },

    ["CoP 4-4: Slanderous Utterings"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 4-3: The Secrets of Worship"},
        },
        steps = {
            {
                text = "Step 1: Speak with Despachiaire in Tavnazian Safehold (K-9/K-10).\n \n" ..
                       "Use Home Point #3 to warp directly to Tavnazian Safehold.\n \n" ..
                       "A cutscene will play automatically when you enter the area near him.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Despachiaire",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {112},
            },
            {
                text = "Step 2: Enter Sealion's Den via the entrance at H-9 on the lower level of Tavnazian Safehold.\n \n" ..
                       "Head to Home Point #2 and descend to the lower level - Sealion's Den is at H-9.\n \n" ..
                       "Inspect the Iron Gate inside at H-6 for the final cutscene to complete the mission.\n \n" ..
                       "Optional: Sueleen, near the gate, will comment on the mission.\n \n",
                route_to = "Sealion's Den",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
                onmob_target = "sealions-den-iron-gate",
                trigger_on_event_id = {13},
            },
        },
        reward = {
            text = "Title: The Lost One\nNext: The Enduring Tumult of War (CoP 5-1)",
        }
    },

    -----------------------------------
    -- CoP 5-1: The Enduring Tumult of War
    -----------------------------------
    ["CoP 5-1: The Enduring Tumult of War"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 4-4: Slanderous Utterings"},
        },
        steps = {
            {
                text = "Step 1: Head to Port Bastok for a cutscene that begins Chapter 5.\n \n" ..
                       "The cutscene triggers automatically on zone-in.\n \n" ..
                       "Optional pre-cutscenes: Despachiaire in Tavnazian Safehold (K-10), Chasalvige in North San d'Oria (L-6), and Anoki in Port San d'Oria (H-6).\n \n",
                route_to = "Port Bastok",
                zone_trigger = "Port Bastok",
                trigger_on_event_id = {306},
            },
            {
                text = "Step 2: Speak to Cid on the second floor of Metalworks (H-8) for a cutscene.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {849},
            },
            {
                text = "Step 3: Head to Beaucedine Glacier and enter Pso'Xja at (F-7) for a cutscene.\n \n" ..
                       "Use the Iron Grate at (F-7) - marked 5 - the tower to the south of the zone.\n \n" ..
                       "Note: Use the survival guide/outpost warp to Fauregandi and follow the arrows from (H-9)! \n \n",
                route_to = "Beaucedine Glacier",
                onmob_target = "beaucedine-glacier-iron-grate-f7",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16, label = "5"},
                zone_trigger = "Pso'Xja",
                trigger_on_event_id = {1},
                zone_max_distance = 55,
                visual_zones = {
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -4.7, y = -59.8, z = -89.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 12.3, y = -59.6, z = -38.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 6.2, y = -59.6, z = 26.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 3.6, y = -59.8, z = 87.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -108.0, y = -79.9, z = 87.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -57.1, y = -79.1, z = 80.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -18.9, y = -80.7, z = 57.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -22.9, y = -79.9, z = 11.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -50.5, y = -80.7, z = -25.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -96.8, y = -79.8, z = -79.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -103.8, y = -80.0, z = -119.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -141.2, y = -80.1, z = -138.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -178.8, y = -79.5, z = -111.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -180.8, y = -87.0, z = -62.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -197.3, y = -99.9, z = -6.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -252.4, y = -99.6, z = 21.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 4: Follow the path forward (do NOT drop into any holes) to the Stone Door.\n \n" ..
                       "Check the Stone Door to spawn Nunyunuwi - defeat it to proceed.\n \n" ..
                       "Nunyunuwi has ~3,500 HP with strong Auto-Regen. Any job around level 75 can handle it.\n \n",
                zone_name = "Pso'Xja",
                onmob_enemy = {"Nunyunuwi"},
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Nunyunuwi"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                trigger_on_event_id = {69, 70},
                visual_zones = {
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -329.9, y = 0.2, z = 288.3 }, size = 4, direction = "up", floor_id = 12, colour = "yellow" },
                },
                onmob_target = "pso-xja-stone-door-h8",
                images = {
                            {
                                width = 512,
                                height = 512,
                                state = 4,
                                highlights = {
                                    -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                    { position = "H-7", offsetX = 16, offsetY = 16 },
                                },
                                zone_name = "Pso'Xja",
                                floor_id = 12,
                            },
                },
            },
            {
                text = "Step 5: Check the Stone Door again to move onward, then take the elevator down.\n \n" ..
                       "WARNING: Cast Sneak before descending if under level 50. Do NOT cast magic or rest while on the elevator.\n \n" ..
                       "At the bottom, follow the hallway to the next Stone Door and check it to zone into Promyvion-Vahzl.\n \n" ..
                       "A cutscene plays on entry and you receive the Key Item: Light of Vahzl, completing the mission.\n \n",
                images = {
                            {
                                width = 512,
                                height = 512,
                                state = 5,
                                highlights = {
                                    -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                    { position = "H-7", offsetX = 16, offsetY = 16 },
                                },
                                zone_name = "Pso'Xja",
                                floor_id = 12,
                            },
                            {
                                width = 512,
                                height = 512,
                                state = 5,
                                highlights = {
                                    -- { position = "J-7", offsetX = 16, offsetY = 16, label = "A" },
                                    { position = "F-8", offsetX = 16, offsetY = 16 },
                                },
                                zone_name = "Pso'Xja",
                                floor_id = 15,
                            },
                },
                visual_zones = {
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = -359.1, y = 48.0, z = 350.1 }, size = 4, direction = "left", floor_id = 15, colour = "yellow" },
                },
                onmob_target = "pso-xja-stone-door-g7",
                trigger_on_keyitem_obtain = 593,
            },
        },
        reward = {
            text = "Key Item: Light of Vahzl\nNext: Desires of Emptiness (CoP 5-2)",
        }
    },

    -----------------------------------
    -- CoP 5-2: Desires of Emptiness
    -----------------------------------
    ["CoP 5-2: Desires of Emptiness"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 5-1: The Enduring Tumult of War"},
        },
        steps = {
            {
                text = "Step 1: Travel to Beaucedine Glacier and enter Pso'Xja at (F-7) - same route as CoP 5-1.\n \n" ..
                       "Use the Survival Guide warp to Fauregandi and follow the arrows from (H-9).\n \n" ..
                       "Inside Pso'Xja, interact with the Stone Door portal to be teleported into Promyvion-Vahzl.\n \n" ..
                       "Tip: If you've previously cleared any Memory Flux gates, the portal will warp you directly to your furthest unlocked island!\n \n",
                route_to = "Beaucedine Glacier",
                onmob_target = "beaucedine-glacier-iron-grate-f7",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16, label = "5"},
                zone_trigger = "Promyvion - Vahzl",
                zone_max_distance = 55,
                visual_zones = {
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -4.7, y = -59.8, z = -89.3 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 12.3, y = -59.6, z = -38.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 6.2, y = -59.6, z = 26.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 3.6, y = -59.8, z = 87.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -108.0, y = -79.9, z = 87.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -57.1, y = -79.1, z = 80.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -18.9, y = -80.7, z = 57.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -22.9, y = -79.9, z = 11.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -50.5, y = -80.7, z = -25.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -96.8, y = -79.8, z = -79.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -103.8, y = -80.0, z = -119.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -141.2, y = -80.1, z = -138.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -178.8, y = -79.5, z = -111.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -180.8, y = -87.0, z = -62.4 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -197.3, y = -99.9, z = -6.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -252.4, y = -99.6, z = 21.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 2: [Island 1] Sneak/Invisible does NOT work ,all mobs are True Sight.\n \n" ..
                       "WARNING: Idle Wanderers, Woeful Weepers, and Livid Seethers aggro to level 99 - avoid them!\n \n" ..
                       "Defeat the Memory Receptacle(marked on map/game) to unlock the Memory Stream portal, then use it to advance to Island 2.\n \n" ..
                       "Can either be at (I-8) or (H-12), and if portal doesnt appear after killing you can check the other location! \n \n",
                zone_name = "Promyvion - Vahzl",
                trigger_on_event_id = {32, 33},
                onmob_enemy = "Memory Receptacle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-8",  offsetX = 16, offsetY = 16 },
                            { position = "H-12", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 3: [Island 2] Defeat the Memory Receptacle \n \n" ..
                       "This will unlock the Memory Stream portal - either at (F-5) or (F-6), then use it to advance to Island 3.\n \n",
                zone_name = "Promyvion - Vahzl",
                trigger_on_event_id = {30, 31},
                onmob_enemy = "Memory Receptacle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-5",  offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            -- Island 3: Memory Flux (Propagator)
            {
                text = "Step 4: [Island 3] Find the green Memory Flux gate. \n \n" ..
                       "Interact with it at (J-8)!\n \n" ..
                       "You will see: 'You sense a dark, empty presence...' - Propagator (Gorger) has spawned.\n \n",
                trigger_on_talk = "You sense a dark, empty presence...",
                onmob_target = "promyvion-vahzl-memory-flux-j8",
                zone_max_distance = 55,
                visual_zones = {
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 421.8, y = 0.0, z = -261.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 399.7, y = 0.0, z = -250.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 364.6, y = 0.0, z = -245.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 341.6, y = 0.0, z = -242.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 321.0, y = 0.0, z = -236.9 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 305.9, y = 0.0, z = -221.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 289.2, y = 0.0, z = -205.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 272.5, y = 0.0, z = -188.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 258.1, y = 0.0, z = -170.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 233.4, y = 0.0, z = -144.4 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 207.7, y = 0.0, z = -117.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 197.3, y = 0.0, z = -92.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 193.8, y = 0.0, z = -62.0 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 5: [Island 3] Defeat Propagator.\n \n" ..
                       "- Fission: Spawns Offspring adds - all die when Propagator is killed. Use Terroanima when it uses Fission to buy time.\n" ..
                       "- Vanity Drive: Directional AoE - stay behind the boss.\n" ..
                       "- Stygian Flatus: AoE Paralyze - cast Barparalyzra before engaging.\n" ..
                       "- Spirit Absorption: Drains ~200 HP, blinkable with 1-2 shadows.\n" ..
                       "- Promyvion Barrier: Defense boost - dispel if possible.\n" ..
                       "- Quadratic Continuum: Single target damage.\n \n",
                onmob_enemy = {"Propagator"},
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Propagator"},
                    count_party_kills = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 6: [Island 3] Examine the Memory Flux gate (J-8) again to receive the cutscene.\n \n" ..
                       "IMPORTANT: This cutscene is mandatory - you cannot enter the Spire without it!\n \n",
                onmob_target = "promyvion-vahzl-memory-flux-j8",
                trigger_on_event_id = {51},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 7: [Island 3] Defeat the Memory Receptacle to unlock the Memory Stream \n \n" ..
                       "These are located at (K-8), (K-11), (J-10), (L-8) to advance to Island 4.\n \n",
                zone_name = "Promyvion - Vahzl",
                onmob_enemy = {"Memory Receptacle"},
                onmob_enemy_size = 4,
                trigger_on_event_id = {35, 36, 37, 38},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                            { position = "L-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            -- Island 4: Memory Flux (Solicitor)
            {
                text = "Step 8: [Island 4] Find the green Memory Flux gate (M-6) and interact with it.\n \n" ..
                       "You will see: 'You sense a dark, empty presence...' - Solicitor has spawned.\n \n",
                zone_name = "Promyvion - Vahzl",
                onmob_target = "promyvion-vahzl-memory-flux-m6",
                trigger_on_talk = "You sense a dark, empty presence...",
                visual_zones =   {
                    { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 273.3, y = -0.2, z = 143.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 304.2, y = 0.0, z = 151.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 348.6, y = -0.3, z = 145.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 389.4, y = 0.0, z = 145.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 9: [Island 4] Defeat Solicitor.\n \n" ..
                       "- Brain Spike: Single-target damage.\n" ..
                       "- Carousel: AoE damage.\n" ..
                       "- Promyvion Brume: AoE damage, Poison, and resets hate.\n" ..
                       "- Empty Crush: Single-target damage.\n" ..
                       "- Impalement: Single-target damage (Throat Stab mechanics - this will leave the player on 5percent HP be careful ).\n \n" ..
                       "Gravity helps keep healers safe.\n \n",
                onmob_enemy = {"Solicitor"},
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Solicitor"},
                    count_party_kills = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 10: [Island 4] Examine the Memory Flux gate again to receive the cutscene.\n \n",
                zone_name = "Promyvion - Vahzl",
                trigger_on_event_id = {52},
                onmob_target = "promyvion-vahzl-memory-flux-m6",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 11: [Island 4] Defeat the Memory Receptacle to unlock the Memory Stream. \n \n" ..
                       "These are located at (N-4), (N-7), and (J-7) to advance to Island 5.\n \n",
                onmob_enemy = {"Memory Receptacle"},
                onmob_enemy_size = 4,
                trigger_on_event_id = {34, 39, 40},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "N-4", offsetX = 16, offsetY = 16 },
                            { position = "N-7", offsetX = 16, offsetY = 16 },
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            -- Island 5: Memory Flux (Ponderer)
            {
                text = "Step 12: [Island 5] Find the green Memory Flux gate (D-6) and interact with it.\n \n" ..
                       "You will see: 'You sense a dark, empty presence...' - Ponderer has spawned.\n \n",
                trigger_on_talk = "You sense a dark, empty presence...",
                onmob_target = "promyvion-vahzl-memory-flux-d6",
                zone_max_distance = 55,
                visual_zones = {
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = 27.9, y = 0.0, z = -10.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -18.6, y = 0.0, z = 1.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -45.1, y = 0.0, z = 20.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -98.6, y = -0.0, z = 19.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -134.0, y = 0.0, z = 14.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -157.3, y = 0.0, z = 14.4 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -179.9, y = 0.0, z = 11.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -203.0, y = 0.0, z = 13.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -226.2, y = 0.0, z = 15.8 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -249.3, y = 0.0, z = 18.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -272.5, y = 0.0, z = 20.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -290.1, y = 0.0, z = 24.0 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -314.6, y = 0.0, z = 56.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -316.3, y = 0.0, z = 86.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -319.8, y = 0.0, z = 126.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 13: [Island 5] Defeat Ponderer.\n \n" ..
                       "- Shadow Spread: AoE Sleep, Curse, Blind - Poison Potions highly recommended. If everyone is asleep, it stops attacking for ~10 seconds.\n" ..
                       "- Negative Whirl: Medium-high AoE damage + Slow, strips shadows.\n" ..
                       "- Winds of Promyvion: Erases a single debuff from itself.\n" ..
                       "- Stygian Vapor: Short range AoE Plague.\n" ..
                       "- Trinary Tap: Absorbs up to 3 buffs from a single target - don't eat defense food near it.\n" ..
                       "- Trinary Absorption: Absorbs ~200-300 HP, spams at ~20% HP - have Hysteroanima ready. Utsusemi blocks it; Third Eye does not.\n \n",
                zone_name = "Promyvion - Vahzl",
                onmob_enemy = {"Ponderer"},
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Ponderer"},
                    count_party_kills = true,
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 14: [Island 5] Examine the Memory Flux gate again to receive the cutscene.\n \n",
                onmob_target = "promyvion-vahzl-memory-flux-d6",
                trigger_on_event_id = {53},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        highlights = {
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 15: [Island 5] Proceed directly to the Spire of Vahzl entrance.\n \n",
                zone_trigger = "Spire of Vahzl",
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -330.3, y = 0.0, z = 132.6 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -307.8, y = 0.0, z = 88.6 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -284.6, y = 0.0, z = 70.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -247.3, y = -0.2, z = 63.2 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -226.4, y = 0.0, z = 44.6 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -200.0, y = 0.0, z = 21.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -172.4, y = 0.0, z = 0.9 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -163.6, y = 0.0, z = -9.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -159.9, y = 0.0, z = -36.7 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                        { zone_name = "Promyvion - Vahzl", type = 'arrow', center = { x = -140.2, y = 0.0, z = -55.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 15,
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Promyvion - Vahzl",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Step 16: [Spire of Vahzl] Buffs wear on entry. Examine the Web of Recollections to begin the battlefield (30 min limit).\n \n" ..
                       "Three bosses: Procreator (Gorger), Cumulator (Craver), Agonizer (Thinker).\n \n" ..
                       "They join the fight in alphabetical order based on who you attack first:\n" ..
                       "- Attack Procreator - Agonizer joins   -> Cumulator last.\n" ..
                       "- Attack Cumulator  - Procreator joins -> Agonizer last.\n" ..
                       "- Attack Agonizer   - Cumulator joins  -> Procreator last.\n \n" ..
                       "A boss won't join if you one-shot the current one from above 20 percent. Each has a random element - look for the coloured flame.\n \n" ..
                       "On victory you are warped to Beaucedine Glacier (F-7) for a cutscene.\n \n",
                onmob_enemy = {"Procreator", "Cumulator", "Agonizer"},
                onmob_enemy_size = 6,
                kill_requirement = {
                    count = 3,
                    enemies = {"Procreator", "Cumulator", "Agonizer"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                trigger_on_event_id = {206},
            },
            {
                text = "Step 17: Speak to Cid on the second floor of Bastok - Metalworks (H-8) to complete the mission and begin Three Paths (CoP 5-3).\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {850},
            },
        },
        reward = {
            text = "Mission Complete!\nNext: Three Paths (CoP 5-3)",
        }
    },
    -----------------------------------
    -- CoP 5-3: Three Paths
    -----------------------------------
    ["CoP 5-3: Three Paths"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 5-2: Desires of Emptiness"},
        },
        steps = {
            -- === INTRODUCTION ===
            {
                text = "Step 1: All three sub-paths must be completed (in any order). You can work on them simultaneously.\n \n" ..
                       "Talk to Cid at Metalworks (H-8). He outlines the three paths:\n" ..
                       "- Tenzen's Path: Seek out the tower in Pso'Xja\n" ..
                       "- Ulmia's Path: Find the girl Prishe spoke of in San d'Oria\n" ..
                       "- Louverance's Path: Investigate the Movalpolos underworld\n \n" ..
                       "This guide covers them in order: Tenzen -> Ulmia -> Louverance.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {851},
            },
            -- === TENZEN'S PATH ===
            {
                text = "Step 2: [Tenzen] Head to La Theine Plateau and examine the ??? at (G-6) - same spot as 'I Can Hear a Rainbow' (Carbuncle's Ruby quest).\n \n" ..
                       "Fastest route: Teleport-Holla (Holla Crag), Survival Guide, or Unity Concord warp.\n \n" ..
                       "Make sure this cutscene appears in your mission log - it is required for the Pso'Xja Avatar Gate to trigger in the next step.\n \n",
                route_to = "La Theine Plateau",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                onmob_target = "la-theine-plateau-???-g6",
                trigger_on_event_id = {203},
            },
            {
                text = "Step 3: [Tenzen] Enter Pso'Xja via the J-8 tower 1 (the 16-floor tower) \n \n" ..
                       "Use Fauregandi Survival Guide or Outpost Warp and run through Beaucedine Glacier.\n \n",
                route_to = "Beaucedine Glacier",
                zone_max_distance = 55,
                onmob_target = "beaucedine-glacier-iron-grate-j8",
                visual_zones = {
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -33.6, y = -59.9, z = -121.1 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -62.1, y = -54.9, z = -107.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -46.2, y = -39.9, z = -202.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 10.7, y = -40.2, z = -194.0 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 19.7, y = -40.0, z = -161.9 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 32.5, y = -40.6, z = -140.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 59.8, y = -40.0, z = -117.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 79.9, y = -39.8, z = -102.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 134.6, y = -40.5, z = -75.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 140.4, y = -40.1, z = -45.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 122.5, y = -40.0, z = -2.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 73.6, y = -32.4, z = 20.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 106.9, y = -26.3, z = 21.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 138.8, y = -20.7, z = 20.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 176.9, y = -19.2, z = 2.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 167.2, y = -20.2, z = -53.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 146.0, y = -19.7, z = -113.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 118.2, y = -19.6, z = -147.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 66.1, y = -15.3, z = -181.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 111.5, y = -5.3, z = -182.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 143.2, y = -0.1, z = -182.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 190.8, y = 0.0, z = -188.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 234.8, y = 0.1, z = -196.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 266.6, y = 0.5, z = -199.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 298.7, y = 0.9, z = -201.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 314.7, y = 0.1, z = -202.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 348.3, y = 0.4, z = -201.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 346.4, y = 0.6, z = -150.7 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 334.6, y = 0.3, z = -95.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 306.4, y = 0.2, z = -61.8 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 280.9, y = 1.0, z = -20.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                },
                zone_trigger = "Pso'Xja",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {3},
            },
            {
                text = "Step 4: [Tenzen] Navigate 16 Stone Doors in four sections. Each door pops a Gargoyle NM - defeat it and pass through within 25 seconds.\n \n" ..
                       "Door sections and aggro to manage before popping each NM:\n" ..
                       "- 1-4:   Maze Lizards (non-aggressive - safe to pop immediately).\n" ..
                       "- 5-8:   Blubber Eyes (sound aggro) and Cryptonberries (sight aggro).\n" ..
                       "- 9-12:  Camazotz (sound aggro), Magic Millstones (magic aggro), Snolls (ice weather only; magic and sight aggro).\n" ..
                       "- 13-16: Cryptonberries (sight aggro).\n \n" ..
                       "Strategy: Approach each door and verify nothing aggros through it, kill any adds on the other side, THEN pop the NM.\n \n" ..
                       "THF can pick locks with skeleton keys, living keys or Thief's Tools (~50%% success) to skip the NM fight.\n \n" ..
                       "To exit early, click the door you entered through to teleport outside.\n \n" ..
                       "Follow the route clockwise to the center of the map, take the elevator down, then click the Avatar Gate to complete this step.\n \n",
                zone_max_distance = 10,
                onmob_enemy = "Gargoyle",
                onmob_target = {"pso-xja-stone-door-1",
                                "pso-xja-stone-door-2",
                                "pso-xja-stone-door-3",
                                "pso-xja-stone-door-4",
                                "pso-xja-stone-door-5",
                                "pso-xja-stone-door-6",
                                "pso-xja-stone-door-7",
                                "pso-xja-stone-door-8",
                                "pso-xja-stone-door-9",
                                "pso-xja-stone-door-10",
                                "pso-xja-stone-door-11",
                                "pso-xja-stone-door-12",
                                "pso-xja-stone-door-13",
                                "pso-xja-stone-door-14",
                                "pso-xja-stone-door-15",
                                "pso-xja-stone-door-16",
                                "pso-xja-avatar-gate"},
                visual_zones = {
                        --1st door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 333.9, y = 0.2, z = -50.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 341.6, y = -0.0, z = -50.0 }, size =3, floor_id = 1, colour = "yellow" },
                        --2nd door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 349.7, y = 0.2, z = -48.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 350.0, y = 0.2, z = -61.6 }, size = 3, floor_id = 1, colour = "yellow" },
                        --3rd door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 351.5, y = 0.2, z = -70.3 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 338.4, y = 0.2, z = -70.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --4th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 332.4, y = 0.2, z = -70.1 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 321.6, y = 0.2, z = -70.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --5th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 310.0, y = 0.2, z = -88.6 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 310.0, y = 0.2, z = -101.6 }, size = 3, floor_id = 1, colour = "yellow" },
                        --6th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 312.4, y = 0.2, z = -109.4 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 298.4, y = 0.2, z = -110.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --7th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 290.3, y = 0.2, z = -111.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 290.0, y = 0.2, z = -98.4 }, size = 3, floor_id = 1, colour = "yellow" },
                        --8th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 290.1, y = 0.2, z = -91.4 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 290.0, y = 0.2, z = -81.6 }, size = 3, floor_id = 1, colour = "yellow" },
                        --9th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 273.4, y = 0.2, z = -70.0 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 258.4, y = 0.2, z = -70.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --10th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 249.4, y = 0.2, z = -70.7 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 250.0, y = 0.2, z = -58.4 }, size = 3, floor_id = 1, colour = "yellow" },
                        --11th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 246.6, y = 0.2, z = -49.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 261.6, y = 0.2, z = -50.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --12th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 269.4, y = 0.2, z = -50.2 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 278.4, y = 0.2, z = -50.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --13th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 290.1, y = 0.2, z = -32.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 290.0, y = 0.2, z = -18.4 }, size = 3, floor_id = 1, colour = "yellow" },
                        --14th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 288.4, y = 0.2, z = -10.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 301.6, y = 0.2, z = -10.0 }, size = 3, floor_id = 1, colour = "yellow" },
                        --15th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 309.9, y = 0.2, z = -7.7 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 310.0, y = 0.2, z = -21.6 }, size = 3, floor_id = 1, colour = "yellow" },
                        --16th door
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 310.1, y = 0.2, z = -29.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'square', center = { x = 310.0, y = 0.2, z = -38.4 }, size = 4, floor_id = 1, colour = "yellow" },

                        --elevator
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 300.0, y = 0.0, z = -49.3 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        -- highlights = {
                        --     { position = "M-6", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 1,
                    },
                },
                kill_requirement = {
                    count = 16,
                    enemies = {"Gargoyle"},
                    count_party_kills = true,
                    display_only = true,
                    reset_on_zone_entry = true,
                },
                trigger_on_event_id = {3},
            },
            {
                text = "Step 5: [Tenzen] Talk to Monberaux in the Infirmary in Upper Jeuno (G-10) - Home Point #3 - to receive Key Item: Envelope from Monberaux.\n \n",
                route_to = "Upper Jeuno",
                onmob_target = "Monberaux",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {74},
            },
            {
                text = "Step 6: [Tenzen] Talk to Pherimociel at the Guard Post in Ru'Lude Gardens (G-6) for a cutscene involving Wolfgang.\n \n" ..
                       "You may need to talk twice to trigger the mission cutscene.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Pherimociel",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {58},
            },
            {
                text = "Step 7: [Tenzen] Exit Upper Jeuno to Batallia Downs and examine the ??? at (K-9) for a cutscene.\n \n",
                route_to = "Batallia Downs",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                onmob_target = "batallia-downs-???-k9",
                trigger_on_event_id = {0},
            },
            {
                text = "Step 8: [Tenzen] Examine the same ??? at Batallia Downs (K-9) a SECOND time to receive Key Item: Delkfutt Recognition Device.\n \n" ..
                       "Confirm you receive the key item - it is required for the next step.\n \n",
                route_to = "Batallia Downs",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                onmob_target = "batallia-downs-???-k9",
                trigger_on_keyitem_obtain = {613}
            },
            {
                text = "Step 9: [Tenzen] Enter Lower Delkfutt's Tower and find the Cermet Door on floor 1 at (H-5), north side.\n \n" ..
                       "Touch the Cermet Door - you'll see: 'Something huge is bearing down upon you!' and Disaster Idol will spawn.\n \n",
                route_to = "Lower Delkfutt's Tower",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                onmob_target = "lower-delkfutt-tower-cermet-door-h5",
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 464.0, y = 0.0, z = -60.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 526.2, y = 0.4, z = -77.9 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 556.3, y = 0.6, z = -41.8 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.7, y = 0.0, z = -16.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 580.1, y = 0.0, z = 18.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 563.7, y = 0.6, z = 79.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 536.3, y = -0.0, z = 106.2 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 503.7, y = 0.0, z = 140.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 459.5, y = 0.0, z = 139.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                },
                trigger_on_talk = "Something huge is bearing down upon you!",
            },
            {
                text = "Step 10: [Tenzen] Defeat Disaster Idol:\n" ..
                       "- Susceptible to: Blind, Poison, Gravity, elemental debuffs and ninjutsu.\n" ..
                       "- Resistant to: Elegy, Requiem, Silence, Stun, Flash. Does NOT use Meltdown.\n \n",
                route_to = "Lower Delkfutt's Tower",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                onmob_enemy = {"Disaster Idol"},
                onmob_enemy_size = 5,
                kill_requirement = {
                    count = 1,
                    enemies = {"Disaster Idol"},
                    count_party_kills = true,
                },
            },
            {
                text = "Step 11: [Tenzen] Examine the Cermet Door again at (H-5) for a cutscene.\n \n",
                onmob_target = "lower-delkfutt-tower-cermet-door-h5",
                route_to = "Lower Delkfutt's Tower",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {25},
                zone_max_distance = 35,
                visual_zones = {
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 464.0, y = 0.0, z = -60.6 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 526.2, y = 0.4, z = -77.9 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 556.3, y = 0.6, z = -41.8 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 579.7, y = 0.0, z = -16.5 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 580.1, y = 0.0, z = 18.6 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 563.7, y = 0.6, z = 79.6 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 536.3, y = -0.0, z = 106.2 }, size = 4, direction = "nw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 503.7, y = 0.0, z = 140.2 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                        { zone_name = "Lower Delkfutt's Tower", type = 'arrow', center = { x = 459.5, y = 0.0, z = 139.5 }, size = 4, direction = "down", floor_id = 1, colour = "yellow" },
                },
            },
            {
                text = "Step 12: [Tenzen] Return to Pso'Xja via the H-10 tower in Beaucedine Glacier.\n \n" ..
                       "A cutscene plays automatically when you zone in - no further action required.\n \n",
                route_to = "Beaucedine Glacier",
                destination_highlight = {position = "H-10", offsetX = 16, offsetY = 16},
                onmob_target = "beaucedine-glacier-iron-grate-h10",
                zone_max_distance = 45,
                visual_zones = {
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -34.7, y = -59.9, z = -114.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -60.4, y = -53.8, z = -110.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -62.1, y = -48.4, z = -136.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -53.7, y = -39.4, z = -197.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -18.2, y = -39.1, z = -200.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 16.8, y = -41.1, z = -179.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 26.0, y = -40.3, z = -147.5 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 59.5, y = -40.0, z = -116.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 107.9, y = -39.6, z = -99.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 138.5, y = -40.2, z = -66.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 140.0, y = -40.9, z = -21.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 129.2, y = -40.2, z = -0.6 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 93.9, y = -39.4, z = 4.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 68.8, y = -34.3, z = 20.9 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 104.8, y = -26.6, z = 21.6 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 163.1, y = -19.2, z = 16.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 167.7, y = -19.9, z = -12.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 164.6, y = -20.0, z = -76.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 147.2, y = -20.3, z = -127.4 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 99.5, y = -19.2, z = -152.2 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 65.2, y = -15.7, z = -179.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 103.7, y = -7.2, z = -183.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 135.0, y = -1.3, z = -182.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 171.1, y = 0.2, z = -194.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 172.6, y = 0.0, z = -251.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 135.4, y = -0.3, z = -287.5 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 100.2, y = 0.2, z = -301.1 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                        { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 60.6, y = 0.9, z = -322.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                },
                trigger_on_event_id = {4},
            },
            {
                text = "Step 13: [Tenzen] Take the elevator down then examine the Avatar Gate at (H-10) for a cutscene.\n \n" ..
                       "Use Sneak and Invisible. Follow the right wall to (I-8), drop to the lower level, then head south and north to the elevator.\n \n" ..
                       "There will be arrows to guide you! \n \n",
                zone_max_distance = 20,
                onmob_target = "pso-xja-avatar-gate-2",
                visual_zones = {
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 219.0, y = 0.0, z = -329.2 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 189.5, y = 0.2, z = -330.7 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 188.2, y = 8.0, z = -290.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 149.1, y = 16.2, z = -290.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 123.8, y = 16.0, z = -290.0 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 89.9, y = 8.0, z = -290.2 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 90.2, y = 0.2, z = -330.8 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 89.9, y = 0.2, z = -349.7 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 90.5, y = 8.0, z = -390.4 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 130.5, y = 16.2, z = -389.9 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 152.7, y = 16.2, z = -390.2 }, size = 4, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 189.7, y = 8.0, z = -388.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 188.1, y = 0.2, z = -349.7 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 172.9, y = 0.2, z = -349.9 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'line', start = { x = 171.3, y = 0.0, z = -349.9 }, stop = { x = 170.1, y = 16.2, z = -349.6 }, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 170.2, y = 16.2, z = -351.1 }, size = 4, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 169.1, y = 16.0, z = -370.1 }, size = 4, direction = "left", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 150.2, y = 16.2, z = -369.6 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Pso'Xja", type = 'arrow', center = { x = 140.3, y = 16.0, z = -355.0 }, size = 4, direction = "up", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        -- highlights = {
                        --     { position = "F-9", offsetX = 16, offsetY = 16 },
                        -- },
                        zone_name = "Pso'Xja",
                        floor_id = 2,
                    },
                },
                trigger_on_event_id = {5},
            },
            {
                text = "Step 14: [Tenzen] Talk to Cid at Metalworks (H-8) to complete Tenzen's Path.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {854},
            },
            -- === ULMIA'S PATH ===
            {
                text = "Step 15: [Ulmia] Talk to Hinaree at Count Caffaule's Manor in Southern San d'Oria (B-6) for a cutscene.\n \n" ..
                       "The manor is in the western residential area of Southern San d'Oria.\n \n",
                route_to = "Southern San d'Oria",
                onmob_target = "Hinaree",
                destination_highlight = {position = "B-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {22},
            },
            {
                text = "Step 16: [Ulmia] Enter Port San d'Oria for an automatic cutscene.\n \n",
                route_to = "Port San d'Oria",
                zone_trigger = "Port San d'Oria",
                trigger_on_event_id = {4},
            },
            {
                text = "Step 17: [Ulmia] Talk to Chasalvige in the Cathedral in Northern San d'Oria (L-6) - first door on the left inside the manuscript room.\n \n",
                route_to = "Northern San d'Oria",
                onmob_target = "Chasalvige",
                destination_highlight = {position = "L-6", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {762},
            },
            {
                text = "Step 18: [Ulmia] Talk to Kerutoto in the Rhinostery in Windurst Waters (J-8, use the north door).\n \n" ..
                       "You may need to talk twice - the mission cutscene references a girl with 'crikey-spiky hair'.\n \n",
                route_to = "Windurst Waters South",
                onmob_target = "Kerutoto",
                destination_highlight = {position = "J-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {876},
            },
            {
                text = "Step 19: [Ulmia] Talk to Yoran-Oran at the Optistery in Windurst Walls (E-5) for a cutscene.\n \n",
                route_to = "Windurst Walls",
                onmob_target = "Yoran-Oran",
                destination_highlight = {position = "E-5", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {473},
            },
            {
                text = "Step 20: [Ulmia] Travel to Attohwa Chasm and enter Boneyard Gully. Examine the Wall of Dark Miasma for battlefield 'Head Wind'.\n \n" ..
                       "Fastest route: Attohwa Chasm Home Point #1 or Unity Concord warp.\n \n" ..
                       "Buffs wear on entry. 30 minute limit. 1000 EXP on win.\n \n" ..
                       "Opponents: Shikaree X (BST/NIN - daggers), Shikaree Y (DRK/MNK - scythe), Shikaree Z (DRG/WHM - polearm) and their pets (~2000 HP each).\n" ..
                       "Only the Trackers need to be defeated. They have Regain - expect frequent weaponskills.\n \n",
                route_to = "Attohwa Chasm",
                zone_trigger = "Boneyard Gully",
                onmob_enemy = {"Shikaree X", "Shikaree Y", "Shikaree Z"},
                onmob_enemy_size = 5,
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 20: [Ulmia] Travel to Uleguerand Range and fall through the hole at (J-9) - the north-westernmost hole drops you nearest to Bearclaw Pinnacle.\n \n" ..
                       "Examine the ??? to enter battlefield 'Flames for the Dead'.\n \n" ..
                       "Buffs wear on entry. 30 minute limit. 1000 EXP on win.\n \n" ..
                       "Opponent: Snoll Tzar (~7000 HP). You have 45 seconds to kill it before Hypothermal Combustion (near-lethal AoE).\n \n" ..
                       "- Shu'Meyo Salt extends the timer by 20 seconds. Stack usages but do not overlap.\n" ..
                       "- Arctic Impact: AoE ice damage (~275).\n" ..
                       "- Cold Wave: AoE Frost (31 HP/tick).\n" ..
                       "- Hiemal Storm: Directional AoE ice damage (200-1400).\n \n",
                route_to = "Uleguerand Range",
                zone_trigger = "Bearclaw Pinnacle",
                onmob_enemy = {"Snoll Tzar"},
                onmob_enemy_size = 6,
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 21: [Ulmia] Talk to Cid at Metalworks (H-8) to complete Ulmia's Path.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {855},
            },
            -- === LOUVERANCE'S PATH ===
            {
                text = "Step 22: [Louverance] Talk to Despachiaire at the top level of Tavnazian Safehold (K-10) - behind the walnut door near Home Point #3.\n \n",
                route_to = "Tavnazian Safehold 3",
                onmob_target = "Despachiaire",
                destination_highlight = {position = "K-10", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {118},
            },
            {
                text = "Step 23: [Louverance] Talk to Perih Vashai in Windurst Woods (K-7) for a long cutscene.\n \n" ..
                       "She may offer a Trust cutscene first - work through it then talk again for the mission cutscene.\n \n",
                route_to = "Windurst Woods",
                onmob_target = "Perih_Vashai",
                destination_highlight = {position = "K-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {686},
            },
            {
                text = "Step 24: [Louverance] Travel to Bibiki Bay - Purgonorgo Isle and examine the ??? Warmachine at (H-11) for a cutscene.\n \n" ..
                       "Getting to Purgonorgo Isle:\n" ..
                       "- Ferry: Manaclipper from Bibiki Bay. Departs at 4:50-5:30 and 16:50-17:30 (Vana'diel time). Multi-ticket from Tswe Panipahr.\n" ..
                       "- Teleport: Atmacite Refiner (requires Hyacinth Stratum Abyssite II).\n \n",
                route_to = "Bibiki Bay",
                destination_highlight = {position = "H-11", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {33},
            },
            {
                text = "Step 25: [Louverance] Zone into Oldton Movalpolos for an automatic cutscene with Louverance.\n \n" ..
                       "Fastest route: Survival Guide in Oldton Movalpolos. Alternatively, Gusgen Mines Survival Guide then head west.\n \n",
                route_to = "Oldton Movalpolos",
                zone_trigger = "Oldton Movalpolos",
                trigger_on_event_id = {1},
            },
            {
                text = "Step 26: [Louverance] Enter Mine Shaft #2716 and complete battlefield 'A Century of Hardship'.\n \n" ..
                       "Getting to Mine Shaft #2716:\n" ..
                       "- Trade a Snow Lily to Tarnotik in Oldton Movalpolos (K-10) to warp directly.\n" ..
                       "- Or pay Twinkbrix (Oldton Movalpolos E-13) 1-10,000 gil for a chance at a Shaft Gate Operating Dial, then 2,000 gil to warp.\n" ..
                       "- Newton Movalpolos Home Point #1 (M-9) also works.\n \n" ..
                       "Touch the Home Point before entering! Buffs wear on entry. 30 minute limit. 1000 EXP on win.\n \n" ..
                       "Opponents: Chekochuk (BLM), Movamuq (WHM), Swipostik (THF), Trikotrak (RDM), and Bugbby (WAR ~9000 HP).\n" ..
                       "- All Moblins: Immune to Sleep. Silence them!\n" ..
                       "- Bugbby: Extremely susceptible to Stun. Uses Mighty Strikes.\n \n",
                route_to = "Oldton Movalpolos",
                onmob_enemy = {"Bugbby", "Chekochuk", "Movamuq", "Swipostik", "Trikotrak"},
                onmob_enemy_size = 5,
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 27: [Louverance] Talk to Cid at Metalworks (H-8) for a cutscene.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {852},
            },
            {
                text = "Step 28: [Louverance] Obtain a Gold Key and trade it to the Shaft Entrance at Mine Shaft #2716 for a cutscene.\n \n" ..
                       "Gold Keys drop from Moblins and Goblins in Newton Movalpolos, or buy via bazaar.\n \n" ..
                       "Note: If you disconnect during the cutscene you lose the key, but you can recheck the door.\n \n",
                route_to = "Oldton Movalpolos",
                trigger_on_event_id = {3},
            },
            {
                text = "Step 29: [Louverance] Return to Metalworks (H-8) and talk to Cid to complete Louverance's Path and the mission.\n \n",
                route_to = "Metalworks",
                onmob_target = "Cid",
                destination_highlight = {position = "H-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {853},
            },
        },
        reward = {
            text = "Mission Complete!\nTitle: Treader of an Icy Past\nTrust: Shikaree Z - talk to Perih Vashai in Windurst Woods (K-7) after completion.\n1000 EXP per battlefield.\nNext: For Whom the Verse is Sung (CoP 5-4)",
        }
    },
}
