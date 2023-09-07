if (Config.Scripts.vehicleDelete == true) then
    RegisterCommand("dv", function()
        TriggerEvent("SimCore:deleteVehicle")
    end, false)

    TriggerEvent("chat:addedSuggestion", "dv", "Deletes a vehicle that you are either the driver of, or standing next to!")


    local distanceToCheck = 5.0
    local numRetries = 5

    RegisterNetEvent( "SimCore:deleteVehicle" )
    AddEventHandler( "SimCore:deleteVehicle", function()
        local ped = PlayerPedId()

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            local pos = GetEntityCoords( ped )

            if ( IsPedSittingInAnyVehicle( ped ) ) then 
                local vehicle = GetVehiclePedIsIn( ped, false )

                if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                    DeleteGivenVehicle( vehicle, numRetries )
                else 
                    Notify( "You must be in the driver's seat!" )
                end 
            else
                local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
                local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )

                if ( DoesEntityExist( vehicle ) ) then 
                    DeleteGivenVehicle( vehicle, numRetries )
                else 
                    Notify( "~y~You must be in or near a vehicle to delete it." )
                end 
            end 
        end 
    end )

    function DeleteGivenVehicle( veh, timeoutMax )
        local timeout = 0 

        SetEntityAsMissionEntity( veh, true, true )
        DeleteVehicle( veh )

        if ( DoesEntityExist( veh ) ) then
            Notify( "~r~SimpleCore failed to delete the vehicle, retrying..." )
            while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
                DeleteVehicle( veh )

                if ( not DoesEntityExist( veh ) ) then 
                    Notify( "~g~The vehicle was deleted!" )
                end 

                timeout = timeout + 1 
                Citizen.Wait( 500 )

                if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
                    Notify( "~r~SimpleCore was unable to delete the vehicle after " .. timeoutMax .. " attempts." )
                end 
            end 
        else 
            Notify( "~g~The vehicle was deleted!" )
        end 
    end 

    function GetVehicleInDirection( entFrom, coordFrom, coordTo )
        local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
        local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
        
        if ( IsEntityAVehicle( vehicle ) ) then 
            return vehicle
        end 
    end

    function Notify( text )
        SetNotificationTextEntry( "STRING" )
        AddTextComponentString( text )
        DrawNotification( false, false )
    end
end
--

