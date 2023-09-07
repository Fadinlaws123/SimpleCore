if (Config.Scripts.roleplayCommands == true) then
    
    Citizen.CreateThread(function()
        TriggerEvent('chat:addSuggestion', '/ooc', 'Out Of Character chat Message. (Global Chat)', {
            {name = "Message", help = "Put your questions or help request."}
        })
        
        TriggerEvent('chat:addSuggestion', '/me', 'Send message in the third person. (Proximity Chat)', {
            {name = "Action", help = "action."}
        })
        
        TriggerEvent('chat:addSuggestion', '/gme', 'Send message in the third person. (Global Chat)', {
            {name = "Action", help = "action."}
        })
        
        TriggerEvent('chat:addSuggestion', '/do', 'Send action message. (Proximity Chat)', {
            {name = "Action", help = "action."}
        })
        
        -- TriggerEvent('chat:addSuggestion', '/ad', 'Send an ad in game (Global Chat)', {
        --     {name = "Message", help = "Ad Message."}
        -- })
        
        TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twotter in game. (Global Chat)', {
            {name = "Message", help = "Twotter Message."}
        })
        
        TriggerEvent('chat:addSuggestion', '/darkweb', 'Send a anonymous message in game. (Global Chat)', {
            {name = "Message", help = "Anonymous Message."}
        })
        
        TriggerEvent("chat:addSuggestion", "/dispatch", "Dispatch Units!", {
            {name = "Dispatch", help = "Take control of units by dispatching emergency services!"}
        })
        
        TriggerEvent("chat:addSuggestion", "/news", "Post anything going on in the world!", {
            {name = "News", help = "Gain the publics attention by posting more content to the news!"}
        })
        
        TriggerEvent('chat:addSuggestion', "/ame", "Anonymously share a player action!", {
            {name = "AMe", help = "Share what you are doing with others whilst staying anonymous!"}
        })
        
        TriggerEvent('chat:addSuggestion', "/discord", "Get our server's discord URL")
        
        TriggerEvent('chat:addSuggestion', "/website", "Get our server's website URL")
        
        TriggerEvent('chat:addSuggestion', "/teamspeak", "Get our teamspeak server info!")
    end)
    
    RegisterNetEvent('SendProximityMessage')
    AddEventHandler('SendProximityMessage', function(id, name, message)
        local myID = PlayerId()
        local pID = GetPlayerFromServerId(id)
        if pID == myID then
            TriggerEvent('chatMessage', "^r^*OOC | " .. name .. "^*", {128, 128, 128}, "^r " .. message)
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
            TriggerEvent('chatMessage', "^r^*OOC | " .. name .. "^*", {128, 128, 128}, "^r " .. message)
        end
    end)
    
    RegisterNetEvent('SendProximityMessageMe')
    AddEventHandler('SendProximityMessageMe', function(id, name, message)
        local myID = PlayerId()
        local pID = GetPlayerFromServerId(id)
        if pID == myID then
            TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .. "^7: " .. "^r " .. message)
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
            TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .. "^7: " .. "^r " .. message)
        end
    end)
    
    RegisterNetEvent('SendProximityMessageDo')
    AddEventHandler('SendProximityMessageDo', function(id, name, message)
        local myID = PlayerId()
        local pID = GetPlayerFromServerId(id)
        if pID == myID then
            TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .. "^7:  " .. "^r  " .. message)
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
            TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .. "^7:  " .. "^r  " .. message)
        end
    end)
end
