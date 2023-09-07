--   ______     __  __     ______     ______      ______   __     __         ______   ______     ______    
--  /\  ___\   /\ \_\ \   /\  __ \   /\__  _\    /\  ___\ /\ \   /\ \       /\__  _\ /\  ___\   /\  == \   
--  \ \ \____  \ \  __ \  \ \  __ \  \/_/\ \/    \ \  __\ \ \ \  \ \ \____  \/_/\ \/ \ \  __\   \ \  __<   
--   \ \_____\  \ \_\ \_\  \ \_\ \_\    \ \_\     \ \_\    \ \_\  \ \_____\    \ \_\  \ \_____\  \ \_\ \_\ 
--    \/_____/   \/_/\/_/   \/_/\/_/     \/_/      \/_/     \/_/   \/_____/     \/_/   \/_____/   \/_/ /_/ 
                                                                                                       

if (Config.Scripts.chatFilter == true) then
    AddEventHandler('chatMessage', function(source, n, message)
        for k,n in pairs(Config.AutoModeration.ChatFilter.filterList) do
            if string.match(message:lower(), n:lower()) then
                CancelEvent()
                if(Config.AutoModeration.ChatFilter.kickPlayer == true) then
                    DropPlayer(source, Config.AutoModeration.ChatFilter.kickMessage)
                end
            end
        end
    end)
end


--   ______   __         ______     __  __     ______     ______        _____     ______     ______     ______    
--  /\  == \ /\ \       /\  __ \   /\ \_\ \   /\  ___\   /\  == \      /\  __-.  /\  == \   /\  __ \   /\  ___\   
--  \ \  _-/ \ \ \____  \ \  __ \  \ \____ \  \ \  __\   \ \  __<      \ \ \/\ \ \ \  __<   \ \  __ \  \ \ \__ \  
--   \ \_\    \ \_____\  \ \_\ \_\  \/\_____\  \ \_____\  \ \_\ \_\     \ \____-  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
--    \/_/     \/_____/   \/_/\/_/   \/_____/   \/_____/   \/_/ /_/      \/____/   \/_/ /_/   \/_/\/_/   \/_____/ 
                                                                                                              

if (Config.Scripts.dragPeople == true) then 
    RegisterServerEvent("SimCore:DragPlayer")
    AddEventHandler("SimCore:DragPlayer", function(Target)
        local Source = source
        TriggerClientEvent("SimCore:DragPlayer", Target, Source)
    end)
end

--   ______     ______     ______     __   __   ______     ______        ______     ______   __  __    
--  /\  ___\   /\  ___\   /\  == \   /\ \ / /  /\  ___\   /\  == \      /\  __ \   /\  ___\ /\ \/ /    
--  \ \___  \  \ \  __\   \ \  __<   \ \ \'/   \ \  __\   \ \  __<      \ \  __ \  \ \  __\ \ \  _"-.  
--   \/\_____\  \ \_____\  \ \_\ \_\  \ \__|    \ \_____\  \ \_\ \_\     \ \_\ \_\  \ \_\    \ \_\ \_\ 
--    \/_____/   \/_____/   \/_/ /_/   \/_/      \/_____/   \/_/ /_/      \/_/\/_/   \/_/     \/_/\/_/ 
                                                                                                    
if (Config.Scripts.ServerAFKKick == true) then
    RegisterServerEvent("SimCore:AFKKICK")
    AddEventHandler("SimCore:AFKKICK", function()
        DropPlayer(source, Config.AutoModeration.ServerAFKKick.kickMessage)
    end)
end

--   __    __     ______     ______     ______        _____     __   __   ______    
--  /\ "-./  \   /\  __ \   /\  ___\   /\  ___\      /\  __-.  /\ \ / /  /\  __ \   
--  \ \ \-./\ \  \ \  __ \  \ \___  \  \ \___  \     \ \ \/\ \ \ \ \'/   \ \  __ \  
--   \ \_\ \ \_\  \ \_\ \_\  \/\_____\  \/\_____\     \ \____-  \ \__|    \ \_\ \_\ 
--    \/_/  \/_/   \/_/\/_/   \/_____/   \/_____/      \/____/   \/_/      \/_/\/_/ 
                                                                                