if(Config.Scripts.playerHandsUp == true) then
    Citizen.CreateThread(function()
        local dict = "missminuteman_1ig_2"
        
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        local handsup = false
        while true do
            Citizen.Wait(0)
            if IsControlJustPressed(1, 323) then --Start holding X
                if not handsup then
                    TaskPlayAnim(PlayerPedId(), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
                    handsup = true
                else
                    handsup = false
                    ClearPedTasks(PlayerPedId())
                end
            end
        end
    end)
end

--

if(Config.Scripts.serverWatermark == true) then 
    Citizen.CreateThread(function()
        while true do
            Wait(1)
            SetTextColour(129, 45, 211, Config.Watermark.alpha)
            SetTextFont(Config.Watermark.textFont)
            SetTextScale(Config.Watermark.scale, Config.Watermark.scale)
            SetTextWrap(0.0, 1.0)
            SetTextCentre(false)
            SetTextDropshadow(2, 2, 0, 0, 0)
            SetTextEdge(1, 0, 0, 0, 205)
            SetTextEntry("STRING")
            AddTextComponentString(Config.Watermark.name)
            DrawText(Config.Watermark.offsetX, Config.Watermark.offsetY)
        end
    end)
end

--

if(Config.Scripts.dragPeople == true) then
        local Drag = {
	Distance = 3,
	Dragging = false,
	Dragger = -1,
	Dragged = false,
}

function Drag:GetPlayers()
	local Players = {}
    
	for Index = 0, 255 do
		if NetworkIsPlayerActive(Index) then
			table.insert(Players, Index)
		end
	end

    return Players
end

function Drag:GetClosestPlayer()
    local Players = self:GetPlayers()
    local ClosestDistance = -1
    local ClosestPlayer = -1
    local PlayerPed = PlayerPedId()
    local PlayerPosition = GetEntityCoords(PlayerPed, false)
    
    for Index = 1, #Players do
    	local TargetPed = GetPlayerPed(Players[Index])
    	if PlayerPed ~= TargetPed then
    		local TargetCoords = GetEntityCoords(TargetPed, false)
    		local Distance = #(PlayerPosition - TargetCoords)

    		if ClosestDistance == -1 or ClosestDistance > Distance then
    			ClosestPlayer = Players[Index]
    			ClosestDistance = Distance
    		end
    	end
    end
    
    return ClosestPlayer, ClosestDistance
end

RegisterNetEvent("SimCore:DragPlayer")
AddEventHandler("SimCore:DragPlayer", function(Dragger)
	Drag.Dragging = not Drag.Dragging
	Drag.Dragger = Dragger
end)

RegisterCommand("drag", function(source, args, fullCommand)
	local Player, Distance = Drag:GetClosestPlayer()

	if Distance ~= -1 and Distance < Drag.Distance then
		TriggerServerEvent("SimCore:DragPlayer", GetPlayerServerId(Player))
	else
		TriggerEvent("chat:addMessage", {
			color = {255, 0, 0},
			multiline = true,
			args = {"Government", "Please get closer to the target!"},
		})
	end
end, false)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if NetworkIsSessionStarted() then
			TriggerEvent("chat:addSuggestion", "/drag", "Drag the closest player")
			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Drag.Dragging then
			local PlayerPed = PlayerPedId()

			Drag.Dragged = true
			AttachEntityToEntity(PlayerPed, GetPlayerPed(GetPlayerFromServerId(Drag.Dragger)), 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		else
			if Drag.Dragged then
				local PlayerPed = PlayerPedId()

				if not IsPedInParachuteFreeFall(PlayerPed) then
					Drag.Dragged = false
					DetachEntity(PlayerPed, true, false)    
				end
			end
		end
	end
end)
end

--

if(Config.Scripts.crouchDown == true) then
    local crouched = false
    
    Citizen.CreateThread( function()
        while true do 
            Citizen.Wait(1)
            local ped = PlayerPedId()
            if (DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped)) then 
                DisableControlAction( 0, 36, true )
                if ( not IsPauseMenuActive() ) then 
                    if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                        RequestAnimSet( "move_ped_crouched" )
                        while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                            Citizen.Wait( 100 )
                        end 
                        if ( crouched == true ) then 
                            ResetPedMovementClipset( ped, 0 )
                            crouched = false 
                        elseif ( crouched == false ) then
                            SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                            crouched = true 
                        end 
                    end
                end 
            end 
        end
    end)
end

--

if(Config.Scripts.tazerEffects == true) then
    local isTaz = false
    Citizen.CreateThread(function()
       while true do 
        Citizen.Wait(5)
        ped = PlayerPedId()

            if IsPedBeingStunned(ped) then
                SetPedToRagdoll(ped, 5000, 5000, 0, 0, 0, 0)
            end

            if IsPedBeingStunned(ped) and not isTaz then
                isTaz = true
                SetTimeCycleModifier("REDMIST_blend")
                ShakeGameplayCam("FANILY5_DRUG_TRIP_SHAKE", 1.0)

            elseif not IsPedBeingStunned(ped) and isTaz then
                isTaz = false
                Wait(5000)

                SetTimeCycleModifier("hud_def_desat_Trevor")

                Wait(10000)

                SetTimeCycleModifier("")
                SetTransitionTimecycleModifier("")
                StopGameplayCamShaking()
            end
        end
    end)
end

--

if(Config.Scripts.disableReticle == true) then
    local scopedWeapons = 
    {
        100416529,
        205991906,
        3342088282
    }
    
    function HashInTable( hash )
        for k, v in pairs( scopedWeapons ) do 
            if ( hash == v ) then 
                return true 
            end 
        end 
    
        return false 
    end 
    
    function ManageReticle()
        local ped = PlayerPedId()
    
        if ( DoesEntityExist(ped) and not IsEntityDead(ped)) then
            local _, hash = GetCurrentPedWeapon(ped, true)
    
            if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and not HashInTable(hash)) then 
                HideHudComponentThisFrame(14)
            end 
        end 
    end 
    
    Citizen.CreateThread(function()
        while true do 
        
            HideHudComponentThisFrame(14)		
            Citizen.Wait(0)
    
        end 
    end)
end

--

