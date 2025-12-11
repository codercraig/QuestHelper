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
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "H-10", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Bastok Mines",
                },
                {
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "D-11", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Bastok Markets",
                },
                {
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
            text = "Step 2: Go to Bastok Mines (D-7) and enter Zeruhn Mines. The entrance to Zeruhn Mines is located in the southwest corner of Bastok Mines.",
            zone_trigger = "Zeruhn Mines",
            images = {
                {
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
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "H-11", offsetX = 16, offsetY = 16 },
                    },
                    zone_name = "Zeruhn Mines",
                    floor_id = 0,
                },
            },
          },
          {
            text = "Step 4: Deliver the report to Naji at (J-8) outside the President's Office in the Metalworks. Side note: If you examine the Key Item 'Zeruhn Report' before talking to Naji, the dialogue in this cutscene will be slightly different.",
            onmob_target = "Naji",
            trigger_on_event_id = { 710 },
            images = {
                {
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
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
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
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Dangruf Wadi",
                        floor_id = 1
                    },
                },
            },
            {
                text = "Step 5: Return to Cid in the Metalworks(H-8) to complete the mission.",
                onmob_target = {"Cid"},
                trigger_on_event_id = { 504 },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Metalworks",
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
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Bastok Mines",
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                          zone_name = "Bastok Markets",
                      },
                      {
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
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Mines",
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                        zone_name = "Bastok Markets",
                    },
                    {
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
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
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
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
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
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "D-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Dangruf Wadi",
                        floor_id = 1,
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
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Mines",
                          highlights = {
                              { position = "H-10", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 1,
                          zone_name = "Bastok Markets",
                          highlights = {
                              { position = "D-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
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
                          width    = 512,
                          height   = 512,
                          state    = 6,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
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
                text = "Step 8: Travel to Port Windurst!\n " ..
                       "If you have the teleport crystal from Crag of Mea you can get a White Mage to teleport you, or Outpost Warp to Kolshushu \n \n" ..
                       "Otherwise time to get some virtual cardio in, a suggested route is: \n" ..
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
                          width    = 512,
                          height   = 512,
                          state    = 8,
                          zone_name = "West Ronfaure",
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "La Theine Plateau",
                        highlights = {
                            { position = "I-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Valkurm Dunes",
                        highlights = {
                            { position = "G-9", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Selbina",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Mhaura",
                        highlights = {
                            { position = "H-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Buburimu Peninsula",
                        highlights = {
                            { position = "D-7", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Tahrongi Canyon",
                        highlights = {
                            { position = "H-13", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "East Sarutabaruta",
                        highlights = {
                            { position = "G-11", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
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
                          width    = 512,
                          height   = 512,
                          state    = 10,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "N-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
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
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "West Sarutabaruta",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-12", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Giddeus",
                          floor_id = 15,
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
                          width    = 512,
                          height   = 512,
                          state    = 2,
                          zone_name = "Port Windurst",
                          highlights = {
                              { position = "N-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Windurst Woods",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
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
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "West Sarutabaruta",
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 1,
                          highlights = {
                              { position = "F-8", offsetX = 16, offsetY = 16 },
                              { position = "G-8", offsetX = 16, offsetY = 16 },
                              { position = "I-8", offsetX = 16, offsetY = 16 },
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 4,
                          zone_name = "Giddeus",
                          floor_id = 15,
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
                          width    = 512,
                          height   = 512,
                          state    = 5,
                          zone_name = "Giddeus",
                          floor_id = 15,
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
                            width    = 512,
                            height   = 512,
                            state    = 7,
                            zone_name = "West Sarutabaruta",
                            highlights = {
                                { position = "K-4", offsetX = 16, offsetY = 16 },
                            },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 7,
                          zone_name = "East Sarutabaruta",
                          highlights = {
                              { position = "J-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Tahrongi Canyon",
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Buburimu Peninsula",
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Mhaura",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                      },
                      {
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
                          width    = 512,
                          height   = 512,
                          state    = 10,
                          zone_name = "Chateau d'Oraguille",
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
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "West Ronfaure",
                          highlights = {
                              { position = "E-4", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Ghelsba Outpost",
                          floor_id = 1,
                          highlights = {
                              { position = "H-11", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 1,
                          highlights = {
                              { position = "K-5", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Fort Ghelsba",
                          highlights = {
                              { position = "J-8", offsetX = 16, offsetY = 16 },
                          },
                      },
                      {
                          width    = 512,
                          height   = 512,
                          state    = 11,
                          zone_name = "Yughott Grotto",
                          floor_id = 2,
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
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks, outside the President's Office. You may need to speak with him twice to receive the cutscene!",
                onmob_target = {"Iron Eater"},
                trigger_on_event_id = {715},
                images = {
                    {
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
                       "From Konschtat Highlands, you can travel to (K-3) to enter Pashhow Marshlands. \n" ..
                       "You also can use the Beadeaux Survival Guide if unlocked!",
                zone_trigger = "Beadeaux",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Konschtat Highlands",
                        highlights = {
                            { position = "K-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                text = "Step 4: Zone into Beadeaux for a cutscene. \n \n" ..
                       "You need to defeat 20 Copper Quadav enemies (levels 22-28) while in Beadeaux - they are around the starting area. They sound-aggro under level 42. \n" ..
                       "Party members get credit for kills. The kill counter persists if you zone or logout.",
                trigger_on_event_id = 120,
                kill_requirement = {
                    count = 20,
                    enemies = {"Copper Quadav"},
                    zone = "Beadeaux",
                    count_party_kills = true
                },
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: After defeating 20 Copper Quadav, zone into Pashhow Marshlands to receive the completion cutscene. \n" ..
                       "Do NOT use Escape or you'll miss the cutscene!",
                trigger_on_event_id = {11},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
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
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city. \n \n",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                       "- Hare Meat drops from rabbits Palborough Mines[Pit Hare] lowest level rabbits near Bastok. Alt: Dangruf Wadi.\n \n",
                items_needed = {
                    "Hare Meat"
                },
                trigger_on_item_obtain = {"Hare Meat"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "North Gustaberg",
                        highlights = {
                            { position = "K-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 2,
                        zone_name = "Palborough Mines",
                        floor_id = 1,
                        --highlights = {
                        --    { position = "K-3", offsetX = 16, offsetY = 16 },
                        --},
                    },
                },
            },
            {
                text = "Step 3: Travel to Gusgen Mines via Konschtat Highlands (L-7). You can also use a Survival Guide or assisted images for directions from Bastok! \n" ..
                       "Recommended: Level 30+ with Sneak, or level 40+ (mobs aggro by hearing and HP). \n \n",
                zone_trigger = "Gusgen Mines",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "North Gustaberg",
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Konschtat Highlands",
                        highlights = {
                            { position = "L-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: In Gusgen Mines, find the ??? at Map 1 (J-7). \n \n" ..
                       "Trade your Hare Meat to it to spawn Blind Moby. \n \n" ..
                       "Defeat Blind Moby to obtain the Glocolite key item. \n \n",
                onmob_target = {"Blind Moby"},
                draw_type = 'square',
                center = { x = 210.1, y= -59.2, z=-101.8 },
                size = 1,
                zone = "Gusgen Mines",
                --trigger_on_event_id = {1010},
                items_needed = {
                    "Glocolite"
                },
                trigger_on_item_obtain = {"Glocolite"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Gusgen Mines",
                        floor_id = 1,
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
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Port Bastok",
                        highlights = {
                            { position = "L-6", offsetX = 16, offsetY = 16 },
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
            {
                text = "Step 1: Receive the mission from any Bastok Gate Guard. They can be found at the entrance gates to the city.",
                onmob_target = {"Rashid", "Cleades", "Argus"},
                trigger_on_event_id = 1001,
                trigger_on_talk = {"You have accepted the mission"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Mines",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 1,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                text = "Step 3: Travel to Ru'Lude Gardens in Jeuno and speak with Goggehn at the Embassy of Bastok (H-10). \n \n" ..
                       "The trip is quite long to Jeuno - it can be done via the following route: \n \n" ..
                       "Metalworks          : Go to (E-7/8) -> Bastok Markets. \n" ..
                       "Bastok Markets      : Go to (D-11)  -> South Gustaberg. \n" ..
                       "South Gustaberg     : Go to (E-6)   -> North Gustaberg. \n" ..
                       "North Gustaberg     : Go to (D/E-6) -> Konschtat Highlands. \n" ..
                       "Konschtat Highlands : Go to (K-3)   -> Pashhow Marshlands. \n" ..
                       "Pashhow Marshlands  : Go to (K-4)   -> Rolanberry Fields. \n" ..
                       "Rolanberry Fields   : Go to (L-3)   -> Lower Jeuno. \n" ..
                       "Lower Jeuno         : Go to (I-5)   -> Upper Jeuno. \n" ..
                       "Upper Jeuno         : Go to (J-10)  -> Ru'Lude Gardens. \n \n" ..
                       "Now go stretch your legs irl and grab the Home Point crystals so you can teleport back! \n \n",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = {41, 66, 139},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Metalworks",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                            { position = "E-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Bastok Markets",
                        highlights = {
                            { position = "D-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "South Gustaberg",
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
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
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Konschtat Highlands",
                        highlights = {
                            { position = "K-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Pashhow Marshlands",
                        highlights = {
                            { position = "K-4", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Rolanberry Fields",
                        highlights = {
                            { position = "L-3", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Upper Jeuno",
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 3,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Travel to Qufim Island and enter Lower Delkfutts Tower - If walking for first time : \n \n" ..
                       "Lower Jeuno  : Go to (K-6) -> Port Jeuno. \n" ..
                       "Port Jeuno   : Go to (F-5) -> Qufim Island. \n" ..
                       "Qufim Island : Go to (F-5) -> Lower Delkfutts Tower. \n \n" ..
                       "Alternatively, you can use Unity Warp/Outpost Warp/Home Point to Qufim Island if unlocked for quickness",
                zone_trigger = "Lower Delkfutt's Tower",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "K-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Port Jeuno",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 4,
                        zone_name = "Qufim Island",
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 5: Navigate Delkfutt's Tower in Qufim Island (10 floors). \n" ..
                       "Recommended: Level 40+ with Sneak and Invisible, or level 50+. \n" ..
                       "You need to reach Floor 10 - Upper Delkfutt's Tower!  \n \n" ..
                       "1st Floor: Go to (E/F-6) Stairs \n" ..
                       "2nd Floor: (I/J-9) Stairs - Avoid (H-9). \n" ..
                       "3rd Floor: (G-6) Teleporter. \n" ..
                       "4th Floor: (I-6) Stairs - long way around. \n" ..
                       "5th Floor: (H-9) Stairs  \n" ..
                       "6th Floor: (J-10) Teleporter \n" ..
                       "7th Floor: (F-6/7) Stairs (NW) \n" ..
                       "8th Floor: (1st time): (I-6 Stairs \n" ..
                       "9th Floor: (1st time): J-10 (Do NOT drop at (H-10). \n" ..
                       "8th Floor: (2nd time): F-9/G-10 -> 9th Floor \n" ..
                       "9th Floor: (2nd time): F-6 -> 10th Floor Teleport. \n \n",
                zone_trigger = "Upper Delkfutt's Tower",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "E-6", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 3,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 15,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 4,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 5,
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 6,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 7,
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                            { position = "F-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 8,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16 },
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 5,
                        zone_name = "Middle Delkfutt's Tower",
                        floor_id = 9,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Kill Porphyrion to obtain a Delkfutt Key! \n \n" ..
                       "Notes: It uses Eagle Eye Shot, be careful! \n \n" ..
                       "Recommended: Level 50+ or a party. \n \n",
                items_needed = {
                    "Delkfutt Key"
                },
                trigger_on_item_obtain = {"Delkfutt Key"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 6,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 7: Trade the Delkfutt Key on the elevator to access the basement area of the tower. \n",
                trigger_on_event_id = {1,6},
                onmob_target = {"Elevator"},
                draw_type = 'square',
                center = {x = -300, y= -143.6, z=19.9},
                size = 1,
                zone = "Upper Delkfutt's Tower",
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 7,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 1,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: You will now have to run down the tower's stairs and re-enter Lower Delkfutts Tower Basement. \n \n" ..
                       "Trigger a cutscene at the Cermet Door in the basement (L-9).",
                trigger_on_event_id = 1,
                onmob_target = {"Cermet Door"},
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Upper Delkfutt's Tower",
                        floor_id = 5,
                        -- highlights = {
                        --     { position = "L-9", offsetX = 16, offsetY = 16 },
                        -- },
                    },
                    {
                        width    = 512,
                        height   = 512,
                        state    = 8,
                        zone_name = "Lower Delkfutt's Tower",
                        floor_id = 15,
                        highlights = {
                            { position = "L-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 9: Return to Goggehn at the Embassy of Bastok in Ru'Lude Gardens (H-10).",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = 139,
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 9,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 10: Click on the Door:Bastokan Embassy at (H-10) in Ru'Lude Gardens to complete the mission.",
                onmob_target = {"Door:Bastokan Embassy"},
                trigger_on_event_id = 38,
                images = {
                    {
                        width    = 512,
                        height   = 512,
                        state    = 10,
                        zone_name = "Ru'Lude Gardens",
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
            -- PREREQUISITES
            {
                text = "Step 1: This mission requires Rank 4. Ensure your Rank Points are high (nearly or completely full) by completing repeatable missions or trading 4 crystals to a Conquest Overseer. \n \n" ..
                       "Morlepiche (H-10) in upper Ru'Lude Gardens accepts crystals. \n \n" ..
                       "Go to Basokan Embassy and speak with Goggehn (H-10) to start the mission. \n \n" ..
                       "Note: Unlike most missions, this is NOT offered by Gate Guards.",
                onmob_target = {"Goggehn"},
                trigger_on_talk = {" pronto!"},
                trigger_on_event_id = 0,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 1,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },

            },

            -- MISSION START
            {
                text = "Step 2: Next check the Door: Bastokan Embassy at (H-10). \n \n" ..
                       "You will receive KI:Archducal Audience Permit.",
                onmob_target = {"Door:Bastokan Embassy"},
                trigger_on_event_id = {129},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: In Ru'Lude Gardens, check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Letter to Aldo.",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {128},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Ru'Lude Gardens",
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 4: Travel to Lower Jeuno and talk to Aldo (J-8) inside Neptune's Spire Inn. \n \n" ..
                       "You will receive KI:Silver Bell. \n \n" ..
                       "NOTE: To access Tenshodo HQ, you need KI:Tenshodo Member's Card from the quest 'Tenshodo Membership' OR trade a Tenshodo Invite to Ghebi Damomohe (I-7). \n \n" ..
                       "You can buy a Tenshodo Invite off the Auction House in the Others > Misc.1 section \n \n" ..
                       "Once you have a Tenshodo Invite simply trade it to Ghebi Damomohe (I-7) - she is behind the counter at the entrance! \n" ..
                       "If on CoP mission 'A Vessel Without a Captain', that scene appears first - talk to Aldo twice. \n \n",
                onmob_target = {"Aldo"},
                trigger_on_event_id = {152},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            -- YAGUDO TORCH
            {
                text = "Step 5: Talk to Paya-Sabya (I-8) in Upper Jeuno. \n" ..
                "Notes: Home Point#3 closest teleport. \n \n",
                onmob_target = {"Paya-Sabya"},
                trigger_on_event_id = {80},
                keyitems_needed = {20,21,46,47},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Upper Jeuno",
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 6: Talk to Muckvix (H-9) teleport to Home Point#1 in Lower Jeuno and head inside Muckvix's Junk Shop. \n \n" ..
                       "You will receive KI:Yagudo Torch. \n \n",
                onmob_target = {"Muckvix"},
                trigger_on_event_id = {184},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 6,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "H-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- CREST OF DAVOI
            {
                text = "Step 7: Talk to Baudin at (G-7) southwest corner in Upper Jeuno. \n \n",
                onmob_target = {"Baudin"},
                trigger_on_event_id = {174},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 7,
                        zone_name = "Upper Jeuno",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 8: Obtain Coeurl Meat by: \n \n" ..
                       "Purchasing from Auction House: Food > Ingredients section! \n \n" ..
                       "Defeating Coeurls (drops from all Coeurls, including in Sauromugue Champaign/Meriphataud Mountains) \n \n" ..
                       "Go to Port Jeuno (E-6) - Home Point#1 and zone into Sauromugue Champaign. \n \n",

                items_needed = {
                    "Coeurl Meat"
                },
                trigger_on_item_obtain = {"Coeurl Meat"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 8,
                        zone_name = "Sauromugue Champaign",
                        highlights = {
                            { position = "J-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 9: Trade Coeurl Meat to Baudin (G-7) in Upper Jeuno. \n \n" ..
                       "You will receive KI:Crest of Davoi. (Completes quest 'Crest of Davoi') \n \n",
                onmob_target = {"Baudin"},
                trigger_on_event_id = {171},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 9,
                        zone_name = "Upper Jeuno",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- BEADEAUX KEY ITEMS
            {
                text = "Step 10: Talk to Sattal-Mansal (J-8) in Lower Jeuno (outside Aldo's room in basement of Neptune's Spire). \n \n" ..
                       "This initiates quests: 'Mysteries of Beadeaux I' and 'Mysteries of Beadeaux II'. \n \n" ..
                       "He will request: Quadav Charm (Rare/Ex) and Quadav Augury Shell (Rare). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {89},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 10,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 11: Travel to Beadeaux. \n \n" ..
                       "Fastest route: Survival Guide to Beadeaux directly, or Outpost to Passhow Marshlands. \n \n",
                zone_trigger = "Beadeaux",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 11,
                        zone_name = "Pashhow Marshlands",
                        highlights = {
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 12: In Beadeaux Map 1, head to ramp at (H-7) to enter Map 2. \n \n" ..
                       "In Map 2, examine 'The Mute' at (G-7) to receive Silence effect. \n \n" ..
                       "This allows you to pass 'The Afflictor' without being Cursed. \n \n",
                trigger_on_buff = 6,  -- Silence status effect (ID: 6 on this server)
                zone_name = "Beadeaux",
                onmob_target = {"The Mute1"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 12,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 13: Whilst Silenced, you can walk through 'The Afflictor' to avoid being CURSED! \n \n" ..
                       "Make your way to (F-8) and back to Map 1. \n \n" ..
                       "Now go to (E-10) and up the ramp to the 2nd Level on Map 1. \n \n",
                trigger_zones = {
                    { type = 'square', center = {  x = -259.9, y = 1, z = -137 }, size = 3  }
                },
                onmob_target = {"Ramp 1"},
                zone = "Beadeaux",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "E-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 14: Defeat De'Vyu Headhunter (I-9) to obtain Quadav Charm (drops up to 4). \n \n" ..
                       "Defeat Go'Bhu Gascon (F-6) to obtain Quadav Augury Shell (drops up to 4). \n \n" ..
                       "Notes: Stay on the 2nd level and run around to the shown coordinates. \n \n",
                require_all_items = true,
                items_needed = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                trigger_on_item_obtain = {
                    "Quadav Charm",
                    "Quadav Augury Shell"
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 14,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 13,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "F-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 15: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                       "Trade Quadav Charm -> receive KI:Coruscant Rosary (completes 'Mysteries of Beadeaux I'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {91},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 15,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 16: Return to Sattal-Mansal (J-8) in Lower Jeuno. \n \n" ..
                        "Trade Quadav Augury Shell -> receive KI:Black Matinee Necklace (completes 'Mysteries of Beadeaux II'). \n \n",
                onmob_target = {"Sattal-Mansal"},
                trigger_on_event_id = {92},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 16,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "J-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            -- DAVOI - OPTISTONE
            {
                text = "Step 17: Travel to Davoi! \n \n" ..
                       "Fastest route: Unity Warp to Jugner Forest, go to (G-12). OR Outpost to Norvallen > Davoi. \n \n" ..
                       "If running and no teleports here's a route from Jeuno: \n \n" ..
                       "Lower Jeuno    (I-5)  ->\n" ..
                       "Upper Jeuno    (F-5)  ->\n" ..
                       "Batallia Downs (F-9)  ->\n" ..
                       "Jugner Forrest (G-12) ->\n" ..
                       "Davoi. \n \n",
                zone_trigger = "Davoi",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 17,
                        zone_name = "Lower Jeuno",
                        highlights = {
                            { position = "I-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 17,
                        zone_name = "Upper Jeuno",
                        highlights = {
                            { position = "F-5", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 17,
                        zone_name = "Batallia Downs",
                        highlights = {
                            { position = "F-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 17,
                        zone_name = "Jugner Forest",
                        highlights = {
                            { position = "G-12", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 18: Navigate to Wall of Dark Arts (G-7) and click! \n \n" ..
                       "You will need the KI:Crest of Davoi to get through. \n \n" ..
                       "Click Yes... Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                onmob_target = {"Wall of Dark Arts"},
                trigger_on_event_id = 54,
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 18,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 19: Continue into Monastic Cavern. \n \n",
                zone_trigger = "Monastic Cavern",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 19,
                        zone_name = "Davoi",
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 20: In Monastic Cavern, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Optistone. \n \n",
                keyitems_needed = {14},
                trigger_on_keyitem_obtain = {14},
                onmob_target = {"Magicite-Monastic"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 20,
                        zone_name = "Monastic Cavern",
                        highlights = {
                            { position = "F-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- BEADEAUX - AURASTONE
            {
                text = "Step 21: Return to Beadeaux! \n \n" ..
                       "Use the Survival Guide or Outpost [Derfland] in Pashhow Marshlands to get there! \n \n" ..
                       "Map 1 go to (H-7). \n \n" ..
                       "Navigate to Qulun Dome entrance at (I-7). \n \n",
                zone_trigger = "Qulun Dome",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 21,
                        zone_name = "Pashhow Marshlands",
                        highlights = {
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 21,
                        zone_name = "Beadeaux",
                        floor_id = 1,
                        highlights = {
                            { position = "H-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 21,
                        zone_name = "Beadeaux",
                        floor_id = 15,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 22: In Qulun Dome, check the Door (G-8). \n \n" ..
                       "Open the door - you need: KI:Silver Bell, KI:Coruscant Rosary, KI:Black Matinee Necklace. \n \n" ..
                       "Might have to click it twice, till an option: 'Investigate the door?' -  Click Yes! \n \n",
                onmob_target = {"Qulun Door 1"},
                --trigger_on_event_id = {50},
                trigger_on_talk = {" shine brightly!"},
                zone = "Qulun Dome",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 22,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 23: In Qulun Dome, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Aurastone. \n \n",
                keyitems_needed = {15},
                trigger_on_keyitem_obtain = {15},
                onmob_target = {"Magicite-Qulun"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 23,
                        zone_name = "Qulun Dome",
                        highlights = {
                            { position = "E-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- CASTLE OZTROJA - ORASTONE
            {
                text = "Step 24: Travel to Castle Oztroja. \n \n"..
                       "Fastest route: Survival Guide to Aragoneu > Castle Oztroja OR outpost to Meriphataud Mountains! \n \n" ..
                       "If you like getting some virtual cardio in heres a route from Jeuno: \n \n" ..
                       "Port Jeuno            : (K-8)  ->\n" ..
                       "Sauromugue Champaign  : (K-11) ->\n" ..
                       "Meriphataud Mountains : (L-8)  ->\n" ..
                       "Castle Oztroja - woo! \n \n",
                zone_trigger = "Castle Oztroja",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 24,
                        zone_name = "Port Jeuno",
                        highlights = {
                            { position = "K-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 24,
                        zone_name = "Sauromugue Champaign",
                        highlights = {
                            { position = "K-11", offsetX = 16, offsetY = 16 },
                            { position = "L-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 24,
                        zone_name = "Meriphataud Mountains",
                        highlights = {
                            { position = "L-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 25: Castle Oztroja Route: \n \n" ..
                       "Navigate through: \n \n" ..
                       "Map 1 (I-8)    -> \n" ..
                       "Map 2 (G-7)    -> \n" ..
                       "Map 6 (I-7)    -> \n" ..
                       "Map 7 (H-9/10) -> Yagudo Torch! \n \n" ..
                       "Notes: One lever opens door, other triggers trapdoor. Correct lever changes each Vana'diel day. \n \n" ..
                       "Stand on trapdoor to use the lever. To avoid trap: Click lever and then RUN off trapdoor immediately. \n \n" ..
                       "If you fall follow the map and click the other lever until you get through! \n \n",
                trigger_on_event_id = {11},
                zone_name = "Castle Oztroja",
                visual_zones = {
                    {
                        type = 'square',
                        center = { x = -102.9, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15  -- Optional: only show on floor 1
                    },
                    {
                        type = 'square',
                        center = { x = -97.3, y = 24.3, z = -108.4 },
                        size = 2,
                        floor_id = 15  -- Optional: only show on floor 5
                    },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 25,
                        zone_name = "Castle Oztroja",
                        floor_id = 1,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 25,
                        zone_name = "Castle Oztroja",
                        floor_id = 2,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 25,
                        zone_name = "Castle Oztroja",
                        floor_id = 5,
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 25,
                        zone_name = "Castle Oztroja",
                        floor_id = 6,
                        highlights = {
                            { position = "I-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 25,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "J-11", offsetX = 16, offsetY = 16 },
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 26: Now proceed to the Altar Room! \n \n" ..
                       "You'll have to go through another Brass Door! \n \n",
                zone_trigger = "Altar Room",
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 26,
                        zone_name = "Castle Oztroja",
                        floor_id = 15,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 27: In Altar Room, check the Magicite at the end of the hall. \n \n" ..
                       "You will receive KI:Magicite: Orastone. \n \n" ..
                       "NOTE: If you spoke to Paya-Sabya and Muckvix, you get Fickblix cutscene. If repeating mission and skipped them, cutscene is skipped. \n \n",
                keyitems_needed = {16},
                trigger_on_keyitem_obtain = {16},
                onmob_target = {"Magicite-Altar"},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 27,
                        zone_name = "Altar Room",
                        highlights = {
                            { position = "G-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },

            -- MISSION COMPLETION
            {
                text = "Step 28: After obtaining all THREE Magicites, return to Ru'Lude Gardens (Home Point #1) and check the Audience Chamber door at (H-6). \n \n" ..
                       "You will receive KI:Airship Pass (or 20,000 gil if you already have one). \n \n" ..
                       "You will also receive title: 'Have Wings, Will Fly'. \n \n",
                onmob_target = {"Door: Audience Chamber"},
                trigger_on_event_id = {60},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 28,
                        zone_name = "Ru'Lude Gardens",
                        floor_id = 0,
                        highlights = {
                            { position = "H-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 29: Talk to Goggehn (H-10) at the Bastokan Embassy in Ru'Lude Gardens to complete the mission. \n \n" ..
                       "Rewards: Rank 5, KI:Message to Jeuno, 10,000 gil. \n \n" ..
                       "Mission 5-1 'Darkness Rising' begins immediately. You cannot change allegiance until completing or rejecting 5-1. \n \n",
                onmob_target = {"Goggehn"},
                trigger_on_event_id = {35},
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 29,
                        zone_name = "Ru'Lude Gardens",
                        floor_id = 0,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Rank 5, Airship Pass (or 20,000 gil), Message to Jeuno KI, 10,000 gil, Title: Have Wings Will Fly"
        }
    },

    ["5-1: Darkness Rising"] = {
        steps = {
            { text = "Step 1: Receive the mission from any Bastok Gate Guard." },
            {
                text = "Step 2: Talk to Iron Eater at (J-8) in the Metalworks.",
                images = {
                    {
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
