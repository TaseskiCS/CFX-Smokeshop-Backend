fx_version 'cerulean'
games { 'gta5' }

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_main.lua',
}

server_scripts {
    'server/sv_main.lua'
}

shared_scripts {
    'config.lua'
}