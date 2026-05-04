fx_version 'cerulean'
game 'gta5'

shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'

lua54 'yes'

shared_script 'shared.lua'
client_script 'client.lua'
server_script 'server.lua'

dependencies {
    '/onesync',
}

escrow_ignore {
    'shared.lua',
    'client.lua',
    'server.lua'
}
dependency '/assetpacks'