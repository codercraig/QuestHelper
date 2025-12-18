return {
    ["Open Sesame"] = {
        steps = {
            {
                text = "Step 1: Speak to Lokpix at the Altepa telepoint in Eastern Altepa Desert (G-10) and answer yes to both questions. \n \n" ..
                       "This step does not need to be done first, but must be completed before trading items to him.",
                onmob_target = "Lokpix",
                trigger_on_talk = {"Open Sesame"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Eastern Altepa Desert",
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Obtain a Tremorstone by checking a ??? near the protocrystal in the Cloister of Tremors. \n \n" ..
                       "This quest does not need to be active to obtain the Tremorstone. \n \n" ..
                       "Quick route: If you have Summoner level 20+, use the Mini Tuning Fork of Earth from the 'Trial Size Trial by Earth' quest to warp instantly. \n \n" ..
                       "Alternative: Use Quicksand Caves Home Point #2, or Unity warp to Quicksand Caves (Level 125 category).",
                trigger_on_item_obtain = "Tremorstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Cloister of Tremors",
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Obtain ONE of the following items (your choice): \n \n" ..
                       "Option 1: Meteorite - Dropped by Crawlers in West Sarutabaruta (only Crawlers around Starfall Hillock), or excavated from Mineral Vein in Mog Garden. \n \n" ..
                       "Option 2: Soil Gem - Craft via mid-level Goldsmithing, or buy from Auction House. \n \n" ..
                       "Option 3: Twelve Soil Geodes - Dropped by high level monsters on Earthday or in earth weather, or buy from Auction House.",
                items_needed = {
                    { display = "Meteorite OR Soil Gem OR 12x Soil Geodes", alternatives = {"Meteorite", "Soil Gem", "Soil Geodes"} }
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "West Sarutabaruta",
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Trade the Tremorstone and your chosen item(s) to Lokpix at Eastern Altepa Desert (G-10) to receive the Key Item: Loadstone.",
                onmob_target = "Lokpix",
                trigger_on_keyitem_obtain = "Loadstone",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Eastern Altepa Desert",
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Key Item: Loadstone (Required for Bastok Mission 8-1)"
        }
    },
}
