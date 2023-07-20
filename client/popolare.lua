ESX = exports["es_extended"]:getSharedObject()
local ped = PlayerPedId()
local currentPos = GetEntityCoords(ped)
local giaf = false

-- BLIP IN MAPPA -- 
ydblip = AddBlipForCoord(YD.Popolare.BlipCoords)
SetBlipSprite(ydblip, YD.Popolare.BlipSprite)
SetBlipScale(ydblip, YD.Popolare.BlipScale)
SetBlipColour(ydblip, YD.Popolare.BlipColour)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(YD.Popolare.BlipName)
EndTextCommandSetBlipName(ydblip)

exports.qtarget:AddBoxZone(YD.Popolare.TargetEntrata.Event, vector3(287.9472, -1095.0304, 28.4197), 2.0, 1.0, {
	name = YD.Popolare.TargetEntrata.Event,
	heading = 0.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -97.99,
}, {
	options = {
		{
			event = YD.Popolare.TargetEntrata.Event,
			icon = YD.Popolare.TargetEntrata.Icon,
			label = YD.Lang.TargetHousePopolare,
		},
	},
	distance = 2.5
})

RegisterNetEvent(YD.Popolare.TargetEntrata.Event, function()
local chiavi = exports.ox_inventory:Search('count', YD.CraftMenu.KeyPopolare)
	if chiavi >= YD.MinimalKey then
		if lib.progressCircle({
			duration = YD.Popolare.ProgWait,
			label = YD.Lang.ProgEnter,
			position = YD.CraftMenu.ProgPos,
			useWhileDead = false,
			canCancel = true,
		}) then TriggerServerEvent('tippa:casa') end
		ESX.ShowNotification(YD.Lang.EnterHouse)
	else
		ESX.ShowNotification(YD.Lang.ErrorEnter)
	end
end)

RegisterNetEvent('tpcasa', function()
	SetEntityCoords(PlayerPedId(), YD.Popolare.CoordsHouse, false, false, false, true)
end)

TriggerEvent('gridsystem:registerMarker', {
	name = YD.Popolare.Guardaroba.Name,
	pos = YD.Popolare.Guardaroba.Coords,
	scale = vector3(0.4, 0.4, 0.4),
	size = vector3(2.0, 2.0, 2.0),
	msg = YD.Lang.Guardaroba,
	type = YD.Popolare.Guardaroba.Type,
    show3D = YD.Popolare.Guardaroba.Show3D,
    color =  YD.Popolare.Guardaroba.Color,
    drawDistance = YD.Popolare.Guardaroba.Distance,
	control = YD.Popolare.Guardaroba.Control,
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

exports.qtarget:AddBoxZone(YD.Popolare.Frigo.Event, vector3(265.7940, -997.5726, -99.0086), 2.0, 2.0, {
	name = YD.Popolare.Frigo.Event,
	heading = 0.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -95.99,
}, {
	options = {
		{
			event = YD.Popolare.Frigo.Event,
			icon = YD.Popolare.Frigo.Icon,
			label = YD.Lang.Frigo,
		},
	},
	distance = 2.5
})

RegisterNetEvent(YD.Popolare.Frigo.Event, function()
    exports.ox_inventory:openInventory('shop', { type = YD.Popolare.Frigo.ShopName, id = 1})
end)

exports.qtarget:AddBoxZone(YD.Popolare.Deposito.Event, vector3(265.65, -999.4, -100.01), 2.0, 2.0, {
	name = YD.Popolare.Deposito.Event,
	heading = 0.0,
	debugPoly = false,
	minZ = -100.39,
	maxZ = -95.99,
}, {
	options = {
		{
			event = YD.Popolare.Deposito.Event,
			icon = YD.Popolare.Deposito.Icon,
			label = YD.Lang.Deposito,
		},
	},
	distance = 2.5
})

exports.qtarget:AddBoxZone(YD.Popolare.Uscita.Name, vector3(266.1327, -1007.38, -101.0), 1.45, 1.45, {
	name=YD.Popolare.Uscita.Name,
	heading=170.0,
	debugPoly=false,
	minZ=-101.77834,
	maxZ=-99.87834,
	}, {
		options = {
			{
				event = YD.Popolare.Uscita.Event,
				icon = YD.Popolare.Uscita.Icon,
				label = YD.Popolare.Uscita.Label,
				
			}
		},
	distance = 2.0
})

RegisterNetEvent(YD.Popolare.Uscita.Event, function()
	if not giaf then
		giaf = true
		lib.progressCircle({
			duration = YD.Popolare.ProgWait,
			position = YD.CraftMenu.ProgPos,
			label = YD.Lang.LabelEscHouse,
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
			},
		}) 
		SetEntityCoords(PlayerPedId(), YD.Popolare.Uscita.PosUscita, false, false, false, true)
		TriggerServerEvent(YD.Popolare.Uscita.ServerEvent)
		FreezeEntityPosition(ped, false)
		Wait(10000)
		giaf = false
	end
end)

AddEventHandler(YD.Popolare.Deposito.Event, function()
    TriggerServerEvent(YD.Popolare.Deposito.Event)
end)

RegisterNetEvent(YD.Popolare.Deposito.NameInv)
AddEventHandler(YD.Popolare.Deposito.NameInv, function(name)
    TriggerEvent('ox_inventory:openInventory', 'stash', name)
end)