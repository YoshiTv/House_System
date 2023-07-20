ESX = exports["es_extended"]:getSharedObject()
local ped = PlayerPedId()
local currentPos = GetEntityCoords(ped)

local options = {
    {
        name = YD.Craft.Name,
        event = YD.Craft.Event,
        icon = YD.Craft.Icon,
        label = YD.Lang.ProgLabel,
    }
}
local shopchiavi = { 
    YD.Craft.Ped
}
exports.ox_target:addModel(shopchiavi, options)
 
ydblip = AddBlipForCoord(YD.Craft.BlipCoords)
SetBlipSprite(ydblip, YD.Craft.BlipSprite)
SetBlipScale(ydblip, YD.Craft.BlipScale)
SetBlipColour(ydblip, YD.Craft.BlipColour)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString(YD.Craft.BlipName)
EndTextCommandSetBlipName(ydblip)

Citizen.CreateThread(function()
  if not HasModelLoaded(YD.Craft.Ped) then
     RequestModel(YD.Craft.Ped)
     while not HasModelLoaded(YD.Craft.Ped) do
        Citizen.Wait(5)
     end
  end

npc = CreatePed(4, YD.Craft.Ped, YD.Craft.PosPed, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
end)

RegisterNetEvent('compra:chiavi', function()
    lib.registerContext({
        id = 'menu',
        title = YD.CraftMenu.Title,
        options = {
          {
            title = YD.CraftMenu.TitlePopolari,
            description = 'Price = 500$',
            icon = 'fa-solid fa-money-bill-1-wave',
            iconColor = 'orange',
            onSelect = function()
                casepopolari()
            end,
          },
          {
            title = YD.CraftMenu.TitleModerne,
            description = 'Price = 1500$',
            icon = 'fa-solid fa-money-bill-1-wave',
            iconColor = 'orange',
            onSelect = function()
                casemoderne()
            end,
          },
        }
      })
    lib.showContext('menu')
end)

function casepopolari()
local soldi = exports.ox_inventory:Search('count', YD.CraftMenu.ItemRemove)
FreezeEntityPosition(ped, true)
	if soldi >= 500 then
		if lib.progressCircle({
			duration = YD.CraftMenu.ProgWait,
			label = YD.Lang.ProgLabel,
			position = YD.CraftMenu.ProgPos,
			useWhileDead = false,
			canCancel = true,
			anim = {
				dict = 'timetable@amanda@ig_2',
				clip = 'ig_2_base_amanda'
			},
		}) then TriggerServerEvent('popolari', 1) end
		ESX.ShowNotification(YD.Lang.Popolare)
	else
		ESX.ShowNotification(YD.Lang.Error)
	end
FreezeEntityPosition(ped, false)
end

function casemoderne()
local soldi = exports.ox_inventory:Search('count', YD.CraftMenu.ItemRemove)
FreezeEntityPosition(ped, true)
	if soldi >= 1500 then
		if lib.progressCircle({
			duration = YD.CraftMenu.ProgWait,
			label =  YD.Lang.ProgLabel,
			position = YD.CraftMenu.ProgPos,
			useWhileDead = false,
			canCancel = true,
			anim = {
				dict = 'timetable@amanda@ig_2',
				clip = 'ig_2_base_amanda'
			},
		}) then TriggerServerEvent('moderne', 1) end
		ESX.ShowNotification(YD.Lang.Moderna)
	else
		ESX.ShowNotification(YD.Lang.Error)
	end
FreezeEntityPosition(ped, false)
end