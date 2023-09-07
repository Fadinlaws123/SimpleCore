if(Config.Scripts.emergencyCalling == true) then
    if(Config.EmergencyCalling.loggingWebhook == "CHANGE ME") then
        print("[^1SimpleCore^0] ^3Make sure that you changed the webhook for the 911 script to log correctly! - @SimpleCore/Config.lua:233^0")
    else
        print("[^1SimpleCore^0] ^2911 Script hooked to discord successfully!^0")
    end
end

-- if(Config.Scripts.technicalCalling == true) then
    
--     print("[^1SimpleCore^0] ^3SimpleCore /311 Script has been disabled due to conflictions with /911! In the meantime, you are able to use /911!")
    
--     -- if(Config.EmergencyCalling.technicalCalling.loggingWebhook == "CHANGE ME") then
--     --     print("[^1SimpleCore^0] ^3Make sure that you changed the webhook for the 311 script to log correctly! - @SimpleCore/Config.lua:240^0")
--     -- else
--     --     print("[^1SimpleCore^0] ^2311 Script hooked to discord successfully!^0")
--     -- end
-- end

if(Config.Scripts.roleplayCommands == true) then
    if(Config.RoleplayCommands.roleplayCommandsLogging == "CHANGE ME") then 
        print("[^1SimpleCore^0] ^3Make sure that you changed the webhook for the roleplay commands to log correctly! - @SimpleCore/Config.lua:135^0")
    else
        print("[^1SimpleCore^0] ^2RPCommands hooked to discord successfully!^0")
    end
end