if(Config.Scripts.ragdollDamage == true) then
    local BONES = {
        --[[Pelvis]][11816] = true,
        --[[SKEL_L_Thigh]][58271] = true,
        --[[SKEL_L_Calf]][63931] = true,
        --[[SKEL_L_Foot]][14201] = true,
        --[[SKEL_L_Toe0]][2108] = true,
        --[[IK_L_Foot]][65245] = true,
        --[[PH_L_Foot]][57717] = true,
        --[[MH_L_Knee]][46078] = true,
        --[[SKEL_R_Thigh]][51826] = true,
        --[[SKEL_R_Calf]][36864] = true,
        --[[SKEL_R_Foot]][52301] = true,
        --[[SKEL_R_Toe0]][20781] = true,
        --[[IK_R_Foot]][35502] = true,
        --[[PH_R_Foot]][24806] = true,
        --[[MH_R_Knee]][16335] = true,
        --[[RB_L_ThighRoll]][23639] = true,
        --[[RB_R_ThighRoll]][6442] = true,
    }
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
                if HasEntityBeenDamagedByAnyPed(ped) then
                        Disarm(ped)
                end
                ClearEntityLastDamageEntity(ped)
         end
    end)
    
    function Bool(num) return num == 1 or num == true end
    local function GetDisarmOffsetsForPed (ped)
        local v
    
        if IsPedWalking(ped) then v = { 0.6, 4.7, -0.1 }
        elseif IsPedSprinting(ped) then v = { 0.6, 5.7, -0.1 }
        elseif IsPedRunning(ped) then v = { 0.6, 4.7, -0.1 }
        else v = { 0.4, 4.7, -0.1 } end
    
        return v
    end

    function Disarm(ped)
        if IsEntityDead(ped) then return false end
    
        local boneCoords
        local hit, bone = GetPedLastDamageBone(ped)
    
        hit = Bool(hit)
    
        if hit then
            if BONES[bone] then
                
    
                boneCoords = GetWorldPositionOfEntityBone(ped, GetPedBoneIndex(ped, bone))
                SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
                
    
                return true
            end
        end
        return false
    end
end

--

if(Config.Scripts.playerPointing == true) then
    local mp_pointing = false
    local keyPressed = false
    
    local function startPointing()
        local ped = PlayerPedId()
        RequestAnimDict("anim@mp_point")
        while not HasAnimDictLoaded("anim@mp_point") do
            Wait(0)
        end
        SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
        SetPedConfigFlag(ped, 36, 1)
        Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
        RemoveAnimDict("anim@mp_point")
    end
    
    local function stopPointing()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
        if not IsPedInjured(ped) then
            ClearPedSecondaryTask(ped)
        end
        if not IsPedInAnyVehicle(ped, 1) then
            SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
        end
        SetPedConfigFlag(ped, 36, 0)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
    local once = true
    local oldval = false
    local oldvalped = false
    
    Citizen.CreateThread(function()
        while true do
            Wait(0)
    
            if once then
                once = false
            end
    
            if not keyPressed then
                if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                    Wait(200)
                    if not IsControlPressed(0, 29) then
                        keyPressed = true
                        startPointing()
                        mp_pointing = true
                    else
                        keyPressed = true
                        while IsControlPressed(0, 29) do
                            Wait(50)
                        end
                    end
                elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                    keyPressed = true
                    mp_pointing = false
                    stopPointing()
                end
            end
    
            if keyPressed then
                if not IsControlPressed(0, 29) then
                    keyPressed = false
                end
            end
            if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
                stopPointing()
            end
            if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
                if not IsPedOnFoot(PlayerPedId()) then
                    stopPointing()
                else
                    local ped = PlayerPedId()
                    local camPitch = GetGameplayCamRelativePitch()
                    if camPitch < -70.0 then
                        camPitch = -70.0
                    elseif camPitch > 42.0 then
                        camPitch = 42.0
                    end
                    camPitch = (camPitch + 70.0) / 112.0
    
                    local camHeading = GetGameplayCamRelativeHeading()
                    local cosCamHeading = Cos(camHeading)
                    local sinCamHeading = Sin(camHeading)
                    if camHeading < -180.0 then
                        camHeading = -180.0
                    elseif camHeading > 180.0 then
                        camHeading = 180.0
                    end
                    camHeading = (camHeading + 180.0) / 360.0
    
                    local blocked = 0
                    local nn = 0
    
                    local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                    local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                    nn,blocked,coords,coords = GetRaycastResult(ray)
    
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
    
                end
            end
        end
    end)
