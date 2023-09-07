--    ____  _                 _       ____               
--   / ___|(_)_ __ ___  _ __ | | ___ / ___|___  _ __ ___ 
--   \___ \| | '_ ` _ \| '_ \| |/ _ \ |   / _ \| '__/ _ \
--    ___) | | | | | | | |_) | |  __/ |__| (_) | | |  __/
--   |____/|_|_| |_| |_| .__/|_|\___|\____\___/|_|  \___|
--                     |_|                                                                                                                                      
--
--                   Created by Fadin_laws
--                        V. 1.1.2
--

Config = {} -- Do not touch this line.

--   ______     ______     ______     __     ______   ______   ______    
--  /\  ___\   /\  ___\   /\  == \   /\ \   /\  == \ /\__  _\ /\  ___\   
--  \ \___  \  \ \ \____  \ \  __<   \ \ \  \ \  _-/ \/_/\ \/ \ \___  \  
--   \/\_____\  \ \_____\  \ \_\ \_\  \ \_\  \ \_\      \ \_\  \/\_____\ 
--    \/_____/   \/_____/   \/_/ /_/   \/_/   \/_/       \/_/   \/_____/ 
                                                                     

Config.Scripts = {

--    __     __   _     _      _        ____            _       _       
--    \ \   / /__| |__ (_) ___| | ___  / ___|  ___ _ __(_)_ __ | |_ ___ 
--     \ \ / / _ \ '_ \| |/ __| |/ _ \ \___ \ / __| '__| | '_ \| __/ __|
--      \ V /  __/ | | | | (__| |  __/  ___) | (__| |  | | |_) | |_\__ \
--       \_/ \___|_| |_|_|\___|_|\___| |____/ \___|_|  |_| .__/ \__|___/
--                                                       |_|            
    
    vehicleDelete = true, -- Enable / Disable the usage of /dv.
    vehicleMaintenance = true, -- Enable / Disable the vehicle maintenance scripts.
    vehicleSaveTires = true, -- Enable / Disable the tire snapping script.
    deleteAllVehicles = true, -- Enable / Disable the usage of /dva (Admin Permission Based)
    removeParkedCars = true, -- Remove any / all parked vehicles from the side of the road.
    airControl = true, -- Remove the ability for players to control their vehicles whilst in the air.
    antiVehicleFlip = true, -- Remove the ability for players to flip their vehicle back onto the wheels when they flip over.
    vehicleBrakeLights = true, -- Enable / Disable vehicle brake lights turning on while the vehicle you're driving is stopped.

--     ____ _           _     ____            _       _       
--    / ___| |__   __ _| |_  / ___|  ___ _ __(_)_ __ | |_ ___ 
--   | |   | '_ \ / _` | __| \___ \ / __| '__| | '_ \| __/ __|
--   | |___| | | | (_| | |_   ___) | (__| |  | | |_) | |_\__ \
--    \____|_| |_|\__,_|\__| |____/ \___|_|  |_| .__/ \__|___/
--                                             |_|                       

    roleplayCommands = true, -- Enable / Disable the usage of rp commands.
    chatFilter = true, -- Enable / Disable the need to autokick someone for sending bad things (Filter can be configured below)
    autoMessages = true, -- Enable / Disable the usage of auto messages in-game with the chat! 
    emergencyCalling = true, -- Enable / Disable the /911 script!
    chatClearing = true, -- Enable / Disable the /clearchat script (Ace permissions)
    -- Ace Permission permission:
    -- add_ace group.[GROUPNAME] chat.clear allow

--     ____  _                         ____            _       _       
--    |  _ \| | __ _ _   _  ___ _ __  / ___|  ___ _ __(_)_ __ | |_ ___ 
--    | |_) | |/ _` | | | |/ _ \ '__| \___ \ / __| '__| | '_ \| __/ __|
--    |  __/| | (_| | |_| |  __/ |     ___) | (__| |  | | |_) | |_\__ \
--    |_|   |_|\__,_|\__, |\___|_|    |____/ \___|_|  |_| .__/ \__|___/
--                   |___/                              |_|            

    dragPeople = true, -- Enable / Disable the /drag command.
    persistantFlashlight = true, -- Enable / Disable the ability to have your weapon's flashlight on whilst moving (Without having to aim)
    dropWeapon = true, -- Enable / Disable the /dropweapon command to drop your weapon(s)!
    clearInventory = true, -- Enable / Disable the /clear command to clear your players weapon wheel + armor.
    crouchDown = true, -- Enable / Disable the ability to crouch with CTRL
    playerPointing = true, -- Enable / Disable the ability for players to point with the characters (Press B to do so.)
    playerHandsUp = true, -- Enable / Disable the ability to put your hands up by pressing X.
    playerClumsy = true, -- Enable / Disable the feature that you player could have a chance of falling if spam-jumping
    playerClumsyChance = 0.8, -- Chance of falling (e.g. 80% = 0.8    75% = 0.75    32% = 0.32)
    ragdollDamage = true, -- Enable / Disable the feature, where if you are shot your character COULD ragdoll.
    tazerEffects = true, -- Enable / Disable the tazer effects if tazed by someone.

--     ____                             ____            _       _       
--    / ___|  ___ _ ____   _____ _ __  / ___|  ___ _ __(_)_ __ | |_ ___ 
--    \___ \ / _ \ '__\ \ / / _ \ '__| \___ \ / __| '__| | '_ \| __/ __|
--     ___) |  __/ |   \ V /  __/ |     ___) | (__| |  | | |_) | |_\__ \
--    |____/ \___|_|    \_/ \___|_|    |____/ \___|_|  |_| .__/ \__|___/
--                                                       |_|            

    disableReticle = true, -- Enable / Disable the weapons reticle (Make shooting people harder.)
    serverPVP = true, -- Enable / Disable the ability for players to cause damage to others.
    serverWatermark = true, -- Enable / Disable the server watermark
    ignoreWantedLevel = true, -- Enable / Disable the police from ever being dispatched to you (true = cops ignore | false = cops chase you)
    serverAFKKick = false, -- Enable / Disable the feature to automatically kick someone if they are AFK for to long.
    mapBlips = true, -- Enable / Disable the SimpleCore Map Blips.
    antiCombatRolling = true, -- Enable / Disable the ability for players to combat roll.
}









--   __     __     ______     ______   ______     ______     __    __     ______     ______     __  __    
--  /\ \  _ \ \   /\  __ \   /\__  _\ /\  ___\   /\  == \   /\ "-./  \   /\  __ \   /\  == \   /\ \/ /    
--  \ \ \/ ".\ \  \ \  __ \  \/_/\ \/ \ \  __\   \ \  __<   \ \ \-./\ \  \ \  __ \  \ \  __<   \ \  _"-.  
--   \ \__/".~\_\  \ \_\ \_\    \ \_\  \ \_____\  \ \_\ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_\ \_\  \ \_\ \_\ 
--    \/_/   \/_/   \/_/\/_/     \/_/   \/_____/   \/_/ /_/   \/_/  \/_/   \/_/\/_/   \/_/ /_/   \/_/\/_/ 
                                                                                              
Config.Watermark = {
    name = "~y~Simple ~w~Developments", -- Name of your server.
    offsetX = 0.870, -- X Location (How far left / right)
    offsetY = 0.001, -- Y Location (How far up / down)
    alpha = 255, -- How visible the text is.
    scale = 0.5, -- How big the text is. 
    textFont = 4, -- Font type. (0-5)
}

--   ______     ______      ______     ______     __    __     __    __     ______     __   __     _____     ______    
--  /\  == \   /\  == \    /\  ___\   /\  __ \   /\ "-./  \   /\ "-./  \   /\  __ \   /\ "-.\ \   /\  __-.  /\  ___\   
--  \ \  __<   \ \  _-/    \ \ \____  \ \ \/\ \  \ \ \-./\ \  \ \ \-./\ \  \ \  __ \  \ \ \-.  \  \ \ \/\ \ \ \___  \  
--   \ \_\ \_\  \ \_\       \ \_____\  \ \_____\  \ \_\ \ \_\  \ \_\ \ \_\  \ \_\ \_\  \ \_\\"\_\  \ \____-  \/\_____\ 
--    \/_/ /_/   \/_/        \/_____/   \/_____/   \/_/  \/_/   \/_/  \/_/   \/_/\/_/   \/_/ \/_/   \/____/   \/_____/ 
                                                                                                                   
Config.RoleplayCommands = {

    rpCommandCustom = false, -- Enable / Disable the /command custom usage (Requres RP Commands to be enable!)


    twitterCommand = true, -- Enable / Disable the /twitter command.
    dispatchCommand = true, -- Enable / Disable the /dispatch command.
    darkWebCommand = true, -- Enable / Disable the /darkweb command.
    newsCommand = true, -- Enable / Disable the /news command.
    doCommand = true, -- Enable / Disable the /do command.
    oocCommand = true, -- Enable / Disable the /ooc command.
    meCommand = true, -- Enable / Disable the /me command.
    AdCommand = true, -- Enable / Disable the /ad command.
    discordCommand = true, -- Enable / Disable the /discord command!
    websiteCommand = true, -- Enable / Disable the /website command!
    teamspeakCommand = true, -- Enable / Disable the /teamspeak command!
    globalMeCommand = true, -- Enable / Disable the /gme command. (Sends /me in global chat for everyone to see.)
    staffCommand = true, -- Enable /  Disable the /staff command. (Ace Permission locked)

    roleplayCommandsLogging = "https://discord.com/api/webhooks/1146550595419914302/rYSqVKFithjQD_aTCo0YJoDZOwtEfD9QrIG1fnIfipMKk3dGsVgRDSL46K1kzGJ3O0RI", -- Discord Channel that the / commands will be logged to.
    missingArgs = '^1Please make sure that you provide a message after the / command!', -- Message that is sent if you fail to input a message after the / command.

    twitterName = "twitter", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    dispatchName = "dispatch", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    darkwebName = "darkweb", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    newsName = "news", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    doName = "do", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    oocName = "ooc", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    meName = "me", -- Command name that will be registered, if you have "rpCommandCustom = true,"!
    globalMeName = "gme", -- Command name that will be registered, if you have "rpCommandCustom = true,"!

    discordServerURL = "https://discord.gg/CHANGEME",
    teamspeakServerURL = "IP: CHANGEME | Password: CHANGEME",
    websiteServerURL = "https://google.com"
}

--   __   __   ______     __  __     __     ______     __         ______     ______     ______     __   __     ______   ______     ______     __        
--  /\ \ / /  /\  ___\   /\ \_\ \   /\ \   /\  ___\   /\ \       /\  ___\   /\  ___\   /\  __ \   /\ "-.\ \   /\__  _\ /\  == \   /\  __ \   /\ \       
--  \ \ \'/   \ \  __\   \ \  __ \  \ \ \  \ \ \____  \ \ \____  \ \  __\   \ \ \____  \ \ \/\ \  \ \ \-.  \  \/_/\ \/ \ \  __<   \ \ \/\ \  \ \ \____  
--   \ \__|    \ \_____\  \ \_\ \_\  \ \_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_\\"\_\    \ \_\  \ \_\ \_\  \ \_____\  \ \_____\ 
--    \/_/      \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/ \/_/     \/_/   \/_/ /_/   \/_____/   \/_____/ 
                                                                                                                                                    
Config.VehicleControl = {
    vehicleDoorControl = {
        trunkCommand = true, -- Enable / Disable /trunk.
        hoodCommand = true, -- Enable / Disable /hood.
        engineCommand = true, -- Enable / Disable /eng.
    },
    vehicleMaintenanceScripts = {
        fixCommand = true,  -- Enable / Disable the /fix command.
        fixPermissions = false, -- Enable / Disable if you need to have ace permissions before using the command! (add_ace group.staff vehicle.fix allow).
        cleanCommand = true, -- Enable / Disable the /clean command.
        cleanPermissions = false, -- Enable / Disable if you need to have ace permissions before using the command! (add_ace group.staff vehicle.clean allow).
    },
    massVehicleDelete = {
        commandDelay = 15, -- How long it would take to execute the command 100% (in seconds)
        delayMessage = "^1SimpleCore^0: ^7All unoccupied vehicles will be deleted in 15 seconds!",
        deleteMessage = "^1SimpleCore^0: ^7All unoccupied vehicles have been deleted by a server staff member to reduce lag / vehicles!",
        restrictCommand = true, -- Requre the usage of ace permissions! (False = everyone can use | true = ace permission locked)
        -- Ace permission group (How-To)
        -- add_ace [GROUP] command.[commandName] allow # Template
        -- add_ace group.admin simcore.dva allow # Example
    }
}

--   ______     __  __     ______   ______     __    __     ______     ______     ______     ______     ______     ______    
--  /\  __ \   /\ \/\ \   /\__  _\ /\  __ \   /\ "-./  \   /\  ___\   /\  ___\   /\  ___\   /\  __ \   /\  ___\   /\  ___\   
--  \ \  __ \  \ \ \_\ \  \/_/\ \/ \ \ \/\ \  \ \ \-./\ \  \ \  __\   \ \___  \  \ \___  \  \ \  __ \  \ \ \__ \  \ \  __\   
--   \ \_\ \_\  \ \_____\    \ \_\  \ \_____\  \ \_\ \ \_\  \ \_____\  \/\_____\  \/\_____\  \ \_\ \_\  \ \_____\  \ \_____\ 
--    \/_/\/_/   \/_____/     \/_/   \/_____/   \/_/  \/_/   \/_____/   \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_____/ 
                                                                                                                         
Config.AutoMessages = {
    messageDelay = 10, -- Delay that each message has before sending the next (in seconds)
    messagePrefix = '[^1SimpleCore^0] ', -- Prefix of the messages when being sent.
    serverMessages = {
        'Welcome to the server! We hope you enjoy your stay!',
        'If you have any questions, feel free to ask!'
    },
}

--   ______     __  __     ______   ______     __    __     ______     _____    
--  /\  __ \   /\ \/\ \   /\__  _\ /\  __ \   /\ "-./  \   /\  __ \   /\  __-.  
--  \ \  __ \  \ \ \_\ \  \/_/\ \/ \ \ \/\ \  \ \ \-./\ \  \ \ \/\ \  \ \ \/\ \ 
--   \ \_\ \_\  \ \_____\    \ \_\  \ \_____\  \ \_\ \ \_\  \ \_____\  \ \____- 
--    \/_/\/_/   \/_____/     \/_/   \/_____/   \/_/  \/_/   \/_____/   \/____/ 
                                                                            

Config.AutoModeration = {
    ChatFilter = {
        kickPlayer = false, -- Enable / Disable the feature to kick a player if they say a word not allowed. 
        kickMessage = "You were kicked from this server for saying something you are not allowed to say!",
        filterList = {
            "nigger",
            "nigga",
            "faggot",
            "cunt"
        },
    },

    ServerAFKKick = {
        timeUntilKicked = 600, -- How long someone has before being kicked (in seconds (Default is 10 minutes!))
        kickWarning = true, -- Enable / Disable the warning upon 3/4 of the timer has exceeded.
        kickMessage = "You were kicked from the server for being AFK for too long!",
    },
}

--   ______     __    __     ______     ______     ______     ______     __   __     ______     __  __        ______     ______     ______     __     ______   ______  
--  /\  ___\   /\ "-./  \   /\  ___\   /\  == \   /\  ___\   /\  ___\   /\ "-.\ \   /\  ___\   /\ \_\ \      /\  ___\   /\  ___\   /\  == \   /\ \   /\  == \ /\__  _\ 
--  \ \  __\   \ \ \-./\ \  \ \  __\   \ \  __<   \ \ \__ \  \ \  __\   \ \ \-.  \  \ \ \____  \ \____ \     \ \___  \  \ \ \____  \ \  __<   \ \ \  \ \  _-/ \/_/\ \/ 
--   \ \_____\  \ \_\ \ \_\  \ \_____\  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\\"\_\  \ \_____\  \/\_____\     \/\_____\  \ \_____\  \ \_\ \_\  \ \_\  \ \_\      \ \_\ 
--    \/_____/   \/_/  \/_/   \/_____/   \/_/ /_/   \/_____/   \/_____/   \/_/ \/_/   \/_____/   \/_____/      \/_____/   \/_____/   \/_/ /_/   \/_/   \/_/       \/_/ 
                                                                                                                                                                   

Config.EmergencyCalling = {
    callBlips = true, -- Enable / Disable blips being posted on the map.
    callsInChat = true, -- Enable / Disable the 911 calls being posted in chat.
    blipTime = 180, -- Time in miliseconds before the 911 blip disappears.
    chatSuggestion = true,
    blipRadius = 175.0 ,
    loggingWebhook = "https://discord.com/api/webhooks/1146550595419914302/rYSqVKFithjQD_aTCo0YJoDZOwtEfD9QrIG1fnIfipMKk3dGsVgRDSL46K1kzGJ3O0RI", -- Channel that the script will log to!
}

Config.MapBlips = {
    --[[
        Blip Color Codes: https://docs.fivem.net/docs/game-references/blips/#blip-colors
        Blip Icon Codes: https://docs.fivem.net/docs/game-references/blips/
    ]]

    -- The Prison

    {title="Bolingbroke Penitentiary", colour=75, id=238, x=1807.53, y=2605.59, z=45.565},

    -- Airports 

    {title="Airport", colour=3, id=90, x=1721.0, y=3255.07, z=41.148},
    {title="Airport", colour=3, id=90, x=2149.59, y=4817.6, z=41.268},
    {title="Airport", colour=3, id=90, x=-1045.49, y=-2751.304, z=21.363},

    -- Job Centre 

    {title="Job Centre", colour=60, id=351, x=-264.58, y=-963.7, z=31.223},

    -- A few ATM's within the city.

    {title="ATM", colour=2, id=108, x=89.9733, y=2.18227, z=68.2283},
    {title="ATM", colour=2, id=108, x=-526.065, y=-1221.99, z=18.4549},
    {title="ATM", colour=2, id=108, x=711.389, y=-820.833, z=23.6155},
    {title="ATM", colour=2, id=108, x=-2073.44, y=-317.245, z=13.316},
    {title="ATM", colour=2, id=108, x=-821.17, y=-1083.29, z=11.1324},
    {title="ATM", colour=2, id=108, x=1686.4, y=4816.36, z=42.0092},

    -- Banks

    {title="Bank", colour=2, id=431, x=-2964.76, y=482.658, z=15.7068},
    {title="Bank", colour=2, id=431, x=260.232, y=205.886, z=106.284},
    {title="Bank", colour=2, id=431, x=150.061, y=-1039.99, z=29.3778},
    {title="Bank", colour=2, id=431, x=-1213.57, y=-328.829, z=37.7908},
    {title="Bank", colour=2, id=431, x=-109.453, y=6464.05, z=31.6267},

    --Race Track

    {title="Race Track", colour=6, id=147, x=1131.91, y=101.72, z=83.023},

    -- Casino

    {title="Casino", colour=81, id=277, x=930.71, y=41.14, z=78.513},

    -- Helicopter Pad(s)

    {title="Helicopter Landing", colour=29, id=64, x=-736.22, y=-1455.6, z=5},

    -- Clothing Stores

    {title="Suburban", id=73, x=124.25, y=-218.53, z=54.56},
    {title="Suburban", id=73, x=76.11, y=-1393.83, z=29.38},
    {title="Suburban", id=73, x=-822.74, y=-1074.34, z=11.33},
    {title="Suburban", id=73, x=-1195.25, y=-773.52, z=17.32},
    {title="Suburban", id=73, x=-161.55, y=-303.7, z=39.73},
    {title="Suburban", id=73, x=424.68, y=-805.72, z=29.49},
    {title="Suburban", id=73, x=-711.06, y=-153.53, z=37.42},
    {title="Suburban", id=73, x=-1451.76, y=-236.49, z=49.81},
    {title="Suburban", id=73, x=-1099.8, y=2710.1, z=19.11},
    {title="Suburban", id=73, x=-3171.74, y=1049.05, z=20.86},
    {title="Suburban", id=73, x=617.77, y=2757.91, z=42.09},
    {title="Suburban", id=73, x=1692.88, y=4822.66, z=42.06},
    {title="Suburban", id=73, x=4.57, y=6513.28, z=31.88},

    -- Gun Stores

    {title="Ammunation", id=110, x=-329.72, y=6082.81, z=31.45},
    {title="Ammunation", id=110, x=1694.67, y=3757.67, z=34.71},
    {title="Ammunation", id=110, x=-1117.48, y=2696.67, z=18.55},
    {title="Ammunation", id=110, x=-3170.54, y=1085.7, z=20.84},
    {title="Ammunation", id=110, x=-1307.71, y=-392.4, z=36.7},
    {title="Ammunation", id=110, x=250.86, y=-48.18, z=69.94},
    {title="Ammunation", id=110, x=812.43, y=-2156.59, z=29.62},
    {title="Ammunation", id=110, x=20.73, y=-1107.57, z=29.8},
    {title="Ammunation", id=110, x=-663.35, y=-936.66, z=21.83},
    {title="Ammunation", id=110, x=2569.28, y=296.55, z=108.73},

    -- 24/7 Stores

    {title="24/7", id=59, x=-50.21, y=-1753.21, z=29.42},
    {title="24/7", id=59, x=29.47, y=-1344.82, z=29.5},
    {title="24/7", id=59, x=-711.6, y=-912.57, z=19.22},
    {title="24/7", id=59, x=1159.51, y=-321.71, z=69.21},
    {title="24/7", id=59, x=-1488.1, y=-380.56, z=40.16},
    {title="24/7", id=59, x=-1224.01, y=-905.55, z=12.33},
    {title="24/7", id=59, x=377.63, y=326.61, z=103.57},
    {title="24/7", id=59, x=2555.08, y=385.8, z=108.62},
    {title="24/7", id=59, x=-2969.01, y=390.53, z=15.04},
    {title="24/7", id=59, x=544.45, y=2668.85, z=42.16},
    {title="24/7", id=59, x=1963.35, y=3744.3, z=32.34},
    {title="24/7", id=59, x=1702.39, y=4926.02, z=42.06},
    {title="24/7", id=59, x=2678.72, y=3284.8, z=55.24},
    {title="24/7", id=59, x=1733.37, y=6414.96, z=35.04},

    -- Police Department(s)

    {title="Police Station", colour=29, id=60, x=825.05, y=-1290.09, z=28.24},

    -- Fire Department(s)

    {title="Fire Station", colour=1, id=60, x=-1035.06, y=-2383.83, z=14.09},
    {title="Fire Station", colour=1, id=60, x=-1180.07, y=-1777.14, z=3.91},
    {title="Fire Station", colour=1, id=60, x=-2111.1, y=2832.05, z=32.81},
}

-- End of Config File.
