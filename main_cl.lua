--[[

 ▄▄ • ▪  ▄▄▄▄▄▄▄▄▄▄ ▄▄▄· 
▐█ ▀ ▪██ •██  •██  ▐█ ▀█ 
▄█ ▀█▄▐█· ▐█.▪ ▐█.▪▄█▀▀█ 
▐█▄▪▐█▐█▌ ▐█▌· ▐█▌·▐█▪ ▐▌
·▀▀▀▀ ▀▀▀ ▀▀▀  ▀▀▀  ▀  ▀ 
      Gitta - 2022©
]]--

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterCommand("test_tint", function(source, args, raw)
	local CurrentWeapon = GetSelectedPedWeapon(PlayerPedId()) -- Get current weapon ped is equiped.
    SetPedWeaponTintIndex(PlayerPedId(), CurrentWeapon, tonumber(args[1])) -- Set the weapon tint on de currentweapon.
	ESX.ShowNotification("Succesfully added weapon tint!") -- Just a simple notification.
end)