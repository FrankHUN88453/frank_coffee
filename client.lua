ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local coffee = {690372739}

-------------------Qtarget---------------
exports['qtarget']:AddTargetModel(coffee, {
    options = {
        {
            event = "coffee:buy",
            icon = "fas fa-coffee",
            label = "Kávé",
            item = "coffee",
            price = Config.KaveAr ,
        },
    },
    distance = 1.0
})

----------------KÁVÉ--------------------
RegisterNetEvent('coffee:buy')
AddEventHandler('coffee:buy',function(data)
    ESX.TriggerServerCallback('coffebuy:moneycheck', function(money)
    if money then
    Animacio()
Wait(2500)
    ESX.ShowNotification("Vettél egy kávét " .. data.price .. "$ ért.")
	TriggerServerEvent('kave')
    else
        ESX.ShowNotification("Nincs elég pénzed")
    end
    end)
end)

RegisterNetEvent('frank_coffee:kaveivas')
AddEventHandler('frank_coffee:kaveivas', function(source)
	KaveAnim() 
end)

-------Animáció------------
function Animacio()
    playAnim('anim@amb@clubhouse@jukebox@', 'insert_coins', 1000)
end

function KaveAnim()
    playAnim('amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 3000)
end

function playAnim(animDict, animName, duration)
        RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
        TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
        RemoveAnimDict(animDict)
    end

    


