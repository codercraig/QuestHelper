-- Zone Connection Graph
-- Defines which zones connect to each other and the exit coordinates
-- Format: ["Zone Name"] = { {zone = "Connected Zone", exit = "Grid Coordinate"}, ... }

return {
    -- Bastok Area
    ["Bastok Mines"] = {
        {zone = "Bastok Markets", exit = "F-5"},
        {zone = "South Gustaberg", exit = "H-10"},
        {zone = "Zeruhn Mines", exit = "D-7"}
    },
    ["Bastok Markets"] = {
        {zone = "Metalworks", exit = "H-6"},
        {zone = "Port Bastok", exit = "G-3"},
        {zone = "Bastok Mines", exit = "H-13"},
        {zone = "South Gustaberg", exit = "D-11"}
    },
    ["Port Bastok"] = {
        {zone = "Bastok Markets", exit = "D-11"},
        {zone = "North Gustaberg", exit = "L-6"}
    },
    ["Metalworks"] = {
        {zone = "Bastok Markets", exit = "H-7"}
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
        {zone = "South Gustaberg", exit = "I-6"}
    },

    -- San d'Oria Area
    ["Southern San d'Oria"] = {
        {zone = "Northern San d'Oria", exit = "D-8"},
        {zone = "Port San d'Oria", exit = "K-10"},
        {zone = "West Ronfaure", exit = "A-1"}
    },
    ["Northern San d'Oria"] = {
        {zone = "Southern San d'Oria", exit = "L-8"},
        {zone = "Chateau d'Oraguille", exit = "F-4"}
    },
    ["Port San d'Oria"] = {
        {zone = "Southern San d'Oria", exit = "H-2"}
    },
    ["Chateau d'Oraguille"] = {
        {zone = "Northern San d'Oria", exit = "H-10"}
    },
    ["West Ronfaure"] = {
        {zone = "Southern San d'Oria", exit = "K-6"},
        {zone = "East Ronfaure", exit = "G-6"},
        {zone = "Ghelsba Outpost", exit = "E-4"}
    },
    ["East Ronfaure"] = {
        {zone = "West Ronfaure", exit = "A-6"},
        {zone = "La Theine Plateau", exit = "G-6"}
    },
    ["La Theine Plateau"] = {
        {zone = "East Ronfaure", exit = "E-4"},
        {zone = "Valkurm Dunes", exit = "I-5"},
        {zone = "Jugner Forest", exit = "H-12"},
        {zone = "Ordelle's Caves", exit = "F-6"}
    },

    -- Windurst Area
    ["Windurst Waters"] = {
        {zone = "Windurst Walls", exit = "L-9"},
        {zone = "Port Windurst", exit = "G-10"},
        {zone = "Windurst Woods", exit = "K-12"}
    },
    ["Windurst Walls"] = {
        {zone = "Windurst Waters", exit = "J-4"},
        {zone = "Heavens Tower", exit = "E-7"}
    },
    ["Port Windurst"] = {
        {zone = "Windurst Waters", exit = "L-5"},
        {zone = "West Sarutabaruta", exit = "A-8"}
    },
    ["Windurst Woods"] = {
        {zone = "Windurst Waters", exit = "E-3"},
        {zone = "East Sarutabaruta", exit = "K-12"}
    },
    ["Heavens Tower"] = {
        {zone = "Windurst Walls", exit = "H-8"}
    },
    ["West Sarutabaruta"] = {
        {zone = "Port Windurst", exit = "K-8"},
        {zone = "East Sarutabaruta", exit = "J-7"},
        {zone = "Giddeus", exit = "F-7"}
    },
    ["East Sarutabaruta"] = {
        {zone = "Windurst Woods", exit = "G-11"},
        {zone = "West Sarutabaruta", exit = "E-4"},
        {zone = "Tahrongi Canyon", exit = "J-4"}
    },
    ["Tahrongi Canyon"] = {
        {zone = "East Sarutabaruta", exit = "C-6"},
        {zone = "Buburimu Peninsula", exit = "L-6"},
        {zone = "Meriphataud Mountains", exit = "F-12"}
    },
    ["Buburimu Peninsula"] = {
        {zone = "Tahrongi Canyon", exit = "D-6"},
        {zone = "Valkurm Dunes", exit = "F-8"}
    },
    ["Meriphataud Mountains"] = {
        {zone = "Tahrongi Canyon", exit = "J-4"},
        {zone = "Sauromugue Champaign", exit = "I-12"}
    },

    -- Jeuno Area
    ["Ru'Lude Gardens"] = {
        {zone = "Upper Jeuno", exit = "H-9"},
        {zone = "Lower Jeuno", exit = "G-11"}
    },
    ["Upper Jeuno"] = {
        {zone = "Ru'Lude Gardens", exit = "H-8"},
        {zone = "Lower Jeuno", exit = "G-11"}
    },
    ["Lower Jeuno"] = {
        {zone = "Upper Jeuno", exit = "H-5"},
        {zone = "Ru'Lude Gardens", exit = "H-5"},
        {zone = "Port Jeuno", exit = "H-8"},
        {zone = "Rolanberry Fields", exit = "F-12"}
    },
    ["Port Jeuno"] = {
        {zone = "Lower Jeuno", exit = "H-8"}
    },
    ["Rolanberry Fields"] = {
        {zone = "Lower Jeuno", exit = "H-5"},
        {zone = "Pashhow Marshlands", exit = "H-14"},
        {zone = "Crawlers' Nest", exit = "I-7"},
        {zone = "Sauromugue Champaign", exit = "I-5"}
    },
    ["Pashhow Marshlands"] = {
        {zone = "Rolanberry Fields", exit = "H-5"},
        {zone = "Konschtat Highlands", exit = "E-12"},
        {zone = "Beadeaux", exit = "K-11"}
    },
    ["Sauromugue Champaign"] = {
        {zone = "Meriphataud Mountains", exit = "G-5"},
        {zone = "Rolanberry Fields", exit = "K-6"},
        {zone = "Batallia Downs", exit = "K-12"}
    },
    ["Batallia Downs"] = {
        {zone = "Sauromugue Champaign", exit = "H-5"},
        {zone = "Jugner Forest", exit = "H-4"}
    },
    ["Jugner Forest"] = {
        {zone = "La Theine Plateau", exit = "E-4"},
        {zone = "Batallia Downs", exit = "I-11"}
    },

    -- Dungeons/Other
    ["Zeruhn Mines"] = {
        {zone = "Bastok Mines", exit = "H-7"}
    },
    ["Palborough Mines"] = {
        {zone = "North Gustaberg", exit = "K-6"},
        {zone = "Zeruhn Mines", exit = "H-6"}
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
        {zone = "West Sarutabaruta", exit = "J-8"}
    },
    ["Ordelle's Caves"] = {
        {zone = "La Theine Plateau", exit = "F-5"}
    },
    ["Crawlers' Nest"] = {
        {zone = "Rolanberry Fields", exit = "H-7"}
    },
    ["Selbina"] = {
        {zone = "Valkurm Dunes", exit = "I-9"}
    }
}
