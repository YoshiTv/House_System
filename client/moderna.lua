ESX = exports["es_extended"]:getSharedObject()
local ped = PlayerPedId()
local currentPos = GetEntityCoords(ped)

-- BLIP IN MAPPA -- 
ydblip = AddBlipForCoord(YD.Moderna.BlipCoords)
SetBlipSprite(ydblip, YD.Moderna.BlipSprite)
SetBlipScale(ydblip, YD.Moderna.BlipScale)
SetBlipColour(ydblip, YD.Moderna.BlipColour)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(YD.Moderna.BlipName)
EndTextCommandSetBlipName(ydblip)

exports.qtarget:AddBoxZone(YD.Moderna.Entrata.Event, vector3(-287.6155, -1061.4697, 26.3054), 5.0, 1.0, {
	name = YD.Moderna.Entrata.Event,
	heading = -20.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -97.99,
}, {
	options = {
		{
			event = YD.Moderna.Entrata.Event,
			icon = YD.Moderna.Entrata.Icon,
			label = YD.Moderna.Entrata.Label,
		},
	},
	distance = 2.5
})

RegisterNetEvent(YD.Moderna.Entrata.Event, function()
local chiavi = exports.ox_inventory:Search('count', YD.CraftMenu.KeyModerna)
	if chiavi >= YD.MinimalKey then
		if lib.progressCircle({
			duration = YD.Moderna.ProgWait,
			label = YD.Lang.ProgEnter,
			position = YD.Moderna.Position,
			useWhileDead = false,
			canCancel = true,
		}) then TriggerServerEvent('tippa:casamoderna') end
		ESX.ShowNotification(YD.Lang.EnterHouse)
	else
		ESX.ShowNotification(YD.Lang.ErrorModern)
	end
end)

RegisterNetEvent('tpcasamoderna', function()
	SetEntityCoords(PlayerPedId(), YD.Moderna.Entrata.CoordsEnter, false, false, false, true)
end)

TriggerEvent('gridsystem:registerMarker', {
	name = YD.Moderna.Guardaroba.Name,
	pos = YD.Moderna.Guardaroba.Coords,
	scale = vector3(0.4, 0.4, 0.4),
	size = vector3(2.0, 2.0, 2.0),
	msg = YD.Lang.Guardaroba,
	type = YD.Moderna.Guardaroba.Type,
    show3D = YD.Moderna.Guardaroba.Show3D,
    color =  YD.Moderna.Guardaroba.Color,
    drawDistance = YD.Moderna.Guardaroba.Distance,
	control = YD.Moderna.Guardaroba.Control,
	action = function()
        local config = {
            ped = false,
            headBlend = false,
            faceFeatures = false,
            headOverlays = false,
            components = true,
            props = true
        }
        exports['fivem-appearance']:startPlayerCustomization(function (appearance)
            if (appearance) then
                TriggerServerEvent('fivem-appearance:save', appearance)
                ESX.SetPlayerData('ped', PlayerPedId())
            else
                ESX.SetPlayerData('ped', PlayerPedId())
            end
        end, config)
    end
})

exports.qtarget:AddBoxZone(YD.Moderna.Frigo.Event, vector3(-618.9775, 47.2611, 96.6001), 1.0, 1.0, {
	name = YD.Moderna.Frigo.Event,
	heading = 0.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -95.99,
}, {
	options = {
		{
			event = YD.Moderna.Frigo.Event,
			icon = YD.Moderna.Frigo.Icon,
			label = YD.Lang.Frigo,
		},
	},
	distance = 2.5
})

RegisterNetEvent(YD.Moderna.Frigo.Event, function()
    exports.ox_inventory:openInventory('shop', { type = YD.Moderna.Frigo.ShopName, id = 1})
end)

exports.qtarget:AddBoxZone(YD.Moderna.Deposito.Event, vector3(-622.8297, 57.1546, 96.5995), 2.0, 1.6, {
	name = YD.Moderna.Deposito.Event,
	heading = 0.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -97.89,
}, {
	options = {
		{
			event = YD.Moderna.Deposito.Event,
			icon = YD.Moderna.Deposito.Icon,
			label = YD.Lang.Deposito,
		},
	},
	distance = 2.5
})

exports.qtarget:AddBoxZone(YD.Moderna.EsciCasa.Event, vector3(-602.8551, 58.9302, 97.4002), 1.45, 1.45, {
	name=YD.Moderna.EsciCasa.Event,
	heading=00.0,
	debugPoly=false,
	minZ=-101.77834,
	maxZ=-99.87834,
	}, {
		options = {
			{
				event = YD.Moderna.EsciCasa.Event,
				icon = YD.Moderna.EsciCasa.Icon,
				label = YD.Lang.MsgEscHouse,
				
			}
		},
	distance = 2.0
})
RegisterNetEvent(YD.Moderna.EsciCasa.Event, function()
	if not giaf then
		giaf = true
		lib.progressCircle({
		    duration = YD.Moderna.ProgWait,
		    position = YD.Moderna.Position,
			label = YD.Lang.LabelEscHouse,
		    useWhileDead = false,
		    canCancel = true,
		    disable = {
		        car = true,
		    },
		})
		SetEntityCoords(PlayerPedId(), YD.Moderna.EsciCasa.CoordsEsc, false, false, false, true)
		TriggerServerEvent(YD.Moderna.EsciCasa.Event)
		FreezeEntityPosition(ped, false)
		Wait(10000)
		giaf = false
	end
end)

AddEventHandler(YD.Moderna.Deposito.Event, function()
    TriggerServerEvent(YD.Moderna.Deposito.Event)
end)

RegisterNetEvent(YD.Moderna.Deposito.NameInv)
AddEventHandler(YD.Moderna.Deposito.NameInv, function(name)
    TriggerEvent('ox_inventory:openInventory', 'stash', name)
end)