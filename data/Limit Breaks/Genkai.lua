-- =============================================================================
-- Limit Break (Genkai) quest line
-- =============================================================================
-- SCAFFOLD ONLY - steps below are placeholders. Author them another day from the
-- wiki + server Lua, following data/ref/step_authoring_guide.md.
--
-- Plan (project memory: genkai-plan):
--   * Genkai 1-4 are SHARED across all jobs (level caps 50->55->60->65->70).
--       - typically item-collection / trial quests, same for every job.
--   * Genkai 5 is the MAAT FIGHT (cap 70->75) and differs PER JOB.
--       - build the 15 original jobs first.
--       - the addon does NOT detect the player's job, so each job's Maat fight is
--         its own entry the player selects manually (do NOT auto-branch on job).
--
-- This folder is auto-discovered as the "Limit Breaks" category by the loader
-- (modules/quest_data.lua). Each key below becomes a selectable entry; each entry
-- needs a `steps` table with at least one step so the UI renders cleanly.
--
-- Genkai 1 is split into TWO entries sharing choice_group "Genkai 1: In Defiant
-- Challenge" so the UI shows a "Choose one" between the FARMING route (kill mobs
-- for the drops - the original quest) and the KEY ITEM route (click ??? for each
-- item - a newer QOL addition). Splitting keeps each route's arrows on their own
-- step instead of overlapping in one. Complete EITHER to settle Genkai 1.
-- Order note: the UI sorts entries by name (utils.get_sorted_keys), so "Farming"
-- shows before "Key Item" (F < K); source order below matches that.
-- =============================================================================

