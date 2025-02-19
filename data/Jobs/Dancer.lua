return {
    ["1.Dancer Unlock - Lakeside Minuet"] = {
        steps = {
          {
            text = "Step 1: Speak to Laila (G-7) in Upper Jueno to start the Dancer quest.\n \n" ..
                   "- Notes: Being Level 30+ is the only requirement on ANY job. \n \n",
            images = {
                {
                    file     = "maps/upper_jeuno.png",
                    width    = 512,
                    height   = 512,
                    state    = 1,
                    highlights = {
                        { position = "G-7", offsetX = 16, offsetY = 16 },
                    },
                }
            },
          },
          {
            text = "Step 2: Speak with Rhea Myuliah (G-7) who is standing right next to Laila. \n \n",
            images = {
                {
                    file     = "maps/upper_jeuno.png",
                    width    = 512,
                    height   = 512,
                    state    = 2,
                    highlights = {
                        { position = "G-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 3: Go to Southern San d'Oria and talk to Valderotaux (K-6) - (Home Point#3), he's in the Lion Springs Tavern.\n \n" ..
                   "- Check the books around the room, and you will spawn a 'Dusty Tome' monster! \n \n" ..
                   "- Notes: He will give options on your dance performance, none of these options you choose make any impact on progression.' \n \n",

            images = {
                {
                    file     = "maps/southern_san_doria.png",
                    width    = 512,
                    height   = 512,
                    state    = 3,
                    highlights = {
                        { position = "K-6", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 4: Return to Upper Jueno and talk to Rhea Myuliah (G-7) again. \n \n" ..
                   "- Notes: Mentions a pebble in Lake Mechieume in Jugner Forest(S) - which is in the past!' \n \n",
            images = {
                {
                    file     = "maps/upper_jeuno.png",
                    width    = 512,
                    height   = 512,
                    state    = 4,
                    highlights = {
                        { position = "G-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 5: Travel to Jugner Forest(S). \n \n" ..
                   "Travel:  \n" ..
                   "- Batalia Downs    (H-5) -> Batalia Downs(S) \n" ..
                   "- Batalia Downs(S) (F-9) -> Jugner Forest(S) \n \n" ..
                   "- Notes: You will have to go through (H-5) Cavernous Maw in Batalia Downs if you do not have spell Recall Jugner. \n \n",
            images = {
                {
                    file     = "maps/batallia_downs.png",
                    width    = 512,
                    height   = 512,
                    state    = 5,
                    highlights = {
                        { position = "H-5", offsetX = 16, offsetY = 16 },
                    },
                },
                {
                    file     = "maps/batallia_downs_s.png",
                    width    = 512,
                    height   = 512,
                    state    = 5,
                    highlights = {
                        { position = "F-9", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 6: In Jugner Forest(S) go to (I-5) and click on the 'Glowing Pebble' for a cutscene with young Laila. \n \n " ..
                   "- Notes: You will obtain the KI:Stardust Pebble. \n \n",
            images = {
                {
                    file     = "maps/jugner_forest_s.png",
                    width    = 512,
                    height   = 512,
                    state    = 6,
                    highlights = {
                        { position = "I-5", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
          {
            text = "Step 7: Return back to Upper Jueno and speak to Laila (G-7) to complete the Dancer unlock quest. \n \n " ..
                   "- Notes: Congratulations! You may now become a Dancer! \n \n",
            images = {
                {
                    file     = "maps/upper_jeuno.png",
                    width    = 512,
                    height   = 512,
                    state    = 7,
                    highlights = {
                        { position = "G-7", offsetX = 16, offsetY = 16 },
                    },
                },
            },
          },
        },
        reward = {
            text = "Unlock Dancer Job!",

            },
        },
["2.Dancer AF Weapon - The Unfinished Waltz"] = {
            steps = {
                {
                    text = "Step 1: Speak to Laila (G-7) in Upper Jueno to begin the quest.\n \n" ..
                           "\n" ..
                           "- Notes: You must be level 40+ Dancer Main to start this quest.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 1,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 2: Talk to Rhea Myuliah (G-7) standing right beside Laila.\n \n" ..
                           "- She will mention rumors of a traveling dancer and suspicious medicine.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 2,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 3: Travel to Grauberg (S) in the Wings of the Goddess era.\n \n" ..
                           "- Be sure you're heading to Grauberg (S), not the Abyssea version.\n \n" ..
                           "- If possible, mount up to avoid Hippogryphs with true sight.\n \n",
                    images = {
                        {
                            file = "maps/grauberg_s.png",
                            width = 512,
                            height = 512,
                            state = 3,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 4: Examine the ??? (F-5) for a cutscene.\n \n" ..
                           "- Notes: This ??? is near a cluster of three trees, NW of the Veridical Conflux.\n \n" ..
                           "- Your main job MUST be set to Dancer to receive the cutscene.\n \n",
                    images = {
                        {
                            file = "maps/grauberg_s.png",
                            width = 512,
                            height = 512,
                            state = 4,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 5: (Still at F-5) Check the ??? a second time to spawn the NM \"Migratory Hippogryph.\"\n \n" ..
                           "- Do NOT zone between the first cutscene and spawning the NM or it won't appear.\n \n" ..
                           "- You must still be on DNC main job for this fight.\n \n" ..
                           "- Nearby pixies (Sidhe) do NOT help cure players.\n \n" ..
                           "===== MIGRATORY HIPPOGRYPH =====\n" ..
                           "- Family: Hippogryph \n" ..
                           "- HP: 2000(around)\n" ..
                           "- Job: ???\n" ..
                           "- Recommended: Good soloing jobs can solo this NM at 55, any job around 70 so be careful. \n \n" ..
                           "- With Trusts around late 40s is safe... \n \n",
                    images = {
                        {
                            file = "maps/grauberg_s.png",
                            width = 512,
                            height = 512,
                            state = 5,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 6: Check the ??? a third time after defeating the NM.\n \n" ..
                           "- Receive the KI:The Essence of Dance and another cutscene.\n \n" ..
                           "- The NM needs to be killed only once for all Dancers on this step, but everyone must have examined the ??? for the first cutscene.\n \n" ..
                           "- If someone just defeated the NM, wait a few minutes for the ??? to respawn.\n \n",
                    images = {
                        {
                            file = "maps/grauberg_s.png",
                            width = 512,
                            height = 512,
                            state = 6,
                            highlights = {
                                { position = "F-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 7: Open your Key Items menu (/keyitem) and read \"The Essence of Dance\" before continuing it will be in your Permanent Key Items section.\n \n" ..
                           "- Notes: This is required to trigger the final cutscene.\n \n",
                    images = {
                        {
                        file = "misc/key_item_the_essence_of_dance.png",
                        width = 481,
                        height = 87,
                        state = 7,
                        },
                        {
                        file = "misc/key_item_the_essence_of_dance_2.png",
                        width = 481,
                        height = 222,
                        state = 7,
                        },
                    },
                },
                {
                    text = "Step 8: Return to (Upper Jeuno G-7) and talk to Laila again to receive the War Hoop (DNC AF Weapon).\n" ..
                           "- You MUST have read your key item first.\n" ..
                           "- Your main job MUST still be Dancer to complete the quest.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 8,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
            },
            reward = {
                text = "War Hoop (Dancer AF Weapon).\n",
                images = {
                    {
                        file = "equipment/war_hoop.png",
                        width = 455,
                        height = 87,
                    },
                },
            },
        },
        ["3.Dancer AF Legs - The Road to Divadom"] = {
            steps = {
                {
                    text = "Step 1: (Upper Jeuno G-7) Talk to Laila as a Lv.50+ Dancer.\n \n" ..
                           "- She tells you to find a musician.\n \n" ..
                           "- To save time, acquire Yagudo Glue before heading to Jugner Forest (S).\n \n" ..
                           "- You must have your main job set to Dancer for the next parts of the quest.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 1,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 2: Zone into Jugner Forest (S) for a cutscene.\n \n" ..
                           "- You can receive the cutscene even while mounted.\n \n" ..
                           "- Fastest route (if you have it): Warp to the Survival Guide in Batallia Downs (S), then enter Jugner Forest (S).\n \n" ..
                           "- Otherwise, exit Upper Jeuno to Batallia Downs and proceed to the Cavernous Maw at (H-5). Enter Batallia Downs (S), then go to (E-9) to reach Jugner Forest (S).\n \n",
                    images = {
                        -- (Optional) Add a map for Batallia Downs (S) or Jugner if desired
                    },
                },
                {
                    text = "Step 3: (Jugner Forest (S) I-5) Click the Glowing Pebbles for a cutscene with the Shrouded Piper.\n \n" ..
                           "- He will ask you to bring him a block of Yagudo Glue.\n \n" ..
                           "- You must approach the ??? from the northeast (near Batallia Downs (S)) because of an unmarked fence on the in-game map.\n \n",
                    images = {
                        {
                            file = "maps/jugner_forest_s.png",
                            width = 512,
                            height = 512,
                            state = 3,
                            highlights = {
                                { position = "I-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 4: Obtain Yagudo Glue (if you haven't already).\n \n" ..
                           "- Yagudo Glue drops from Bard-type Yagudo in the past (e.g., Yagudo Pipers).\n \n" ..
                           "- Low-level Yagudo Pipers spawn outside Giddeus in West Sarutabaruta (S). Higher-level ones are in Castle Oztroja (S).\n \n" ..
                           "- You do NOT need to be on Dancer job for the glue to drop.\n \n" ..
                           "- Make sure to switch back to Dancer to complete the remainder of the quest.\n \n",
                    images = {
                        -- (Optional) Map for West Sarutabaruta (S) or Castle Oztroja (S)
                    },
                },
                {
                    text = "Step 5: (Jugner Forest (S) I-5) Trade the Yagudo Glue to the Glowing Pebbles.\n \n" ..
                           "- This will complete the Shrouded Piper’s request.\n \n",
                    images = {
                        {
                            file = "maps/jugner_forest_s.png",
                            width = 512,
                            height = 512,
                            state = 5,
                            highlights = {
                                { position = "I-5", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 6: (Upper Jeuno G-7) Speak with Laila again to receive Dancer's Tights.\n \n" ..
                           "- You must be on your Dancer main job for this final step.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 6,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
            },
            reward = {
                text = "Dancer's Tights.\n \n" ..
                       "- Congratulations! You now have your DNC AF Legs.\n \n",
                images = {
                {
                    file = "equipment/dancers_tights.png",
                    width = 455,
                    height = 107,
                },
            },
            },
        },
        ["4.Dancer AF Body - Comeback Queen"] = {
            steps = {
                {
                    text = "Step 1: Go to Upper Jeuno and Speak with Laila (G-7) as a Lv.50+ Dancer.\n \n" ..
                           "- You will receive a cutscene and the Key Item 'Wyatt's Proposal.'\n \n" ..
                           "- Make sure your main job is set to Dancer.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 1,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 2: Travel to Bastok Markets and Speak with Harmodios (K-10) in his music shop for another cutscene.\n \n" ..
                           "- Harmodios will discuss the performance and Wyatt's Proposal.\n \n",
                    images = {
                        {
                            file = "maps/bastok_markets.png",
                            width = 512,
                            height = 512,
                            state = 2,
                            highlights = {
                                { position = "K-10", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 3: Return to Upper Jeuno and speak to Laila (G-7) for a follow-up cutscene.\n \n" ..
                           "- She will reference your next meeting with Rhea Myuliah.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 3,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 4: Speak with Rhea Myuliah (G-7) for a practice performance cutscene.\n \n" ..
                           "- The goal is to have the biggest audience by selecting dances that appeal to certain age groups:\n \n" ..
                           "  - Waltzes attract young men/women.\n" ..
                           "  - Sambas attract older people.\n" ..
                           "  - Jigs attract children.\n \n" ..
                           "- You have 60 seconds per practice to do as many dances as possible.\n" ..
                           "- Each successful dance pulls watchers from Valeriano's troupe to yours.\n" ..
                           "- You can practice as often as you like.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 4,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
                {
                    text = "Step 5: Wait for the Vana'diel day to change, then speak to Laila (G-7) again for the real performance.\n \n" ..
                           "- You must be on Dancer main to trigger this final cutscene.\n" ..
                           "- The real audience is 3 children, 2 young men/women, and 2 older people.\n" ..
                           "- Focus on Jigs and Waltzes to secure at least 5 of the 7 watchers.\n" ..
                           "- If your performance fails, you must wait another in-game day and zone before trying again.\n" ..
                           "- Even after the timer hits 0:00, Valeriano can still steal audience members, so dance quickly.\n \n" ..
                           "- Tip: Rapidly alternate Waltzes and Jigs to ensure you capture enough watchers.\n \n",
                    images = {
                        {
                            file = "maps/upper_jeuno.png",
                            width = 512,
                            height = 512,
                            state = 5,
                            highlights = {
                                { position = "G-7", offsetX = 16, offsetY = 16 },
                            },
                        },
                    },
                },
            },
            reward = {
                text = "Dancer's Casaque.\n \n" ..
                       "- You must attract at least 4 watchers to succeed.\n" ..
                       "- Congratulations on obtaining your DNC AF Body!\n \n",
                images = {
                {
                    file = "equipment/dancers_casaque.png",
                    width = 455,
                    height = 127,
                },
            },
        },
    },
    ["5.Dancer AF Hands - Matthias Craft"] = {
        steps = {
            {
                text = "Step 1: You must be Level 50+ Dancer and have completed the quest 'The Road to Divadom.' Artifact Quest from Laila.\n \n" ..
                       "- This is required to access the Dancer AF Hands quest.\n \n" ..
                       "- Make sure your main job is set to Dancer.\n \n",
                images = {
                    -- No specific map needed yet
                },
            },
            {
                text = "Step 2: Go to Upper Jeuno and talk to Olgald (G-7) to activate the quest.\n \n" ..
                       "- He will direct you to see a tailor in Bastok Markets named Matthias.\n \n",
                images = {
                    {
                        file = "maps/upper_jeuno.png",
                        width = 512,
                        height = 512,
                        state = 2,
                        highlights = {
                            { position = "G-7", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
            {
                text = "Step 3: Travel to Bastok Markets and speak to Matthias (J-9).\n \n" ..
                       "- He will require these items for your order:\n \n" ..
                       "  - Square of Karakul Cloth\n" ..
                       "  - Square of Rainbow Cloth\n" ..
                       "  - Square of Rainbow Velvet\n \n" ..
                       "- Can aquire each from the Auction House. \n \n" ..
                       "- Once you have them, zone out and wait for the next Vana'diel day to pass before returning to Matthias.\n \n",
                images = {
                    {
                        file = "maps/bastok_markets.png", -- Adjust map file if needed
                        width = 512,
                        height = 512,
                        state = 3,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        file = "items/karakul_cloth.png", -- Adjust map file if needed
                        width = 455,
                        height = 66,
                        state = 3,
                    },
                    {
                        file = "items/rainbow_cloth.png", -- Adjust map file if needed
                        width = 455,
                        height = 66,
                        state = 3,
                    },
                    {
                        file = "items/rainbow_velvet.png", -- Adjust map file if needed
                        width = 455,
                        height = 66,
                        state = 3,
                    },
                },
            },
            {
                text = "Step 4: After the in-game day change, return to Matthias to complete the process.\n \n" ..
                       "- You can now obtain your Dancer AF Hands.\n \n" ..
                       "- Note: You can only have Matthias craft one item at a time; once chosen, you cannot cancel.\n \n" ..
                       "- After obtaining this piece, you may also request Dancer's Tiara or Dancer's Shoes.\n \n",
                images = {
                    {
                        file = "maps/bastok_markets.png",
                        width = 512,
                        height = 512,
                        state = 4,
                        highlights = {
                            { position = "J-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
            },
        },
        reward = {
            text = "Dancer's Bangles (AF Hands).\n \n" ..
                   "- Congratulations on another piece of your DNC Artifact Armor!\n \n",
            images = {
            {
                file = "equipment/dancers_bangles.png",
                width = 455,
                height = 127,
            },
        },
        },
    },
}

