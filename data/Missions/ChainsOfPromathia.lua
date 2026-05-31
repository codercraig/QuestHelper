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
                    enemies = {"Ponderer"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                onmob_enemy = {"Ponderer"},
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
                       "Congratulations on completeing the 3 Promyvions! You will get a cutscene and end up in Lufaise Meadows. \n \n",
                keyitems_needed = {590,591,592},
                kill_requirement = {
                    count = 1,
                    enemies = {"Agonizer"},
                    count_party_kills = true,
                    reset_on_zone_entry = true,
                    display_only = true,
                },
                onmob_enemy = {"Agonizer"},
                onmob_enemy_size = 4,
                trigger_on_keyitem_obtain = {590,591,592},
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
                text = "Step 1: After defeating all 3 Promyvion bosses you will be automatically teleported to Lufaise Meadows and a cutscene will play.\n \n" ..
                       "WARNING: Do NOT teleport out after the cutscene - it is very hard to return. Complete this mission first!\n \n" ..
                       "Your Mysterious Amulet is removed during the cutscene.\n \n",
                zone_name = "Lufaise Meadows",
                route_to = "Lufaise Meadows",
                trigger_on_event_id = {110},
            },
            {
                text = "Step 2: Head west through Lufaise Meadows to the Tavnazian Safehold entrance at E-8 or F-10.\n \n" ..
                       "WARNING: Orcs and Gigas aggro to sight and link. Bugards aggro to sound. Be careful if under level 50.\n \n" ..
                       "Zone into the Tavnazian Safehold - a cutscene will play and the mission will complete.\n \n" ..
                       "Tip: Access the Survival Guide and Home Point at the front of the Safehold before moving on.\n \n",
                route_to = "Tavnazian Safehold 2",
                --zone_trigger = "Tavnazian Safehold",
                trigger_on_event_id = {101},
            },
        },
        reward = {
            text = "Title: Dead Body\nNext: The Lost City (CoP 2-2)",
        }
    },

    ["CoP 2-3: Distant Beliefs"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-2: The Lost City"},
        },
        steps = {
            {
                text = "Step 1: Enter Phomiuna Aqueducts via the Sewer Entrance in the basement of Tavnazian Safehold (I-7).\n \n" ..
                       "Choose 'Proceed onward' when prompted, might require clicking it twice for prompt to appear.\n \n",
                route_to = "Tavnazian Safehold 3",
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

    ["CoP 2-2: The Lost City"] = {
        prerequisites = {
            {category = "Missions", subfile = "ChainsOfPromathia", name = "CoP 2-1: An Invitation West"},
        },
        steps = {
            {
                text = "Step 1: Head to the top floor of Tavnazian Safehold and pass through the Walnut Door at K-9.\n \n" ..
                       "Speak to Despachiaire at K-10 for a cutscene.\n \n",
                route_to = "Tavnazian Safehold 1",
                onmob_target = "Despachiaire",
                destination_highlight = {position = "K-9", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {102},
            },
            {
                text = "Step 2: Head all the way down to the basement level of Tavnazian Safehold.\n \n" ..
                       "Examine the Sewer Entrance at I-7 to trigger a cutscene and complete the mission.\n \n" ..
                       "This will also unlock the next mission: Distant Beliefs (CoP 2-3).\n \n",
                route_to = "Tavnazian Safehold 3",
                onmob_target = "tavnazian-safehold-sewer-entrance",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {103},
            },
        },
        reward = {
            text = "Access to Phomiuna Aqueducts\nNext: Distant Beliefs (CoP 2-3)",
        }
    },
}