return {
    ["Genkai 1: In Defiant Challenge - Farming Method"] = {
        -- Shared across ALL jobs. Log ID 3 / Quest ID 128 (jeuno.IN_DEFIANT_CHALLENGE).
        -- Original route: kill the listed mob in each dungeon for the item drop.
        -- Start: Maat, Ru'Lude Gardens (H-5). Requires Lv.50 with the level cap still at 50.
        choice_group = "Genkai 1: In Defiant Challenge",
        prerequisites = {
            {category = "Quests", subfile = "Garlaige Citadel", name = "Pouch of Weighted Stones (Banishing Gate opener)", recommended = true},
            {category = "Quests", subfile = "Windurst Waters North", name = "Magicked Astrolabe", recommended = true},
        },
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to bring him an Exoray Mold, a Bomb Coal, and a sheet of Ancient Papyrus.\n \n" ..
                       "- Kill the listed mob in each dungeon for the drop. No quest Key Items required.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 79 },
            },
            {
                text = "Step 2: Farm the Exoray Mold in Crawlers' Nest.\n \n" ..
                       "- Follow the YELLOW arrows to the Exorays and kill them for the drop.\n" ..
                       "- Exorays are in the tunnel to the donut room, starting around (I-10) on Map 1.\n" ..
                       "- WARNING: Exorays use Silence Gas and Spore (ice/paralysis) - mages bring Echo Drops and consider /whm.\n \n",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to kill the Exorays for the Mold drop
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 367.2, y = -32.3, z = -21.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'square', center = { x = 364.0, y = -32.2, z = -23.0 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 329.4, y = -32.3, z = -17.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 300.3, y = -32.3, z = -32.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 278.8, y = -32.1, z = -59.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 259.7, y = -32.5, z = -48.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 220.4, y = -32.4, z = -19.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 180.0, y = -32.3, z = -16.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 162.9, y = -32.4, z = -19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.1, y = -32.2, z = -27.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.6, y = -37.3, z = -58.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 129.6, y = -41.4, z = -72.8 }, stop = { x = 127.7, y = -32.0, z = -80.4 }, floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 123.0, y = -32.2, z = -81.6 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 103.3, y = -32.5, z = -73.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 77.8, y = -32.2, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.0, y = -32.3, z = -42.0 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.8, y = -35.1, z = -29.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 53.9, y = -37.3, z = -28.1 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.2, y = -33.4, z = -7.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Exoray",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
            },
            {
                text = "Step 3: Farm the Bomb Coal in Garlaige Citadel.\n \n" ..
                       "- Just click door if you have the Weighted Stones, otherwise be nice to 3 other people and have them step on the purple latches! \n \n" ..
                       "- Explosures (at (I-8) past the first Banishing Gate drop Bomb Coal at a high rate.\n" ..
                       "- WARNING: Use Sneak + Invisible to avoid aggro throughout Map 2.\n \n",
                zone_max_distance = 20,
                visual_zones = {
                        -- To Banshing Gate 1
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -380.1, y = -7.8, z = 375.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'square', center = { x = -383.0, y = -6.0, z = 363.5 }, size = 1, floor_id = 1, colour = "green" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -366.3, y = -6.0, z = 340.3 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -340.4, y = -3.3, z = 337.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -339.8, y = 0.0, z = 300.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -328.0, y = 0.0, z = 300.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -309.7, y = 0.0, z = 300.0 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -297.8, y = 0.0, z = 292.0 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -283.8, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -259.4, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -248.2, y = 0.0, z = 300.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -234.8, y = 0.0, z = 299.6 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.1, y = 0.0, z = 298.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -219.8, y = 0.0, z = 288.4 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -222.0, y = 0.0, z = 279.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -227.7, y = 0.0, z = 257.4 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -220.4, y = 0.0, z = 242.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.6, y = 0.0, z = 220.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -201.0, y = -3.0, z = 220.0 }, width = 6.25, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },

                        -- Step on squares to open door if no KI weighted stones
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -213.0, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -212.8, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                        { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },

                        -- To the BOMBS!!
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -194.6, y = 0.0, z = 219.8 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -180.7, y = 0.0, z = 217.8 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -180.1, y = 0.0, z = 195.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -179.0, y = 0.0, z = 178.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -166.9, y = 0.0, z = 179.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -140.1, y = 0.0, z = 179.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -117.5, y = 0.0, z = 179.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -100.0, y = 0.0, z = 179.2 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.8, y = 0.0, z = 205.2 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -97.5, y = 0.0, z = 220.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -68.7, y = 0.0, z = 218.2 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.7, y = 0.0, z = 200.0 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.1, y = 5.3, z = 171.3 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -58.2, y = 5.9, z = 150.5 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -49.1, y = 6.9, z = 144.3 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -38.1, y = 6.1, z = 143.1 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -24.7, y = 7.6, z = 140.9 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.5, y = 5.9, z = 152.9 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                        { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.7, y = 6.1, z = 177.3 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 2,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Garlaige Citadel",
                        floor_id = 16,
                        highlights = {
                            { position = "H-11", offsetX = 16, offsetY = 16 },
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Explosure",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Bomb Coal" }, -- VERIFY display name (LSB: CHUNK_OF_BOMB_COAL)
            },
            {
                text = "Step 4: Farm the Ancient Papyrus in The Eldieme Necropolis.\n \n" ..
                       "- Liches on the first level (Map 1) drop Ancient Papyrus (sparse spawns) - Make a Thief friend with Treasure Hunter.\n" ..
                       "- If the GATE is shut, follow the PURPLE line to and from the GATE - once you open go back to following yellow arrows! \n \n",
                route_to = "The Eldieme Necropolis",
                destination_highlight = { position = "H-9", offsetX = 16, offsetY = 16},
                onmob_target = "the-eldieme-necropolis-east-plate-h8",
                zone_max_distance = 20,
                visual_zones = {
                        --Route to J-10 The Eldieme Necrolpolios
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 424.2, y = 8.0, z = -142.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 388.5, y = 8.4, z = -176.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 353.5, y = 8.4, z = -207.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 322.7, y = 0.0, z = -238.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 289.5, y = 2.6, z = -268.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 246.2, y = 7.7, z = -299.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 218.3, y = 8.9, z = -323.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.3, y = 8.8, z = -342.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.9, y = 8.4, z = -372.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 198.3, y = 8.0, z = -402.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 177.9, y = 8.1, z = -417.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 138.3, y = 11.6, z = -378.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                        -- 1st keyitem.
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 316.7, y = -32.0, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 308.3, y = -32.0, z = -56.9 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.9, y = -32.0, z = -49.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 284.1, y = -32.2, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 273.3, y = -32.0, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --Shivas Gate
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },

                        -- PURPLE ARROWS TO GATE
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 301.1, y = -32.0, z = -43.4 }, stop = { x = 300.0, y = -32.0, z = -34.0 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 300.0, y = -32.0, z = -34.0 }, stop = { x = 299.8, y = -32.0, z = -26.9 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.8, y = -32.0, z = -26.9 }, stop = { x = 299.3, y = -32.0, z = -17.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.3, y = -32.0, z = -17.2 }, stop = { x = 299.5, y = -32.0, z = -4.9 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.5, y = -32.0, z = -4.9 }, stop = { x = 299.2, y = -28.0, z = 1.8 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 299.2, y = -28.0, z = 1.8 }, stop = { x = 289.4, y = -28.0, z = 1.8 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 289.4, y = -28.0, z = 1.8 }, stop = { x = 281.5, y = -28.0, z = 2.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 281.5, y = -28.0, z = 2.2 }, stop = { x = 281.7, y = -28.0, z = 11.3 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 281.7, y = -28.0, z = 11.3 }, stop = { x = 282.0, y = -28.0, z = 19.7 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 282.0, y = -28.0, z = 19.7 }, stop = { x = 272.9, y = -32.0, z = 19.5 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 272.9, y = -32.0, z = 19.5 }, stop = { x = 264.7, y = -32.0, z = 19.4 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 264.7, y = -32.0, z = 19.4 }, stop = { x = 257.4, y = -32.0, z = 19.3 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 257.4, y = -32.0, z = 19.3 }, stop = { x = 257.2, y = -32.0, z = 15.0 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 257.2, y = -32.0, z = 15.0 }, stop = { x = 250.0, y = -32.0, z = 16.1 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 250.0, y = -32.0, z = 16.1 }, stop = { x = 250.0, y = -32.0, z = 19.6 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 250.0, y = -32.0, z = 19.6 }, stop = { x = 240.2, y = -32.3, z = 20.2 }, floor_id = 15, colour = "magenta" },
                        { zone_name = "The Eldieme Necropolis", type = 'line', start = { x = 240.2, y = -32.3, z = 20.2 }, stop = { x = 233.8, y = -34.0, z = 19.9 }, floor_id = 15, colour = "magenta" },

                },
                onmob_enemy = "Lich",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Ancient Papyrus" },
            },
            {
                text = "Step 5: Return to Maat in Ru'Lude Gardens (H-5) and trade him all three items together (Exoray Mold, Bomb Coal, Ancient Papyrus) to finish.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                items_needed = { "Exoray Mold", "Bomb Coal", "Ancient Papyrus" },
                --require_all_items = true,
                trigger_on_event_id = { 81 },
            },
        },
        reward = {
            text = "Title: Horizon Breaker.\n \n" ..
                   "- Your level cap is raised to 55.\n \n",
        },
    },

    ["Genkai 1: In Defiant Challenge - Key Item Method"] = {
        -- Same quest, newer QOL route: click all THREE ??? per dungeon to receive
        -- each finished item (fragments combine automatically).
        choice_group = "Genkai 1: In Defiant Challenge",
        prerequisites = {
            {category = "Quests", subfile = "Garlaige Citadel", name = "Pouch of Weighted Stones (Banishing Gate opener)", recommended = true},
            {category = "Quests", subfile = "Windurst Waters North", name = "Magicked Astrolabe", recommended = true},
        },
        requirements = {
            level = 50,
        },
        steps = {
            {
                text = "Step 1: Speak to Maat in Ru'Lude Gardens (H-5) to start the quest.\n \n" ..
                       "- Maat asks you to bring him an Exoray Mold, a Bomb Coal, and a sheet of Ancient Papyrus.\n \n" ..
                       "- Click all THREE ??? in each item's dungeon to receive the finished item (fragments combine automatically). You MUST have started the quest with Maat first.\n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                keyitems_needed = {2134,2135,2136,2137,2138,2139,2140,2141,2142},
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                trigger_on_event_id = { 79 },
            },
            {
                text = "Step 2: Get the Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-g10-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 367.2, y = -32.3, z = -21.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'square', center = { x = 364.0, y = -32.2, z = -23.0 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 329.4, y = -32.3, z = -17.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 300.3, y = -32.3, z = -32.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 278.8, y = -32.1, z = -59.5 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 259.7, y = -32.5, z = -48.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 220.4, y = -32.4, z = -19.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 180.0, y = -32.3, z = -16.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 162.9, y = -32.4, z = -19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.1, y = -32.2, z = -27.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 139.6, y = -37.3, z = -58.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 129.6, y = -41.4, z = -72.8 }, stop = { x = 127.7, y = -32.0, z = -80.4 }, floor_id = 15, colour = "yellow" },

                        -- to KI 1
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 124.0, y = -32.3, z = -81.0 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 111.6, y = -33.5, z = -71.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 95.8, y = -32.3, z = -70.5 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 81.2, y = -32.0, z = -60.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 58.0, y = -32.2, z = -53.5 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 57.9, y = -32.2, z = -38.3 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 53.3, y = -34.7, z = -32.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 55.5, y = -38.2, z = -25.3 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.8, y = -33.3, z = -7.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.9, y = -27.8, z = 19.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 21.6, y = -20.0, z = 22.8 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.5, y = -16.6, z = 3.9 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.8, y = -12.4, z = -15.6 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 40.3, y = -8.2, z = -21.2 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.4, y = -3.1, z = -15.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.4, y = -0.3, z = 9.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.1, z = 42.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.2, z = 81.6 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.3, y = -0.4, z = 99.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.2, y = -0.3, z = 130.1 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.7, y = -0.2, z = 154.6 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.2, y = -6.0, z = 179.9 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 50.7, y = -8.7, z = 189.7 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 47.6, y = -8.2, z = 192.0 }, stop = { x = 46.9, y = -2.0, z = 195.4 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 47.9, y = -0.0, z = 199.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 50.9, y = -0.2, z = 214.5 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 82.7, y = -0.1, z = 218.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.6, y = -0.3, z = 229.0 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.4, y = -0.3, z = 255.8 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 80.1, y = -0.1, z = 260.7 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 57.7, y = -0.5, z = 264.9 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.3, y = -0.5, z = 300.9 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 32.7, y = -2.0, z = 301.6 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.4, y = -6.1, z = 297.5 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 8.3, y = -9.0, z = 290.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 8.3, y = -9.0, z = 290.4 }, stop = { x = 4.3, y = -1.9, z = 286.9 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 0.1, y = -0.2, z = 283.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -14.5, y = -0.5, z = 267.2 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -29.8, y = -0.4, z = 259.0 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -49.5, y = -2.6, z = 260.7 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -61.4, y = -6.3, z = 256.9 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -70.8, y = -8.9, z = 249.7 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = -70.8, y = -8.9, z = 249.7 }, stop = { x = -78.7, y = -0.2, z = 242.9 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -76.9, y = -0.2, z = 240.8 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -66.3, y = -0.0, z = 239.8 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -67.5, y = -0.6, z = 225.5 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -58.7, y = -0.2, z = 203.9 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.6, y = -3.0, z = 185.1 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -71.6, y = -6.6, z = 180.8 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -97.4, y = -11.5, z = 179.6 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -100.0, y = -15.5, z = 163.1 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -98.7, y = -12.8, z = 145.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = -98.4, y = -12.9, z = 142.5 }, stop = { x = -98.4, y = -10.5, z = 140.5 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -97.0, y = -10.4, z = 138.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -60.9, y = -8.5, z = 140.4 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.4, y = -8.2, z = 115.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -65.6, y = -8.3, z = 94.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "H-8", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "G-10", offsetX = 16, offsetY = 16, label = "1" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 2,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" },
                trigger_on_keyitem_obtain = {2137},
            },
            {
                text = "Step 3: Get the second Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-i10-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -80.1, y = -8.2, z = 82.6 }, size = 3, direction = "ne", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -67.6, y = -8.4, z = 93.7 }, size = 3, direction = "ne", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.3, y = -8.1, z = 120.7 }, size = 3, direction = "up", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -59.9, y = -8.4, z = 143.0 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = -18.8, y = -8.4, z = 139.9 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 6.5, y = -6.8, z = 139.0 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 15.8, y = -4.6, z = 138.6 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'line', start = { x = 17.3, y = -4.7, z = 138.7 }, stop = { x = 18.8, y = -2.5, z = 138.4 }, floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 19.3, y = -2.3, z = 136.6 }, size = 3, direction = "se", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 18.1, y = -0.1, z = 117.3 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 29.5, y = -0.4, z = 98.7 }, size = 3, direction = "right", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.0, y = -0.4, z = 98.2 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.1, y = 0.0, z = 61.7 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 59.9, y = -0.4, z = 20.2 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 61.5, y = -1.2, z = -7.0 }, size = 3, direction = "down", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 58.1, y = -3.6, z = -17.4 }, size = 3, direction = "sw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 44.2, y = -7.3, z = -20.0 }, size = 3, direction = "left", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 23.5, y = -11.3, z = -19.4 }, size = 3, direction = "nw", floor_id = 16, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 18.9, y = -16.2, z = 1.3 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 28.8, y = -21.7, z = 20.2 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.1, y = -31.6, z = 2.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.7, y = -37.3, z = -24.9 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 60.1, y = -32.2, z = -57.8 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 92.9, y = -32.3, z = -67.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.9, y = -32.6, z = -83.1 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 108.2, y = -32.6, z = -93.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 114.1, y = -32.5, z = -100.0 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 101.5, y = -32.3, z = -124.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 99.1, y = -32.4, z = -148.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.3, y = -32.2, z = -161.7 }, size = 3, direction = "se", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 108.5, y = -35.7, z = -169.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 104.2, y = -38.2, z = -174.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "I-10", offsetX = 16, offsetY = 16,label = "2" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 3,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-11", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
                trigger_on_keyitem_obtain = {2138},
            },
             {
                text = "Step 4: Get the final Exoray Mold Crumb in Crawlers' Nest.\n \n" ..
                       "- Follow the arrows to the ??? (marked KI on the map).\n",
                onmob_target = "crawlers-nest-i6-???",
                zone_max_distance = 20,
                visual_zones = {
                        -- Route to the 3 KEYITEM ??? for the mold
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 97.9, y = -38.5, z = -181.5 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 113.2, y = -25.2, z = -220.6 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 141.0, y = -19.0, z = -214.1 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 140.4, y = -15.4, z = -195.9 }, size = 3, direction = "up", floor_id = 17, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 133.7, y = -10.9, z = -179.5 }, size = 3, direction = "left", floor_id = 17, colour = "yellow" },
                        { zone_name = "Crawlers' Nest", type = 'arrow', center = { x = 102.1, y = -4.1, z = -176.3 }, size = 3, direction = "down", floor_id = 17, colour = "yellow" },

                },
                images = {
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 15,
                        highlights = {
                            { position = "J-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 16,
                        highlights = {
                            { position = "H-10", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 4,
                        zone_name = "Crawlers' Nest",
                        floor_id = 17,
                        highlights = {
                            { position = "I-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                },
                trigger_on_item_obtain = { "Exoray Mold" }, -- VERIFY display name (LSB: CLUMP_OF_EXORAY_MOLD)
                trigger_on_keyitem_obtain = {2139},
            },
            {
                text = "Step 5: Get the Bomb Coal in Garlaige Citadel (Key Item ??? x3).\n \n" ..
                       "- All three are on Map 2. Use a 'Pouch of Weighted Stones' to pass the first Banishing Gate.\n" ..
                       "- The ??? are at (I-8), (H-7) and (G-6) in the first room on the right from the east.\n" ..
                       "- CRITICAL: click ALL THREE ??? to receive the Bomb Coal.\n" ..
                       "- WARNING: Use Sneak + Invisible to avoid aggro throughout Map 2.\n \n",
                onmob_target = {"garlaige-citadel-i8-bcf-1-???",
                                "garlaige-citadel-h7-bcf-2-???"},
                zone_max_distance = 25,
                visual_zones = {
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -380.1, y = -7.8, z = 375.0 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'square', center = { x = -383.0, y = -6.0, z = 363.5 }, size = 1, floor_id = 1, colour = "green" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -366.3, y = -6.0, z = 340.3 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -340.4, y = -3.3, z = 337.6 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -339.8, y = 0.0, z = 300.8 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -328.0, y = 0.0, z = 300.1 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -309.7, y = 0.0, z = 300.0 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -297.8, y = 0.0, z = 292.0 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -283.8, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -259.4, y = 0.0, z = 300.4 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -248.2, y = 0.0, z = 300.2 }, size = 3, direction = "ne", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -234.8, y = 0.0, z = 299.6 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.1, y = 0.0, z = 298.8 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -219.8, y = 0.0, z = 288.4 }, size = 3, direction = "sw", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -222.0, y = 0.0, z = 279.1 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -227.7, y = 0.0, z = 257.4 }, size = 3, direction = "se", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -220.4, y = 0.0, z = 242.9 }, size = 3, direction = "down", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -221.6, y = 0.0, z = 220.1 }, size = 3, direction = "right", floor_id = 1, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -201.0, y = -3.0, z = 220.0 }, width = 6.25, height = 6.00, floor_id = 1, colour = "cyan", vertical_axis = 'z' },

                    -- Step on squares to open door if no KI weighted stones
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -213.0, y = -0.3, z = 226.3 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -212.8, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },
                    { zone_name = "Garlaige Citadel", type = 'rect', center = { x = -207.2, y = -0.3, z = 213.8 }, width = 1.75, height = 2.75, floor_id = 1, colour = "magenta" },

                    -- To 1st Bomb KI
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -197.0, y = 0.0, z = 219.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -179.4, y = 0.0, z = 218.9 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -177.6, y = 0.0, z = 179.2 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -141.2, y = 0.0, z = 179.1 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -114.8, y = 0.0, z = 179.2 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -100.1, y = 0.0, z = 180.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.7, y = 0.0, z = 201.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -98.3, y = 0.0, z = 219.9 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -70.3, y = 0.0, z = 219.5 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.3, y = 0.0, z = 200.5 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -60.2, y = 6.0, z = 164.2 }, size = 3, direction = "down", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -54.7, y = 6.4, z = 145.0 }, size = 3, direction = "right", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -40.0, y = 6.1, z = 143.2 }, size = 3, direction = "se", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -29.5, y = 7.6, z = 138.5 }, size = 3, direction = "ne", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -19.6, y = 6.0, z = 155.0 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -15.6, y = 6.1, z = 182.7 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },

                    -- To 2nd/3rd
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -14.3, y = 6.5, z = 201.4 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -18.4, y = 9.0, z = 219.4 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -38.6, y = 7.0, z = 239.6 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -55.8, y = 6.1, z = 258.8 }, size = 3, direction = "nw", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -58.6, y = 5.9, z = 274.1 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.4, y = 5.9, z = 312.3 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -59.9, y = 2.8, z = 340.8 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -99.8, y = 0.0, z = 339.9 }, size = 3, direction = "left", floor_id = 2, colour = "yellow" },
                    { zone_name = "Garlaige Citadel", type = 'arrow', center = { x = -129.1, y = 0.0, z = 339.6 }, size = 3, direction = "up", floor_id = 2, colour = "yellow" },
                  },
                  images = {
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 1,
                        highlights = {
                            { position = "I-9", offsetX = 16, offsetY = 16 },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 2,
                        highlights = {
                            { position = "I-8", offsetX = 16, offsetY = 16, label = "1" },
                            { position = "H-7", offsetX = 16, offsetY = 16, label = "2" },
                            { position = "G-6", offsetX = 16, offsetY = 16, label = "3" },
                        },
                    },
                    {
                        width = 512,
                        height = 512,
                        state = 5,
                        zone_name = "Garlaige Citadel",
                        floor_id = 16,
                        highlights = {
                            { position = "G-6", offsetX = 16, offsetY = 16 },
                        },
                    },
                },
                onmob_enemy = "Explosure",
                onmob_enemy_size = 2,
                trigger_on_item_obtain = { "Bomb Coal" }, -- VERIFY display name (LSB: CHUNK_OF_BOMB_COAL) - 3 crumb KIs combine into 1 Bomb Coal, so complete on the finished item
            },
            {
                text = "Step 6: Get the Ancient Papyrus in The Eldieme Necropolis (Key Item ??? x3).\n \n" ..
                       "- All three are on Map 1, in the small rooms containing Braziers, at [1](H-9), [3](F-9) and [2](F-7).\n" ..
                       "- A 'Magicked Astrolabe' opens any door on click. Without it, the gate switch is at (H-8) - watch for false floors that look like gravel.\n \n" ..
                       "- CRITICAL: click ALL THREE ??? to receive the Ancient Papyrus.\n" ..
                       "- Notes: The order is 1 -> 2 -> 3 from the map, but we will pick the Ancient Papyrus Shreds in order 1 -> 3 -> 2(incases there's confusion as its a nicer route!\n \n",
                route_to = "The Eldieme Necropolis",
                destination_highlight = {
                    { position = "H-9", offsetX = 16, offsetY = 16, label = "1" },
                    { position = "F-9", offsetX = 16, offsetY = 16, label = "3" },
                    { position = "F-7", offsetX = 16, offsetY = 16, label = "2" },
                },
                onmob_target = {"the-eldieme-necropolis-h9-aps-1-???",
                                "the-eldieme-necropolis-f9-aps-3-???",
                                "the-eldieme-necropolis-f7-aps-2-???"},
                zone_max_distance = 30,
                visual_zones = {
                        --Route to J-10 The Eldieme Necrolpolios
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 424.2, y = 8.0, z = -142.7 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 388.5, y = 8.4, z = -176.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 353.5, y = 8.4, z = -207.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 322.7, y = 0.0, z = -238.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 289.5, y = 2.6, z = -268.9 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 246.2, y = 7.7, z = -299.6 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 218.3, y = 8.9, z = -323.3 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.3, y = 8.8, z = -342.9 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 204.9, y = 8.4, z = -372.8 }, size = 4, direction = "down", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 198.3, y = 8.0, z = -402.1 }, size = 4, direction = "sw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 177.9, y = 8.1, z = -417.7 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },
                        { zone_name = "Batallia Downs", type = 'arrow', center = { x = 138.3, y = 11.6, z = -378.6 }, size = 4, direction = "nw", floor_id = 0, colour = "yellow" },

                        -- 1st keyitem.
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.5, y = -56.0, z = -115.6 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'square', center = { x = 418.0, y = -52.0, z = -99.5 }, size = 1, floor_id = 15, colour = "green" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.3, y = -50.8, z = -92.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.7, y = -48.0, z = -57.8 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 420.8, y = -42.3, z = -10.7 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 401.6, y = -40.0, z = 19.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 380.2, y = -40.0, z = 20.3 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 378.9, y = -36.0, z = -19.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 328.5, y = -32.0, z = -59.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 316.7, y = -32.0, z = -60.3 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 308.3, y = -32.0, z = -56.9 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 300.9, y = -32.0, z = -49.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 284.1, y = -32.2, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 273.3, y = -32.0, z = -59.9 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        --Shivas Gate
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 271.0, y = -34.3, z = -60.0 }, width = 4.25, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 266.1, y = -32.0, z = -58.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 263.6, y = -32.0, z = -66.6 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --3rd Keyitem
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 250.4, y = -32.0, z = -60.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 230.3, y = -32.0, z = -59.1 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 220.6, y = -32.0, z = -47.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 218.6, y = -32.0, z = -28.2 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 205.9, y = -32.0, z = -20.0 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 185.9, y = -32.0, z = -20.2 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 160.0, y = -32.0, z = -20.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 147.6, y = -32.0, z = -21.5 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 140.1, y = -32.0, z = -32.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 138.2, y = -32.0, z = -51.7 }, size = 3, direction = "sw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 123.1, y = -32.0, z = -59.7 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 115.0, y = -32.0, z = -59.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --Shivas Gate 2
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 111.0, y = -34.5, z = -60.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 111.0, y = -34.5, z = -60.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 106.3, y = -32.0, z = -58.6 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 103.1, y = -32.0, z = -66.1 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },

                        --2nd keyitem
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 89.5, y = -32.0, z = -59.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 69.0, y = -32.0, z = -58.8 }, size = 3, direction = "nw", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.0, y = -32.0, z = -42.4 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.2, y = -32.0, z = -8.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 59.9, y = -28.0, z = 1.8 }, size = 3, direction = "left", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.2, y = -28.0, z = 2.1 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.6, y = -27.5, z = 21.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 54.9, y = -27.8, z = 37.3 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.4, y = -32.0, z = 45.5 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 59.8, y = -32.0, z = 67.2 }, size = 3, direction = "up", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 60.8, y = -32.0, z = 91.1 }, size = 3, direction = "ne", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 72.2, y = -32.0, z = 99.5 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 85.1, y = -32.0, z = 100.0 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'rect', center = { x = 89.0, y = -34.5, z = 100.0 }, width = 4.00, height = 4.75, floor_id = 15, colour = "cyan", vertical_axis = 'z' },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 93.1, y = -32.0, z = 101.4 }, size = 3, direction = "down", floor_id = 15, colour = "yellow" },
                        { zone_name = "The Eldieme Necropolis", type = 'arrow', center = { x = 96.3, y = -32.0, z = 93.3 }, size = 3, direction = "right", floor_id = 15, colour = "yellow" },

                },
                trigger_on_item_obtain = { "Ancient Papyrus" }, -- VERIFY display name (LSB: PIECE_OF_ANCIENT_PAPYRUS)
            },
            {
                text = "Step 7: Return to Maat in Ru'Lude Gardens (H-5) and trade him all three items together (Exoray Mold, Bomb Coal, Ancient Papyrus) to finish.\n \n",
                route_to = "Ru'Lude Gardens",
                onmob_target = "Maat",
                destination_highlight = { position = "H-5", offsetX = 16, offsetY = 16 },
                items_needed = { "Exoray Mold", "Bomb Coal", "Ancient Papyrus" },
                --require_all_items = true,
                trigger_on_event_id = { 81 },
            },
        },
        reward = {
            text = "Title: Horizon Breaker.\n \n" ..
                   "- Your level cap is raised to 55.\n \n",
        },
    },

    ["Genkai 2: Cap 55 -> 60 (TODO name)"] = {
        -- Genkai 1 is a choice_group (Farming or Key Item). Prereqs check exact names,
        -- not the group, so use an OR-group so EITHER route satisfies it:
        -- prerequisites = {
        --     { any = {
        --         {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 1: In Defiant Challenge - Farming Method (Cap 50 -> 55)"},
        --         {category = "Limit Breaks", subfile = "Genkai", name = "Genkai 1: In Defiant Challenge - Key Item Method (Cap 50 -> 55)"},
        --     } },
        -- },
        steps = {
            { text = "TODO: author. Shared across all jobs." },
        },
    },

    ["Genkai 3: Cap 60 -> 65 (TODO name)"] = {
        steps = {
            { text = "TODO: author. Shared across all jobs." },
        },
    },

    ["Genkai 4: Cap 65 -> 70 (TODO name)"] = {
        steps = {
            { text = "TODO: author. Shared across all jobs." },
        },
    },

    -- Genkai 5 = Maat fight (cap 70 -> 75). PER JOB - split into one entry per job
    -- (e.g. "Genkai 5: Maat (Warrior)", "... (Monk)", ...). Placeholder for now.
    ["Genkai 5: Maat / Cap 70 -> 75 (per-job - TODO split)"] = {
        steps = {
            { text = "TODO: split into one entry per job (15 original jobs first). No auto job detection." },
        },
    },
}
