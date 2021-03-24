--Todos los resources que usemos deberán tener un fxmanifest.lua
fx_version 'bodacious' --Especifica la version del server (buscar en docs el script)
game 'gta5' --Especifica el juego al que pertenece el script (RDR3 o GTA5 [minuscula])

author 'MancoRuben'
description 'This is my second FiveM script. Lets see how it goes :)'
version '1.0.0' --Version de tu script, pura facha

--resource_type 'gametype' { name = 'My gametype!' } --El tipo de recurso que vas a crear. (No se suele meter cuando haces un standalone add-on)

client_script 'carspawner_client.lua' --Le indica al runtime que el cliente deberia cargar este script