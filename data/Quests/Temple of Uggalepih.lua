return {
    ["Paintbrush of Souls"] = {
        steps = {
            {
                text = "Step 1: Travel to the Temple of Uggalepih - We can use the Elshimo Uplands Outpost and go south to the entrance, otherwise you can get a Teleport-Yhoat and run south then east!",
                zone_trigger = "Temple of Uggalepih",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Yhoator Jungle",
                        highlights = {
                            { position = "J-12", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Obtain an Uggalepih Key. These are dropped by Tonberry Cutters in the Temple of Uggalepih (Map 1)",
                trigger_on_item_obtain = "Uggalepih Key",
                items_needed = "Uggalepih Key",
                --keyitems_needed = {272},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                    },
                },
            },
            {
                text = "Step 3: Go to (F-7) on Map 1 of Temple of Uggalepih and trade the Uggalepih Key to the Granite Door. Trading the key will trigger a walk-through cutscene - only the person who trades it will enter the room. The Uggalepih Key will be consumed upon entering.",
                onmob_target = "templeugg1-zm4-granitedoor",
                trigger_on_event_id = { 46 },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Inside the room, read each of the three Worn Books to obtain an Old Rusty Key (key item). You must read all three books(Click Yes!) - There's some lines to the ??? located in the room!",
                onmob_target = {"templeugg1-zm4-wornbook1","templeugg1-zm4-wornbook2","templeugg1-zm4-wornbook3"},
                keyitems_needed = {273},
                trigger_on_keyitem_obtain = {273},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Click on the Old Casket and use the Old Rusty Key to obtain your Paintbrush of Souls (permanent key item). This is required for Zilart Mission 4.",
                onmob_target = "templeugg1-zm4-oldcasket",
                keyitems_needed = {272},
                trigger_on_keyitem_obtain = {272},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Temple of Uggalepih",
                        floor_id = 1,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Permanent Key Item: Paintbrush of Souls (Required for Zilart Mission 4)"
        }
    },
}
