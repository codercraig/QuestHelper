return {
    ["1-1: The Zeruhn Report"] = {
        steps = {
          {
            text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",

            onmob_target = {"Rashid", "Cleades", "Argus"},
            trigger_on_event_id = 1001,
            trigger_on_talk = {"You have accepted the mission"},
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
            zone_trigger = "Zeruhn Mines",
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
            onmob_target = {"Makarim"},
            trigger_on_event_id = { 121 },
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
            onmob_target = "Naji",
            trigger_on_event_id = { 710 },
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
        }
    },

    ["1-2: A Geological Survey"] = {
        steps = {
            {
              text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
              onmob_target = {"Rashid", "Cleades", "Argus"},
              trigger_on_event_id = 1001,
              trigger_on_talk = {"You have accepted the mission"},
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
                text = "Step 2: Go to Metalworks and talk to Cid (H-8), inside Cid's Lab, for a Key Item Blue Acidity Tester.",
                onmob_target = {"Cid"},
                trigger_on_event_id = 503,
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
                zone_trigger = "Dangruf Wadi",
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
                onmob_target = {"Geyser1"},
                trigger_on_event_id = { 10,11,12 },
                draw_type = 'square',
                center = {x = -133, y= 3, z=133.3},
                size = 2,
                zone = "Dangruf Wadi",

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
                onmob_target = {"Cid"},
                trigger_on_event_id = { 504 },
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
        reward = {
            text = "Rank Points"
        }
    },

    ["1-3: Fetichism"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
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
                text = "Step 2: Collect four Quadav fetiches. Go to North Gustaberg(K-3) and zone into Palborough Mines: You will require Head, Torso, Arms, and Legs from enemy Amber/Greater/Onyx/Veteran/Old/Brass Quadav in this zone. Can be purchased on Auction House under [Other -> Beast-made].",

                items_needed = {
                    "Quadav fetich head",
                    "Quadav fetich arms",
                    "Quadav fetich torso",
                    "Quadav fetich legs"
                },

                -- [NEW] This line turns the list below into a mandatory checklist maybe no logner needed with items needed section
                require_all_items = true,

                trigger_on_item_obtain = {
                    "Quadav fetich head",
                    "Quadav fetich arms",
                    "Quadav fetich torso",
                    "Quadav fetich legs"
                },
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
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = {1005,1008},
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
        reward = {
            text = "Rank 2, 1000g"
        }
    },

    ["2-1: The Crystal Line"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                      {
                          file     = "maps/bastok_mines.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/bastok_markets.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/port_bastok.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Port Bastok",
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Talk to Cid in the Metalworks (H-8). \n \n",
                onmob_target = {"Cid"},
                trigger_on_event_id = 505,
                -- items_needed: Shows in UI but does NOT auto-complete the step
                items_needed = {
                    " Crystal"
                },
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        -- [NEW] 1. Define the Zone Name (Must match zones.lua)
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Trade any crystal (these drop from any monster with Signet/Sanction or Sigil on ) to the Telepoints: \n" ..
                       "-{!Recommended!} Crag of Dem(I-6) \n" ..
                       "- Crag of Holla(K-8) \n" ..
                       "- Crag of Mea(I-6) \n \n" ..
                       "It will then become a Faded Crystal, check your inventory and it should update visually to be a white crystal.\n" ..
                       "Remember to click on the tele-crystal, this will give you {KI:Dem Gate Crystal} allowing you to Teleport-Dem to that location later. \n \n" ..
                       "You can warp back to Bastok-Metalworks. \n \n",
                trigger_on_item_obtain = "Faded Crystal",
                images = {
                    {
                        file     = "maps/south_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/north_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "North Gustaberg",
                        highlights = {
                            { position = "D-6", offsetX = 16, offsetY = 16 },
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/konschtat_highlands.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "items/faded_crystal.png",
                        width    = 457,
                        height   = 70,
                        state    = 3,
                    },

                },
            },
            {
                text = "Step 4: Return and Trade Cid the Faded Crystal in the Metalworks(H-8).\n" ..
                       "Optional: Talk to Naji(J-8) for some cheesy dialogue. \n \n",
                onmob_target = {"Cid"},
                trigger_on_event_id = 506,

                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Talk to Ayame inside the Cannonry in the Metalworks(K-7). \n \n",
                onmob_target = {"Ayame"},
                trigger_on_event_id = 712,
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
        reward = {
            text = "Rank Points!"
        }
    },
    ["2-2: Wading Beasts"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n" ..
                       "This Mission can be skipped if you trade Crystals to the gate guards to boost your Rank Points, see 'Status -> 'Profile' \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
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
                text = "Step 2: Obtain a Lizard Egg! \n\n" ..
                       "===== Buy from Auction House =====\n \n" ..
                       "- Check 'Food' > 'Ingredients' section for listings.\n \n" ..
                       "===== Obtain from Lizard Family =====\n \n" ..
                       "- Travel through South Gustaberg(D-9) to Dangruf Wadi.\n" ..
                       "- Inside Dangruf Wadi Look for 'Steam Lizards'(G-11) - level 16-20.\n" ..
                       "",
                items_needed = {
                    "Lizard Egg"
                },
                trigger_on_item_obtain = {"lizard egg"},
                images = {
                    {
                        file     = "maps/windurst_waters_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "items/lizard_egg.png",
                        width    = 453,
                        height   = 66,
                        state    = 2,
                    },
                    {
                        file     = "maps/south_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "D-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/dangruf_wadi.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Go to Metalworks(J-8) in Bastok and trade Alois a Lizard Egg to complete the mission",
                onmob_target = {"Alois"},
                trigger_on_event_id = { 373, 372 },
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["2-3: The Emissary - Introduction"] = {
        steps = {
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n" ..
                       "This mission has a fight capped originally at 25, non-era versions will be uncapped - check with your respective server!' \n \n",
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
                text = "Step 2: Talk to Naji in Metalworks (J-8), just outside the Presidents Office. \n" ..
                       "After the cutscene you will have to travel to San d'Oria and Windhurst \n" ..
                       "Please note you can choose San d'Oria -> Windurst or Windurst -> San d'Oria. Questhelper will split this into two missions. \n" ..
                       "Which order will affect the tasks, titles and cutscenes so this section will be split into two. \n \n",
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
        },
        reward = {
            text = "Nothing. . ."
        }
    },
    ["2-3: The Emissary - San d'Oria -> Windurst"] = {
        steps = {
            {
                text = "Step 1: Talk to Baraka and then Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Go to Chateau d'Oraguille which resides in Northern San d'Oria (I/J-6). \n",
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          highlights = {
                              { position = "I-6", offsetX = 16, offsetY = 16 },
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 3: Talk to Halver in Chateau d'Oraguille (I-9). \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Halver. \n \n",
                images = {
                      {
                          file     = "maps/chateau_doraguille.png",
                          width    = 512,
                          height   = 512,
                          state    = 3,
                          highlights = {
                              { position = "I-9", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 4: Travel to Ghelsba Outpost which can be reached from West Ronfaure (E-4). \n",
                images = {
                      {
                          file     = "maps/west_ronfaure.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          highlights = {
                              { position = "E-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 5: Defeat the NM Warchief Vatgit in Ghlesba Outpost (H-7). \n \n" ..
                       "===== Warchief Vatgit ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 16 \n" ..
                       "Job: Warrior \n \n" ..
                       "===== Bloody Vrukwuk ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 14 \n" ..
                       "Job: Paladin \n \n" ..
                       "===== Fogweaver Mozzfuzz ===== \n" ..
                       "Family: Orc \n" ..
                       "Level: 14 \n" ..
                       "Job: Black Mage \n \n" ..
                       "Recommended: Soloable at level 20 comfortably.\n" ..
                       "Notes: Warchief Vatgit is sometimes followed by Bloody Vrukwuk or Fogweaver Mozzfuzz. Try and one-shot these monsters build tp on surrounding monsters! \n \n",
                images = {
                      {
                          file     = "maps/ghelsba_outpost_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          highlights = {
                              { position = "H-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "monsters/warchief_vatgit.png",
                        width    = 325,
                        height   = 467,
                        state    = 5,
                      },
                      {
                        file     = "monsters/bloody_vrukwuk.png",
                        width    = 325,
                        height   = 467,
                        state    = 5,
                      },
                      {
                        file     = "monsters/fogweaver_mozzfuzz.png",
                        width    = 325,
                        height   = 467,
                        state    = 5,
                      },
                  },
            },
            {
                text = "Step 6: Return back to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 6,
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 7: Travel to Windurst!\n " ..
                       "If you have the teleport crystal from Crag of Mea you can get a White Mage to teleport you, or Outpost Warp to Kolshushu \n \n" ..
                       "Otherwise time get some virtual cardio in: A suggested route is: \n" ..
                       "West Ronfaure (F-12)      ->\n" ..
                       "La Thiene Plateau (I-13)  ->\n" ..
                       "Valkrum Dunes (G-9)       ->\n" ..
                       "Selbina[BOAT] (H-10)      ->\n" ..
                       "Mhaura (H-5)              ->\n" ..
                       "Buburimu Peninsula (D-7)  ->\n" ..
                       "Tahrongi Canyon (H-13)    ->\n" ..
                       "East Sarutabaruta (G-11)  ->\n" ..
                       "Windurst(thank f***!!)    ->\n \n" ..
                       "You made it!! Now stretch your real life legs! \n",
                images = {
                      {
                          file     = "maps/west_ronfaure.png",
                          width    = 512,
                          height   = 512,
                          state    = 7,
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/la_theine_plateau.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "I-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/valkurm_dunes.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/selbina.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/mhaura.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/buburimu_peninsula.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "D-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/tahrongi_canyon.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "H-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                      },
                  },
            },
            {
                text = "Step 8: Talk to Melek in the Consulate of Bastok in Port Windurst (F-6). \n",
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 8,
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 9: Talk to Kupipi in Heavens Tower on the first floor north side (no map/position available), she will give you a KI:Dark Key. \n \n" ..
                       "Suggested Route: \n" ..
                       "Port Windurst (N-5) ->\n" ..
                       "Windurst Woods (F-5) ->\n" ..
                       "Windurst Walls (H-7) ->\n" ..
                       "Heavens Tower",
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 9,
                          highlights = {
                              { position = "N-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                  },
            },
        },
        reward = {
            text = "Trust: Halver, 5000g, and RANK3!"
        }
    },

    ["3-1: The Four Musketeers"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["3-2: To the Forsaken Mines"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["3-3: Jeuno"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 3: Complete the assigned task from Savae E Paleade." },
            { text = "Step 4: Return to the Bastok Gate Guard to complete the mission." },
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["4-1: Magicite"] = {
        steps = {
            { text = "Step 1: Ensure your Rank Points are nearly or completely full by trading crystals to a Conquest Overseer." },
            {
                text = "Step 2: Speak with Goggehn at the Bastokan Embassy in Ru'Lude Gardens to begin the mission.",
                images = {
                    {
                        file = "maps/ru_lude_gardens.png",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
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
            { text = "Step 4: Proceed to the Audience Chamber at (H-6) in Ru'Lude Gardens and examine the door for a cutscene, receiving the Key Item: Letter to Aldo." },
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
            { text = "Step 9: Acquire Coeurl Meat by defeating Coeurls in areas like Meriphataud Mountains or by purchasing from the Auction House." },
            { text = "Step 10: Trade the Coeurl Meat to Baudin to receive the Key Item: Crest of Davoi." },
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
            { text = "Step 12: Travel to Beadeaux; ensure you have Sneak active to avoid sound-aggro from Quadavs." },
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
            { text = "Step 14: Proceed to Map 1 via exit B at (F-8) and use the ramp at (E-10) to reach the upper level." },
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
            { text = "Step 17: Return to Sattal-Mansal in Lower Jeuno and trade the Quadav Charm to receive the Key Item: Coruscant Rosary." },
            { text = "Step 18: Trade the Quadav Augury Shell to Sattal-Mansal to receive the Key Item: Black Matinee Necklace." },
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
            { text = "Step 20: Disable the 'Wall of Dark Arts' at (G-7) to access Monastic Cavern." },
            { text = "Step 21: Navigate through Monastic Cavern to the Magicite room and examine the Magicite to receive the Key Item: Magicite: Optistone." },
            { text = "Step 22: Return to Beadeaux; use Sneak to avoid sound-aggro from Quadavs." },
            { text = "Step 23: Enter Map 2 via exit A at (H-7) and proceed to Qulun Dome at (I-7)." },
            { text = "Step 24: Open the door in Qulun Dome; if prompted with 'The Silver Bell, Coruscant Rosary, Black Matinee Necklace, glow faintly.', move closer and try again." },
            { text = "Step 25: Inside Qulun Dome, examine the Magicite to receive the Key Item: Magicite: Aurastone." },
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
            { text = "Step 27: Navigate to the door at (I-8) on Map 1; operate the correct lever to avoid the trapdoor and proceed to Map 3." },
            { text = "Step 28: From Map 3, enter Map 7 via exit F at (G-7), then proceed to Map 2 via exit I at (I-7)." },
            { text = "Step 29: Light the Yagudo Torch at (H-9/10) to open the Brass Door at (G-10)." },
            { text = "Step 30: Enter the Altar Room and examine the Magicite to receive the Key Item: Magicite: Orastone." },
            { text = "Step 31: After obtaining all three Magicites, return to the Audience Chamber at (H-6) in Ru'Lude Gardens for a cutscene." },
            { text = "Step 32: You will receive an Airship Pass; if you already possess one, you'll receive 20,000 gil instead." },
            { text = "Step 33: Return to Goggehn at the Bastokan Embassy to complete the mission, earning Rank 5, the Key Item: Message to Jeuno, and 10,000 gil." }
        },
        reward = {
            text = "Rank 5, Airship Pass, 10,000 gil"
        }
    },

    ["5-1: Darkness Rising"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["5-2: Xarcabard, Land of Truths"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 3: Return to the Bastok Gate Guard to complete the mission." }
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["6-1: Return of the Talekeeper"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["6-2: The Pirate's Cove"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["6-2: The Chains That Bind Us"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 4: Defeat the required NM to proceed." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["7-1: The Final Image"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["7-2: On My Way"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 3: Defeat the required NM to proceed." },
            { text = "Step 4: Return to the Bastok Gate Guard to complete the mission." }
        },
        reward = {
            text = "Rank Points!"
        }
    },

    ["8-1: The Chains That Bind Us"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 4: Defeat the required NM to proceed." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["8-2: Enter the Talekeeper"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 4: Defeat the required NM to proceed." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["9-1: The Salt of the Earth"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 4: Collect the required key item from the location." },
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
        reward = {
            text = "Rank Points!"
        }
    },

    ["9-2: Where Two Paths Converge"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
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
            { text = "Step 4: Defeat the Shadow Lord in the final battle." },
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
        reward = {
            text = "Rank 10 and Airship pass to Kazham"
        }
    },
}
