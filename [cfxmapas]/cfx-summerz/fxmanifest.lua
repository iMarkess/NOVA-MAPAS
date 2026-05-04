shared_script '@eqpg-pro/events.lua'
client_script '@eqpg-pro/client_shared.lua'
server_script '@eqpg-pro/server_shared.lua'
fx_version "cerulean"
game "gta5"

this_is_a_map "yes"

files {
	"stream/*",
	"stream/**/*",
	"interiorproxies.meta"
}

data_file "DLC_ITYP_REQUEST" "stream/*.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/**/*.ytyp"
data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"