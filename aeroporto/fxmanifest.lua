shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'

fx_version 'cerulean'
game 'gta5'

this_is_a_map "yes"

files {
    'gustavera_spawn_timecycle.xml',
    'stream/*'
}

data_file 'TIMECYCLEMOD_FILE' 'gustavera_spawn_timecycle.xml'
dependency '/assetpacks'