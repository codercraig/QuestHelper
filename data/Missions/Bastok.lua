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
                    zone_name = "Bastok Mines",
                },
                {
                    file     = "maps/bastok_markets.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Bastok Markets",
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
                zone_name = "Port Bastok",
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
                    zone_name = "Bastok Mines",
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
                    zone_name = "Zeruhn Mines",
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
                    zone_name = "Metalworks",
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
                        zone_name = "Bastok Mines",
                    },
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        file     = "maps/port_bastok.png",
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
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
                        zone_name = "Metalworks",
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
                        zone_name = "South Gustaberg",
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
                        zone_name = "Dangruf Wadi",
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
                          zone_name = "Bastok Mines",
                      },
                      {
                          file     = "maps/bastok_markets.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Bastok Markets",
                      },
                      {
                          file     = "maps/port_bastok.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "L-6", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Port Bastok",
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

                require_all_items = true,
                images = {
                      {
                          file     = "maps/north_gustaberg.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          highlights = {
                              { position = "K-3", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "North Gustaberg",
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
                        zone_name = "Bastok Mines",
                    },
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
                        file     = "maps/port_bastok.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Port Bastok",
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
                -- Using alias format: display name shown to user, but checks for any of the alternatives
                items_needed = {
                    {
                        display = "Elemental Crystal",
                        alternatives = {
                            "Dark Crystal",
                            "Fire Crystal",
                            "Ice Crystal",
                            "Wind Crystal",
                            "Earth Crystal",
                            "Lightning Crystal",
                            "Water Crystal",
                            "Light Crystal"
                        }
                    }
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
                       "-{!Recommended!} Crag of Dem(I-6) \n \n" ..
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
                        zone_name = "Konschtat Highlands",
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
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
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
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
                        zone_name = "Metalworks",
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
                trigger_on_item_obtain = {"Lizard Egg"},
                images = {
                    {
                        file     = "maps/south_gustaberg.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "D-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/dangruf_wadi.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Dangruf Wadi",
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
                text = "Step 2: Talk to Naji in Metalworks (J-8), just outside the Presidents Office. \n" ..
                       "After the cutscene you will have to travel to San d'Oria and Windhurst \n" ..
                       "Please note you can choose San d'Oria -> Windurst or Windurst -> San d'Oria. Questhelper will split this into two missions. \n" ..
                       "Which order will affect the tasks, titles and cutscenes so this section will be split into two so follow the one you prefer! \n \n",
                onmob_target = {"Naji"},
                trigger_on_event_id = { 714 },
                images = {
                      {
                          file     = "maps/metalworks.png",
                          zone_name = "Metalworks",
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
            text = "Nothing. . . wamp wamp!"
        }
    },
    ["2-3: The Emissary - San d'Oria -> Windurst"] = {
        steps = {
            {
                text = "Step 1: Talk to Baraka (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                trigger_on_event_id = { 11141 },
                onmob_target = {"Baraka"},
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Talk to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                trigger_on_event_id = { 536 },
                onmob_target = {"Helaku"},
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 3: Go to Chateau d'Oraguille which resides in Northern San d'Oria (I-6/J-6). \n",
                zone_trigger = "Chateau d'Oraguille",
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 3,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "I-6", offsetX = 16, offsetY = 16 },
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 4: Talk to Halver in Chateau d'Oraguille (I-9). \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Halver. \n",
                trigger_on_event_id = { 501 },
                onmob_target = {"Halver"},
                images = {
                      {
                          file     = "maps/chateau_doraguille.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Chateau d'Oraguille",
                          highlights = {
                              { position = "I-9", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 5: Travel to Ghelsba Outpost which can be reached from West Ronfaure (E-4). \n",
                zone_trigger = "Ghelsba Outpost",
                images = {
                      {
                          file     = "maps/west_ronfaure.png",
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          zone_name = "West Ronfaure",
                          highlights = {
                              { position = "E-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 6: Defeat the NM Warchief Vatgit in Ghlesba Outpost (H-7). \n \n" ..
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
                 kill_requirement = {
                    count = 1,
                    enemies = {"Warchief Vatgit"},  -- Only Stone Eater kills count
                    zone = "Ghelsba Outpost",
                    count_party_kills = true  -- Count kills from party members and trusts
                },
                images = {
                      {
                          file     = "maps/ghelsba_outpost_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 6,
                          zone_name = "Ghelsba Outpost",
                          highlights = {
                              { position = "H-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 7: Return back to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                onmob_target = {"Helaku"},
                trigger_on_event_id = { 543 },
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 7,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 8: Travel to Windurst- Port Windurst!\n " ..
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
                zone_trigger = "Port Windurst",
                images = {
                      {
                          file     = "maps/west_ronfaure.png",
                          width    = 512,
                          height   = 512,
                          state    = 8,
                          zone_name = "West Ronfaure",
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/la_theine_plateau.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "La Theine Plateau",
                        highlights = {
                            { position = "I-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/valkurm_dunes.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Valkurm Dunes",
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/selbina.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Selbina",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/mhaura.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Mhaura",
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/buburimu_peninsula.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Buburimu Peninsula",
                        highlights = {
                            { position = "D-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/tahrongi_canyon.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Tahrongi Canyon",
                        highlights = {
                            { position = "H-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/east_sarutabaruta.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "East Sarutabaruta",
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        highlights = {
                            { position = "E-11", offsetX = 16, offsetY = 16 },
                            { position = "E-12", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Windurst Woods",
                      },
                  },
            },
            {
                text = "Step 9: Talk to Melek in the Consulate of Bastok in Port Windurst (F-6). \n",
                trigger_on_event_id = { 64 },
                onmob_target = {"Melek"},
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 9,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 10: Talk to Kupipi in Heavens Tower on the first floor north side, she will give you a KI:Dark Key. \n" ..
                       "All party members need one Dark Key! \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n \n" ..
                       "Suggested Route: \n" ..
                       "Port Windurst (N-5)  ->\n" ..
                       "Windurst Woods (F-5) ->\n" ..
                       "Windurst Walls (H-7) ->\n" ..
                       "Heavens Tower",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = {242},
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 10,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "N-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                  },
            },
            {
                text = "Step 11: Travel to Giddeus with your party. \n" ..
                       "Suggested Route: \n" ..
                       "West Sarutabaruta (F-8)  ->\n" ..
                       "Giddeus           (F-12) ->\n" ..
                       "Balga's Dais.              \n",
                zone_trigger = "Balga's Dais",
                images = {
                      {
                          file     = "maps/west_sarutabaruta.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "West Sarutabaruta",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/giddeus_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Giddeus",
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/giddeus_2.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Giddeus",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 12: This is a BCNM battle! You will face Searcher and Black Dragon. \n" ..
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
                images = {
                    --{ state = 12}
                  },
            },
            {
                text = "Step 13: Return to Melek in the Consulate of Bastok in Port Windurst (F-6) to receive the KI:Kindred Report.",
                onmob_target = {"Melek"},
                trigger_on_event_id = {66},
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 13,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 14: Return to Naji in Metalworks (J-8) to complete the mission!",
                onmob_target = {"Naji"},
                trigger_on_event_id = {713},
                images = {
                      {
                          file     = "maps/metalworks.png",
                          width    = 512,
                          height   = 512,
                          state    = 14,
                          zone_name = "Metalworks",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Trust: Halver & Semih!"
        }
    },

    ["2-3: The Emissary - Windurst -> San d'Oria"] = {
        steps = {
            {
                text = "Step 1: Talk to Melek in the Consulate of Bastok in Port Windurst (F-6). \n",
                onmob_target = {"Melek"},
                trigger_on_event_id = {49},
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 2: Talk to Kupipi in Heavens Tower on the first floor north side to receive the KI:Sword Offering. \n \n" ..
                       "Suggested Route: \n" ..
                       "Port Windurst (N-5) ->\n" ..
                       "Windurst Woods (F-5) ->\n" ..
                       "Windurst Walls (H-7) ->\n" ..
                       "Heavens Tower \n \n"..
                       "Note: If you posses KI:Rhapsody in White you will obtain a new trust - Cipher:Semih. \n",
                onmob_target = {"Kupipi"},
                trigger_on_event_id = { 239 },
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "N-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/windurst_woods.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/windurst_walls.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Windurst Walls",
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                  },
            },
            {
                text = "Step 3: Talk to Gold Skull in the Consulate of Bastok in Port Windurst (F-6) to receive a Dull Sword.",
                onmob_target = {"Gold Skull"},
                trigger_on_event_id = { 53 },
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 3,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 4: Travel to Giddeus Map 2 and speak with Uu Zhoumo (F-7) you can drop down either from 'A','E','F' and 'G' on Map1. You need to get an Aspir Knife! \n \n" ..
                       "===== Obtaining Aspir Knife ===== \n" ..
                       "The Aspir Knife drops from Eyy Mon the Ironbreaker, a Yagudo NM in Giddeus. \n" ..
                       "This NM spawns on Map2 (G-7) around this area. Also highlighted! \n" ..
                       "Each party member needs one Aspir Knife! \n" ..
                       "Respawn time: approximately 15 minutes. \n \n",
                items_needed = {
                    "Aspir Knife"
                },
                trigger_on_item_obtain = {"Aspir Knife"},
                images = {
                        {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "A-4", offsetX = 16, offsetY = 16 },
                              { position = "A-5", offsetX = 16, offsetY = 16 },
                          },
                       },
                       {
                          file     = "maps/west_sarutabaruta.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "West Sarutabaruta",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/giddeus_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                              { position = "G-8", offsetX = 16, offsetY = 16 },
                              { position = "I-8", offsetX = 16, offsetY = 16 },
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/giddeus_2.png",
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          highlights = {
                              { position = "F-7", offsetX = 16, offsetY = 16 },
                              { position = "G-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 5: Trade the Aspir Knife to Uu Zhoumo (F-7) in Giddeus Map 2.",
                onmob_target = {"Uu Zhoumo"},
                trigger_on_event_id = { 41 },
                images = {
                      {
                          file     = "maps/giddeus_2.png",
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          zone_name = "Giddeus",
                          highlights = {
                              { position = "F-7", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 6: Return to Melek in the Consulate of Bastok in Port Windurst (F-6).",
                onmob_target = {"Melek"},
                trigger_on_event_id = { 55 },
                images = {
                      {
                          file     = "maps/port_windurst.png",
                          width    = 512,
                          height   = 512,
                          state    = 6,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "F-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 7: Travel to San d'Oria! \n " ..
                       "If you have the teleport crystal from Crag of Holla you can get a White Mage to teleport you or use Unity Warp. \n \n" ..
                       "Otherwise here's a suggested route from Windurst: \n" ..
                       "Port Windurst  (A-4)/(A-5)    ->\n" ..
                       "West Sarutabaruta (J-4)       ->\n" ..
                       "East Sarutabaruta (J-4)       ->\n" ..
                       "Tahrongi Canyon (K-8)         ->\n" ..
                       "Buburimu Peninsula (I-9)      ->\n" ..
                       "Mhaura - get the boat! (H-10) ->\n" ..
                       "Selbina (H-6)/(I-6)           ->\n" ..
                       "Valkrum Dunes (K-5)/(L-5)     ->\n" ..
                       "La Thiene Plateau (D-3)/(E-3) ->\n" ..
                       "West Ronfaure (I-5) -> Northern San d'Oria!\n \n",
                zone_trigger = "Northern San d'Oria",
                images = {
                      {
                            file     = "maps/port_windurst.png",
                            width    = 512,
                            height   = 512,
                            state    = 7,
                            zone_name = "Port Windurst",
                            highlights = {
                                { position = "A-4", offsetX = 16, offsetY = 16 },
                                { position = "A-5", offsetX = 16, offsetY = 16 },
                            },
                      },
                      {
                            file     = "maps/west_sarutabaruta.png",
                            width    = 512,
                            height   = 512,
                            state    = 7,
                            zone_name = "West Sarutabaruta",
                            highlights = {
                                { position = "K-4", offsetX = 16, offsetY = 16 },
                            },
                      },
                      {
                          file     = "maps/east_sarutabaruta.png",
                          width    = 512,
                          height   = 512,
                          state    = 7,
                          zone_name = "East Sarutabaruta",
                          highlights = {
                              { position = "J-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        file     = "maps/tahrongi_canyon.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Tahrongi Canyon",
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/buburimu_peninsula.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Buburimu Peninsula",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/mhaura.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Mhaura",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/selbina.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Selbina",
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/valkurm_dunes.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Valkurm Dunes",
                        highlights = {
                            { position = "K-5", offsetX = 16, offsetY = 16 },
                            { position = "L-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/la_theine_plateau.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "La Theine Plateau",
                        highlights = {
                            { position = "D-3", offsetX = 16, offsetY = 16 },
                            { position = "E-3", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        file     = "maps/west_ronfaure.png",
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "West Ronfaure",
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                  },
            },
            {
                text = "Step 8: Talk to Helaku (K-10) in the Consulate of Bastok in Northern San d'Oria. \n",
                onmob_target = {"Helaku"},
                trigger_on_talk = {"Helaku:"},
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 8,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 9: Go to Chateau d'Oraguille which resides in Northern San d'Oria (I-6/J-6). \n",
                zone_trigger = "Chateau d'Oraguille",
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 9,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "I-6", offsetX = 16, offsetY = 16 },
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 10: Talk to Halver in Chateau d'Oraguille (I-9). \n" ..
                       "If you have KI:Rhapsody in White you will obtain a new trust - Cipher:Halver. \n \n",
                onmob_target = {"Halver"},
                trigger_on_event_id = {503},
                images = {
                      {
                          file     = "maps/chateau_doraguille.png",
                          width    = 512,
                          height   = 512,
                          state    = 10,
                          highlights = {
                              { position = "I-9", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 11: Travel to Horlais Peak in La Theine Plateau (F-5) with your party. \n \n" ..

                       "Notes: Orcs sight-Aggro to players around level 35 unless they are Invisible. Bats will aggro by sound. \n \n" ..
                       "West Ronfaure  : Go to (E-4) -> Ghelsba Outpost. \n" ..
                       "Ghelsba Outpost: Go to (H-11)-> Yughott Grotto  - exit 1. \n" ..
                       "Yughott Grotto : Go to (K-5) -> Fort Ghelsba    - exit 3. \n" ..
                       "Fort Ghelsba   : Go to (J-8) -> Yughott Grotto  - exit 4. \n" ..
                       "Yughott Grotto : Enter Horlais Peak (J-6). \n \n",
                zone_trigger = "Horlais Peak",
                images = {
                      {
                          file     = "maps/west_ronfaure.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "West Ronfaure",
                          highlights = {
                              { position = "E-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/ghelsba_outpost_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Ghelsba Outpost",
                          highlights = {
                              { position = "H-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/yughott_grotto_1.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          highlights = {
                              { position = "K-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/fort_ghelsba.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Fort Ghelsba",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          file     = "maps/yughott_grotto_2.png",
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          highlights = {
                              { position = "J-6", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 12: This is a BCNM battle! You will face Spotter and Dread Dragon. \n \n" ..
                       "Recommended: Level 35+ or a party. \n \n" ..
                       "===== Spotter ===== \n" ..
                       "Family: Spotter \n" ..
                       "Level: 25 \n \n" ..
                       "===== Dread Dragon ===== \n" ..
                       "Family: Dragon \n" ..
                       "Level: 27 \n" ..
                       "Notes: Sleep/Bind the dragon and kill the Spotter first! \n \n" ..
                       "After winning, you will receive the KI:Kindred Crest and title 'Dread Dragon Slayer'.",
                trigger_on_event_id = {32001},
            },
            {
                text = "Step 13: Return to Helaku in Northern San d'Oria (K-10) to receive the KI:Kindred Report. Backtrack the route you took to get here. \n",
                onmob_target = {"Helaku"},
                trigger_on_event_id = {545},
                images = {
                      {
                          file     = "maps/northern_san_doria.png",
                          width    = 512,
                          height   = 512,
                          state    = 13,
                          zone_name = "Northern San d'Oria",
                          highlights = {
                              { position = "K-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
            {
                text = "Step 14: Return to Bastok and speak with Naji in Metalworks (J-8) to complete the mission!",
                onmob_target = {"Naji"},
                trigger_on_event_id = {713},
                images = {
                      {
                          file     = "maps/metalworks.png",
                          width    = 512,
                          height   = 512,
                          state    = 14,
                          zone_name = "Metalworks",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                  },
            },
        },
        reward = {
            text = "Rank 3, 3000g, Adventurer's Certificate, Trust: Halver!"
        }
    },

    ["3-1: The Four Musketeers"] = {
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
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks, outside the President's Office. You need to speak with him twice.",
                onmob_target = {"Iron Eater"},
                trigger_on_event_id = {715, 716},
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Beadeaux via Pashhow Marshlands (J-9). \n" ..
                       "From Konschtat Highlands, you can also travel to (K-3) to enter Pashhow Marshlands. \n" ..
                       "You may also be transported to the Beadeaux Survival Guide if unlocked.",
                zone_trigger = "Beadeaux",
                images = {
                    {
                        file     = "maps/konschtat_highlands.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Konschtat Highlands",
                        highlights = {
                            { position = "K-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/pashhow_marshlands.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Pashhow Marshlands",
                        highlights = {
                            { position = "L-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Zone into Beadeaux for a cutscene. \n" ..
                       "You need to defeat 20 Copper Quadav enemies (levels 22-28) while in Beadeaux. They sound-aggro under level 42. \n" ..
                       "Party members get credit for kills. The kill counter persists if you zone or logout.",
                --zone_trigger = "Beadeaux",
                trigger_on_event_id = 120,
                kill_requirement = {
                    count = 20,
                    enemies = {"Copper Quadav"},
                    zone = "Beadeaux",
                    count_party_kills = true
                },
                images = {
                    {
                        file     = "maps/beadeaux_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        --highlights = {
                         --   { position = "H-7", offsetX = 16, offsetY = 16 },
                        --},
                    },
                },
            },
            {
                text = "Step 5: After defeating 20 Copper Quadav, zone into Pashhow Marshlands to receive the completion cutscene. \n" ..
                       "Do NOT use Escape or you'll miss the cutscene!",
                --zone_trigger = "Pashhow Marshlands",
                trigger_on_event_id = {11},
                images = {
                    {
                        file     = "maps/beadeaux_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "350 Rank Points!"
        }
    },

    ["3-2: To the Forsaken Mines"] = {
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
                text = "Step 2: Obtain Hare Meat! \n\n" ..
                       "===== Buy from Auction House =====\n \n" ..
                       "- Check 'Food' > 'Ingredients' section for listings.\n \n" ..
                       "===== Obtain from Rabbit Family =====\n \n" ..
                       "- Hare Meat drops from rabbits in Dangruf Wadi or Palborough Mines.\n",
                items_needed = {
                    "Hare Meat"
                },
                trigger_on_item_obtain = {"Hare Meat"},
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
                    {
                        file     = "maps/palborough_mines_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        --highlights = {
                        --    { position = "K-3", offsetX = 16, offsetY = 16 },
                        --},
                    },
                },
            },
            {
                text = "Step 3: Travel to Gusgen Mines via Konschtat Highlands (L-7). You can also use a Survival Guide if available. \n" ..
                       "Recommended: Level 30+ with Sneak, or level 40+ (mobs aggro by hearing and HP).",
                zone_trigger = "Gusgen Mines",
                images = {
                    {
                        file     = "maps/konschtat_highlands.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: In Gusgen Mines, find the ??? at Map 1 (J-7). Trade your Hare Meat to it to spawn Blind Moby. \n" ..
                       "Defeat Blind Moby to obtain the Glocolite key item.",
                onmob_target = {"Blind Moby"},
                draw_type = 'square',
                center = { x = 210.1, y= -59.2, z=-101.8 },
                size = 1,
                zone = "Gusgen Mines",
                --trigger_on_event_id = {1010},
                -- items_needed = {
                --     "Glocolite"
                -- },
                trigger_on_item_obtain = {"Glocolite"},
                images = {
                    {
                        file     = "maps/gusgen_mines_1.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "J-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Return to any Bastok Gate Guard and trade the Glocolite to complete the mission.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = {1006},
                images = {
                    {
                        file     = "maps/bastok_mines.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/bastok_markets.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file     = "maps/port_bastok.png",
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
        reward = {
            text = "400 Rank Points!"
        }
    },

    ["3-3: Jeuno"] = {
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
                text = "Step 2: Visit Lucius at the Metalworks (I-9) to obtain the KI:Letter to the Ambassador.",
                onmob_target = {"Lucius"},
                trigger_on_event_id = 322,
                images = {
                    {
                        file     = "maps/metalworks.png",
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Ru'Lude Gardens in Jeuno and speak with Goggehn at the Embassy of Bastok (H-10).",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = {41, 66, 139},
                images = {
                    {
                        file     = "maps/ru_lude_gardens.png",
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Navigate Delkfutt's Tower in Qufim Island (10 floors). \n" ..
                       "Recommended: Level 40+ with Sneak and Invisible, or level 50+. \n" ..
                       "You need to reach Floor 10 and defeat Porphyrion at (H-8) to obtain the Delkfutt Key.",
                items_needed = {
                    "Delkfutt Key"
                },
                images = {
                    {
                        file     = "maps/qufim_island.png",
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Use the Delkfutt Key to access the basement area of the tower. \n" ..
                       "Trigger a cutscene at the Cermet Door in the basement (L-9).",
                trigger_on_event_id = 1,
                images = {
                    {
                        file     = "maps/delkfutts_tower.png",
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "L-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Return to Goggehn at the Embassy of Bastok in Ru'Lude Gardens (H-10) to complete the mission.",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = 38,
                images = {
                    {
                        file     = "maps/ru_lude_gardens.png",
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 4, 5000g!"
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
