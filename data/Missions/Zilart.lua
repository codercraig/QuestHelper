return {
    ["ZM1: The New Frontier"] = {
        prerequisites = {
            {category = "Missions", subfile = "Bastok", name = "5-2: Xarcabard, Land of Truths"},
            {category = "Missions", subfile = "SanDoria", name = "5-2: The Shadow Lord"},
            {category = "Missions", subfile = "Windurst", name = "5-2: The Shadow Awaits"},
        },
        steps = {
            {
                text = "Step 1: Enter Norg to receive a cutscene and a Key Item: Map of Norg.",
                --zone_trigger = "Norg",
                trigger_on_event_id = {1},
                route_to = "Norg",
            },
        },
        reward = {
            text = "Key Item: Map of Norg",
        }
    },

    ["ZM2: Welcome tNorg"] = {
        steps = {
            {
                text = "Step 1: Click on the 'Oaken Door' at (K-8) in Norg for a cutscene with Gilgamesh. The dialog will ask if you want to open the door, choose Yes. \n \n" ..
                       "Note: If you are on one of the numerous Rhapsodies Missions where you click on the door, you will get that cutscene first. Just touch the door again. \n \n",
                route_to = "Norg",
                onmob_target = {"Norg_OakenDoor"},
                destination_highlight = {position = "K-8", offsetX = 16, offsetY = 16},
                trigger_on_event_id = {2},
            },
        },
        reward = {
            text = "None",
        }
    },

    ["ZM3: Kazhams Chieftainess"] = {
        steps = {
            {
                text = "Talk to Jakoh Wahcondalo at (J-9) in Kazham (Home Point #1) to obtain the Key Item: Sacrificial Chamber Key, which is required to enter the deeper areas of the Temple of Uggalepih.",
                onmob_target = "Jakoh Wahcondalo",
                route_to = "Kazham",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                --trigger_on_event_id = {114},
                keyitems_needed = {238},
                trigger_on_keyitem_obtain = {238},
            },
        },
        reward = {
            text = "Key Item: Sacrificial Chamber Key",
        }
    },

    ["ZM4: The Temple of Uggalepih"] = {
        prerequisites = {
            {category = "Quests", subfile = "Temple of Uggalepih", name = "Paintbrush of Souls"},
        },
        steps = {
            {
                keyitems_needed = {272},
                text = "Quick Route (Recommended): If you have already acquired the Den of Rancor Home Point #1, use that to arrive at Den of Rancor, Map 2 (E-4), wherein you just take a few steps west to arrive at your destination (skip to step 10). Alternatively, use Unity Concord Teleportation - talk to a Unity Concord NPC and select 'Bring me to Wanted encounter area', then choose Den of Rancor from the list of Level 128 encounter areas. You will arrive at Den of Rancor, Map 2 (G-12).",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        highlights = {
                            { position = "E-4", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Quick Route (Recommended): If you have already acquired the Den of Rancor Home Point #1 otherwise Travel to the Temple of Uggalepih, either via Survival Guide (Elshimo Uplands) to Map 1 (F-6), or via Yhoator Jungle to the main entrance at Map 1, (I-6). If you aren't in possession of the Permanent Key Item: Paintbrush of Souls, complete the mini-quest to receive it.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Take the northwest exit to Yhoator Jungle at Map 1, F-5. Head west in Yhoator on the outside of the temple to reach the entrance and enter the Temple of Uggalepih's Map 2.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Head south to (I-10). If you do not possess an Unlit Lantern, kill any Tonberry Maledictor, Tonberry Jinxer, and Tonberry Pursuer you see in the western rooms. Only one is required, but having up to four speeds things up. Once at (I-10), kill the Temple Guardian to open the door.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Enter the large room and take the northeast exit, following the corridor to arrive at (I-7/8), the room containing the Picture Frames and the Granite Door. Click on the empty Picture Frame in the middle of the eastern wall just once. You must stand directly in the center of the empty frame, as close to the wall as possible.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "When you receive the message 'By focusing your thoughts on the paintbrush of souls, a new painting begins to appear on the canvas...', wait at least 30 seconds (the screen should flash briefly) before confirming. After the message 'You succeeded in projecting the image in your soul to the blank canvas. The door to the Rancor Den has opened!', the Granite Door should open. Follow the passageway downward into Den of Rancor.",
                zone_trigger = "Den of Rancor",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "You should now be in a cavern of Den of Rancor, Map 1 (G-6) which contains some Tonberry Imprecators who can drop the Unlit Lantern, if you don't already possess one. Trade your Unlit Lantern to the Altar of Rancor on Map 1 (E-5) to receive a Rancor Flame. IMPORTANT: Only use the 'Rancor Flame' from this altar, not colored flames from other altars deeper in the Den.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16 },
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 0,
                    },
                },
            },
            {
                text = "Drop down the hole at the northeast corner of (F-7) to reach Map 2. Head northwest up the passageway to reach the four torches and the gate of the Sacrificial Chamber at (E-5).",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 0,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Trade a Rancor Flame to one torch to light it up and receive an Unlit Lantern in return. All four torches need to be lit to open the gate. You cannot trade while Invisible - you may need to fight enemies. Repeat the process of trading Unlit Lantern at the Altar to get Rancor Flame, then lighting torches, until all four are lit. The torches stay lit until the door is opened. WARNING: Players exiting via the door switch will cause lit torches to become unlit.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Once inside, interact with the Home Point so you don't have to repeat this process. Before proceeding to the battle, consider warping away to reset your Tonberry hate at the Temple of Uggalepih to avoid being K.O.'d by Everyone's Rancor. After entering the Sacrificial Chamber, examine the Mahogany Door to enter the Battlefield (level 99 cap, 6 players max). Buffs wear upon entry.",
                zone_trigger = "Sacrificial Chamber",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 10,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "BATTLE: There are three Tonberry NMs that must be defeated. Recommended kill order: 1) Grav'iton (Thief with crown - immune to sleep), 2) Molyb'iton (Black Mage), 3) Tungs'iton (Summoner). The Thief is completely immune to sleep, so kill it while you Silence/Sleep the other two. The Summoner comes with a random elemental pet that dies when its master does.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Sacrificial Chamber",
                    },
                },
            },
            {
                text = "At approximately 25% HP, the Summoner summons a random avatar for Astral Flow (max damage ~700-800). At approximately 25% HP, the Thief may use Everyone's Rancor which can K.O. in one shot if you haven't reset your Tonberry hate. This fight can be completed solo by most jobs at 99 and is easily duoed.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Sacrificial Chamber",
                    },
                },
            },
            {
                text = "Clearing the battlefield gives a cutscene and places you in a different location. You will obtain a Key Item: Dark Fragment. After the cutscene, walking out of the Sacrificial Chamber zones you to Map 2 of the Temple of Uggalepih at the Northwest room. Note: If you're doing this for Rhapsodies of Vana'diel prerequisite, you can now continue past The Cursed Temple. You do not need any further Zilart progress to finish Rhapsodies.",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Sacrificial Chamber",
                    },
                },
            },
        },
        reward = {
            text = "Key Item: Dark Fragment",
        }
    },
}
