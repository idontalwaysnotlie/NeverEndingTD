-- variables
TELEPORTERS = {
--                        entrance_name = "exit_name"
--            example:    teleport_southeast = "southeast_exit",
                        P1Teleporter = "P1TeleporterExit"  
--            Remember to always put a , between lines, but not on the last line
                }

function Teleport_Hero(trigger)
    -- Find the respective exit to every entrance
    local point = Entities:FindByName( nil, TELEPORTERS[trigger.caller:GetName()] ):GetAbsOrigin()
    -- Teleport the unit
    FindClearSpaceForUnit(trigger.activator, point, false)
    -- Stop the unit or else, it might move around after being teleported.
    trigger.activator:Stop()
--[[
    print (trigger.caller:GetName())
    print ("Teleported!")
--]]
    SendToConsole("dota_camera_center") -- Camera has to follow otherwise, the player might be lost.
end
function OnStartTouch(trigger)
	if(trigger.activator:IsHero()) then
		print("players cant go through the portal silly")
		return 
	end
	print (trigger.caller:GetName())
	local inspect = require('inspect')
	local point  = Entities:FindByName( nil, trigger.caller:GetName() .."exit")
	FindClearSpaceForUnit(trigger.activator, point:GetAbsOrigin(), false)
	trigger.activator:SetInitialGoalEntity( Entities:FindByName(nil,trigger.caller:GetName().."WP"))
	trigger.activator:Stop()
	local player = "Player "..string.char(string.byte(trigger.caller:GetName(),2))
	GameRules:SendCustomMessage("<font color='#FF8888'>You have lost a life</font> please dont do that "..player, 0, 0)
end
 
function OnEndTouch(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
 
end