-- Zone Connection Graph
-- Defines which zones connect to each other and the exit coordinates
-- Format: ["Zone Name"] = { {zone = "Connected Zone", exit = "Grid Coordinate", floor_id = 1}, ... }
--
-- Optional floor_id parameter:
--   - If specified: Only show that specific floor with those specific exits (accurate for multi-floor zones)
--   - If omitted: Show all floors with all exits (default behavior, works for most zones)
--
-- Example for multi-floor zone:
-- ["Windurst Waters"] = {
--     {zone = "Windurst Walls", exit = "L-9", floor_id = 1},
--     {zone = "West Sarutabaruta", exit = "G-4", floor_id = 1},
--     {zone = "Port Windurst", exit = "G-10", floor_id = 2},
--     {zone = "Windurst Woods", exit = "G-8", floor_id = 2},
-- },

return {
    -- Bastok Area
    ["Bastok Mines"] = {
        {zone = "Bastok Markets", exit = "F-4"},
        {zone = "South Gustaberg", exit = "H-10"},
        {zone = "Zeruhn Mines", exit = "D-7"}
    },
    ["Bastok Markets"] = {
        {zone = "Metalworks", exit = "H-6"},
        {zone = "South Gustaberg", exit = "D-11"},
        {zone = "Bastok Mines", exit = "H-13"},
        {zone = "Port Bastok", exit = "G-3"}
    },
    ["Port Bastok"] = {
        {zone = "Bastok Markets", exit = "D-11"},
        {zone = "North Gustaberg", exit = "L-6"}
    },
    ["Metalworks"] = {
        {zone = "Bastok Markets", exit = "E-8"}
    },
    ["South Gustaberg"] = {
        {zone = "Bastok Markets", exit = "J-7"},
        {zone = "Bastok Mines", exit = "L-8"},
        {zone = "Dangruf Wadi", exit = "D-9"},
        {zone = "North Gustaberg", exit = "E-6"},
        {zone = "North Gustaberg", exit = "H-5"}
    },
    ["North Gustaberg"] = {
        {zone = "Port Bastok", exit = "L-8"},
        {zone = "South Gustaberg", exit = "E-12"},
        {zone = "South Gustaberg", exit = "H-11"},
        {zone = "Palborough Mines", exit = "K-3"},
        {zone = "Konschtat Highlands", exit = "E-6"}
    },
    ["Konschtat Highlands"] = {
        {zone = "North Gustaberg", exit = "I-12"},
        {zone = "Valkurm Dunes", exit = "G-2"},
        {zone = "Gusgen Mines", exit = "L-7"},
        {zone = "Pashhow Marshlands", exit = "K-3"}
    },
    ["Valkurm Dunes"] = {
        {zone = "Konschtat Highlands", exit = "M-11"},
        {zone = "Gustav Tunnel", exit = "B-8"},
        {zone = "Selbina", exit = "G-9"},
        {zone = "La Theine Plateau", exit = "L-5"}
    },
    ["Dangruf Wadi"] = {
        {zone = "South Gustaberg", exit = "I-6"},
        {zone = "North Gustaberg", exit = "J-3"}
    },

    -- San d'Oria Area
    ["Southern San d'Oria"] = {
        {zone = "Northern San d'Oria", exit = "I-7"},
        {zone = "West Ronfaure", exit = "F-10"},
        {zone = "East Ronfaure", exit = "L-10"}
    },
    ["Northern San d'Oria"] = {
        {zone = "Southern San d'Oria", exit = "J-11"},
        {zone = "Port San d'Oria", exit = "F-3"},
        {zone = "Chateau d'Oraguille", exit = "J-6"},
        {zone = "West Ronfaure", exit = "C-8"},
        {zone = "Carpenters' Landing", exit = "F-5"}
    },
    ["Port San d'Oria"] = {
        {zone = "Northern San d'Oria", exit = "F-10"}
    },
    ["Chateau d'Oraguille"] = {
        {zone = "Northern San d'Oria", exit = "I-9"},
        {zone = "Bostaunieux Oubliette", exit = "I-8"}
    },
    ["West Ronfaure"] = {
        {zone = "Southern San d'Oria", exit = "I-6"},
        {zone = "Northern San d'Oria", exit = "I-5"},
        {zone = "East Ronfaure", exit = "J-7"},
        {zone = "East Ronfaure", exit = "J-9"},
        {zone = "Ghelsba Outpost", exit = "E-4"},
        {zone = "La Theine Plateau", exit = "F-12"}
    },
    ["East Ronfaure"] = {
        {zone = "Southern San d'Oria", exit = "G-6"},
        {zone = "West Ronfaure", exit = "F-7"},
        {zone = "West Ronfaure", exit = "F-9"},
        {zone = "King Ranperre's Tomb", exit = "H-12"},
        {zone = "Ranguemont Pass", exit = "K-4"}
    },
    ["La Theine Plateau"] = {
        {zone = "West Ronfaure", exit = "E-3"},
        {zone = "Valkurm Dunes", exit = "I-13"},
        {zone = "Jugner Forest", exit = "M-8"},
        {zone = "Ordelle's Caves", exit = "H-7"}
    },

    -- Windurst Area
    ["Windurst Waters North"] = {
        {zone = "Windurst Walls", exit = "L-9"},
        {zone = "West Sarutabaruta", exit = "G-4"},
        {zone = "Windurst Waters South", exit = "G-12"}
    },
    ["Windurst Waters South"] = {
        {zone = "Port Windurst", exit = "G-10"},
        {zone = "Windurst Waters North", exit = "H-5"}
    },
    ["Windurst Walls"] = {
        {zone = "Windurst Waters North", exit = "B-6"},
        {zone = "Windurst Woods", exit = "J-14"},
        {zone = "Heavens Tower", exit = "H-7"}
    },
    ["Port Windurst"] = {
        {zone = "Windurst Waters South", exit = "E-3"},
        {zone = "Windurst Woods", exit = "N-5"},
        {zone = "West Sarutabaruta", exit = "A-4"}
    },
    ["Windurst Woods"] = {
        {zone = "Windurst Walls", exit = "F-5"},
        {zone = "Port Windurst", exit = "E-11"},
        {zone = "East Sarutabaruta", exit = "K-10"}
    },
    ["Heavens Tower"] = {
        {zone = "Windurst Walls", exit = "H-8"}
    },
    ["West Sarutabaruta"] = {
        {zone = "Windurst Waters North", exit = "J-8"},
        {zone = "Port Windurst", exit = "I-10"},
        {zone = "East Sarutabaruta", exit = "K-4"},
        {zone = "East Sarutabaruta", exit = "L-8"},
        {zone = "Giddeus", exit = "F-7"}
    },
    ["East Sarutabaruta"] = {
        {zone = "Windurst Woods", exit = "G-11"},
        {zone = "West Sarutabaruta", exit = "E-4"},
        {zone = "Tahrongi Canyon", exit = "J-4"}
    },
    ["Tahrongi Canyon"] = {
        {zone = "East Sarutabaruta", exit = "H-13"},
        {zone = "Buburimu Peninsula", exit = "K-8"},
        {zone = "Meriphataud Mountains", exit = "G-3"},
        {zone = "Maze of Shakhrami", exit = "K-5"}
    },
    ["Buburimu Peninsula"] = {
        {zone = "Tahrongi Canyon", exit = "D-7"},
        {zone = "Mhaura", exit = "I-9"},
        {zone = "Maze of Shakhrami", exit = "F-6"},
        {zone = "Labyrinth of Onzozo", exit = "K-6"}
    },
    ["Mhaura"] = {
        {zone = "Buburimu Peninsula", exit = "H-5"},
        {zone = "Selbina", exit = "H-10"}
    },
    ["Selbina"] = {
        {zone = "Valkurm Dunes", exit = "H-6"},
        {zone = "Mhaura", exit = "H-10"}
    },
    ["Meriphataud Mountains"] = {
        {zone = "Tahrongi Canyon", exit = "F-12"},
        {zone = "Sauromugue Champaign", exit = "D-4"},
        {zone = "Castle Oztroja", exit = "L-8"},
        {zone = "The Sanctuary of Zitah", exit = "L-4"}
    },
    ["Castle Oztroja"] = {
        {zone = "Meriphataud Mountains", exit = "K-8"}
    },
    ["The Sanctuary of Zitah"] = {
        {zone = "Meriphataud Mountains", exit = "E-12"}
    },

    -- Jeuno Area
    ["Ru'Lude Gardens"] = {
        {zone = "Upper Jeuno", exit = "H-11"},
    },
    ["Upper Jeuno"] = {
        {zone = "Ru'Lude Gardens", exit = "J-10"},
        {zone = "Lower Jeuno", exit = "H-11"},
        {zone = "Batallia Downs", exit = "F-4"}
    },
    ["Lower Jeuno"] = {
        {zone = "Upper Jeuno", exit = "I-5"},
        {zone = "Port Jeuno", exit = "K-6"},
        {zone = "Rolanberry Fields", exit = "F-12"}
    },
    ["Port Jeuno"] = {
        {zone = "Lower Jeuno", exit = "E-10"},
        {zone = "Qufim Island", exit = "E-5"},
        {zone = "Sauromugue Champaign", exit = "K-8"}
    },
    ["Qufim Island"] = {
        {zone = "Port Jeuno", exit = "F-6"},
        {zone = "Lower Delkfutt's Tower", exit = "F-6"},
        {zone = "Behemoth's Dominion", exit = "D-5"},
        {zone = "Misareaux Coast", exit = "E-6"}
    },
    ["Rolanberry Fields"] = {
        {zone = "Lower Jeuno", exit = "K-4"},
        {zone = "Pashhow Marshlands", exit = "H-14"},
        {zone = "Crawlers' Nest", exit = "I-7"},
        {zone = "Sauromugue Champaign", exit = "K-5"}
    },
    ["Pashhow Marshlands"] = {
        {zone = "Rolanberry Fields", exit = "K-4"},
        {zone = "Konschtat Highlands", exit = "E-12"},
        {zone = "Beadeaux", exit = "K-11"}
    },
    ["Sauromugue Champaign"] = {
        {zone = "Meriphataud Mountains", exit = "K-11"},
        {zone = "Rolanberry Fields", exit = "K-6"},
        {zone = "Batallia Downs", exit = "K-12"}
    },
    ["Batallia Downs"] = {
        {zone = "Upper Jeuno", exit = "L-9"},
        {zone = "Rolanberry Fields", exit = "K-9"},
        {zone = "Jugner Forest", exit = "F-9"}
    },
    ["Jugner Forest"] = {
        {zone = "La Theine Plateau", exit = "E-4"},
        {zone = "Batallia Downs", exit = "I-11"}
    },

    -- Dungeons/Other
    ["Zeruhn Mines"] = {
        {zone = "Bastok Mines", exit = "I-7"}
    },
    ["Palborough Mines"] = {
        {zone = "North Gustaberg", exit = "K-6"}
    },
    ["Gusgen Mines"] = {
        {zone = "Konschtat Highlands", exit = "D-6"}
    },
    ["Beadeaux"] = {
        {zone = "Pashhow Marshlands", exit = "F-7"}
    },
    ["Ghelsba Outpost"] = {
        {zone = "West Ronfaure", exit = "J-8"}
    },
    ["Giddeus"] = {
        {zone = "West Sarutabaruta", exit = "H-3"},
        {zone = "Balga's Dais", exit = "F-12"}
    },
    ["Balga's Dais"] = {
        --{zone = "Giddeus", exit = "J-8"}
    },
    ["Ordelle's Caves"] = {
        {zone = "La Theine Plateau", exit = "F-5"}
    },
    ["Crawlers' Nest"] = {
        {zone = "Rolanberry Fields", exit = "H-7"}
    },
    ["Carpenters' Landing"] = {
        {zone = "Northern San d'Oria", exit = "H-8"}
    },
    ["Bostaunieux Oubliette"] = {
        {zone = "Chateau d'Oraguille", exit = "I-9"}
    },
    ["King Ranperre's Tomb"] = {
        {zone = "East Ronfaure", exit = "I-9"}
    },
    ["Ranguemont Pass"] = {
        {zone = "East Ronfaure", exit = "E-6"}
    },
}
