-- The following three functions are necessary for building helper.

function testme (keys)
	if keys.split_shot_projectile then SplitShotLaunch(keys) else SplitShotDamage(keys) end
end
function ChainLightning( keys )
	ChainLightning2(keys)
end

function build( keys )
    local player = keys.caster:GetPlayerOwner()
    local pID = player:GetPlayerID()
    local ability = keys.ability
	
	

    -- We don't want to charge the player resources at this point
    -- This is only relevent for abilities that use AbilityGoldCost
    local goldCost = keys.ability:GetGoldCost(-1)
    PlayerResource:ModifyGold(pID, goldCost, false, 7) 
    ability:EndCooldown()
	

    BuildingHelper:AddBuilding(keys)

    keys:OnBuildingPosChosen(function(vPos)
        --print("OnBuildingPosChosen")
        -- in WC3 some build sound was played here.
    end)

    keys:OnPreConstruction(function ()
        -- Use this function to check/modify player resources before the construction begins
        -- Return false to abort the build. It cause OnConstructionFailed to be called
        if PlayerResource:GetGold(pID) < goldCost then
            return false
        end

        PlayerResource:ModifyGold(pID, -1 * goldCost, false, 7)
    end)

    keys:OnConstructionStarted(function(unit)
        -- This runs as soon as the building is created
        FindClearSpaceForUnit(keys.caster, keys.caster:GetAbsOrigin(), true)
        ability:StartCooldown(ability:GetCooldown(-1))

    end)
    keys:OnConstructionCompleted(function(unit)
        -- Play construction complete sound.
        -- Give building its abilities
        -- add the mana
        unit:SetMana(unit:GetMaxMana())
		--unit:setBuildingCost(goldCost)
		
    end)

    -- These callbacks will only fire when the state between below half health/above half health changes.
    -- i.e. it won't unnecessarily fire multiple times.
    keys:OnBelowHalfHealth(function(unit)
    end)

    keys:OnAboveHalfHealth(function(unit)

    end)

    keys:OnConstructionFailed(function( building )
        -- This runs when a building cannot be placed, you should refund resources if any. building is the unit that would've been built.
    end)

    keys:OnConstructionCancelled(function( building )
        -- This runs when a building is cancelled, building is the unit that would've been built.
    end)

    -- Have a fire effect when the building goes below 50% health.
    -- It will turn off it building goes above 50% health again.
    keys:EnableFireEffect("modifier_jakiro_liquid_fire_burn")
end

function building_canceled( keys )
    BuildingHelper:CancelBuilding(keys)
end

function create_building_entity( keys )
    BuildingHelper:InitializeBuildingEntity(keys)
end

function sell(keys)
	local caster = keys.caster  
	local pp = PlayerResource:GetPlayer(caster:GetMainControllingPlayer())
	if pp and caster.GoldCost then 
		pp.activeBuilder:SetGold(pp.activeBuilder:GetGold()+caster.GoldCost,false)
	end
	if caster then 
		BuildingHelper:RemoveBuilding(caster, true)
	end
end

function test(keys)
	print("test was called")
end

