return {
    ["1-1: The Horutoto Ruins Experiment"] = {
        steps = {
          {
            text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n" ..
                   "They can be found at the entrance gates to the city. \n \n",
            images = {
                {
                    zone_name = "Windurst Waters",
                    floor_id = 1,
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "F-5", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    zone_name = "Port Windurst",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "B-5", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    zone_name = "Windurst Woods",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "K-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    zone_name = "Windurst Walls",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 2: Go to Orastery in Port Windurst (E-7) and speak to Hakkura-Rinkuru.\n \n",
            images = {
                {
                    file     = "maps/port_windurst.png",
                    width    = 512,
                    height   = 512,
                    state    = 2,
                    highlights = {
                        { position = "E-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 3: Go to East Sarutabaruta (J-7) and look out for a large stone tower.\n" ..
                   "There's a survival guide teleport if you have unlocked it for the Inner Horutoto Ruins!\n" ..
                   "(Optional): Speak to Sama Gohjima at the entrance of the tower for extra dialogue.\n \n",

            images = {
                {
                    file     = "maps/east_sarutabaruta.png",
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "J-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 4: Inside the Inner Horutoto Ruins go down the stairs towards to the main room and look for the Cracked Wall located roughly around (H-9). \n \n",

            images = {
                {
                    file     = "maps/inner_horutoto_ruins_1.png",
                    width    = 512,
                    height   = 512,
                    state    = 4,
                    highlights = {
                        { position = "H-9", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 5: Pass through and turn left check the Magical Gizmo (I-9) \n \n",
            images = {
                {
                    file     = "maps/inner_horutoto_ruins_1.png",
                    width    = 512,
                    height   = 512,
                    state    = 5,
                    highlights = {
                        { position = "I-9", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 6: Head back out and check the six different Ancient Magical Gizmos. \n" ..
                   "You will recieve the KI:Cracked Mana Orb which will be at a random Gizmo.\n \n",
            images = {
                {
                    file     = "maps/inner_horutoto_ruins_1.png",
                    width    = 512,
                    height   = 512,
                    state    = 6,
                    highlights = {
                        { position = "G-8", offsetX = 16, offsetY = 16 },
                        { position = "G-9", offsetX = 16, offsetY = 16 },
                        { position = "H-8", offsetX = 16, offsetY = 16 },
                        { position = "H-9", offsetX = 16, offsetY = 16 },
                        { position = "I-8", offsetX = 16, offsetY = 16 },
                        { position = "I-9", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 7: Head back to Hakkuru-Rinkuru (E-7) to complete the first mission! \n \n",
            images = {
                {
                    file     = "maps/port_windurst.png",
                    width    = 512,
                    height   = 512,
                    state    = 7,
                    highlights = {
                        { position = "E-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
        },
        reward = {
            text = "Rank Points!",
            -- images = {
            --     {
            --         file   = "equipment/rajasring.png",
            --         width  = 300,
            --         height = 100,
            --     },
            --     {
            --         file   = "equipment/rajasring.png",
            --         width  = 300,
            --         height = 100,
            --     },
            -- },
        }
    },

    ["1-2: The Heart of the Matter"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n" ..
                       "They can be found at the entrance gates to the city. \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_windurst.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to Windurst Woods and talk to Apururu (H-9) - (Home Point #3).\n" ..
                       "She will give you 6 Dark Mana Orbs, with a destination of Outer Hurototo Ruins. \n \n",
                images = {
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Proceed to East Sarutabaruta and talk to Pore-Ohre (J-11).\n" ..
                       "He will give you a KI:Southeastern Star Charm.\n" ..
                       "Head down the tower and zone into the Outer Horutoto Ruins.\n \n",
                images = {
                    {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: In Outer Horutoto Ruins run South, and then West \n"..
                       "You will have to click the 6 Gizmos at each corner of the sqaure\n" ..
                       "And there's 2 Gizmos in the North and South secret rooms. \n \n",
                images = {
                    {
                        file     = "maps/outer_horutoto_ruins_3.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                    },
                },
            },
            {
                text = "Step 5: Once all the orbs have been placed, head to the crack on the east outer wall!\n" ..
                       "Examine the 'Gate: Magical Gizmo'\n" ..
                       "Your orbs should now be energised with MAGIC! \n \n",
                images = {
                    {
                        file     = "maps/outer_horutoto_ruins_3.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                    },
                },
            },
            {
                text = "Step 6: Recollect all the Orbs now.\n" ..
                       "Should now be KI:GLOWING Mana Orbs'\n" ..
                       "If you zone out you will get an extra cutscene with the Cardinals. \n \n",
                images = {
                    {
                        file     = "maps/outer_horutoto_ruins_3.png",
                        width    = 512,
                        height   = 512,
                        state    = 6,
                    },
                },
            },
            {
                text = "Step 7: Speak to Apururu (H-9) in Windurst Woods(Home Point#3) inside the Manustery.\n \n",
                images = {
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = "Rank Points"
    },

    ["1-3: The Price of Peace"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n" ..
                       "They can be found at the entrance gates to the city. \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_windurst.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to Windurst Waters(South) - (Home Point#3), and talk to Leepe-Hoppe (J-9) on the roof of the Rhinostery. \n" ..
                       "He will give you the KI:Food/Drink Offering. \n" ..
                       "Optional: Talk with Ohbiru-Dohbiru. \n \n",
                images = {
                      {
                          file     = "maps/windurst_waters_2.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          highlights = {
                              { position = "J-9", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 3: Travel through West Sarutabaruta (F-7) and Enter Giddeus. \n" ..
                       "Notes: Nearby Outpost (H-6). \n \n",
                images = {
                    {
                        file     = "maps/west_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                  },
            },
            {
                text = "Step 4: Whilst in Giddeus follow the path and at ALL intersections take the left hand choice until (H-7). \n" ..
                       "Talk to the Yagudo NPC Laa Mozi to give the KI:Food Offering. \n \n",
                images = {
                    {
                        file     = "maps/giddeus_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                  },
            },
            {
                text = "Step 5: Turn back and continue to take the left hand choice until (G-7). \n" ..
                       "Talk to the other Yagudo NPC Ghoo Pakya to give the KI:Drink Offering. \n \n",
                images = {
                    {
                        file     = "maps/giddeus_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                  },
            },
            {
                text = "Step 6: Return to Windurst Waters and talk to Leepe-Hoppe (J-9). \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_2.png",
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                  },
            },
            {
                text = "Step 7: Complete the mission by talking to any Windurstian Gate Guard.\n" ..
                       "They can be found at the entrance gates to the city. \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_windurst.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = "Rank 2, 1000g!"
    },

    ["2-1: Lost for Words"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n" ..
                       "They can be found at the entrance gates to the city. \n" ..
                       "Trade 1 of any crystal to unlock this mission, or trade 7 for a full progress bar. \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_windurst.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "B-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "K-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 2: Go to Windurst Waters(North) - (Home Point#1), and talk to Tosuka-Porika (G-8) in the Optistery. \n" ..
                       "He is in the East Wing of the Optistery. \n" ..
                       "Notes: May have to talk to him twice to progress in this Mission! \n \n",
                images = {
                      {
                          file     = "maps/windurst_waters_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          highlights = {
                              { position = "G-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 3: Travel to Windurst Woods and talk to Nanaa Mihgo (J-3). \n" ..
                       "Notes: You will obtain a KI:Lapis Monocle. \n \n",
                images = {
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "J-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Travel to Maze of Shakhrami. \n \n" ..
                       "Travel: \n" ..
                       "East Sarutabaruta (J-4) -> Tahrongi Canyon \n" ..
                       "Tahrongi Canyon   (K-5) -> Maze of Shakhrami \n \n",
                images = {
                    {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-4", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/tahrongi_canyon.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "K-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Inside go to (G-6) and go through tunnel marked 'D' on map. \n" ..
                       "Continue down and you will be on a new map... \n" ..
                       "Go to (H-5) and examine a 'Fossil Rock' obtain KI:Lapis Coral. - and if unlucky continue onto - (I-7)/(I-8)/(F-8) throughout the zone. \n \n" ..
                       "Notes: If you are below level 35 it is reccomended to bring Sneak and Invisible for Goblins! \n" ..
                       "This can get tedious - if you have been unlucky you will have to look through both maps for 'Fossil Rocks' which exist in nearly every room! \n" ..
                       "Warp out once you have attained the KI:Lapis Coral. \n \n",
                images = {
                    {
                        file     = "maps/maze_of_shakhrami_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/maze_of_shakhrami_2.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                            { position = "H-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return back to Windurst Woods and speak to Nanaa Mihgo (J-3). \n" ..
                       "Notes: You will obtain the KI:Hideout Key ! \n \n",
                images = {
                    {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "J-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Travel to Horutoto Ruins. \n" ..
                       "Travel: \n" ..
                       "East Sarutabaruta (J-7) -> Lily Tower. \n \n",
                images = {
                    {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: Once inside, go to (G-9) the section noted as 'B' on the map. \n" ..
                       "You will end up in Bettle's Burrow Map, and should continue on to the Mohogany Door (G-8) \n" ..
                       "Click on the door for a cutscene. \n \n",
                images = {
                    {
                        file     = "maps/inner_horutoto_ruins_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/inner_horutoto_ruins_2.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 9: Warp and go back to Windurst Walls (G-3) finding the 'House of the Hero'. \n" ..
                       "Click on the door for a cutscene. \n \n",
                images = {
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        highlights = {
                            { position = "G-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 10: Zone into Windurst Waters(North) - (Home Point#1). \n" ..
                       "Speak with Tosuka-Porika (G-8) at the Optistery to complete the quest! \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["2-2: Testing Time"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n \n" ..
                       "Note: This mission is skippable! \n" ..
                       "Mission available only after trading crystals to the guards with initials in their names 'W.W' for example. \n \n",
                       images = {
                        {
                            file     = "maps/windurst_waters_1.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/port_windurst.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "B-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_woods.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "K-10", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_walls.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "H-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
            },
            {
                text = "Step 2: Talk to Moreno-Toeno (L-6) inside the Aurastery at Windurst Waters (North). \n" ..
                       "He will give you a KI:Creature Counter magic doll! \n \n" ..
                       "Notes: You MAY have to speak to him twice to activate the cutscene needed for this mission!! \n \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Tahrongi Canyon. \n" ..
                       "Notes: Before setting off grab a Warp Scroll and make sure your Home Point is in Windurst. \n \n",
                images = {
                    {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "J-4", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Once in Tahrongi Canyon start killing monsters - you need ATLEAST 30 Kills!! \n \n" ..
                       "Notes: You have 1hour to achieve this and return to Moreno-Toeno. \n " ..
                       "Pet kills do NOT count \n" ..
                       "Trust kills DO count \n" ..
                       "Players in party DO count also towards the 30 total! \n \n",
                images = {
                    {
                        file     = "maps/tahrongi_canyon.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                    },
                },
            },
            {
                text = "Step 5: Return back to Moreno-Toeno (L-6) inside the Aurastery at Windurst Waters (North). \n",
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },
    ["2-3: The Three Kingdoms - Introduction"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Windurstian Gate Guard.\n \n" ..
                       "Mission available only after trading crystals to the guards with initials in their names 'W.W' for example. \n \n" ..
                       "Notes: This contains multiple paths San d'Oria <-> Bastok the guide will split up so choose which Nation you go to first. \n \n",
                       images = {
                        {
                            file     = "maps/windurst_waters_1.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/port_windurst.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "B-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_woods.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "K-10", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_walls.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "H-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
            },
            {
                text = "Step 2: The guard will inform you to go to Heavens Tower by Windurst Walls (H-6)/(H-7).",
                images = {
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Once inside Heavens Tower(no map) look for the Door:Clerical Chamber and talk to Kupipi behind the desk.\n \n" ..
                       "Notes: She will hand you a KI:Letter to the Consuls. \n " ..
                       "Depending on the nation you pick, choose the appropriate guide!! \n \n",
            },
        },
        --reward = "Rank 3, Adventurer's Certificate, 3000g, access to Chateau d'Oraguille"
    },
    ["2-3: The Three Kingdoms - San d'Oria -> Bastok"] = {
        steps = {
            {
                text = "Step 1: Travel to San d'Oria.\n \n" ..
                       "Mission available only after trading crystals to the guards with initials in their names 'W.W' for example. \n \n" ..
                       "Notes: This contains multiple paths San d'Oria <-> Bastok the guide will split up so choose which Nation you go to first. \n \n",
                       images = {
                        {
                            file     = "maps/windurst_waters_1.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/port_windurst.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "B-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_woods.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "K-10", offsetX = 16, offsetY = 16 },
                            },
                        },
                        {
                            file     = "maps/windurst_walls.png",
                            width    = 512,
                            height   = 512,
                            state    = 1,
                            highlights = {
                                { position = "H-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
            },
            {
                text = "Step 2: The guard will inform you to go to Heavens Tower by Windurst Walls (H-6)/(H-7).",
                images = {
                    {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Once inside Heavens Tower(no map) look for the Door:Clerical Chamber and talk to Kupipi behind the desk.\n \n" ..
                       "Notes: She will hand you a KI:Letter to the Consuls. \n " ..
                       "Depending on the nation you pick, choose the appropriate guide!! \n \n",
            },
        },
        --reward = "Rank 3, Adventurer's Certificate, 3000g, access to Chateau d'Oraguille"
    },
    ["3-1: The Four Musketeers"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Beadeaux and locate the target point at (H-7).",
                images = {
                    {
                        file     = "maps/beadeaux.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Iron Eater to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["3-2: To the Forsaken Mines"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Cid at (H-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Gusgen Mines and locate the target point at (I-7).",
                images = {
                    {
                        file     = "maps/gusgen_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Cid to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["3-3: Jeuno"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Travel to Jeuno and speak with Savae E Paleade at (G-8) in Lower Jeuno.",
                images = {
                    {
                        file     = "maps/lower_jeuno.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 3: Complete the assigned task from Savae E Paleade.",
            "Step 4: Return to the Bastok Gate Guard to complete the mission.",
        },
    },

    ["4-1: Magicite"] = {
        steps = {
            -- Initiating the Mission
            "Step 1: Ensure your Rank Points are nearly or completely full by trading crystals to a Conquest Overseer.",
            {
                text = "Step 2: Speak with Goggehn at the Bastokan Embassy in Ru'Lude Gardens to begin the mission.",
                images = {
                    {
                        file = "maps/ru_lude_gardens.png",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            -- e.g., if Goggehn is at H-10, use:
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Examine the Door: Bastokan Embassy at (H-10) in Ru'Lude Gardens to receive the Key Item: Archducal Audience Permit.",
                images = {
                    {
                        file = "maps/ru_lude_gardens.png",
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Proceed to the Audience Chamber at (H-6) in Ru'Lude Gardens and examine the door for a cutscene, receiving the Key Item: Letter to Aldo.",
            {
                text = "Step 5: In Lower Jeuno, enter Neptune's Spire and speak with Aldo at (J-8) to receive the Key Item: Silver Bell.",
                images = {
                    {
                        file = "maps/lower_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 5,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- Obtaining the Yagudo Torch
            {
                text = "Step 6: Speak to Paya-Sabya at (I-8) in Upper Jeuno.",
                images = {
                    {
                        file = "maps/upper_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 6,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Then, talk to Muckvix at (H-9) in Lower Jeuno to receive the Key Item: Yagudo Torch.",
                images = {
                    {
                        file = "maps/lower_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 7,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- Obtaining the Crest of Davoi
            {
                text = "Step 8: Speak with Baudin at (G-8) in Upper Jeuno; he will request a slice of Coeurl Meat.",
                images = {
                    {
                        file = "maps/upper_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 8,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 9: Acquire Coeurl Meat by defeating Coeurls in areas like Meriphataud Mountains or by purchasing from the Auction House.",
            "Step 10: Trade the Coeurl Meat to Baudin to receive the Key Item: Crest of Davoi.",

            -- Obtaining the Coruscant Rosary and Black Matinee Necklace
            {
                text = "Step 11: Speak to Sattal-Mansal at (J-8) in Lower Jeuno, outside Aldo's room in Neptune's Spire, to initiate the quests 'Mysteries of Beadeaux I' and 'Mysteries of Beadeaux II'.",
                images = {
                    {
                        file = "maps/lower_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 11,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 12: Travel to Beadeaux; ensure you have Sneak active to avoid sound-aggro from Quadavs.",
            {
                text = "Step 13: Enter Map 2 via exit A at (H-7) and examine 'The Mute' at (G-7) to receive Silence, allowing safe passage past 'The Afflictor' without being Cursed.",
                images = {
                    {
                        file = "maps/beadeaux.png",
                        width = 512,
                        height = 512,
                        state = 13,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 14: Proceed to Map 1 via exit B at (F-8) and use the ramp at (E-10) to reach the upper level.",
            {
                text = "Step 15: Defeat De'Vyu Headhunter at (I-9) to obtain a Quadav Charm.",
                images = {
                    {
                        file = "maps/beadeaux.png",
                        width = 512,
                        height = 512,
                        state = 15,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 16: Defeat Go'Bhu Gascon at (F-6) to obtain a Quadav Augury Shell.",
                images = {
                    {
                        file = "maps/beadeaux.png",
                        width = 512,
                        height = 512,
                        state = 16,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 17: Return to Sattal-Mansal in Lower Jeuno and trade the Quadav Charm to receive the Key Item: Coruscant Rosary.",
            "Step 18: Trade the Quadav Augury Shell to Sattal-Mansal to receive the Key Item: Black Matinee Necklace.",

            -- Acquiring the Magicite: Optistone in Davoi
            {
                text = "Step 19: Travel to Davoi; use Invisible to avoid sight-aggro from Orcs.",
                images = {
                    {
                        file = "maps/davoi.png",
                        width = 512,
                        height = 512,
                        state = 19,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 20: Disable the 'Wall of Dark Arts' at (G-7) to access Monastic Cavern.",
            "Step 21: Navigate through Monastic Cavern to the Magicite room and examine the Magicite to receive the Key Item: Magicite: Optistone.",

            -- Acquiring the Magicite: Aurastone in Beadeaux
            "Step 22: Return to Beadeaux; use Sneak to avoid sound-aggro from Quadavs.",
            "Step 23: Enter Map 2 via exit A at (H-7) and proceed to Qulun Dome at (I-7).",
            "Step 24: Open the door in Qulun Dome; if prompted with 'The Silver Bell, Coruscant Rosary, Black Matinee Necklace, glow faintly.', move closer and try again.",
            "Step 25: Inside Qulun Dome, examine the Magicite to receive the Key Item: Magicite: Aurastone.",

            -- Acquiring the Magicite: Orastone in Castle Oztroja
            {
                text = "Step 26: Travel to Castle Oztroja; use Invisible to avoid sight-aggro from Yagudo and Sneak for bats.",
                images = {
                    {
                        file = "maps/castle_oztroja.png",
                        width = 512,
                        height = 512,
                        state = 26,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 27: Navigate to the door at (I-8) on Map 1; operate the correct lever to avoid the trapdoor and proceed to Map 3.",
            "Step 28: From Map 3, enter Map 7 via exit F at (G-7), then proceed to Map 2 via exit I at (I-7).",
            "Step 29: Light the Yagudo Torch at (H-9/10) to open the Brass Door at (G-10).",
            "Step 30: Enter the Altar Room and examine the Magicite to receive the Key Item: Magicite: Orastone.",

            -- Completing the Mission
            "Step 31: After obtaining all three Magicites, return to the Audience Chamber at (H-6) in Ru'Lude Gardens for a cutscene.",
            "Step 32: You will receive an Airship Pass; if you already possess one, you'll receive 20,000 gil instead.",
            "Step 33: Return to Goggehn at the Bastokan Embassy to complete the mission, earning Rank 5, the Key Item: Message to Jeuno, and 10,000 gil."
        }
    },

    ["5-1: Darkness Rising"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Beadeaux and locate the target point at (H-7).",
                images = {
                    {
                        file     = "maps/beadeaux.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Iron Eater to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["5-2: Xarcabard, Land of Truths"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Travel to Xarcabard and locate the target point at (J-9).",
                images = {
                    {
                        file     = "maps/xarcabard.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 3: Return to the Bastok Gate Guard to complete the mission."
        },
    },

    ["6-1: Return of the Talekeeper"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Medicine Eagle at (H-7) in Bastok Mines.",
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Quicksand Caves and locate the target point at (K-7).",
                images = {
                    {
                        file     = "maps/quicksand_caves.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Medicine Eagle to complete the mission.",
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["6-2: The Pirate's Cove"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Cid at (H-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Norg and speak with Gilgamesh at (I-8).",
                images = {
                    {
                        file     = "maps/norg.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Cid to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["6-2: The Chains That Bind Us"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Cid at (H-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Gustav Tunnel and locate the target point at (F-7).",
                images = {
                    {
                        file     = "maps/gustav_tunnel.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Defeat the required NM to proceed.",
            {
                text = "Step 5: Return to Cid to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["7-1: The Final Image"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Ro'Maeve and locate the target point at (H-5).",
                images = {
                    {
                        file     = "maps/ro_maeve.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Iron Eater to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["7-2: On My Way"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Travel to Ifrit's Cauldron and locate the target point at (H-6).",
                images = {
                    {
                        file     = "maps/ifrits_cauldron.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 3: Defeat the required NM to proceed.",
            "Step 4: Return to the Bastok Gate Guard to complete the mission."
        },
    },

    ["8-1: The Chains That Bind Us"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Cid at (H-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Gustav Tunnel and locate the target point at (F-7).",
                images = {
                    {
                        file     = "maps/gustav_tunnel.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Defeat the required NM to proceed.",
            {
                text = "Step 5: Return to Cid to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["8-2: Enter the Talekeeper"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Speak to Medicine Eagle at (H-7) in Bastok Mines.",
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to the Quicksand Caves and locate the target point at (K-7).",
                images = {
                    {
                        file     = "maps/quicksand_caves.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Defeat the required NM to proceed.",
            {
                text = "Step 5: Return to Medicine Eagle at (H-7) in Bastok Mines to complete the mission.",
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["9-1: The Salt of the Earth"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Speak to Raibaht at (J-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Cape Teriggan and locate the target point at (L-6).",
                images = {
                    {
                        file     = "maps/cape_teriggan.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Collect the required key item from the location.",
            {
                text = "Step 5: Return to Raibaht to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["9-2: Where Two Paths Converge"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Speak to Lucius at (K-7) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Castle Zvahl Baileys and locate the target point at (J-6).",
                images = {
                    {
                        file     = "maps/castle_zvahl_baileys.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 4: Defeat the Shadow Lord in the final battle.",
            {
                text = "Step 5: Return to Lucius to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },
}
