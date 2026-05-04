fx_version 'cerulean'
game 'gta5'

shared_scripts {
    '@vrp/lib/Utils.lua'
}

shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'

lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/mining.lua',
    'client/entityset.lua'
}

server_scripts {
    'server/main.lua'
}

escrow_ignore {
    'client/main.lua',
    'client/mining.lua',
    'client/entityset.lua',
    'server/main.lua'
}

dependency '/assetpacks'