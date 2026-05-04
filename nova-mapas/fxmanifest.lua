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
	"interiorproxies.meta"
}

data_file "DLC_ITYP_REQUEST" "stream/*.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/**/*.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/**/**/*.ytyp"
data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"
data_file 'DLC_ITYP_REQUEST' 'stream/v_utility.ytyp'