end

--

if(Config.Scripts.playerClumsy == true) then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(200)
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
                local chance_result = math.random()
                if chance_result < Config.Scripts.playerClumsyChance then 
                    Citizen.Wait(600)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.00)
                    SetPedToRagdoll(ped, 5000, 1, 2)
                else
                    Citizen.Wait(2000)
                end
            end
        end
    end)
end

-- 

if(Config.Scripts.airControl == true) then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(veh) and not IsEntityDead(veh) then
                local model = GetEntityModel(veh)
                if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and IsEntityInAir(veh) then
                    DisableControlAction(0, 59)
                    DisableControlAction(0, 60)
                end
            end
        end
    end)
end

--

if(Config.Scripts.serverPVP == true) then
    AddEventHandler("playerspawned", function()
       NetWorkSetFriendlyFireOption(true)
       SetCanAttackFriendly(PlayerPedId(), true, true) 
    end)
end

--
if(Config.Scripts.serverAFKKick == true) then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            playerPed = PlayerPedId()
            if playerPed then
                currentPos = GetEntityCoords(playerPed, true)
                if currentPos == prevPos then
                    if time > 0 then
                        if Config.AutoModeration.ServerAFKKick.kickWarning and time == math.ceil(Config.AutoModeration.ServerAFKKick.timeUntilKicked / 4) then
                            Notify('~r~WARNING: You will be kicked in ~y~'.. time .. ' ~r~seconds for being AFK!' )
                        end
                        time = time - 1
                    else
                        TriggerServerEvent("SimCore:AFKKICK")
                    end
                else
                    time = Config.AutoModeration.ServerAFKKick.timeUntilKicked
                end
                prevPos = currentPos
            end
        end
    end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
end
--

if(Config.Scripts.deleteAllVehicles == true) then 
    local delay2 = Config.VehicleControl.massVehicleDelete.commandDelay * 1000
    RegisterNetEvent("SimCore:delallvehicles")
    AddEventHandler("SimCore:delallvehicles", function ()
        TriggerEvent('chat:addMessage', Config.VehicleControl.massVehicleDelete.delayMessage)
        Wait(delay2)
        TriggerEvent('chat:addMessage', Config.VehicleControl.massVehicleDelete.deleteMessage)
        local totalvehc = 0
        local notdelvehc = 0

        for vehicle in EnumerateVehicles() do
            if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) DeleteVehicle(vehicle)
                if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
                if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
            end
            totalvehc = totalvehc + 1 
        end
    end)

    RegisterNetEvent('SimCore:NoDVAPerms')
    AddEventHandler('SimCore:NoDVAPerms', function(source, args, rawCommand)
        Notify('~y~You do not have permission to run ~r~/dva!')
    end)
    
    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

--

if(Config.Scripts.ignoreWantedLevel == true) then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for i = 1, 12 do
                EnableDispatchService(i, false)
            end
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
            SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
        end
    end)
end

--

if(Config.Scripts.removeParkedCars == true) then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(20)
    
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed) 
            RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
            SetGarbageTrucks(0)
            SetRandomBoats(0)
        end
    end)
end

--

if(Config.Scripts.autoMessages == true) then
    local timeout = Config.AutoMessages.messageDelay * 1000 * 60
    Citizen.CreateThread(function()
        while true do
            function chat(i)
                TriggerEvent('chat:addMessage', {color = {255, 255, 255}, multiline = false, args = {Config.AutoMessages.messagePrefix, Config.AutoMessages.serverMessages[i]}})
            end
            for i in pairs(Config.AutoMessages.serverMessages) do
                chat(i)
                Citizen.Wait(timeout)
            end

            Citizen.Wait(50)
        end
    end)
end

--

