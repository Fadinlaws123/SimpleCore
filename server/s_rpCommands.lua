if(Config.Scripts.roleplayCommands == true) then

    if(Config.RoleplayCommands.twitterCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.twitterName, function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^0^*[^5Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
            end, false)
        else
            RegisterCommand('twt', function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^0^*[^5Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)^r", {30, 144, 255}, table.concat(args, " "))
            end, false)
        end
    end

    if(Config.RoleplayCommands.dispatchCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.dispatchName, function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "~y~DISPATCH ~w~| ~y~".. GetPlayerName(source) .."", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**DISPATCH:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        else
            RegisterCommand("dispatch", function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "~y~DISPATCH ~w~| ~y~".. GetPlayerName(source) .."", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**DISPATCH:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        end
    end

    if(Config.RoleplayCommands.darkWebCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.darkwebName, function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "~r~DARKWEB ~w~| ~r~Anonymous User~w~", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**DARKWEB:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        else
            RegisterCommand("darkweb", function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "~r~DARKWEB ~w~| ~r~Anonymous User~w~", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**DARKWEB:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        end
    end

    if(Config.RoleplayCommands.newsCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.newsName, function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "^6NEWS ~w~| ^6"..GetPlayerName(source) .. "~w~", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**NEWS:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        else
            RegisterCommand("news", function(source, args, raw)
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "^6NEWS ~w~| ^6".. GetPlayerName(source) .. "~w~", { 30, 144, 255 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**NEWS:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            end)
        end
    end

    if(Config.RoleplayCommands.doCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.doName, function(source, args, user)
                local name = GetPlayerName(source)
                TriggerClientEvent("SendProximityMessageDo", -1, source, name, table.concat(args, " "))
              end, false)
        else
            RegisterCommand('do', function(source, args, user)
                local name = GetPlayerName(source)
                TriggerClientEvent("SendProximityMessageDo", -1, source, name, table.concat(args, " "))
              end, false)
        end
    end

    if(Config.RoleplayCommands.oocCommand == true) then
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.oocName, function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^*OOC | " .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
            end, false)
        else
            RegisterCommand('ooc', function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^*OOC | " .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
            end, false)
        end
    end

    if(Config.RoleplayCommands.meCommand == true) then 
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.meName, function(source, args, user)
                local name = GetPlayerName(source)
                TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
            end, false)  
        else
            RegisterCommand('me', function(source, args, user)
                local name = GetPlayerName(source)
                TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
            end, false)
        end
    end


    if(Config.RoleplayCommands.globalMeCommand == true) then
        if(Config.RoleplayCommands.rpCommandCustom == true) then
            RegisterCommand(Config.RoleplayCommands.globalMeName, function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^3^*GLOBAL ME | ^7" .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
            end, false)
        else
            RegisterCommand('gme', function(source, args, user)
                TriggerClientEvent('chatMessage', -1, "^3^*GLOBAL ME | ^7" .. GetPlayerName(source) .. "^r", {128, 128, 128}, table.concat(args, " "))
            end, false)
        end
    end
    
    if(Config.RoleplayCommands.staffCommand == true) then
        RegisterCommand("staff", function(source, args)
            if IsPlayerAceAllowed(source, "chat.staff") then
                if #args <= 0 then
                    TriggerClientEvent('chatMessage', source, Config.RoleplayCommands.missingArgs)
                else
                    local message = table.concat(args, " ")
                    local steam = GetPlayerName(source)
                    args = table.concat(args, ' ')
                    TriggerClientEvent('chatMessage', -1, "~r~STAFF ~w~| ~r~".. GetPlayerName(source) .."~w~", { 128, 128, 128 }, message)
                    PerformHttpRequest(Config.RoleplayCommands.roleplayCommandsLogging, function(err, text, headers) end, 'POST', json.encode({username = steam, content = "**STAFF:** ".. message .."", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
                end
            else
                TriggerClientEvent('chat:addMessage', -1, "[~r~SimpleCore~w~] ~y~You lack the permissions to use the /staff command!")
                print("A user with the ID tried to run the /staff script without having the proper permissions! ID: " .. source .. " Name: " .. GetPlayerName(source))
            end
        end, false)
    end

    if(Config.RoleplayCommands.discordCommand == true) then
        RegisterCommand('discord', function()
            TriggerClientEvent('chatMessage', -1, "^*Discord Server: ^_" .. Config.RoleplayCommands.discordServerURL, {245, 191, 66})
        end)
    end
    if(Config.RoleplayCommands.websiteCommand == true) then
        RegisterCommand('website', function()
            TriggerClientEvent('chatMessage', -1, "^*Our Website: ^_" .. Config.RoleplayCommands.websiteServerURL, {245, 191, 66})
        end)
    end
    if(Config.RoleplayCommands.teamspeakCommand == true) then
        RegisterCommand('teamspeak', function()
            TriggerClientEvent('chatMessage', -1, "^*Teamspeak Info: ^_" .. Config.RoleplayCommands.teamspeakServerURL, {245, 191, 66})
        end)
    end
end