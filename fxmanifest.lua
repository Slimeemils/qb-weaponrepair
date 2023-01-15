fx_version 'cerulean'
game 'gta5'
author 'Slime - Weapon Repair for QBCore'
version '1.0.0'

client_scripts {
	'config.lua',
	'client.lua',	
}

server_scripts {
	'config.lua',
	'@oxmysql/lib/MySQL.lua',
	'server.lua',	
}

lua54 'yes'