if(Config.Scripts.emergencyCalling == true) then
    if (Config.EmergencyCalling.chatSuggestion == true) then
        TriggerEvent("chat:addSuggestion", "/911", "Report a crime!", {
            { name = "Report", help = "Enter your report here!"}
        })
    end
        
        RegisterCommand('911', function(source, args)
            
        local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')
        
            if args[1] == nil then
                TriggerEvent('chat:addMessage', {color = {255, 255, 255}, multiline = false, args = {'[^1SimpleCore^0]: What is the nature and location of your emergency?'}})
            end
            if args[1] ~= nil then
                TriggerServerEvent('SimCore:call911', location, msg, x, y, z, name)
            end
        end)
        
        RegisterNetEvent('SimCore:set911Blip')
        AddEventHandler('SimCore:set911Blip', function(name, x, y, z)
        
        blip = nil
        blips = {}
        
        local blip = AddBlipForRadius(x, y, z, Config.EmergencyCalling.blipRadius)
        
            SetBlipHighDetail(blip, true)
            SetBlipColour(blip, 3)
            SetBlipAlpha (blip, 128)
        
        local blip1 = AddBlipForCoord(x, y, z)
        
            SetBlipSprite (blip1, sprite)
            SetBlipDisplay(blip1, true)
            SetBlipScale  (blip1, 0.9)
            SetBlipColour (blip1, 3)
            SetBlipAsShortRange(blip1, true)
        
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("911 - " .. name)
            EndTextCommandSetBlipName(blip1)
            table.insert(blips, blip1)
            Wait(Config.EmergencyCalling.blipTime * 1000)
            for i, blip1 in pairs(blips) do 
                RemoveBlip(blip)
                RemoveBlip(blip1)
        
            end
        end)
end

--

if(Config.Scripts.vehicleBrakeLights == true) then
    local brakeLightSpeedThresh = 0.25

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            local player = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(player, false)
            
            if(vehicle ~= nil) and (GetEntitySpeed(vehicle) <= brakeLightSpeedThresh) then
                SetVehicleBrakeLights(vehicle, true)
            end
        end
    end)
end

-- 

if(Config.Scripts.vehicleSaveTires == true) then 
    Citizen.CreateThread(function()
        local angle = 0.0
        local speed = 0.0

        while true do 
            Citizen.Wait(0)
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            if DoesEntityExist(veh) then 
                local tangle = GetVehicleSteeringAngle(veh)
                if tangle > 10.0 or tangle < -10.0 then
                    angle = tangle
                end
                speed = GetEntitySpeed(veh)
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                if speed < 0.1 and DoesEntityExist(vehicle) and not GetIsTaskActive(PlayerPedId(), 151) and not GetIsVehicleEngineRunning(vehicle) then
                    SetVehicleSteeringAngle(GetVehiclePedIsIn(PlayerPedId(), true), angle)
                end
            end
        end
    end)
end

--

