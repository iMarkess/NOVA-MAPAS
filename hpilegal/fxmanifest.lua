shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'BrunX Mods'
description 'BrunX Mods'
version '1.0.0'
this_is_a_map "yes"
files {
    "interiorproxies.meta",
    'stream/*'
}
escrow_ignore {
    'stream/*.ytd',
}
dependency '/assetpacks'
