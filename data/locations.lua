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
    -- Bastok Mines
    ["Rashid"] = {
        target_pos = { x = -8.5, y = -3.0, z = -123.6 },
        trigger_npc = "Rashid",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    -- Bastok Markets
    ["Cleades"] = {
        target_pos = { x = -362.0, y = -12.0, z = -169.0 },
        trigger_npc = "Cleades",
        visual_mode = "arc",
        zone = "Bastok Markets",
    },
    -- Port Bastok
    ["Argus"] = {
        target_pos = { x = 132.0, y = 6.5, z = -2.1 },
        trigger_npc = "Argus",
        visual_mode = "arc",
        zone = "Port Bastok",
    },
    -- Metalworks
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
    ["Iron Eater"] = {
        target_pos = { x = 92.9, y = -22.0, z = 1.8 },
        trigger_npc = "Iron Eater",
        visual_mode = "arc",
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
    ["Lucius"] = {
        target_pos = { x = 60, y = -18.2, z = -42.3 },
        trigger_npc = "Lucius",
        visual_mode = "arc",
        zone = "Metalworks",
    },
     ["Ayame"] = {
        target_pos = { x = 134, y = -20.5, z = 33.3 },
        trigger_npc = "Ayame",
        visual_mode = "arc",
        zone = "Metalworks",
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
    },
    --Gusgen Mines
    ["Blind Moby"] = {
        target_pos = { x = 210.1, y= -59.2, z=-101.8},
        visual_mode = "arc",
        zone = "Gusgen Mines"
    },
    -- Beaudeaux
    ["The Mute1"] = {
        target_pos = { x = -100, y= 21.9, z=102.9},
        trigger_npc = "The Mute",
        visual_mode = "arc",
        zone = "Beadeaux"
    },
    ["Ramp 1"] = {
        target_pos = { x = -259.9, y = 1, z = -137},
        visual_mode = "arc",
        zone = "Beadeaux"
    },
    --Windurst
    --Port Windurst
    ["Melek"] = {
        target_pos = { x = -78, y= -7, z=156},
        trigger_npc = "Melek",
        visual_mode = "arc",
        zone = "Port Windurst"
    },
    ["Gold Skull"] = {
        target_pos = { x = -76.5, y= -7.5, z=159.3},
        trigger_npc = "Gold Skull",
        visual_mode = "arc",
        zone = "Port Windurst"
    },

    --Heavens Tower
    ["Kupipi"] = {
        target_pos = { x = 2, y= -1, z=32.1},
        trigger_npc = "Kupipi",
        visual_mode = "arc",
        zone = "Heavens Tower"
    },
    -- Giddeus
    ["Uu Zhoumo"] = {
        target_pos = { x = -180, y= 15, z=157.4},
        trigger_npc = "Uu Zhoumo",
        visual_mode = "arc",
        zone = "Giddeus"
    },

    --San d'Oria
    --Northern San d'Oria
    ["Baraka"] = {
        target_pos = { x = 38.65, y= -3.5, z=-5.75},
        trigger_npc = "Baraka",
        visual_mode = "arc",
        zone = "Northern San d'Oria"
    },
    ["Helaku"] = {
        target_pos = { x = 51.8, y= -3.5, z=-15.6},
        trigger_npc = "Helaku",
        visual_mode = "arc",
        zone = "Northern San d'Oria"
    },
    -- Chateau d'Oraguille
    ["Halver"] = {
        target_pos = { x = 2.4, y= -2, z=1.9},
        trigger_npc = "Halver",
        visual_mode = "arc",
        zone = "Chateau d'Oraguille"
    },
    -- Jueno
    -- Lower Jeuno
    ["Aldo"] = {
        target_pos = { x = 21, y= 1.9, z=-61.7},
        trigger_npc = "Aldo",
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Muckvix"] = {
        target_pos = { x = -26.8, y= 3.5, z=-137.3},
        trigger_npc = "Muckvix",
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Sattal-Mansal"] = {
        target_pos = { x = 41.3, y= 3.1, z=-54},
        trigger_npc = "Sattal-Mansal",
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Jeuno Bazaar"] = {
        target_pos = { x = -1.3, y= 0, z=-64.2},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Mhuufya's Shop"] = {
        target_pos = { x = -9.5, y= 0, z=-78.3},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    ["Door: Junk Shop"] = {
        target_pos = { x = -10.5, y= 0, z=-73.4},
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
    -- Upper Jeuno
    ["Paya-Sabya"] = {
        target_pos = { x = 11.85, y= 1.5, z=70.9},
        trigger_npc = "Paya-Sabya",
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Baudin"] = {
        target_pos = { x = -76.4, y= -2.2, z=80},
        trigger_npc = "Baudin",
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Door: Jeuno Auction House"] = {
        target_pos = { x = 5.1, y= 0, z=45.3},
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    ["Door: Paya-Sabya's Shop"] = {
        target_pos = { x = 14.3, y= 0, z=75.1},
        visual_mode = "arc",
        zone = "Upper Jeuno"
    },
    -- Ru'Lude Gardens
    ["Goggehn"] = {
        target_pos = { x = 3, y= 6.7, z=-79.4},
        trigger_npc = "Goggehn",
        visual_mode = "arc",
        zone = "Ru'Lude Gardens"
    },
    ["Door:Bastokan Embassy"] = {
        target_pos = { x = 18.6, y= 7.3, z=-75.4},
        visual_mode = "arc",
        zone = "Ru'Lude Gardens"
    },
    ["Door: Audience Chamber"] = {
        target_pos = { x = 0.1, y= -7, z=70.3},
        visual_mode = "arc",
        zone = "Ru'Lude Gardens"
    },
    -- Qufum Island
    --Lower Delkfutts Tower
    ["Cermet Door"] = {
        target_pos = { x = 601, y= 13.7, z=-19.7},
        visual_mode = "arc",
        zone = "Lower Delkfutt's Tower"
    },
    -- Upper Delkfutts Tower
    ["Elevator"] = {
        target_pos = { x = -300, y= -143.6, z=19.9},
        visual_mode = "arc",
        zone = "Upper Delkfutt's Tower"
    },
}