if(Config.VehicleControl.vehicleDoorControl.engineCommand == true) then

    TriggerEvent('chat:addSuggestion', '/eng', 'Turn on / off your vehicle\'s Engine!')

        RegisterCommand('eng', function(source, args, rawCommand)
            local Veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local playerPed = GetPlayerPed(-1)
            if IsPedInAnyVehicle(playerPed, false) then
                if Veh ~= nil and Veh ~= 0 and GetPedInVehicleSeat(Veh, 0) then
                    SetVehicleEngineOn(Veh, (not GetIsVehicleEngineRunning(Veh)), false, true)
                    Notify('~g~Engine toggled!')
                end
            else
                Notify('~r~You must be in a vehicle to toggle the engine!')
            end
        end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
end

--

if(Config.VehicleControl.vehicleDoorControl.trunkCommand == true) then

    TriggerEvent('chat:addSuggestion', '/trunk', 'Open / Close your vehicle\'s Trunk!')

    RegisterCommand('trunk', function(source, args, rawCommand)
        local Veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            if Veh ~= nil and Veh ~= 0 and Veh ~= 1 then
                if GetVehicleDoorAngleRatio(Veh, 5) > 0 then
                    SetVehicleDoorShut(Veh, 5, false)
                else
                    SetVehicleDoorOpen(Veh, 5, false, false)
                end
            end
            Notify("~g~Your trunk was toggled!")
        else
            Notify('~r~You must be in a vehicle in order to toggle the trunk!')
        end
    end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
end

--

if(Config.VehicleControl.vehicleDoorControl.hoodCommand == true) then

    TriggerEvent('chat:addSuggestion', '/hood', 'Open / Close your vehicle\'s Hood!')

    RegisterCommand('hood', function(source, args, rawCommand)
        local Veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            if Veh ~= nil and Veh ~= 0 and Veh ~= 1 then
                if GetVehicleDoorAngleRatio(Veh, 4) > 0 then
                    SetVehicleDoorShut(Veh, 4, false)
                else
                    SetVehicleDoorOpen(Veh, 4, false, false)
                end
            end
            Notify('~g~Your hood was toggled!')
        else
            Notify('~r~You must be in a vehicle to toggle the hood!')
        end
    end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, false)
    end
end

--

if(Config.VehicleControl.vehicleMaintenanceScripts.fixCommand == true) then 

    TriggerEvent('chat:addSuggestion', '/fix', 'Fix your vehicle', {
        {name = "Fix", help = "Remove any damages / Mud splashes on your vehicle."}
    })

    RegisterNetEvent("SimCore:fixVehicle")
    AddEventHandler("SimCore:fixVehicle", function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if vehicle ~= nil then
            SetVehicleEngineHealth(vehicle, 1000)
            SetVehicleEngineOn( vehicle, true, true )
            SetVehicleFixed(vehicle)
            Notify("~g~Your vehicle has been fixed!")
        else
            Notify("~r~You must be in a vehicle to fix one!")
        end
    end)

    RegisterNetEvent('SimCore:nofPerms')
    AddEventHandler('SimCore:nofPerms', function()
        Notify("~r~You lack permissions to run /fix!")
    end)
    
    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

if(Config.VehicleControl.vehicleMaintenanceScripts.cleanCommand == true) then

    TriggerEvent('chat:addSuggestion', '/clean', 'Clean your vehicle', {
        {name = "Clean", help = "Remove any dirt from your vehicle."}
    })

    RegisterNetEvent("SimCore:cleanVehicle")
    AddEventHandler("SimCore:cleanVehicle", function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if vehicle ~= nil then
            SetVehicleDirtLevel(vehicle, 0)
            Notify("~g~Your vehicle has been cleaned!")
        else
            Notify("~r~You must be in a vehicle to clean one!")
        end
    end)

    RegisterNetEvent('SimCore:nocPerms')
    AddEventHandler('SimCore:nocPerms', function()
        Notify("~r~You lack permissions to run /clean!")
    end)
    
    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

--

if(Config.Scripts.mapBlips == true) then
    Citizen.CreateThread(function()
        for _, info in pairs(Config.MapBlips) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, 0.9)
            SetBlipColour(info.blip, info.colour)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
        end
    end)
end

--

if(Config.Scripts.antiCombatRolling == true) then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsPedArmed(GetPlayerPed(-1), 4 | 2) and IsControlPressed(0, 25) then
                DisableControlAction(0, 22, true)
            end
        end
    end)
end

if(Config.Scripts.dropWeapon == true) then 

    TriggerEvent('chat:addSuggestion', '/dropweapon', 'Drops Weapon in Hand')

    RegisterCommand('dropweapon', function(source, args, rawCommand)
        local CurrentWeapon = GetSelectedPedWeapon(PlayerPedId())
        SetPedDropsInventoryWeapon(PlayerPedId(), CurrentWeapon, -2.0, 0.0, 0.5, 30)
        Notify('~r~Weapon Dropped on the ground!')
    end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

if(Config.Scripts.clearInventory == true) then

    TriggerEvent('chat:addSuggestion', '/clear', 'Clears all Weapons')

    RegisterCommand('clear', function(source, args, rawCommand)
        SetEntityHealth(PlayerPedId(), 200)
        SetPedArmour(PlayerPedId(), 0)
        RemoveAllPedWeapons(PlayerPedId(), true)
        Notify('~r~All Weapons Cleared!')
    end)

    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

if(Config.Scripts.chatClearing == true) then
    RegisterNetEvent('SimCore:LackPerms')
    AddEventHandler('SimCore:LackPerms', function(source, args, rawCommand)
        Notify('~y~You do not have permission to run ~r~/clearchat!')
    end)
    function Notify(text)
        SetNotificationTextEntry("STRING")
	    AddTextComponentString(text)
	    DrawNotification(false, false)
    end
end

if(Config.Scripts.persistantFlashlight == true) then 
    SetFlashLightKeepOnWhileMoving(true)
end