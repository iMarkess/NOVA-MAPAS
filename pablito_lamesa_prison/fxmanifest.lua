shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'
fx_version 'cerulean'
game 'gta5'

author 'Pablito'
description 'La Mesa Prison'
version '1.4.0'

this_is_a_map 'yes'

files {
    'pablito_lamesa_prison_timecycle.xml',
    'sp_manifest.ymt',
    "audioconfig/**/*.rel",
    "sfx/**/*.awc"    
}

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

escrow_ignore {
	'stream/replace/id1_26_build_b.ydr',
    'stream/replace/id1_26_build_barrier1.ydr',
    'stream/replace/id1_26_building.ydr',
    'stream/replace/id1_26_emissive.ydr',
    'stream/replace/id1_26_ground.ydr',
    'stream/replace/id1_26_olay003.ydr',
    'stream/replace/id1_props_flyers13.ydr',
    'stream/replace/id1_props_flyers14.ydr',
    'stream/replace/lod/id1_lod_slod4.ydr',    
    'stream/replace/lod/id1_26_emissive_slod_children.ydd',
    'stream/replace/lod/id1_26_slod1_children.ydd',
    'stream/replace/lod/id1_lod_emissive_19_children.ydd',
    'stream/replace/lod/id1_lod_id1_slod2_26_children.ydd',
    'stream/replace/lod/id1_lod_slod4_children.ydd',
    'stream/replace/lod/id1_props_combo12_slod_children.ydd',    
    'stream/escape_tunnel/hangar/id1_13_ground1b.ydr',
    'stream/escape_tunnel/hangar/id1_13_ground1b2_decal.ydr',
    'stream/escape_tunnel/hangar/id1_13_structure2.ydr'
}
dependency '/assetpacks'