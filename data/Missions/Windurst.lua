return {
    ["1-1: The Zeruhn Report"] = {
        steps = {
          {
            text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
            images = {
                {
                    file     = "maps/bastok_mines.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    file     = "maps/bastok_markets.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    file     = "maps/port_bastok.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "L-6", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 2: Go to Bastok Mines (D-7) and enter Zeruhn Mines. The entrance to Zeruhn Mines is located in the southwest corner of Bastok Mines.",
            images = {
                {
                    file     = "maps/bastok_mines.png",
                    width    = 512,
                    height   = 512,
                    state    = 2,
                    highlights = {
                        { position = "D-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 3: Talk to Makarim at (H-11) in Zeruhn Mines to receive the Zeruhn Report. He is located all the way to the south within Zeruhn Mines. Although there are creatures here in the level 75-80 range, they are not aggressive and do not aggro by sound.",
            images = {
                {
                    file     = "maps/zeruhn_mines.png",
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "H-11", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 4: Deliver the report to Naji at (J-8) outside the President's Office in the Metalworks. Side note: If you examine the Key Item 'Zeruhn Report' before talking to Naji, the dialogue in this cutscene will be slightly different.",
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

    ["1-2: A Geological Survey"] = {
        steps = {
            {
              text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
              images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_bastok.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Go to Metalworks and talk to Cid (H-8), inside Cid's Lab, for a Key Item Blue Acidity Tester.",
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
                text = "Step 3: Proceed to South Gustaberg (D-9) and enter Dangruf Wadi.",
                images = {
                    {
                        file     = "maps/south_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "D-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: In Dangruf Wadi, go to the geyser at (I-8) and stand on it to be propelled to the ledge, changing the Blue Acidity Tester to Red Acidity Tester. Check your Key Items to make sure it has changed!",
                images = {
                    {
                        file     = "maps/dangruf_wadi.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to Cid in the Metalworks(H-8) to complete the mission.",
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
        reward = "Rank Points"
    },

    ["1-3: Fetichism"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                images = {
                      {
                          file     = "maps/bastok_mines.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/bastok_markets.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/port_bastok.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Collect four Quadav fetiches. Go to North Gustaberg(K-3) and zone into Palborough Mines: You will require Head, Torso, Arms, and Legs from enemy Quadav in this zone. Can be purchased on Auction House under [Other -> Beast-made]",
                images = {
                      {
                          file     = "maps/north_gustaberg.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          highlights = {
                              { position = "K-3", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 3: Return to the Bastok Gate Guard and trade the Head, Torso, Arms, and Legs fetiches to complete the mission!",
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_bastok.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                  },
            },
        },
        reward = "Rank 2, 1000g"
    },

    ["2-1: The Crystal Line"] = {
        steps = {
            "Step 1: Receive the mission from any of the Bastokan Gate Guards.",
            {
                text = "Step 2: Talk to Savae E Paleade at (K-7) in Port Bastok.",
                images = {
                    {
                        file     = "maps/port_bastok.png",
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
                text = "Step 3: Travel to North Gustaberg and locate the hut at (L-8).",
                images = {
                    {
                        file     = "maps/north_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Return to Savae E Paleade to complete the mission.",
                images = {
                    {
                        file     = "maps/port_bastok.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "K-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["2-2: Wading Beasts"] = {
        steps = {
            "Step 1: Receive the mission from any Bastok Gate Guard.",
            {
                text = "Step 2: Talk to Nbu Latteh at (J-9) in Bastok Markets.",
                images = {
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 3: Travel to Dangruf Wadi and obtain three Dhalmel Saliva from Dhalmel.",
            {
                text = "Step 4: Return to Nbu Latteh to complete the mission.",
                images = {
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
    },

    ["2-3: The Emissary"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from Naji at (J-8) in the Metalworks.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            "Step 2: Choose to go to either San d'Oria or Windurst first.",
            "Step 3: Deliver the letter to the respective consulate in the chosen nation.",
            "Step 4: Complete the assigned task from the consulate.",
            "Step 5: Repeat steps 3 and 4 for the other nation.",
            {
                text = "Step 6: Return to Naji in the Metalworks to complete the mission.",
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = "Rank 3, Adventurer's Certificate, 3000g, access to Chateau d'Oraguille"
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
