RegisterCommand('car',function(source,args,rawcommand)
    TriggerServerEvent("discordLog:LogCommand",rawcommand)
    
    local vehicleName = args[1] or 'adder'

    if(not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName)) then --isModelInCdImage --> esta este modelo en el juego?
        TriggerEvent('chat:addMessage',{args={'Tendrias que haber spawneado un '..vehicleName..' virgolini'}})
    else
        --[[if(vehicleName == "jet" or vehicleName == "Jet" or vehicleName == "rhino" or vehicleName == "Rhino") then
            TriggerEvent('chat:addMessage',{args={'Nope'}})
            return
        end]]
        RequestModel(vehicleName) --Este native pide un hash, pero como este especifica que busca un hash, la conversion de string a hash se hace auto
        while(not HasModelLoaded(vehicleName)) do
            Wait(500) --Si no esperaramos, no le dariamos tiempo de cargar el auto al juego. Por eso hacemos esto en vez de no poner nada dentro del while (en ese caso se congelaria el juego)
        end

        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)

        local vehicle = CreateVehicle(vehicleName,pos.x,pos.y,pos.z,GetEntityHeading(playerPed),true,false)

        SetPedIntoVehicle(playerPed,vehicle,-1) -- el -1 es un numero que indica el asiento al que debe subirse el PED (en este caso driver). Buscar docs para saber los demas numeros posibles

        --SetVehicleHasBeenOwnedByPlayer(vehicle,true)

        SetEntityAsNoLongerNeeded(vehicle) --Le devolves el control del vehiculo al juego (para que lo despawnee cuando quiera)

        SetModelAsNoLongerNeeded(vehicleName)


        TriggerEvent('chat:addMessage',{
            args={
                'Terrible cochecito hermano, disfruta tu nuevo ^*'..vehicleName
            }
        })
    end
end,false)