function Upgrade(keys)
	local caster = keys.caster 
	caster:Purge(true,true,true,true,true)
	caster:RemoveEffects(1)
	caster:RemoveEffects(0)
	caster:RemoveEffects(-1)
    local pID = caster:GetMainControllingPlayer()
	local player = PlayerResource:GetPlayer(pID)
    local ability = keys.ability
	local BuildingCost = keys.ability:GetGoldCost(-1)
	if keys.NoElements then BuildingCost = BuildingCost/2 end
	caster.GoldCost = caster.GoldCost + BuildingCost
	if keys.ChangeScale ~= nil then
		caster:SetModelScale(keys.ChangeScale)
		print ("Scale changed")
	end
	if keys.BonusDamage ~= nil then
		caster:SetBaseDamageMax(caster:GetBaseDamageMax() + keys.BonusDamage)
		caster:SetBaseDamageMin(caster:GetBaseDamageMin() + keys.BonusDamage)
	end
	if keys.ChangeBAS ~= nil then
		caster:SetBaseAttackTime(keys.ChangeBAS)
		print ("BAS changed")
	end
	if keys.Ability1 ~=nil then
		if caster:GetAbilityByIndex(0) ~= nil then caster:RemoveAbility(caster:GetAbilityByIndex(0):GetName()) end
		if keys.Ability1 ~= "" then caster:AddAbility(keys.Ability1)end
		print ("Abiltiy1 changed")
	end 
	if keys.Ability2 ~=nil then
		if caster:GetAbilityByIndex(1) ~= nil then caster:RemoveAbility(caster:GetAbilityByIndex(1):GetName()) end
		if keys.Ability2 ~= "" then caster:AddAbility(keys.Ability2)end
		print ("Abiltiy2 changed")
	end 
	if keys.Ability3 ~=nil then
		if caster:GetAbilityByIndex(2) ~= nil then caster:RemoveAbility(caster:GetAbilityByIndex(2):GetName()) end
		if keys.Ability3 ~= "" then caster:AddAbility(keys.Ability3)end
		print ("Abiltiy3 changed")
	end 
	if keys.Ability4 ~=nil then
		if caster:GetAbilityByIndex(3) ~= nil then caster:RemoveAbility(caster:GetAbilityByIndex(3):GetName()) end
		if keys.Ability4 ~= "" then caster:AddAbility(keys.Ability4)end
		print ("Abiltiy4 changed")
	end 
	if keys.changeModel ~= nil then
		caster:setModel(keys.changeModel)
		print ("model updated")
	end
	if caster:GetAbilityByIndex(0) ~= nil then caster:GetAbilityByIndex(0):UpgradeAbility(true) end
	if caster:GetAbilityByIndex(1) ~= nil then caster:GetAbilityByIndex(1):UpgradeAbility(true) end
	if caster:GetAbilityByIndex(2) ~= nil then caster:GetAbilityByIndex(2):UpgradeAbility(true) end
	if caster:GetAbilityByIndex(3) ~= nil then caster:GetAbilityByIndex(3):UpgradeAbility(true) end
	if keys.autocast ~= nil then caster:GetAbilityByIndex(keys.autocast):ToggleAutoCast() end
	--caster:AddItemByName("item_greater_clarity")
	--player:GetAssignedHero():AddItemByName("item_greater_clarity")
	if keys.Projectile ~= nil then 
		caster:SetRangedProjectileName(keys.Projectile) 
		print ("projectile changed to:"..keys.Projectile)
	end
	if keys.Elements ~= nil then 
		caster:AddItemByName("item_Element_Light")
		caster:AddItemByName("item_Element_Flame")
		caster:AddItemByName("item_Element_Nature")
		caster:AddItemByName("item_Element_Dark")
		caster:AddItemByName("item_Element_Water")
		caster:AddItemByName("item_Element_Earth")
		print ("added elements")
	end
	if keys.NoElements ~= nil then 
		caster:RemoveItem(caster:GetItemInSlot(0))
		caster:RemoveItem(caster:GetItemInSlot(1))
		caster:RemoveItem(caster:GetItemInSlot(2))
		caster:RemoveItem(caster:GetItemInSlot(3))
		caster:RemoveItem(caster:GetItemInSlot(4))
		caster:RemoveItem(caster:GetItemInSlot(5))
	end
	if keys.item1 then caster:AddItemByName(keys.item1) end
	if keys.item2 then caster:AddItemByName(keys.item2) end
	if keys.item3 then caster:AddItemByName(keys.item3) end
	if keys.item4 then caster:AddItemByName(keys.item4) end
	if keys.item5 then caster:AddItemByName(keys.item5) end
	if keys.item6 then caster:AddItemByName(keys.item6) end
	if keys.test ~= nil then print("test item clicked") end
	if keys.Vision ~= nil then 
		caster:SetNightTimeVisionRange(keys.Vision) 
		caster:SetDayTimeVisionRange(keys.Vision) 
		print ("vision set to "..keys.Vision)
	end
	if keys.Orb ~= nil then
		invoker_replace_orb(keys, Orb)
		invoker_replace_orb(keys, Orb)
		invoker_replace_orb(keys, Orb)
	end 
	print("upgrade complete")
end

function builder_queue( keys )
    local caster = keys.caster  

    if caster.ProcessingBuilding ~= nil then
        -- caster is probably a builder, stop them
        player = PlayerResource:GetPlayer(caster:GetMainControllingPlayer())
        player.activeBuilding = nil
        if player.activeBuilder and IsValidEntity(player.activeBuilder) then
            player.activeBuilder:ClearQueue()
            player.activeBuilder:Stop()
            player.activeBuilder.ProcessingBuilding = false
        end
    end
end


function SplitShotLaunch( keys )
	local caster = keys.caster
	local caster_location = caster:GetAbsOrigin()
	local ability = keys.ability

	-- Targeting variables
	local target_type = ability:GetAbilityTargetType()
	local target_team = ability:GetAbilityTargetTeam()
	local target_flags = ability:GetAbilityTargetFlags()
	local attack_target = caster:GetAttackTarget()

	-- Ability variables
	local radius = 800
	if keys.radius then radius = keys.radius end
	local max_targets = 4
	if keys.maxTargets then max_targets = keys.maxTargets end
	local projectile_speed = 1500
	if keys.projectileSpeed then projectile_speed = keys.projectileSpeed end
	local split_shot_projectile = keys.split_shot_projectile

	local split_shot_targets = FindUnitsInRadius(target_team, caster_location, nil, radius, caster:GetTeam(), DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false)
	
	-- Create projectiles for units that are not the casters current attack target
	for _,v in pairs(split_shot_targets) do
		if v ~= attack_target then
			local projectile_info = 
			{
				EffectName = split_shot_projectile,
				Ability = ability,
				vSpawnOrigin = caster_location,
				Target = v,
				Source = caster,
				bHasFrontalCone = false,
				iMoveSpeed = projectile_speed,
				bReplaceExisting = false,
				bProvidesVision = false
			}
			ProjectileManager:CreateTrackingProjectile(projectile_info)
			max_targets = max_targets - 1
		end
		-- If we reached the maximum amount of targets then break the loop
		if max_targets == 0 then break end
	end