if (Config.Scripts.deleteAllVehicles == true) then
    RegisterCommand("dva", function(source, args, rawCommand)
        if(Config.VehicleControl.massVehicleDelete.restrictCommand == true) then
            if IsPlayerAceAllowed(source, "vehicle.dva") then
                TriggerClientEvent('SimCore:delallvehicles', -1)
            else
                TriggerClientEvent('SimCore:NoDVAPerms', -1)
            end
        else
            TriggerClientEvent('SimCore:delallvehicles', -1)
        end
    end, false)
end

--

AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = GetPlayerName(source)
      TriggerClientEvent("SendProximityMessage", -1, source, name, message)
    end
    CancelEvent()
end)

--

if(Config.Scripts.emergencyCalling == true) then
    RegisterServerEvent('SimCore:call911')
    AddEventHandler('SimCore:call911', function(location, msg, x, y, z, name, p)
        
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)

            if (Config.EmergencyCalling.callsInChat == true) then
                    TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
                    TriggerClientEvent('chatMessage', -1, '   ^*^5📞Incoming 911 Report: ', {0, 255, 238})
                    TriggerClientEvent('chatMessage', -1, '   ^*^5🧍[Caller Name]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
                    TriggerClientEvent('chatMessage', -1, '   ^*^5🗺️[Location]^r^7', {0, 255, 238}, location)
                    TriggerClientEvent('chatMessage', -1, '   ^*^5⚠️[Report]^r^7', {0, 255, 238}, msg)
                    TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
                end
                sendToDiscord('911 Call Logger \n', '**Caller Name: **' .. pName .. ' (' .. source .. ') \n**  Location: **' .. location .. '\n**  Report: **' .. msg)
            
            if (Config.EmergencyCalling.callBlips == true) then
                    TriggerClientEvent('SimCore:set911Blip', -1, name, x, y, z)
            end
    end)

    function sendToDiscord(name, message)
        local content = {
            {
                ["color"] = "2425087",
                ["title"] = "**New 911 Report**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "Powered by SimpleCore",
                },
            }
        }
        PerformHttpRequest(Config.EmergencyCalling.loggingWebhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end
end

--

if(Config.Scripts.chatClearing == true) then
    RegisterCommand("clearchat", function(source, args, rawCommand)
        if IsPlayerAceAllowed(source, "chat.clear") then
            TriggerClientEvent("chat:clear", -1)
            Citizen.Wait(10)
            TriggerClientEvent('chat:addMessage', -1, "[^1SimpleCore^0]: ^2Chat has been cleared by an administrator!")
            print('Chat has been cleared by ID: ' .. source .. " Name: " .. GetPlayerName(source))
        else
            TriggerClientEvent('SimCore:LackPerms', -1)
            print("A user with the ID tried to run the /clearchat script without having the proper permissions! ID: " .. source .. " Name: " .. GetPlayerName(source))
        end
    end, false)
end

--

if(Config.VehicleControl.vehicleMaintenanceScripts.fixCommand == true) then
    RegisterCommand('fix', function(source, args, rawCommand)
        local identifier = GetPlayerIdentifiers(source)[1]
        if (Config.VehicleControl.vehicleMaintenanceScripts.fixPermissions == true) then 
            if IsPlayerAceAllowed(source, "vehicle.fix") then
                TriggerClientEvent("SimCore:fixVehicle", source)
            else
                TriggerClientEvent("SimCore:nofPerms", source)
            end
        else
            TriggerClientEvent("SimCore:fixVehicle", source)
        end
    end)

end

if(Config.VehicleControl.vehicleMaintenanceScripts.cleanCommand == true) then
    RegisterCommand('clean', function(source, args, rawCommand)
        local identifier = GetPlayerIdentifiers(source)[1]
        if (Config.VehicleControl.vehicleMaintenanceScripts.cleanPermissions == true) then 
            if IsPlayerAceAllowed(source, "vehicle.clean") then
                TriggerClientEvent("SimCore:cleanVehicle", source)
            else
                TriggerClientEvent("SimCore:nocPerms", source)
            end
        else
            TriggerClientEvent("SimCore:cleanVehicle", source)
        end
    end)

end