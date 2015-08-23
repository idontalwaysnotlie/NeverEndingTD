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
	--print (trigger.caller:GetName())
	local inspect = require('inspect')
	local point  = Entities:FindByName( nil, trigger.caller:GetName() .."exit")
	FindClearSpaceForUnit(trigger.activator, point:GetAbsOrigin(), false)
	trigger.activator:SetInitialGoalEntity( Entities:FindByName(nil,trigger.caller:GetName().."WP"))
	trigger.activator:Stop()
	if trigger.activator:GetHealth()<0 then trigger.activator:RemoveSelf() print("Something dead went through the teleporter....")else
		local player = tonumber(string.char(string.byte(trigger.caller:GetName(),2)))
		local player2 = PlayerResource:GetPlayer(player-1)
		player2.lives = player2.lives-1
		if trigger.activator.boss then player2.lives = player2.lives-2 end -- bosses loose 3 lives
		if player2.lives == 0 then --kill off the player
			GameRules:SendCustomMessage("<font color='#FF8888'>Player "..player.." has Died!!!</font>", 0, 0) 
			PlayerResource:SetGold(player-1,0,false)
			PlayerResource:SetCustomBuybackCooldown(player-1,999999)
			PlayerResource:SetCustomBuybackCost(player-1,999999)
			player2:GetAssignedHero():ForceKill(false)
			player2:GetAssignedHero():GetAbilityByIndex(0):SetActivated(false)
			player2:GetAssignedHero():GetAbilityByIndex(1):SetActivated(false)
			ShowGenericPopupToPlayer(player2,"deathTitle","deathContent","","",0)
		end
		if player2.lives > 0 then GameRules:SendCustomMessage("<font color='#FF8888'>Player "..player.." has lost a life!</font> they have "..player2.lives.." left", 0, 0) end
		if player2.lives < 1 then trigger.activator:ForceKill(false) end
	end 
	
end
 
function OnEndTouch(trigger)
 
	--print(trigger.activator)
	--print(trigger.caller)
 
end