end

-- Apply the auto attack damage to the hit unit
function SplitShotDamage( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability

	local damage_table = {}
	
	damage_table.attacker = caster
	damage_table.victim = target
	damage_table.damage_type = ability:GetAbilityDamageType()
	damage_table.damage = caster:GetAttackDamage()
	ApplyDamage(damage_table)
end

function ChainLightning2( event )
	local hero = event.caster
	local target = event.target
	local ability = event.ability

	local damage = event.damage
	local bounces = event.bounces
	local bounce_range = event.range
	local decay = event.decay
	local time_between_bounces = 0.1

	local lightningBolt = ParticleManager:CreateParticle("particles/items_fx/chain_lightning.vpcf", PATTACH_WORLDORIGIN, hero)
	ParticleManager:SetParticleControl(lightningBolt,0,Vector(hero:GetAbsOrigin().x,hero:GetAbsOrigin().y,hero:GetAbsOrigin().z + hero:GetBoundingMaxs().z ))	
	ParticleManager:SetParticleControl(lightningBolt,1,Vector(target:GetAbsOrigin().x,target:GetAbsOrigin().y,target:GetAbsOrigin().z + target:GetBoundingMaxs().z ))	
	--ParticleManager:SetParticleControlEnt(lightningBolt, 1, target, 1, "attach_hitloc", target:GetAbsOrigin(), true)

	EmitSoundOn("Hero_Zuus.ArcLightning.Target", target)	
	ApplyDamage({ victim = target, attacker = hero, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL })
	PopupDamage(target,math.floor(damage))

	-- Every target struck by the chain is added to a list of targets struck, And set a boolean inside its index to be sure we don't hit it twice.
	local targetsStruck = {}
	target.struckByChain = true
	table.insert(targetsStruck,target)

	local dummy = nil
	local units = nil

	Timers:CreateTimer(DoUniqueString("ChainLightning"), {
		endTime = time_between_bounces,
		callback = function()
	
			-- unit selection and counting
			units = FindUnitsInRadius(hero:GetTeamNumber(), target:GetOrigin(), target, bounce_range, DOTA_UNIT_TARGET_TEAM_ENEMY, 
						DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, true)

			-- particle and dummy to start the chain
			targetVec = target:GetAbsOrigin()
			targetVec.z = target:GetAbsOrigin().z + target:GetBoundingMaxs().z
			dummy = CreateUnitByName("dummy_unit", targetVec, false, hero, hero, hero:GetTeam())

			-- Track the possible targets to bounce from the units in radius
			local possibleTargetsBounce = {}
			for _,v in pairs(units) do
				if not v.struckByChain then
					table.insert(possibleTargetsBounce,v)
				end
			end

			-- Select one of those targets at random
			target = possibleTargetsBounce[math.random(1,#possibleTargetsBounce)]
			if target then
				target.struckByChain = true
				table.insert(targetsStruck,target)		
			else
				-- There's no more targets left to bounce, clear the struck table and end
				for _,v in pairs(targetsStruck) do
				    v.struckByChain = false
				    v = nil
				end
				dummy:RemoveSelf()
				return	
			end


			local lightningChain = ParticleManager:CreateParticle("particles/items_fx/chain_lightning.vpcf", PATTACH_WORLDORIGIN, dummy)
			ParticleManager:SetParticleControl(lightningChain,0,Vector(dummy:GetAbsOrigin().x,dummy:GetAbsOrigin().y,dummy:GetAbsOrigin().z + dummy:GetBoundingMaxs().z ))	
			dummy:RemoveSelf()
			-- damage and decay
			damage = damage - (damage*decay)
			ApplyDamage({ victim = target, attacker = hero, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL })
			PopupDamage(target,math.floor(damage))

			-- play the sound
			EmitSoundOn("Hero_Zuus.ArcLightning.Target",target)

			-- make the particle shoot to the target
			ParticleManager:SetParticleControl(lightningChain,1,Vector(target:GetAbsOrigin().x,target:GetAbsOrigin().y,target:GetAbsOrigin().z + target:GetBoundingMaxs().z ))
	
			-- decrement remaining spell bounces
			bounces = bounces - 1

			-- fire the timer again if spell bounces remain
			if bounces > 0 then
				return time_between_bounces
			else
				for _,v in pairs(targetsStruck) do
				   	v.struckByChain = false
				   	v = nil
				end
			end
		end
	})
end


function instaKill ( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	if RandomFloat(0,1) < (keys.chance/100) and not target:IsChampion() then
		local damage_table = {}
		damage_table.attacker = caster
		damage_table.victim = target
		damage_table.damage_type = DAMAGE_TYPE_PURE
		damage_table.damage = 9999999
		ApplyDamage(damage_table)
	end
end 
