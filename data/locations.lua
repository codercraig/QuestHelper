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
    ["Jabbar"] = {
        target_pos = { x = -99.7, y = -3.8, z = 26.1 },
        trigger_npc = "Jabbar",
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
    -- La Theine Plateau
    ["zm4-la-theine-cermet-headstone"] = {
        target_pos = { x = -172.75, y= 38, z=-508.4},
        visual_mode = "arc",
        zone = "La Theine Plateau"
    },
    ["la-theine-plateau-shattered-telepoint"] = {
        target_pos = { x = 340.0, y = 19.1, z = -60.0 },
        visual_mode = "arc",
        zone = "La Theine Plateau",
        floor_id = 0,
        max_distance = 60
    },
    -- Tahrongi Canyon
    ["tahrongi-canyon-shattered-telepoint"] = {
        target_pos = { x = 180.0, y = 35.2, z = 260.0 },
        visual_mode = "arc",
        zone = "Tahrongi Canyon",
        floor_id = 0,
        max_distance = 35
    },
    -- Konschtat Highlands
   ["konschtat-highlands-shattered-telepoint"] = {
        target_pos = { x = 140.0, y = 19.1, z = 220.0 },
        visual_mode = "arc",
        zone = "Konschtat Highlands",
        max_distance = 60
    },
    -- Hall Of Transference
    ["hall-of-transference-dem-large-apparatus"] = {
        target_pos = { x = -236.3, y = -44.9, z = -270.0 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 2,
        max_distance = 35
    },
    ["hall-of-transference-holla-large-apparatus"] = {
        target_pos = { x = -236.3, y = -4.9, z = 290.0 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 1,
        max_distance = 35
    },
    ["hall-of-transference-mea-large-apparatus"] = {
        target_pos = { x = 270.0, y = -84.9, z = -36.3 },
        visual_mode = "arc",
        zone = "Hall of Transference",
        floor_id = 3,
        max_distance = 35
    },
    -- Tavnazian Safehold
    ["Despachiaire"] = {
        target_pos = { x = 111.2, y = -42.0, z = -85.5 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 1,
        max_distance = 35
    },
    ["Justinius"] = {
        target_pos = { x = 78.7, y = -35.5, z = 70.5 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 1,
        max_distance = 35
    },
    ["tavnazian-safehold-sewer-entrance"] = {
        target_pos = { x = 28.0, y = -13.9, z = 45.9 },
        visual_mode = "arc",
        zone = "Tavnazian Safehold",
        floor_id = 3,
        max_distance = 40
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
    -- Port Jeuno
    ["Guddal"] = {
        target_pos = { x = -17.5, y= 6, z=42.1},
        trigger_npc = "Guddal",
        visual_mode = "arc",
        zone = "Port Jeuno"
    },
    --Kazham
    ["Tielleque"] = {
        target_pos = { x = -55.3, y= -12, z=-94.8},
        trigger_npc = "Tielleque",
        visual_mode = "arc",
        zone = "Kazham"
    },
    ["Jakoh Wahcondalo"] = {
        target_pos = { x = 101.8, y= -16.5, z=-115.8},
        trigger_npc = "Jakoh Wahcondalo",
        visual_mode = "arc",
        zone = "Kazham"
    },
    -- Lower Jeuno
    ["Ghebi Damomohe"] = {
        target_pos = { x = 15.6, y= -1.7, z=-7.6},
        trigger_npc = "Ghebi Damomohe",
        visual_mode = "arc",
        zone = "Lower Jeuno"
    },
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
    ["Door: Neptune's Spire"] = {
        target_pos = { x = 38.1, y = -1.6, z = -16.6 },
        visual_mode = "arc",
        zone = "Lower Jeuno",
        max_distance = 35
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
    ["Monberaux"] = {
        target_pos = { x = -42.4, y = -2, z = -1.9 },
        visual_mode = "arc",
        zone = "Upper Jeuno",
        max_distance = 45
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
    ["Pherimociel"] = {
        target_pos = { x = -31.6, y = 0, z = 68.0 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        max_distance = 35
    },
    ["Harith"] = {
        target_pos = { x = -4.3, y = 0.3, z = 134.0 },
        visual_mode = "arc",
        zone = "Ru'Lude Gardens",
        max_distance = 35
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
    ["Norg_OakenDoor"] = {
        target_pos = { x = 101.3, y = -8.8, z = -12.1},
        visual_mode = "arc",
        zone = "Norg"
    },
    ["Gilgamesh"] = {
        target_pos = { x = 122.5, y = -9.8, z = -12.1},
        visual_mode = "arc",
        trigger_npc = "Gilgamesh",
        zone = "Norg",
        max_distance = 35,
    },
    ["Marilleune"] = {
        target_pos = { x = -11.3, y = -2.6, z = -51.3},
        visual_mode = "arc",
        trigger_npc = "Marilleune",
        zone = "Norg"
    },
    -- Ifrit's Caldroun
    ["ifrit-6-2-???"] = {
        target_pos = { x = 172.2, y = -0.5, z = -26.9},
        visual_mode = "arc",
        zone = "Ifrit's Cauldron"
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
    ["templeugg2-zm4-eastpainting"] = {
        target_pos = { x = -52.1, y = -2.2, z = -0.1},
        visual_mode = "arc",
        zone = "Temple of Uggalepih"
    },
    -- Cloister of Frost
    ["cloister-of-frost-zm5-cermet-headstone"] = {
        target_pos = { x = 567.9, y = -1.2, z = 608},
        visual_mode = "arc",
        zone = "Cloister of Frost"
    },
    -- Western Altepa Desern
    ["western-altepa-desert-zm5-cermet-headstone"] = {
        target_pos = { x = -112.4, y = 9.5, z = -220.8},
        visual_mode = "arc",
        zone = "Western Altepa Desert"
    },
    --Yuhtunga Jungle
    ["yuhtunga-jungle-zm5-cermet-headstone"] = {
        target_pos = { x = 493.8, y = 19.5, z = 303.5},
        visual_mode = "arc",
        zone = "Yuhtunga Jungle"
    },
    --Cape Teriggan
    ["cape-teriggan-zm5-cermet-headstone"] = {
        target_pos = { x = -109.2, y = -8.5, z = 453.8},
        visual_mode = "arc",
        zone = "Cape Teriggan"
    },
    --behemoth's dominion
    ["behemoth's-dominion-zm5-cermet-headstone"] = {
        target_pos = { x = -74.8, y = -5.3, z = -89.2},
        visual_mode = "arc",
        zone = "Behemoth's Dominion"
    },
    --sanctuary of zitah
    ["sanctuary-of-zitah-zm5-cermet-headstone"] = {
        target_pos = { x = 231.8, y = -1, z = 279.9},
        visual_mode = "arc",
        zone = "The Sanctuary of Zi'Tah"
    },
    --delkfutts tower
    ["delkfutts-tower-zm8-lift-???"] = {
        target_pos = { x = 260.1, y = 19.4, z = 20.2},
        visual_mode = "arc",
        zone = "Upper Delkfutt's Tower",
        floor_id = 6
    },
    --Hall of the Gods
    ["hall-of-gods-zm10-gate"] = {
        target_pos = { x = 0.1, y = -14.3 , z = 49.7},
        visual_mode = "arc",
        zone = "Hall of the Gods",
        floor_id = 1
    },
    ["hall-of-gods-zm12-shimmering"] = {
        target_pos = { x = 0.1, y = -20.7 , z = 149.1},
        visual_mode = "arc",
        zone = "Hall of the Gods",
        floor_id = 1
    },
    --Rabao
    ["maryoh-comyujah"] = {
        target_pos = { x = -0.8, y = 6.5, z = 75.2 },
        visual_mode = "arc",
        zone = "Rabao"
    },
    --Quicksand Caves
    ["zm12-ancient-vessel-qm7"] = {
        target_pos = { x = -506.8, y = 17.5, z = -420.3 },
        visual_mode = "arc",
        zone = "Quicksand Caves",
        floor_id = 7
    },
    --The Shrine of Ru'Avitau
    ["zm14-ark-angel-cs-locale"] = {
        target_pos = { x = -39.9, y = -1.3, z = -147.8 },
        visual_mode = "arc",
        zone = "The Shrine of Ru'Avitau",
        floor_id = 1
    },
    -- La'Loff Amphitheater
    ["zm14-la-loff-ark-tt-shimmering-circle"] = {
        target_pos = {x = -264.6, y = -137.3, z = 374.7 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-mr-shimmering-circle"] = {
        target_pos = {x = 14.4, y = -224.3, z = 488.1 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-hm-shimmering-circle"] = {
        target_pos = {x = -605, y = -22.7, z = 483.7 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-ev-shimmering-circle"] = {
        target_pos = { x = 235.6, y = -173.6, z = 361.3 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm14-la-loff-ark-gk-shimmering-circle"] = {
        target_pos = { x = 556.0, y = -38.2, z = 520.6 },
        visual_mode = "arc",
        zone = "La'Loff Amphitheater",
        floor_id = 0,
        max_distance = 35
    },
    ["zm16-shrine-of-ru-avitau-yellow-monolith"] = {
        target_pos = { x = 7.9, y = -2.3, z = -116.0 },
        visual_mode = "arc",
        zone = "The Shrine of Ru'Avitau",
        floor_id = 1,
        max_distance = 35
    },
    -- Phomiuna Aqueducts - CoP 2-3
    ["phomiuna-aqueducts-wooden-ladder"] = {
        target_pos = { x = -159.32, y = -2.5, z = 60.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 2,
        max_distance = 30
    },
    ["phomiuna-aqueducts-???"] = {
        target_pos = { x = -75.3, y = -24.6, z = 92.5 },
            visual_mode = "arc",
            zone = "Phomiuna Aqueducts",
            floor_id = 3,
            max_distance = 2.5
    },

    -- CoP 2-3 Oil Lamps (corridor F-8, south to north: Fire/Earth/Water/Wind/Ice/Lightning/Light/Dark)
    -- TODO: Replace target_pos with actual NPC coordinates from zone NPC data
    ["phomiuna-aqueducts-fire-oil-lamp"] = {
    target_pos = { x = -63.7, y = -26.2, z = 43.0 },
    visual_mode = "arc",
    zone = "Phomiuna Aqueducts",
    floor_id = 3,
    max_distance = 35
    },
    ["phomiuna-aqueducts-earth-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 47.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-water-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 53.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-wind-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 57.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-ice-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 63.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-thunder-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 67.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-light-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 73.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-darkness-oil-lamp"] = {
        target_pos = { x = -63.7, y = -26.2, z = 77.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
    ["phomiuna-aqueducts-ornate-gate"] = {
        target_pos = { x = -99.0, y = -25.5, z = 60.0 },
        visual_mode = "arc",
        zone = "Phomiuna Aqueducts",
        floor_id = 3,
        max_distance = 35
    },
}