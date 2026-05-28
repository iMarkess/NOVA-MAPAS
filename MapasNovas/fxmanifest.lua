shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'

game "gta5"
fx_version "cerulean"
this_is_a_map "yes"

client_script {
    "client/*.lua",
    "redlinemecipl.lua"
}

files {
    "client/*.lua",
    "stream/*",
	"stream/**/*",
	"interiorproxies.meta",
    'gustavera_spawn_timecycle.xml',
    'pablito_lamesa_prison_timecycle.xml',
    'sp_manifest.ymt',
    "audioconfig/**/*.rel",
    "sfx/**/*.awc",
}

data_file "DLC_ITYP_REQUEST" "stream/*.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/**/*.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/**/**/*.ytyp"
data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"
data_file 'DLC_ITYP_REQUEST' 'stream/v_utility.ytyp'
data_file 'TIMECYCLEMOD_FILE' 'gustavera_spawn_timecycle.xml'
data_file 'TIMECYCLEMOD_FILE' 'pablito_lamesa_prison_timecycle.xml'
data_file "SCENARIO_POINTS_OVERRIDE_PSO_FILE" "sp_manifest.ymt"
data_file "AUDIO_SOUNDDATA" "audioconfig/gate/prison_gate_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_prison_gate"
data_file 'AUDIO_GAMEDATA' 'audioconfig/doors/pablito_lamesa_prison_doors_game.dat' --dat151
data_file 'AUDIO_GAMEDATA' 'audioconfig/et_1/DDEE2F77_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/et_2/C7B002FB_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/et_3/F966E668_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/floor_0/6C2F3BB3_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/floor_1/516C062D_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/floor_2/80CAE4EA_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/floor_3/7600CF56_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/floor_4/2F694230_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/hangar/88A89676_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/guardhouse/D91C67D5_game.dat'