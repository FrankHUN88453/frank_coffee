ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	

RegisterNetEvent('kave')
AddEventHandler('kave', function()
local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.KaveAr )
	xPlayer.addInventoryItem('coffee', 1)
end)

ESX.RegisterServerCallback('coffebuy:moneycheck', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.KaveAr  then
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterUsableItem('coffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('frank_coffee:kaveivas', source)
	Wait (3000)
	xPlayer.removeInventoryItem('coffee', 1)
	
end)