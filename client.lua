--Do not edit unless you know what you're doing--
peacetime = false 
function DrawText(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextEdge(2, 0, 0, 0, 255)
  SetTextOutline()
  BeginTextCommandDisplayText("STRING")
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end
RegisterNetEvent('Pegasus:PT')
AddEventHandler('Pegasus:PT', function(pt)
	peacetime = pt;
end)
Citizen.CreateThread(function()
	Wait(850);
  player = GetPlayerPed(-1)
	while true do 
		Wait(0);
		if peacetime then 
			  NetworkSetFriendlyFireOption(false)
				SetEntityCanBeDamaged(vehicle, false)
				ClearPlayerWantedLevel(PlayerId())
        for k, v in pairs(GetActivePlayers()) do
          local ped = GetPlayerPed(v)
          SetEntityNoCollisionEntity(GetPlayerPed(-1), GetVehiclePedIsIn(ped, false), true)
          SetEntityNoCollisionEntity(GetVehiclePedIsIn(ped, false), GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
        end
        DrawText(0.590, 1.430, 1.0,1.0,0.45, "~p~[~g~PeaceTime~p~]", 255, 255, 255, 255)
    else
        NetworkSetFriendlyFireOption(true)
				SetEntityCanBeDamaged(vehicle, true)
        DrawText(0.590, 1.430, 1.0,1.0,0.45, "~p~[~r~PeaceTime~p~]", 255, 255, 255, 255)
		end
  end
end)

RegisterNetEvent('PeaceTimeOn')
AddEventHandler('PeaceTimeOn', function(PTON)
   Notify("~g~You have set PeaceTime to ON")
    end)

RegisterNetEvent('PeaceTimeOff')
AddEventHandler('PeaceTimeOff', function(PTOFF)
   Notify("~g~You have set PeaceTime to OFF")
    end)


RegisterNetEvent('NotifyEvent')
AddEventHandler('NotifyEvent', function (notifyevent)
Notify("~r~You do not have permission to use this command!")
end)


function Notify( text )
  SetNotificationTextEntry( "STRING" )
  AddTextComponentString( text )
  DrawNotification( false, false )
end
