return {
    ["1-1: Smash the Orcish Scouts"] = {
        steps = {
            { -- Step 1
                text = "Step 1: Talk to any San d'Orian Gate Guard to accept the mission.",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_talk = {"You have accepted the mission"},
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
                text = "Step 2: Defeat Orcish Fodder in West Ronfaure, Ghelsba Outpost, or La Theine Plateau to obtain an Orcish Axe.",
                trigger_on_item_obtain = {"Orcish Axe"},
            },
            { -- Step 3
                text = "Step 3: Return to San d'Oria and trade the Orcish Axe to any San d'Orian Gate Guard to complete the mission.",
                onmob_target = {"Ambrotien", "Endracion", "Grilau"},
                trigger_on_event_id = {1002, 1020, 2002, 2020},
            },
        },
        reward = {
            text = "Rank Points"
        }
    },
}
