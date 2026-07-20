return {
    ["A Crystal Prelude(Windurst)"] = {
        steps = {
          {
            text = "Step 1: Talk to Erudu-Faludu (H-8) to start the quest.\n" ..
                   "Crystal Warrior quests are custom and do not lock the characters movement.\n" ..
                   "He will give you a 'Sickle' \n \n",
            images = {
                {
                    file     = "maps/toraimarai_canal_2.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-8", offsetX = 16, offsetY = 16 },
                    },
                }
            },
          },
          {
            text = "Step 2: Go to the room west, through the 'Marble Door' and use the 'Sickle'(trade it) on the 'Dangling Roots' for a 'Revival Root' item! \n \n",
            images = {
                {
                    file     = "maps/toraimarai_canal_2.png",
                    width    = 512,
                    height   = 512,
                    state    = 2,
                    highlights = {
                        { position = "G-8", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    file     = "items/sickle.png",
                    width    = 453,
                    height   = 87,
                    state    = 2,
                },
                {
                    file     = "items/revival_root.png",
                    width    = 453,
                    height   = 87,
                    state    = 2,
                },
            },
          },
          {
            text = "Step 3: Trade the 'Revival Root' to Erudu-Faludu (H-8) and he will give you your starting jobs Weapon! \n" ..
                   "Check the books around the room, and you will spawn a 'Dusty Tome' monster! \n" ..
                   "Kill it, and talk to Erudu-Faludu (H-8) again and he will warp you out into East Sarutabaruta with an 'Adventurers Coupon' \n" ..
                   "This can be traded to Jack of Spades (F-8) in Windurst Woods!\n \n",

            images = {
                {
                    file     = "maps/windurst_woods.png",
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "F-8", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
        },
        reward = {
            text = "JSE Onion Weapon, Adventurer Coupon!",
            images = {
                {
                    file   = "items/adventurer_coupon.png",
                    width  = 453,
                    height = 67,
                },
            },
        }
    },
}
