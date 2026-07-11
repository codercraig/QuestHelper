return {
    ["1-1: Smash the Orcish Scouts"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Defeat Orcish Fodder to obtain an Orcish Axe. \n \n" ..
                       "===== Obtaining the Orcish Axe ===== \n" ..
                       "Orcish Fodder spawn in West Ronfaure, Ghelsba Outpost, or La Theine Plateau. \n" ..
                       "Nearest: West Ronfaure, just outside the San d'Oria gates - highlighted on radar. \n" ..
                       "The Orcish Axe is a common drop; kill until one drops. \n \n",
                items_needed = {
                    "Orcish Axe"
                },
                trigger_on_item_obtain = {"Orcish Axe"},
                onmob_enemy = {"Orcish Fodder"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
            },
            { -- Step 3
                text = "Step 3: Return to San d'Oria and trade the Orcish Axe to a Gate Guard to complete the mission. \n \n" ..
                       "Trade to Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1002, 1020, 2002, 2020},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["1-2: Bat Hunt"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 8 recommended.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to King Ranperre's Tomb and kill Ding Bats for Orcish Mail Scales. \n \n" ..
                       "===== Getting there ===== \n" ..
                       "From San d'Oria, cross into East Ronfaure, then enter King Ranperre's Tomb at (H-11). \n" ..
                       "Zone in and follow the right wall until you come out into an open area. \n \n" ..
                       "===== Obtaining Orcish Mail Scales ===== \n" ..
                       "Kill Ding Bats in the open area until you receive Orcish Mail Scales - highlighted on radar. \n" ..
                       "WARNING: Ding Bats only spawn at NIGHT (Vana'diel 18:00 - 6:00). \n \n",
                route_to = "King Ranperre's Tomb",
                items_needed = {
                    "Orcish Mail Scales"
                },
                trigger_on_item_obtain = {"Orcish Mail Scales"},
                onmob_enemy = {"Ding Bat"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
            },
            { -- Step 3
                text = "Step 3: Make your way through the maze to the King's Tomb at (H-10 / I-10). \n \n" ..
                       "Examine the Headstone for a cutscene. \n \n",
                onmob_target = {"Tombstone_Upper"},
                trigger_on_event_id = {4},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "King Ranperre's Tomb",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                            { position = "I-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 4
                text = "Step 4: Return to San d'Oria and trade the Orcish Mail Scales to a Gate Guard to complete the mission. \n \n" ..
                       "Trade to Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n" ..
                       "NOTE: When repeating this mission, trade 1 Bat Fang instead of Orcish Mail Scales. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1003, 1023, 2003, 2023},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["1-3: Save the Children"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 10 recommended.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Talk to Arnau in the Cathedral in Northern San d'Oria (M-6) for a cutscene. \n \n" ..
                       "(First time only - if you are repeating this mission you can skip straight to the battlefield.) \n \n",
                onmob_target = {"Arnau"},
                trigger_on_event_id = {693},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 3
                text = "Step 3: Head to Ghelsba Outpost and check the Hut Door at (G-10) to enter the battlefield \"Save the Children\". \n \n" ..
                       "===== Battle ===== \n" ..
                       "Defeat the 3 Orcs: \n" ..
                       "  Fodderchief Vokdek (Warrior) \n" ..
                       "  Strongarm Zodvad (Ranger) \n" ..
                       "  Sureshot Snatgat (Ranger) \n \n" ..
                       "Time limit: 10 minutes. Buffs wear off on entry. Level is restricted to 99. \n" ..
                       "Trusts are allowed, but cast them AFTER entering - alter egos summoned beforehand despawn. \n \n" ..
                       "Winning grants the Key Item: Orcish Hut Key and the title Fodderchief Flayer. \n \n",
                route_to = "Ghelsba Outpost",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
                onmob_enemy = {"Fodderchief Vokdek", "Strongarm Zodvad", "Sureshot Snatgat"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
                trigger_on_event_id = {32001},
            },
            { -- Step 4
                text = "Step 4: After you are teleported out, check the Hut Door at (G-10) again for a cutscene. \n \n" ..
                       "TIP: Click the Hut Door again afterwards until it stops responding - this saves you a return trip. \n \n",
                onmob_target = {"Hut_Door"},
                trigger_on_event_id = {3, 55},
                route_to = "Ghelsba Outpost",
                destination_highlight = {position = "G-10", offsetX = 16, offsetY = 16},
            },
            { -- Step 5
                text = "Step 5: Return to San d'Oria and speak to a Gate Guard to complete the mission. \n \n" ..
                       "Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n" ..
                       "Optional: return to the Cathedral and speak to Arnau afterwards for an additional cutscene. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1004, 1024, 2004, 2024},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 2, 1000 gil, Title: Fodderchief Flayer"
        }
    },
    ["2-1: The Rescue Drill"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "NOTE: You must have enough rank points to be offered this mission - if your rank bar is empty, trade a crystal to a Gate Guard first. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to La Theine Plateau and talk to Galaihaurat at (E-6), on the road west of the canyon. \n \n" ..
                       "This is the first Temple Knight - you will talk to the rest in order as you head toward Ordelle's Caves. \n \n" ..
                       "WARNING: Funguars in the canyon are Lv18+ and aggro to sound - bring Silent Oils if low level. \n" ..
                       "If you have the quest 'A Timely Visit' active, you may need to finish it first to get the right dialogue. \n \n",
                onmob_target = {"Galaihaurat"},
                trigger_on_event_id = {110},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "E-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Head east and north around the top of the canyon and talk to Equesobillot at (F-6). \n \n",
                onmob_target = {"Equesobillot"},
                trigger_on_event_id = {101},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 4
                text = "Step 4: Talk to Deaufrain (F-6), on the ramp into the canyon. \n \n",
                onmob_target = {"Deaufrain"},
                trigger_on_event_id = {102},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 5
                text = "Step 5: Talk to Vicorpasse (the captain) at the beginning of the canyon. \n \n",
                onmob_target = {"Vicorpasse"},
                trigger_on_event_id = {108},
                route_to = "La Theine Plateau",
            },
            { -- Step 6
                text = "Step 6: Head down into the canyon and talk to Laurisse. \n \n" ..
                       "(Augevinne and Yaucevouchat nearby have optional dialogue.) \n \n",
                onmob_target = {"Laurisse", "Augevinne", "Yaucevouchat"},
                trigger_on_event_id = {106},
                route_to = "La Theine Plateau",
            },
            { -- Step 7
                text = "Step 7: Talk to Narvecaint - the last knight - near (F-7), the entrance to Ordelle's Caves. \n \n",
                onmob_target = {"Narvecaint"},
                trigger_on_event_id = {107},
                route_to = "La Theine Plateau",
            },
            { -- Step 8
                text = "Step 8: Enter Ordelle's Caves (La Theine F-7) and talk to Ruillont. \n \n" ..
                       "Follow the left wall (about 15 seconds walking) - he is hiding in a small pond. \n \n",
                onmob_target = {"Ruillont"},
                trigger_on_event_id = {1},
                route_to = "Ordelle's Caves",
            },
            { -- Step 9
                text = "Step 9: Return to La Theine Plateau and talk to the knight holding Ruillont's Bronze Sword. \n \n" ..
                       "The knight is RANDOM - one of Galaihaurat (E-6), Equesobillot (F-6), or Deaufrain (F-6). \n" ..
                       "You will receive an actual Bronze Sword, so make sure you have an inventory slot free. \n \n",
                onmob_target = {"Galaihaurat", "Equesobillot", "Deaufrain"},
                trigger_on_event_id = {112, 113, 114},
                route_to = "La Theine Plateau",
            },
            { -- Step 10
                text = "Step 10: Return to Ordelle's Caves and trade the Bronze Sword to Ruillont. \n \n",
                onmob_target = {"Ruillont"},
                trigger_on_event_id = {2},
                route_to = "Ordelle's Caves",
            },
            { -- Step 11
                text = "Step 11: Return to La Theine Plateau and talk to Vicorpasse (F-6) at the beginning of the canyon. \n \n" ..
                       "CRITICAL: He gives you the Key Item: Rescue Training Certificate. \n \n",
                onmob_target = {"Vicorpasse"},
                trigger_on_event_id = {115},
                route_to = "La Theine Plateau",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            { -- Step 12
                text = "Step 12: Return to San d'Oria and talk to a Gate Guard to complete the mission. \n \n" ..
                       "Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n" ..
                       "TIP: There is a Survival Guide just inside Ordelle's Caves for a quick return trip. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1005, 2005},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["2-2: The Davoi Report"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 20 in a party, 25 solo. This mission can be skipped by trading 3 crystals to a Gate Guard.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Travel to Davoi (enter from Jugner Forest at G-12) and speak to Zantaviat. \n \n" ..
                       "He is hiding next to a tree near the entrance. \n \n" ..
                       "WARNING: Orcs detect by sight and Bats detect by sound - bring Prism Powders and Silent Oils if low level. \n \n",
                onmob_target = {"Zantaviat"},
                trigger_on_event_id = {100},
                route_to = "Davoi",
            },
            { -- Step 3
                text = "Step 3: Walk south to the pond. At the pond's south end, check the ! point to receive the Key Item: Lost Document. \n \n",
                -- TODO: replace 0 with the Lost Document key item ID (server: xi.ki.LOST_DOCUMENT)
                keyitems_needed = {0},
                trigger_on_keyitem_obtain = {0},
                route_to = "Davoi",
            },
            { -- Step 4
                text = "Step 4: Return the Lost Document to Zantaviat to receive the Key Item: Temple Knights' Davoi Report. \n \n",
                onmob_target = {"Zantaviat"},
                trigger_on_event_id = {104},
                route_to = "Davoi",
            },
            { -- Step 5
                text = "Step 5: Deliver the report in Northern San d'Oria. \n \n" ..
                       "Go to the Cathedral (M-6) and enter the Papal Chambers on the third floor, then speak to Prince Pieuje. \n \n" ..
                       "NOTE: Gate Guards will refuse the report the first time and tell you to deliver it to the prince personally. \n" ..
                       "(On repeat runs you can instead hand the report to a Gate Guard.) \n \n",
                onmob_target = {"_6fc", "Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {695, 1006, 2006},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "M-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["2-3a: Journey Abroad - Introduction"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-1: The Rescue Drill"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Requires Mission 2-1 and a 3/4-full Rank Bar. If short on rank points, trade a crystal to a Temple Knight or repeat Bat Hunt.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and talk to Halver. \n \n" ..
                       "He gives you the Key Item: Letter to the Consuls and sends you to visit the Bastok and Windurst embassies. \n \n" ..
                       "NEXT: Pick ONE route guide and follow it - do NOT do both: \n" ..
                       "  - '2-3b: Journey Abroad - Bastok -> Windurst', or \n" ..
                       "  - '2-3b: Journey Abroad - Windurst -> Bastok'. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {505},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Nothing yet - follow ONE of the two route guides (2-3b) to continue!"
        }
    },
    ["2-3b: Journey Abroad - Bastok -> Windurst"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-3a: Journey Abroad - Introduction"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Travel to Bastok. In the Metalworks, take a lift to the 2nd floor and enter the Consulate of San d'Oria. \n \n" ..
                       "Speak to Savae E Paleade for a cutscene. \n \n" ..
                       "(If you have never been: Unity warp to South Gustaberg, then Bastok Markets H-7 -> Metalworks I-9.) \n \n",
                onmob_target = {"Savae_E_Paleade"},
                trigger_on_event_id = {204},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
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
            { -- Step 4
                text = "Step 4: Head to Palborough Mines (enter from North Gustaberg K-3) and mine Mythril Seams until you obtain Mine Gravel. \n \n" ..
                       "Seam locations: (I-8) floor 1 west of river, (I-8) floor 2 south room, (I-9) floor 3. \n \n" ..
                       "Trade a Pickaxe to a Mythril Seam - it may take several attempts (pickaxes can break; you still get the gravel). \n" ..
                       "Note: Sneak recommended - Quadavs aggro by sight. \n" ..
                       "(Optional): Mine Gravel can also be bought from the Auction House [Others -> Misc.]. \n \n",
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
            { -- Step 5
                text = "Step 5: On floor 3 of Palborough Mines, go to (I-6) and trade the Mine Gravel to the Refiner Lid. \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-elevator-lever-i8",
                                "palborough-mines-refiner-lid"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
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
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 187.0, y = -32.0, z = 61.1 }, size = 4, direction = "right", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.3, y = -32.0, z = 66.2 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 219.4, y = -32.0, z = 99.6 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 218.5, y = -32.0, z = 139.7 }, size = 4, direction = "left", floor_id = 3, colour = "yellow" },
                    { zone_name = "Palborough Mines", type = 'arrow', center = { x = 179.5, y = -32.0, z = 141.5 }, size = 4, direction = "up", floor_id = 3, colour = "yellow" },
                },
            },
            { -- Step 6
                text = "Step 6: Pull the Refiner Lever! \n \n",
                zone_max_distance = 30,
                onmob_target = {"palborough-mines-refiner-lever"},
                route_to = "Palborough Mines 2",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {17},
            },
            { -- Step 7
                text = "Step 7: Drop down to the floor below and pull the second lever. \n \n" ..
                       "You will receive an Onz of Mythril Sand automatically. This completes the mining. \n \n",
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
                },
            },
            { -- Step 8
                text = "Step 8: Return to Savae E Paleade in the Metalworks (2nd floor Consulate) and trade her the Mythril Sand. \n \n" ..
                       "This completes the Bastok leg. \n \n" ..
                       "(Shortcut back: Palborough Mines 3rd floor H-8 boat -> Zeruhn Mines -> Bastok Mines.) \n \n",
                onmob_target = {"Savae_E_Paleade"},
                trigger_on_event_id = {205},
                route_to = "Metalworks",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 9
                text = "Step 9: Travel to Windurst. Talk to Mourices at the Consulate of San d'Oria in Windurst Woods (F-10). \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {462},
                route_to = "Windurst Woods",
            },
            {
                text = "Step 10: Talk to Kupipi in Heavens Tower on the first floor north side, she will give you a KI:Dark Key. \n" ..
                       "All party members need one Dark Key! \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {242},
                route_to = "Heavens Tower",
                zone_max_distance = 17,
                visual_zones = {
                        { zone_name = "Heavens Tower", type = 'arrow', center = { x = -0.0, y = 0.8, z = 15.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                        { zone_name = "Heavens Tower", type = 'rect', center = { x = 0.0, y = -1.8, z = 22.3 }, width = 3.75, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                }
            },
            {
                text = "Step 11: Travel to Giddeus with your party! \n",
                zone_trigger = "Giddeus",
                route_to = "Giddeus",
            },
            {
                text = "Step 12: Navigate to Balga's Dais  \n",
                zone_max_distance = 35,
                zone_trigger = "Balga's Dais",
                visual_zones = {
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -100.7, y = -0.3, z = 404.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -101.4, y = -0.2, z = 382.8 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.1, y = 0.4, z = 376.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -136.4, y = 3.9, z = 341.4 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -159.8, y = 4.0, z = 319.3 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -182.6, y = 4.0, z = 298.7 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -180.8, y = -0.1, z = 274.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -172.4, y = 0.0, z = 259.0 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.2, y = -0.5, z = 256.1 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -139.9, y = -4.0, z = 200.3 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.6, y = -0.2, z = 154.5 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -137.4, y = -0.8, z = 100.7 }, size = 4, direction = "right", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -100.0, y = -0.7, z = 94.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -99.6, y = -1.2, z = 71.6 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -108.8, y = -2.7, z = 60.2 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.3, y = -0.9, z = 51.4 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -140.7, y = -1.2, z = -1.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -138.4, y = -1.2, z = -44.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -133.4, y = 1.1, z = -65.2 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -112.6, y = 1.0, z = -80.1 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -112.3, y = 0.9, z = -105.7 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -86.0, y = 1.0, z = -134.6 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -77.5, y = 1.0, z = -160.9 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -57.6, y = -0.2, z = -186.9 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -66.8, y = -2.8, z = -220.1 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -108.4, y = 0.6, z = -222.8 }, size = 4, direction = "sw", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -121.9, y = 1.0, z = -241.0 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -99.1, y = -0.9, z = -258.0 }, size = 4, direction = "se", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -98.2, y = -3.1, z = -278.0 }, size = 4, direction = "down", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -113.6, y = -3.4, z = -300.6 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                        { zone_name = "Giddeus", type = 'arrow', center = { x = -130.7, y = -2.5, z = -299.5 }, size = 4, direction = "left", floor_id = 1, colour = "cyan" },
                },
                images = {
                      {
                          width    = 512,
                          height   = 512,
                          state    = 12,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 12,
                          zone_name = "Giddeus",
                          floor_id = 15,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 13: This is a BCNM battle! You will face Searcher and Black Dragon. \n" ..
                       "Recommended: Level 35+ or a party. \n \n" ..
                       "===== Searcher ===== \n" ..
                       "Family: Bigeye thing \n" ..
                       "Level: 25 \n \n" ..
                       "===== Black Dragon ===== \n" ..
                       "Family: Dragon \n" ..
                       "Level: 27 \n" ..
                       "Notes: Sleep/Bind the Dragon and kill the Spotter! \n \n" ..
                       "After winning, you will receive the KI:Kindred Crest and title 'Black Dragon Slayer'.",
                trigger_on_event_id = { 32001 },
            },
            { -- Step 12
                text = "Step 14: Return to Mourices in Windurst Woods (F-10) to receive the Key Item: Kindred Report. \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {467},
                route_to = "Windurst Woods",
            },
            { -- Step 13
                text = "Step 15: Return to Chateau d'Oraguille in Northern San d'Oria and report to Halver to complete the mission. \n \n" ..
                       "(Afterwards you can talk to Curilla to obtain her Alter Ego.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {507},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000 gil, Key Item: Adventurer's Certificate, Title: Certified Adventurer"
        }
    },
    ["2-3b: Journey Abroad - Windurst -> Bastok"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "2-3a: Journey Abroad - Introduction"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Travel to Windurst. Talk to Mourices at the Consulate of San d'Oria in Windurst Woods (G-10). \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {448},
                route_to = "Windurst Woods",
            },
            { -- Step 2
                text = "Step 2: Enter Heavens Tower (Windurst Walls H-7) for a cutscene, then talk to Kupipi in the Clerical Chamber. \n \n" ..
                       "She gives you the Key Item: Shield Offering. \n \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {238},
                route_to = "Heavens Tower",
            },
            { -- Step 3
                text = "Step 3: Go to Giddeus (West Sarutabaruta F-8). Make your way to Uu Zhoumo on Map 2 (F-7) and give the Shield Offering. \n \n" ..
                       "Only Invisible is needed in Giddeus. \n \n",
                onmob_target = {"Uu_Zhoumo"},
                trigger_on_event_id = {42},
                route_to = "Giddeus",
            },
            { -- Step 4
                text = "Step 4: Defeat Zhuu Buxu the Silent twice to obtain 2 Parana Shields. \n \n" ..
                       "From Map 1 take the path at (I-8) down the tunnels, then reach (H-7) on Map 2. \n" ..
                       "WARNING: Zhuu Buxu aggros and links with nearby Yagudo. Respawn is ~5 minutes. \n" ..
                       "(You can give the Shield Offering to Uu Zhoumo while waiting for respawns.) \n \n",
                kill_requirement = {
                    count = 2,
                    enemies = {"Zhuu Buxu the Silent"},
                    zone = "Giddeus",
                    count_party_kills = true,
                },
                onmob_enemy = {"Zhuu Buxu the Silent"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 2,
            },
            { -- Step 5
                text = "Step 5: Return to Mourices in Windurst Woods and trade him both Parana Shields to complete the Windurst leg. \n \n",
                onmob_target = {"Mourices"},
                trigger_on_event_id = {457},
                route_to = "Windurst Woods",
            },
            { -- Step 6
                text = "Step 6: Travel to Bastok. In the Metalworks (2nd floor Consulate of San d'Oria) speak to Savae E Paleade for a cutscene. \n \n" ..
                       "(Reach it via Bastok Markets H-7 -> Metalworks.) \n \n",
                onmob_target = {"Savae_E_Paleade"},
                trigger_on_event_id = {206},
                route_to = "Metalworks",
            },
            { -- Step 7
                text = "Step 7: Enter the Department of Industry (adjacent to the President's Office) and speak to Pius. \n \n",
                onmob_target = {"Pius"},
                trigger_on_event_id = {355},
                route_to = "Metalworks",
            },
            { -- Step 8
                text = "Step 8: Walk to the Craftsmen's Eatery (Metalworks G-9) and speak to Grohm. \n \n",
                onmob_target = {"Grohm"},
                trigger_on_event_id = {426},
                route_to = "Metalworks",
            },
            { -- Step 9
                text = "Step 9: Go to Palborough Mines (North Gustaberg K-3) and make your way to the 3rd floor Waughroon Shrine (H-10). \n \n" ..
                       "Enter the Burning Circle for a cutscene and to fight the BCNM: Seeker + Dark Dragon. \n \n" ..
                       "Buffs are removed on entry; Trusts are allowed. (Low level: bring Silent Oils for the Lv21-23 Quadav.) \n" ..
                       "Winning grants the Key Item: Kindred Crest and the title Dark Dragon Slayer. \n \n",
                onmob_enemy = {"Seeker", "Dark Dragon"},
                onmob_enemy_colour = "red",
                onmob_enemy_size = 3,
                trigger_on_event_id = {32001},
                route_to = "Palborough Mines",
            },
            { -- Step 10
                text = "Step 10: Return to Savae E Paleade in the Metalworks to receive the Key Item: Kindred Report. \n \n",
                onmob_target = {"Savae_E_Paleade"},
                trigger_on_event_id = {207},
                route_to = "Metalworks",
            },
            { -- Step 11
                text = "Step 11: Return to Chateau d'Oraguille in Northern San d'Oria and report to Halver to complete the mission. \n \n" ..
                       "(Afterwards you can talk to Curilla to obtain her Alter Ego.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {507},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 3, 3000 gil, Key Item: Adventurer's Certificate, Title: Certified Adventurer"
        }
    },
    ["3-1: Infiltrate Davoi"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 35+. Trade 1 crystal or repeat Bat Hunt once if you need the rank points to unlock it.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and examine the Door: Prince Royal's Rm (H-7) to speak with Prince Trion. \n \n",
                onmob_target = {"_6h0"},
                trigger_on_event_id = {553},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Travel to Davoi (enter from Jugner Forest at G-12). A cutscene plays automatically when you zone in. \n \n" ..
                       "WARNING: Orcs in Davoi detect by sight - keep Invisible up. \n \n",
                trigger_on_event_id = {116},
                route_to = "Davoi",
            },
            { -- Step 4
                text = "Step 4: Find Quemaricond near the bridge (H-7) and talk to him for the Key Item: Royal Knights' Davoi Report. \n \n" ..
                       "Hug the right wall until the path turns north to a three-way intersection, then go left to the bridge. \n" ..
                       "Stay on the bridge and remain Invisible - Quemaricond walks toward you. \n" ..
                       "When the orcs on the west side look away, drop Invisible and talk to him. \n \n",
                onmob_target = {"Quemaricond"},
                trigger_on_event_id = {117},
                route_to = "Davoi",
            },
            { -- Step 5
                text = "Step 5: Return to San d'Oria and deliver the report to Prince Trion. \n \n" ..
                       "Chateau d'Oraguille - examine the Door: Prince Royal's Rm (H-7) again to complete the mission. \n \n",
                onmob_target = {"_6h0"},
                trigger_on_event_id = {554},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "H-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["3-2: The Crystal Spring"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 35. Trade 1 crystal or repeat a previous mission once if you need the rank points to unlock it.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Obtain a Crystal Bass. \n \n" ..
                       "Fish one at the Crystwater Spring in Jugner Forest (J-9), on the zone's eastern edge. \n" ..
                       "(Alternatively, buy a Crystal Bass from the Auction House. Extra fish can be used for repeats.) \n \n",
                items_needed = {"Crystal Bass"},
                trigger_on_item_obtain = {"Crystal Bass"},
                route_to = "Jugner Forest",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Return to San d'Oria and trade the Crystal Bass to a Gate Guard. \n \n" ..
                       "Ambrotien or Endracion (Southern, I-9 / H-7), or Grilau (Northern, D-6). \n \n" ..
                       "NOTE: On a repeat run, trading the Crystal Bass to a guard completes the mission immediately - skip the rest. \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1030, 2030},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 4
                text = "Step 4: Enter Chateau d'Oraguille (Northern San d'Oria, I-7). \n \n" ..
                       "A cutscene plays automatically on entry, between Halver, Curilla, and the Papsque. \n \n",
                trigger_on_event_id = {555},
                route_to = "Chateau d'Oraguille",
            },
            { -- Step 5
                text = "Step 5: Talk to the royal gardener Chalvatot (F-7) in Chateau d'Oraguille to complete the mission. \n \n",
                onmob_target = {"Chalvatot"},
                trigger_on_event_id = {556},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
    ["3-3: Appointment to Jeuno"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "3-1: Infiltrate Davoi"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Talk to a San d'Orian Gate Guard to accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n" ..
                       "(Level 40. Requires Mission 3-1. Trade 1 crystal or repeat a mission once if short on rank points.) \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1009, 2009},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 2
                text = "Step 2: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) and speak with Halver until you get the dialogue starting with \"I've been waiting for you.\" \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {508},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 3
                text = "Step 3: Examine the Door: Great Hall behind Halver for a cutscene with His Majesty Destin, and to receive the Key Item: Letter to the Ambassador. \n \n",
                onmob_target = {"_6h4"},
                trigger_on_event_id = {537},
                route_to = "Chateau d'Oraguille",
            },
            { -- Step 4
                text = "Step 4: Travel to Ru'Lude Gardens in Jeuno and talk to Nelcabrit (G-9) at the San d'Oria embassy for a cutscene. \n \n",
                onmob_target = {"Nelcabrit"},
                trigger_on_event_id = {42},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 5
                text = "Step 5: Travel to Qufim Island and enter Lower Delkfutt's Tower (F-6). \n" ..
                       "Tip: Unity Warp / Home Point to Qufim Island for quickness. \n \n",
                zone_trigger = "Lower Delkfutt's Tower",
                route_to = "Qufim Island",
                destination_highlight = {position = "F-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 6: Navigate Delkfutt's Tower to Floor 10 - Upper Delkfutt's Tower. \n" ..
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
                        state     = 6,
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
                        state     = 6,
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
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id  = 15,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 4,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id  = 6,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width     = 512,
                        height    = 512,
                        state     = 6,
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
                        state     = 6,
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
                        state     = 6,
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
                text = "Step 7: Kill Porphyrion at (H-8) on Floor 10 to obtain a Delkfutt Key. \n \n" ..
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
                        state     = 7,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id  = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 8
                text = "Step 8: Descend to the Lower Delkfutt's Tower basement and enter through the Cermet Door. \n" ..
                       "At Floor 10, use the Elevator platform (H-8) to drop to the blind staircase, then spiral down through Middle and Lower Delkfutt's Tower to the basement. \n" ..
                       "Cross the large basement room and trade (or use) your Delkfutt Key on the Cermet Door at (L-7) for a cutscene. \n \n",
                onmob_target = {"lower-delkfutt-tower-cermet-door-l7"},
                trigger_on_event_id = {0, "Lower Delkfutt's Tower"},
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
            { -- Step 9
                text = "Step 9: Return to the San d'Oria embassy in Ru'Lude Gardens (G-9) and speak to Nelcabrit, the receptionist, for a cutscene. \n \n",
                onmob_target = {"Nelcabrit"},
                trigger_on_event_id = {140},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 10
                text = "Step 10: Examine the ambassador's office door next to Nelcabrit to receive your reward and complete the mission. \n \n",
                onmob_target = {"_6r5"},
                trigger_on_event_id = {39},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 4, 5000 gil"
        }
    },
    ["4-1: Magicite"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "3-3: Appointment to Jeuno"},
            {category = "Quests", subfile = "Lower Jeuno", name = "Tenshodo Membership"},
        },
        steps = {
            -- PREREQUISITES
            {
                text = "Step 1: This mission requires Rank 4. Ensure your Rank Points are high (nearly or completely full) by completing repeatable missions or trading 4 crystals to a Conquest Overseer. \n \n" ..
                       "Morlepiche (H-10) in upper Ru'Lude Gardens accepts crystals. \n \n" ..
                       "Go to the San d'Oria Embassy and speak with Nelcabrit (G-9) to start the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards.",
                onmob_target = {"Nelcabrit"},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'square', center = { x = -4.9, y = 0.0, z = -79.3 }, size = 1, floor_id = 0, colour = "green" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 2.7, y = 9.0, z = -36.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 25.4, y = 7.4, z = -36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                trigger_on_event_id = {45},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },

            -- MISSION START
            {
                text = "Step 2: Next check the San d'Oria Embassy door at (G-9). \n \n" ..
                       "You will receive KI:Archducal Audience Permit.",
                onmob_target = {"_6r5"},
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 36.1, y = 7.5, z = -26.1 }, width = 2.50, height = 3.00, floor_id = 0, colour = "cyan", vertical_axis = 'ns' },
                },
                trigger_on_event_id = {130},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
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
                text = "Step 29: After obtaining all THREE Magicites, return to Ru'Lude Gardens (Home Point #1) and check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Airship Pass (or 20,000 gil if you already have one). \n \n" ..
                       "You will also receive title: 'Have Wings, Will Fly'. \n \n",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {60},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "H-6", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 30: Talk to Nelcabrit (G-9) at the San d'Oria Embassy in Ru'Lude Gardens to complete the mission. \n \n" ..
                       "Rewards: Rank 5, KI:Message to Jeuno, 10,000 gil. \n \n",
                onmob_target = {"Nelcabrit"},
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Ru'Lude Gardens", type = 'square', center = { x = -4.9, y = 0.0, z = -79.3 }, size = 1, floor_id = 0, colour = "green" },
                    { zone_name = "Ru'Lude Gardens", type = 'arrow', center = { x = 2.7, y = 9.0, z = -36.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Ru'Lude Gardens", type = 'rect', center = { x = 25.4, y = 7.4, z = -36.0 }, width = 3.00, height = 3.25, floor_id = 0, colour = "cyan", vertical_axis = 'z' },
                },
                trigger_on_event_id = {36},
                route_to = "Ru'Lude Gardens",
                destination_highlight = {position = "G-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank 5, Airship Pass (or 20,000 gil), Message to Jeuno KI, 10,000 gil, Title: Have Wings Will Fly"
        }
    },

    ["5-1: The Ruins of Fei'Yin"] = {
        prerequisites = {
            {category = "Missions", subfile = "SanDoria", name = "4-1: Magicite"},
        },
        steps = {
            { -- Step 1
                text = "Step 1: Enter Chateau d'Oraguille (Northern San d'Oria, I-7) for a cutscene. \n \n" ..
                       "NOTE: You must view this cutscene before you can accept the mission (or change allegiance at an Immigration NPC). \n \n",
                trigger_on_event_id = {509},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            { -- Step 2
                text = "Step 2: Go to a San d'Orian Gate Guard and accept the mission. \n \n" ..
                       "Southern San d'Oria: Ambrotien or Endracion (I-9 / H-7). \n" ..
                       "Northern San d'Oria: Grilau (D-6). \n \n",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {"You have accepted the mission"},
                zone_max_distance = 40,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Southern San d'Oria",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Northern San d'Oria",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            { -- Step 3
                text = "Step 3: Return to Halver in Chateau d'Oraguille to obtain the Key Item: New Fei'Yin Seal. \n \n" ..
                       "This mission cannot be completed without it. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {533},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
            {
                text = "Step 4: Zone into Fei'Yin for a cutscene with Zeid. \n \n",
                --trigger_on_event_id = {1},
                zone_trigger = "Fei'Yin",
                route_to = "Fei'Yin 1",
                zone_max_distance = 40,
                visual_zones = {
                    -- Route to Fei'Yin in Beaucedine Glacier from Xarca good to help players navigate complicated map.
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -136.4, y = -79.8, z = 220.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -119.9, y = -79.5, z = 173.5 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -101.2, y = -80.0, z = 133.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -96.4, y = -76.2, z = 102.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -32.0, y = -63.2, z = 101.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 0.5, y = -59.1, z = 98.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.6, y = -59.0, z = 60.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 3.0, y = -59.6, z = 12.0 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 5.7, y = -59.7, z = -27.1 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 2.7, y = -59.1, z = -58.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -5.6, y = -59.9, z = -81.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -29.7, y = -59.7, z = -105.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                    --Survival guide
                    { zone_name = "Beaucedine Glacier", type = 'square', center = { x = -28.0, y = -59.8, z = -125.0 }, size = 1, floor_id = 0, colour = "green" },

                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.1, y = -58.2, z = -95.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -63.6, y = -47.5, z = -142.3 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -58.7, y = -39.6, z = -189.8 }, size = 4, direction = "se", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = -27.6, y = -39.7, z = -205.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 10.6, y = -40.1, z = -193.4 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 23.3, y = -40.1, z = -151.9 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 54.1, y = -40.9, z = -128.8 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 85.5, y = -40.0, z = -101.0 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 120.5, y = -40.0, z = -87.2 }, size = 4, direction = "ne", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 141.8, y = -40.4, z = -50.1 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 133.9, y = -40.5, z = -4.9 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 93.1, y = -39.5, z = 0.7 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 61.2, y = -39.2, z = 5.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 64.2, y = -36.0, z = 20.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 126.2, y = -23.1, z = 20.1 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 153.0, y = -19.3, z = 20.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 175.3, y = -19.9, z = 17.5 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 170.4, y = -20.4, z = -30.7 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 167.1, y = -19.8, z = -83.4 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 158.6, y = -19.9, z = -114.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 128.2, y = -19.7, z = -142.5 }, size = 4, direction = "left", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 80.9, y = -19.6, z = -148.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 59.2, y = -17.4, z = -182.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 121.1, y = -3.7, z = -180.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 186.5, y = 0.4, z = -193.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },

                    --Intersection
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 229.4, y = 0.3, z = -198.3 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 269.5, y = 0.3, z = -200.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 317.1, y = 0.0, z = -196.8 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 323.4, y = 0.8, z = -136.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 313.5, y = 0.2, z = -88.5 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 300.7, y = 0.6, z = -27.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 299.3, y = 0.1, z = 21.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 292.0, y = 0.4, z = 57.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.4, y = 0.2, z = 88.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 194.3, y = 0.1, z = 115.2 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 181.1, y = 0.1, z = 144.2 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 195.4, y = 0.0, z = 180.4 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 237.2, y = 0.0, z = 196.2 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 282.7, y = 0.9, z = 217.7 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 335.7, y = -0.2, z = 226.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.0, y = 0.0, z = 277.8 }, size = 4, direction = "right", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 382.8, y = 1.9, z = 296.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 380.4, y = 16.4, z = 361.3 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 379.2, y = 21.0, z = 403.6 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 370.2, y = 20.1, z = 429.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 357.5, y = 20.0, z = 475.5 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 324.6, y = 20.5, z = 506.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 296.7, y = 20.7, z = 524.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                    { zone_name = "Beaucedine Glacier", type = 'arrow', center = { x = 280.7, y = 20.0, z = 535.0 }, size = 4, direction = "up", floor_id = 0, colour = "yellow" },
                },
            },
            {
                text = "Step 5: Travel to Qu'Bia Arena entrance at (K-8) in Fei'Yin.",
                zone_trigger = "Qu'Bia Arena",
                zone_max_distance = 35,
                visual_zones = {
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -176.1, y = -24.0, z = -171.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -152.5, y = -24.0, z = -148.2 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -133.5, y = -24.0, z = -140.4 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -100.2, y = -19.0, z = -133.3 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -97.7, y = -16.0, z = -96.0 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -74.6, y = -16.0, z = -69.5 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -60.4, y = -16.0, z = -61.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.7, y = -16.0, z = -61.7 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 32.3, y = -16.0, z = -54.0 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 27.8, y = -16.0, z = -21.6 }, size = 4, direction = "left", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -20.3, y = -16.0, z = -16.8 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = -16.7, y = -16.0, z = 22.6 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 13.8, y = -16.0, z = 49.1 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 24.9, y = -16.0, z = 58.9 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 63.1, y = -16.6, z = 59.1 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 99.6, y = -24.0, z = 56.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 124.8, y = -24.0, z = 28.4 }, size = 4, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 162.6, y = -23.7, z = 7.4 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 182.3, y = -24.0, z = 19.8 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 209.5, y = -24.0, z = 23.7 }, size = 4, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 221.8, y = -24.0, z = 37.2 }, size = 4, direction = "up", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 218.2, y = -24.0, z = 60.0 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Fei'Yin", type = 'rect', center = { x = 231.5, y = -29.6, z = 60.0 }, width = 4.75, height = 10.75, floor_id = 1, colour = "cyan", vertical_axis = 'z' },
                    { zone_name = "Fei'Yin", type = 'arrow', center = { x = 237.3, y = -24.3, z = 59.5 }, size = 4, direction = "right", floor_id = 1, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Examine the Burning Circle to enter BCNM 'The Rank 5 Mission'. \n \n" ..
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
                onmob_target = "qu-bia-arena-burning-circle",
                onmob_enemy = {"Ancient Sorcerer", "Ancient Warrior", "Archlich Taber'quoan"},
                kill_requirement = {
                    count = 1,
                    enemies = {"Archlich Taber'quoan"},
                    count_party_kills = true,
                    display_only = true,
                },
            },
            { -- Step 7
                text = "Step 7: Report back to Halver in Chateau d'Oraguille to complete the mission. \n \n" ..
                       "(Optional: afterwards talk to Prince Trion, Rahal, and Curilla for additional cutscenes.) \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {534},
                route_to = "Chateau d'Oraguille",
                destination_highlight = {position = "I-9", offsetX = 16, offsetY = 16},
            },
        },
        reward = {
            text = "Rank Points, Title: Archmage Assassin"
        }
    },
}
