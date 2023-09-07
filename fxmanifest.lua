fx_version 'cerulean'
game 'gta5'

name 'SimpleCore'
author 'fadin_laws'
description 'A SimpleCore for your roleplay needs!'
version '1.1.2'

client_scripts {
    'client/client.lua',
    'client/entityiter.lua',
    'client/c_rpCommands.lua'
}

server_scripts {
    'server/server.lua',
    'server/version.lua',
    'server/s_rpCommands.lua',
    'server/webhookChecker.lua'
}

shared_scripts {
    'config.lua',
}