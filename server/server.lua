ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("popolari", function()
	exports.ox_inventory:RemoveItem(source, YD.CraftMenu.ItemRemove, YD.CraftMenu.AmountPopolare, false, false, false)
    exports.ox_inventory:AddItem(source, YD.CraftMenu.KeyPopolare, 1, false, false, false)
end)

RegisterServerEvent("moderne", function()
    exports.ox_inventory:RemoveItem(source, YD.CraftMenu.ItemRemove, YD.CraftMenu.AmountModerna, false, false, false)
    exports.ox_inventory:AddItem(source, YD.CraftMenu.KeyModerna, 1, false, false, false)
end)

RegisterServerEvent("tippa:casa")
AddEventHandler("tippa:casa", function()
	TriggerClientEvent('tpcasa', source)
end)

RegisterServerEvent("tippa:casamoderna")
AddEventHandler("tippa:casamoderna", function()
	TriggerClientEvent('tpcasamoderna', source)
end)

RegisterServerEvent("esci:casamoderna")
AddEventHandler("esci:casamoderna", function()
	TriggerClientEvent('esci:casamoderna', source)
end)

RegisterServerEvent("uscita:casa")
AddEventHandler("uscita:casa", function()
	TriggerClientEvent('esci:casa', source)
end)

RegisterServerEvent('depositopopolare')
AddEventHandler('depositopopolare', function()
	local src = source
	local name = GetPlayerName(src)
	exports.ox_inventory:RegisterStash('popolare', "DEPOSITO", 25, 85000)
	TriggerClientEvent('popolare', src, 'popolare')
end)

RegisterServerEvent('depositomederna')
AddEventHandler('depositomederna', function()
	local src = source
	local name = GetPlayerName(src)
	exports.ox_inventory:RegisterStash('moderna', "DEPOSITO", 25, 85000)
	TriggerClientEvent('moderna', src, 'moderna')
end)

