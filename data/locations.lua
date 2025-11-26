-- File: addons/QuestHelper/data/locations.lua
--
-- This file stores all reusable locations.
-- The key (e.g., "Conrad") will be used in your quest files.
--
-- visual_mode can be "beacon" or "arc".
-- If trigger_npc is "" or nil, it will always be active.
--

return {
    -- Bastok
    ["Rashid"] = {
        target_pos = { x = -8.5, y = -3.0, z = -123.6 },
        trigger_npc = "Rashid",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Cleades"] = {
        target_pos = { x = -362.0, y = -12.0, z = -169.0 },
        trigger_npc = "Cleades",
        visual_mode = "arc",
        zone = "Bastok Markets",
    },
    ["Argus"] = {
        target_pos = { x = 132.0, y = 6.5, z = -2.1 },
        trigger_npc = "Argus",
        visual_mode = "arc",
        zone = "Port Bastok",
    },
    ["Cid"] = {
        target_pos = { x = -12.6, y = -13.0, z = 2.5 },
        trigger_npc = "Cid",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["Conrad"] = {
        target_pos = { x = 132.0, y = 6.5, z = -2.1 },
        trigger_npc = "Conrad",
        visual_mode = "beacon",
        beacon_height = 15.0,
    },
    ["Naji"] = {
        target_pos = { x = 67.0, y = -16.0, z = -4.60 },
        trigger_npc = "Naji",
        visual_mode = "arc",
    },
    ["Malduc"] = {
        target_pos = { x = 66.0, y = -30.0, z = 4.50 },
        trigger_npc = "Malduc",
        visual_mode = "beacon",
    },
    ["Presidents_Office"] = {
        target_pos = { x = 93.0, y = -36.0, z = -0.20 },
        trigger_npc = "Iron Eater",
        visual_mode = "beacon",
    },
    ["Kaela"] = {
        target_pos = { x = 40.5, y = -30.0, z = 16.1 },
        trigger_npc = "Kaela",
        visual_mode = "arc",
    },
    ["Phara"] = {
        target_pos = { x = 75.0, y = -16.0, z = -82.0 },
        trigger_npc = "Phara",
        visual_mode = "beacon",
    },
    ["Alois"] = {
        target_pos = { x = 97.7, y = -22.0, z = 14.6 },
        trigger_npc = "Alois",
        visual_mode = "arc",
        zone = "Metalworks",
    },
     ["Ayame"] = {
        target_pos = { x = 134, y = -20.5, z = 33.3 },
        trigger_npc = "Ayame",
        visual_mode = "arc",
        zone = "Metalworks",
    },
    ["ZoneExit"] = {
        target_pos = { x = 10.0, y = 0.0, z = 10.0 },
        trigger_npc = "", -- Always active
        visual_mode = "beacon",
        beacon_height = 5.0,
        beacon_base_y_offset = 0.5,
    },
    --Zeruhn Mines
    ["Makarim"] = {
        target_pos = { x = -61, y = 7 ,z = -333.3 },
        trigger_npc = "Makarim",
        visual_mode = "arc",
        zone = "Zeruhn Mines",
    },
    --Dangruf Wadi
    ["Geyser1"] = {
        target_pos = { x = -133, y= 3, z=133.3},
        visual_mode = "arc",
        zone = "Dangruf Wadi"
    }
}