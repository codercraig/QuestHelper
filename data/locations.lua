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
    ["Medicine Eagle"] = {
        target_pos = { x = -39, y = -2, z = 40.8 },
        trigger_npc = "Medicine Eagle",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Tall Mountain"] = {
        target_pos = { x = 71.8, y = 5, z = -11.6 },
        trigger_npc = "Tall Mountain",
        visual_mode = "arc",
        zone = "Bastok Mines",
    },
    ["Gumbah"] = {
        target_pos = { x = 53.5, y = -1.4, z = -37.1 },
        trigger_npc = "Gumbah",
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
        target_pos = { x = 132.1, y = 6.8, z = -2.2 },
        trigger_npc = "Argus",
        visual_mode = "arc",
        zone = "Port Bastok",
    },
    ["Hilda"] = {
        target_pos = { x = -161.8, y = -9, z = 10.3 },
        trigger_npc = "Hilda",
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
    ["Karst"] = {
        target_pos = { x = 107, y = -21.8, z = 0.18 },
        trigger_npc = "Karst",
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
    ["Drake Fang"] = {
        target_pos = { x = -77.2, y = -2 ,z = 59.1 },
        trigger_npc = "Drake Fang",
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
    --Qulun Dome
    ["Qulun Door 1"] = {
        target_pos = { x = 59.9, y= 22, z=-6.7},
        visual_mode = "arc",
        zone = "Qulun Dome"
    },
    ["Magicite-Qulun"] = {
        target_pos = { x = 9.5, y= 23, z=-84},
        visual_mode = "arc",
        zone = "Qulun Dome"
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
    -- Davoi
    ["Wall of Dark Arts"] = {
        target_pos = { x = -23.2, y= -0.6, z=-69.1},
        visual_mode = "arc",
        zone = "Davoi"
    },
    -- Monastic Cavern
    ["Magicite-Monastic"] = {
        target_pos = { x = -160.8, y= -9.5, z=7.8},
        visual_mode = "arc",
        zone = "Monastic Cavern"
    },
    -- Altar Room
    ["Magicite-Altar"] = {
        target_pos = { x = -347, y= 22.2, z=46.3},
        visual_mode = "arc",
        zone = "Altar Room"
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
    -- QuiBia Arena
    ["Qubia-BCNM"] = {
        target_pos = { x = -214, y= -24.6, z=-20.1},
        visual_mode = "arc",
        zone = "Qu'Bia Arena"
    },
    -- Western Altepa Desert
    ["6-1-???"] = {
        target_pos = { x = -328.4, y = 0.1, z = -112.9},
        visual_mode = "arc",

        zone = "Western Altepa Desert"
    },
    -- Eastern Altepa Desert
    ["Lokpix"] = {
        target_pos = { x = -55.3, y = 2.9, z = 223.9},
        visual_mode = "arc",
        trigger_npc = "Lokpix",
        zone = "Eastern Altepa Desert"
    },
    -- Norg
    ["Gilgamesh"] = {
        target_pos = { x = 122.5, y = -9.8, z = -12.1},
        visual_mode = "arc",
        trigger_npc = "Gilgamesh",
        zone = "Norg"
    },
    -- Ifrit's Caldroun
    ["ifrit-6-2-???"] = {
        target_pos = { x = 172.2, y = -0.5, z = -26.9},
        visual_mode = "arc",
        zone = "Ifrit's Caldroun"
    },
    -- Quicksand Caves
    ["quicksand-8-1-???"] = {
        target_pos = { x = -469.4, y = -1.4, z = 620},
        visual_mode = "arc",
        zone = "Quicksand Caves"
    },
    ["quicksand2-8-1-???"] = {
        target_pos = { x = -533.1, y = -0.9, z = -415},
        visual_mode = "arc",
        zone = "Quicksand Caves"
    },
    --Kuftal Tunnel
    ["kuftal1-8-2-???"] = {
        target_pos = { x = -29.1, y = -22.1, z = -183.8},
        visual_mode = "arc",
        zone = "Kuftal Tunnel"
    },
    ["kuftal2-8-2-???"] = {
        target_pos = { x = -27.8, y = -10.4, z = -185.8},
        visual_mode = "arc",
        zone = "Kuftal Tunnel"
    },
    --Rabao
    ["Dancing Wolf"] = {
        target_pos = { x = 7.6, y = 6.0, z = 81.3},
        visual_mode = "arc",
        zone = "Rabao"
    },
    -- Gustav Tunnel
    ["gustav1-9-1-???"] = {
        target_pos = { x = -130.7, y = 1.2, z = 252.6},
        visual_mode = "arc",
        zone = "Gustav Tunnel"
    },
    -- Temple of Uggalepih
    ["templeugg1-zm4-granitedoor"] = {
        target_pos = { x = 60.1, y = -2, z = 11.2},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook1"] = {
        target_pos = { x = 67.3, y = -2, z = 22.7},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook2"] = {
        target_pos = { x = 59, y = -2, z = 27.2},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-wornbook3"] = {
        target_pos = { x = 52.9, y = -2, z = 21.7},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    ["templeugg1-zm4-oldcasket"] = {
        target_pos = { x = 63, y = -0.8, z = 17.6},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
}