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
                text = "Step 1: Talk to Jakoh Wahcondalo at (J-9) in Kazham (Home Point #1) to obtain the Key Item: Sacrificial Chamber Key, which is required to enter the deeper areas of the Temple of Uggalepih.",
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
                text = "Step 1: Start traveling to The Temple of Uggalepih. \n" ..
                       "Upper Elshimo Outpost warp will get you there quickly if you have it! \n \n",
                route_to = "Yhoator Jungle",
                destination_highlight = {position = "J-11", offsetX = 16, offsetY = 16},
                zone_trigger = "Temple of Uggalepih"
            },
            {
                text = "Step 2: Head back out to Yhoator Jungle via (F-5) exit, once outside of the temple go west back into exit3 - this will take you BACK into the Temple of Uggalepih (map2).\n \n" ..
                       "Follow the arrows back into the temple again if lost! \n \n" ..
                       "Run to the Granite Door (I-10) to the south and kill the Temple Guardian to open the door - run through quick or you will have to kill the Temple Guardian again",
                kill_requirement = {
                    count = 1,
                    enemies = {"Temple Guardian"},
                    zone = "Temple of Uggalepih",
                    count_party_kills = true
                },
                visual_zones = {
                    -- Floor 0 Yhoator
                    --1
                    { type = 'arrow', center = { x = 32.5, y = -10, z = -454.1 }, size = 4, direction = 'left',floor_id = 0 },
                    --2
                    { type = 'arrow', center = { x = 8.0, y = -10, z = -453.7 }, size = 4, direction = 'down',floor_id = 0 },
                },
                zone_name = "Yhoator Jungle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Ugg`alepih",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yhoator Jungle",
                        floor_id = 0,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 3: Enter the large room and take northeast exit and make your way to (I-7)! \n \n" ..
                       "You will have to navigate through a Granite Door, and you will find yourself in a room with paintings. \n \n" ..
                       "Click on the painting on the east wall only ONCE and do NOT confirm the second message just yet. \n \n" ..
                       "It should say 'There is a blank canvas in this frame. The Paintbrush of souls begins to twitch.' \n \n" ..
                       "You should then see 'By focusing your thoughts on the paintbrush of souls, a new painting begins to appear on the canvas...' DO NOT CLICK YET - wait about 30seconds and the screen should flash white! Then you can click! \n \n" ..
                       "Note: Will be safer to clear the Tonberries out as they will aggroe level 75s. \n \n",
                trigger_on_talk = " Den of Rancor has opened!",
                onmob_target = "templeugg2-zm4-eastpainting",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 4: A door has opened on your left side - look for an arrow, that will lead to the Den of Rancor.",
                visual_zones = {
                    { type = 'arrow', center = { x = -54.4, y = -0, z = 20.2 }, size = 4, direction = 'right',floor_id = 2 },
                },
                zone_name = "Temple of Uggalepih",
                zone_trigger = "Den of Rancor",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Temple of Uggalepih",
                        floor_id = 2,
                    },
                },
            },
            {
            text = "Step 5: Den of Rancor - Light 4 torches to open the gate. Make sure to read ALL of the steps - Items are RARE/EX, so repeat this cycle x4:\n \n" ..
                "Tip: Having someone with the Home Point open the gate is strongly recommended.\n \n" ..
                "[1] Kill a Tonberry Imprecator (G-6) for an Unlit Lantern (skip if you have one - after 1st cycle you should have an Unlit Lantern returned to you!).\n \n" ..
                "[2] Trade to the Altar of Rancor (E-5) Map 1 for a Rancor Flame.\n" ..
                "    !! Only THIS Altar works - deeper Altars produce the wrong flame.\n \n" ..
                "[3] Head to Map 2 via the drop at (F-7).\n \n" ..
                "[4] Trade the Rancor Flame to a torch (E-5) Map 2 — torch lit, Unlit Lantern returned run back up to light the next Unlit Lantern - rinse repeat till all are lit and door opens!\n \n" ..
                "Notes: You cannot trade while Invisible. If you loot an Unlit Lantern mid-fight while holding a Rancor Flame, drop it before trading.\n \n" ..
                "WARNING: The exit switch unlights all torches! If others are present, wait for them to go through first. Get the Home Point on the other side!\n \n",
                zone_trigger = "Sacrificial Chamber",
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = -78.3, y = 15.4, z = -0.5 },
                        size = 1,
                        floor_id = 1  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -63.2, y = 45.7, z = 26.5 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -56.9, y = 46, z = 26.5 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -65.1, y = 45.9, z = 21 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -54.9, y = 45.9, z = 21 },
                        size = 2,
                        floor_id = 2  -- Optional: only show on floor 1
                    },
                    { type = 'arrow', center = { x = -9.6, y = 16.6, z = -61.5 }, size = 4, direction = 'se',floor_id = 1 },

                },
                zone_name = "Den of Rancor",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "F-7", offsetX = 16, offsetY = 16 ,  label = "3" },
                            { position = "G-6", offsetX = 16, offsetY = 16 ,  label = "1" },
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "E-5", offsetX = 16, offsetY = 16, label = "4"},
                            { position = "D-4", offsetX = 16, offsetY = 16, label = "X"},
                        },
                        zone_name = "Den of Rancor",
                        floor_id = 2,
                    },
                },
            },
            {
                text = "Step 6: Inside the Sacrificial Chamber, examine the Mahogany Door to enter the Battlefield.\n \n" ..
                    "Level 99 cap, 6 players max. All buffs wear on entry (including Reraise) — no EXP loss.\n \n" ..
                    "Defeat all three Tonberry NMs. Recommended order:\n" ..
                    "[1] Grav'iton (Thief - crown on head). Immune to sleep - kill first while sleeping/silencing the others.\n" ..
                    "    Warning: At ~25% HP may use Everyone's Rancor, which can one-shot if your Tonberry hate is high.\n" ..
                    "[2] Molyb'iton (Black Mage).\n" ..
                    "[3] Tungs'iton (Summoner). Has a random elemental pet that dies with it - no need to kill the pet.\n" ..
                    "    Warning: At ~25% HP will use Astral Flow (~700-800 damage max). Heal up before waking the elemental.\n \n" ..
                    "Soloable by most jobs at 99. Clearing gives a cutscene and Key Item: Dark Fragment.\n" ..
                    "Exiting zones you to Temple of Uggalepih Map 2 (NW room).\n",
                kill_requirement = {
                    count = 3,
                    enemies = {"Grav'iton", "Molyb'iton", "Tungs'iton"},
                    count_party_kills = true,
                },
                trigger_on_keyitem_obtain = {246},
            },
        },
        reward = {
            text = "Key Item: Dark Fragment",
        }
    },

    ["ZM5: Headstone Pilgrimage"] = {
        prerequisites = {
            {category = "Missions", subfile = "Zilart", name = "ZM4: The Temple of Uggalepih"},
        },
        steps = {
            {
                text = "Step 1: [Water Fragment] — La Theine Plateau\n \n" ..
                    "You need to collect 8 Fragments from across Vana'diel. The Dark Fragment from ZM4 already counts — 7 more to go.\n \n" ..
                    "Note: At battle headstones only one party member needs to examine to spawn the NMs. You have 15 minutes to collect your fragment after defeating them.\n \n" ..
                    "The Cermet Headstone is at (G-11) in La Theine Plateau — no battle required here.\n \n" ..
                    "Fastest: Geomagnetic Fount to La Theine Plateau (arrives at H-10), then run SW to (G-11).\n \n" ..
                    "Run mode: Enter Ordelle's Caves from La Theine Plateau at (F-7) - Look for my wee arrows!\n \n",
                route_to = "La Theine Plateau",
                zone_trigger = "Ordelle's Caves",
                destination_highlight = {position = "F-7", offsetX = 16, offsetY = 16},
                visual_zones = {
                    { type = 'arrow', center = { x = -285.8, y = 9.4, z = 289.0 }, size = 4, direction = 'nw',floor_id = 0 },
                    { type = 'arrow', center = { x = -298.0, y = 25.5, z = 348.4 }, size = 4, direction = 'sw',floor_id = 0 },
                },
                zone_name = "La Theine Plateau",
            },
            {
                text = "Step 2: [Water Fragment] — Enter Ordelle's Cave! \n \n" ..
                    "[1] Once inside Ordelle's Cave head east initially and then south to (I-6)! \n \n" ..
                    "[2] Next we will go to (H-9) on the next map! \n \n" ..
                    "[3] This will lead back to the intial map, we want to go to (H-11) in the SOUTH-EAST room and drop down marked hole. \n \n" ..
                    "Notes: Make sure to NOT fall down the first hole, we will mark the correct hole with a SQUARE. \n \n" ..
                    "[4] Head east to (H-11) to the next map.. \n \n" ..
                    "[5] Last map in the caves, head to (G-10) which will zone you ou to La Theine Plateau ! \n \n",

                visual_zones = {
                    { type = 'arrow', center = { x = -89.9, y = 0.3, z = 589.6 }, size = 4, direction = 'right',floor_id = 1 },
                    { type = 'arrow', center = { x = -145.0, y = 32.1, z = 180.0 }, size = 4, direction = 'right',floor_id = 15 },
                    { type = 'arrow', center = { x = -22.3, y = 32.3, z = 149.2 }, size = 4, direction = 'down',floor_id = 15 },
                    { type = 'arrow', center = { x = -31.6, y = 0.6, z = -8.4 }, size = 4, direction = 'se',floor_id = 1 },
                    { type = 'square', center = { x = -45.6, y = 0.5, z = -74.6 }, size = 7,floor_id = 1 },
                    { type = 'arrow', center = { x = -39.9, y = 28.1, z = -73.6 }, size = 4, direction = 'right',floor_id = 15 },
                    { type = 'arrow', center = { x = -60.2, y = -27.3, z = 55.5 }, size = 4, direction = 'down',floor_id = 2 },
                    { type = 'arrow', center = { x = -100.1, y = -27.5, z = -179.6 }, size = 4, direction = 'left',floor_id = 2 },
                },
                zone_name = "Ordelle's Caves",
                zone_trigger = "La Theine Plateau",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "1"},
                            { position = "H-11", offsetX = 16, offsetY = 16, label = "3"},
                        },
                        floor_id = 1,
                        zone_name = "Ordelle's Caves",
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16, label = "2"},
                            { position = "I-11", offsetX = 16, offsetY = 16, label = "4"},
                        },
                        floor_id = 15,
                        zone_name = "Ordelle's Caves",
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16, label = "5"},
                        },
                        floor_id = 2,
                        zone_name = "Ordelle's Caves",
                    },
                },
            },
             {
                text = "Step 3: [Water Fragment] - Final ! \n \n" ..
                       "Run to the Cermet Headstone and clicky for your first Key Item: Water Fragment!! \n \n",
                keyitems_needed = {240},
                trigger_on_keyitem_obtain = {240},
                onmob_target = "zm4-la-theine-cermet-headstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16,},
                        },
                        floor_id = 0,
                        zone_name = "La Theine Plateau",
                    },

                },
            },
            {
                text = "Step 4 [Ice Fragment] - Travel To Fei'Yin!\n \n" ..
                    "Fastest: Home Point #2 in Fei'Yin — short walk north to the Cloister.\n" ..
                    "Alternative: Home Point #1 in Fei'Yin, use Sneak navigating to (G-9).\n" ..
                    "Mini Tuning Fork of Ice holders can warp directly from Northern San d'Oria.\n \n" ..
                    "If running follow route to Fei'Yin! \n \n",
                keyitems_needed = {244},
                route_to = "Beaucedine Glacier",
                destination_highlight = {position = "J-4", offsetX = 16, offsetY = 16},
                zone_trigger = "Fei'Yin",
            },
            {
                text = "Step 5 [Ice Fragment] - Inside Fei'Yin -> Cloister of Frost\n \n" ..
                    "Once inside Fei'Yin head to (G-9), and then run to (I-5) near the Cloister of Frost \n \n" ..
                    "Notes: Remember to Sneak up! \n \n",
                visual_zones = {
                    { type = 'arrow', center = { x = -78.8, y = -15.6, z = -73.4 }, size = 4, direction = 'ne',floor_id = 1 },
                    { type = 'arrow', center = { x = -20.6, y = -16, z = -61.1 }, size = 4, direction = 'right',floor_id = 1 },
                    { type = 'arrow', center = { x = -18.8, y = -16, z = -18.9 }, size = 4, direction = 'left',floor_id = 1 },
                },
                zone_name = "Fei'Yin",
                zone_trigger = "Cloister of Frost",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Fei'Yin",
                        floor_id = 1,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Fei'Yin",
                        floor_id = 15,
                    },
                },
            },
            {
                text = "Step 6 [Ice Fragment] - Cloister of Frost -> Cermet Headstone \n \n" ..
                       "Once inside Cloister of Frost, run past the protocrystal and click on the Cermet Headstone. \n \n",
                trigger_on_keyitem_obtain = {244},
                onmob_target = "cloister-of-frost-zm5-cermet-headstone",

            },
            {
                text = "Step 7: [Earth Fragment] - Western Altepa Desert \n \n" ..
                    "Fastest: Unity Teleport (Content Level 125) to Western Altepa Desert - drops you right above the pit.\n \n" ..
                    "Otherwise: Enter Quicksand Caves at (J-9).",
                route_to = "Western Altepa Desert",
                destination_highlight = {position = "J-9", offsetX = 16, offsetY = 16},
                keyitems_needed = {241},
                visual_zones = {
                    { type = 'arrow', center = { x = 127.8, y = 1.1, z = -218.6 }, size = 4, direction = 'right' },
                },
                zone_name = "Western Altepa Desert",
                zone_trigger = "Quicksand Caves",
                --trigger_on_keyitem_obtain = {570}, -- TODO: verify Earth Fragment key item ID
            },
            {
                text = "Step 8: [Earth Fragment] - Quicksand Caves \n \n" ..
                    "After zoning, drop down through the sand pit at (K-6) then head east to re-enter Western Altepa Desert.\n \n",
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = 217.3, y = 6.3, z = -15.5 },
                        size = 5,
                        floor_id = 3  -- Optional: only show on floor 1
                    },
                },
                zone_name = "Quicksand Caves",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "K-6", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "N-4", offsetX = 16, offsetY = 16, label = "2" },
                        },
                        zone_name = "Quicksand Caves",
                        floor_id = 3,
                    },
                },
                zone_trigger = "Western Altepa Desert",
            },
            {
                text = "Step 9: [Earth Fragment] - Re-entering Western Altepa Desert. \n \n" ..
                       "Drop down and follow the below ground level path/tunnel to (H-9) and touch the Cermet Headstone.\n \n",
                visual_zones = {
                     { type = 'arrow', center = { x = 140.5, y = 10.2, z = -19.6 }, size = 4, direction = 'down' },
                     { type = 'arrow', center = { x = 58.9, y = 10.2, z = -99.6 }, size = 4, direction = 'left' },
                     { type = 'arrow', center = { x = -19.2, y = 10.2, z = -76.2 }, size = 4, direction = 'down' },
                },
                zone_name = "Western Altepa Desert",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Western Altepa Desert",
                    },
                },
                trigger_on_keyitem_obtain = {241},
                onmob_target = "western-altepa-desert-zm5-cermet-headstone",
            },
            {
                text = "Step 10 [Fire Fragment] - Journey to Ifrit's Cauldron! \n \n" ..
                    "Bring 3+ Ice Clusters just to be safe. Everyone needs Sneak and Invisible — Bombs detect magic use.\n \n" ..
                    "Fastest start: Survival Guide to Yhoator Jungle (G-6) entrance of Ifrit's Cauldron.\n \n" ..
                    "Otherwise let's head to Yhoator Jungle (G-6) and enter Ifrit's Cauldron. \n \n" ..
                    "Follow the Arrows from Kazham if you don't know the way to (G-6)!!",
                route_to = "Yhoator Jungle",
                destination_highlight = {position = "G-6", offsetX = 16, offsetY = 16},
                zone_trigger = "Ifrit's Cauldron",
                items_needed = {
                    { item = "Ice Cluster", quantity = 3 },
                    { item = "Garnet", quantity = 1, optional = true },
                },
                visual_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -160.6, y = 0, z = 362.3 }, size = 4, direction = 'ne' },
                    { zone_name = "Yuhtunga Jungle", type = 'square', center = { x = -94.8, y = 0, z = 418.3 }, size = 7 },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = -94.1, y = 11.2, z = 419.1 }, size = 4, direction = 'sw' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 16.3, y = 1.1, z = 262.5 }, size = 4, direction = 'down' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 30.7, y = 0, z = 222.1 }, size = 4, direction = 'sw' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 20.9, y = 4.5, z = 139.6 }, size = 4, direction = 'down' },
                    -- Yhoator Jungle shapes go here
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -218.0, y = 1.3, z = 176.9 }, size = 4, direction = 'down' },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -167.1, y = 0, z = 58.4 }, size = 4, direction = 'sw' },
                    { zone_name = "Yhoator Jungle", type = 'arrow', center = { x = -161.4, y = 0.8, z = 15 }, size = 4, direction = 'ne' },
                },
            },
            {
                text = "Step 11 [Fire Fragment] - Ifrit's Cauldron - Yuhtunga Jungle\n \n" ..
                    "Route:\n" ..
                    "  Map 4: Enter at (G-6) - head to (H-8) - Map 7\n" ..
                    "  Map 7: (D-12) - Map 5 \n" ..
                    "  Map 5: (J-8) - Map 2. Flame Spout at (H-6)/(H-7) - trade Ice Cluster or wait ~5 min.\n" ..
                    "  Map 2: (E-7) - Map 7 \n" ..
                    "  Map 7: (G-7) - Map 8 \n" ..
                    "  Map 8: Follow tunnel to (C-7) - exit to Yuhtunga Jungle. Two more Flame Spouts on the way.\n \n" ..
                    "  Ash Dragon near the end has wide detection — time your entry when it moves away.\n \n",
                visual_zones = {
                    { zone_name = "Ifrit's Cauldron", type = 'arrow', center = { x = -58.8, y = 20.3, z = 20.5 }, size = 4, direction = 'up' },
                },
                zone_trigger = "Yuhtunga Jungle",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 4,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "D-12", offsetX = 16, offsetY = 16, label="1" },
                            { position = "G-7", offsetX = 16, offsetY = 16, label="2" },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 16,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 5,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 2,
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "C-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Ifrit's Cauldron",
                        floor_id = 17,
                    },
                },
            },
            {
                text = "Step 12 [Fire Fragment] — Back to Yuhtunga Jungle! \n \n" ..
                       "",
                visual_zones = {
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 381.3, y = 20.3, z = 317.3 }, size = 4, direction = 'se' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 395.6, y = 20.2, z = 296.5 }, size = 4, direction = 'right' },
                    { zone_name = "Yuhtunga Jungle", type = 'arrow', center = { x = 419.2, y = 20.1, z = 305.4 }, size = 4, direction = 'right' },
                },
                -- kill_requirement = {
                --     count = 1,
                --     enemies = {"Ancient Weapon"},
                --     count_party_kills = true,
                -- },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 5 [Wind Fragment] — Cape Teriggan\n\n" ..
                    "Fastest: Home Point #1 at Cloister of Gales, or Unity warp (Level 128).\n\n" ..
                    "Enter the uncharted tunnel at (F-7) [1], follow it south, then enter the tunnel at (G-5) [2].\n" ..
                    "The Cermet Headstone is at (H-5).\n\n" ..
                    "BATTLE: Shadow named Axesarion the Wanderer spawns.\n" ..
                    "Uses Dimensional Death frequently. Immune to Stun. Nearby Goblins respawn every 5 minutes.",
                route_to = "Cape Teriggan",
                destination_highlight = {position = "H-5", offsetX = 16, offsetY = 16},
                kill_requirement = {
                    count = 1,
                    enemies = {"Axesarion the Wanderer"},
                    count_party_kills = true,
                },
                trigger_on_keyitem_obtain = {572}, -- TODO: verify Wind Fragment key item ID
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-5", offsetX = 16, offsetY = 16, label = "2" },
                        },
                        zone_name = "Cape Teriggan",
                    },
                },
            },
            {
                text = "Step 6 [Fire Fragment] — Ifrit's Cauldron → Yuhtunga Jungle\n\n" ..
                    "Bring 3+ Ice Clusters. Everyone needs Sneak and Invisible — Bombs detect magic use.\n" ..
                    "Fastest start: Survival Guide to Yhoator Jungle (G-6) entrance of Ifrit's Cauldron.\n\n" ..
                    "Route:\n" ..
                    "  Map 4: Enter at (G-6) → head to (H-8) → Map 7\n" ..
                    "  Map 7: (D-12) → Map 5\n" ..
                    "  Map 5: (J-8) → Map 2. Flame Spout at (H-6)/(H-7) — trade Ice Cluster or wait ~5 min.\n" ..
                    "  Map 2: (E-7) → Map 7\n" ..
                    "  Map 7: (G-7) → Map 8\n" ..
                    "  Map 8: Follow tunnel to (C-7) → exit to Yuhtunga Jungle. Two more Flame Spouts on the way.\n" ..
                    "  !! Ash Dragon near the end has wide detection — time your entry when it moves away.\n\n" ..
                    "In Yuhtunga Jungle: exit tunnel, turn left, enter the tunnel at (L-7) for the Cermet Headstone.\n\n" ..
                    "BATTLE: Two Opo-Opos — Carthi and Tipha. Both immune to Sleep and Lullaby. Gravity and Bind work.",
                route_to = "Yhoator Jungle",
                kill_requirement = {
                    count = 2,
                    enemies = {"Carthi", "Tipha"},
                    count_party_kills = true,
                },
                trigger_on_keyitem_obtain = {569}, -- TODO: verify Fire Fragment key item ID
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yhoator Jungle",
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Yuhtunga Jungle",
                    },
                },
            },
            {
                text = "Step 7 [Light Fragment] — The Sanctuary of Zi'Tah\n\n" ..
                    "Head to the SE corner of (J-9), take the hidden path north to the top-right of (J-9), then hug left along the uncharted path to (I-7).\n\n" ..
                    "BATTLE: Doomed named Doomed Pilgrims — considered the hardest headstone fight. Hits hard and fast. High evasion recommended.\n\n" ..
                    "Once all 8 fragments are collected: 'You now have all 8 fragments of light!' — mission complete!",
                route_to = "The Sanctuary of Zi'Tah",
                destination_highlight = {position = "I-7", offsetX = 16, offsetY = 16},
                kill_requirement = {
                    count = 1,
                    enemies = {"Doomed Pilgrims"},
                    count_party_kills = true,
                },
                trigger_on_keyitem_obtain = {575}, -- TODO: verify Light Fragment key item ID
                trigger_on_talk = "You now have all 8 fragments of light!",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "The Sanctuary of Zi'Tah",
                    },
                },
            },
        },
        reward = {
            text = "Key Items: Fire, Earth, Water, Wind, Ice, Lightning & Light Fragments\nTitle: Bearer of the Eight Prayers",
        }
    },
}
