local isModified = false
local topMPH = 30.0

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(100)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, false) then
			local veh = GetVehiclePedIsUsing(ped)
			local vehWheelCount = GetVehicleNumberOfWheels(veh)
			for i = 0, vehWheelCount + 1 do
				if IsVehicleTyreBurst(veh, i, 0) and GetPedInVehicleSeat(veh, -1) == ped and not isModified then
					isModified = true
					SetVehicleMaxSpeed(veh, topMPH)
				end
			end
		else
			isModified = false
		end
 	end
 end)