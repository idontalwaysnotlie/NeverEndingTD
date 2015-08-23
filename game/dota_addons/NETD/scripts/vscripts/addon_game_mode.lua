-- Generated from template
require( "abilities" )
require( "physics" )
require( "teleporters" )
require( "items" )
require('utilities')
require('upgrades')
require('builder')
require('buildinghelper')
require('libraries/timers')
require('libraries/popups')
require('libraries/notifications')
require('mechanics')
if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
		-- Sounds can precached here like anything else
	PrecacheResource("soundfile", "soundevents/game_sounds_custom.vsndevts", context)

	for i=1, 268 do
		print ("precaching"..UnitsTable[i])
		PrecacheUnitByNameSync(UnitsTable[i],context)
	end
	
	-- Entire items can be precached by name
	-- Abilities can also be precached in this way despite the name
	PrecacheItemByNameSync("item_Element_Flame", context)
	PrecacheItemByNameSync("item_Element_Water", context)
	PrecacheItemByNameSync("item_Element_Nature", context)
	PrecacheItemByNameSync("item_Element_Light", context)
	PrecacheItemByNameSync("item_Element_Dark", context)
	PrecacheItemByNameSync("item_Element_Earth", context)
	PrecacheUnitByNameSync("npc_maze_runner", context)
	PrecacheUnitByNameSync("npc_maze_runner", context)
	PrecacheResource( "particle", "particles/light.vpcf", context )	
	PrecacheResource( "particle", "particles/dark.vpcf", context )	
	PrecacheResource( "particle", "particles/flame.vpcf", context )	
	PrecacheResource( "particle", "particles/earth2.vpcf", context )
	PrecacheResource( "particle", "particles/water.vpcf", context )
	PrecacheResource( "particle", "particles/electric2.vpcf", context )
	PrecacheResource( "particle", "particles/nature.vpcf", context )
	PrecacheResource( "particle", "particles/lava.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_jakiro/jakiro_base_attack_fire.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_explosion.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_nevermore/nevermore_trail.vpcf", context )
	PrecacheResource( "particle", "particles/generic_gameplay/generic_stunned.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_nevermore/nevermore_base_attack.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_earth_spirit/espirit_rollingboulder.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_ursa/ursa_earthshock.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_viper/viper_poison_attack_.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_viper/viper_poison_debuff.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_morphling/morphling_base_attack.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_razor/razor_loadout.vpcf", context )
	PrecacheResource( "particle", "particles/items_fx/chain_lightning.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_bane/bane_fiends_grip.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_alchemist/alchemist_acid_spray_debuff.vpcf", context )
	PrecacheResource( "particle", "particles/ui/dark_swirl_smoke.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_pugna/pugna_life_give.vpcf", context )
	PrecacheResource( "particle", "particles/units/unit_greevil/greevil_blackhole.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_jakiro/jakiro_macropyre_lava_a.vpcf", context )
	PrecacheResource( "particle", "particles/econ/items/crystal_maiden/crystal_maiden_cowl_of_ice/maiden_crystal_nova_cowlofice.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_crystalmaiden/maiden_frostbite_buff.vpcf", context )
	PrecacheResource( "particle", "particles/econ/events/coal/coal_projectile.vpcf", context )
	PrecacheResource( "particle", "particles/econ/items/crystal_maiden/crystal_maiden_maiden_of_icewrack/maiden_arcana_ground_ambient.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", context )
	PrecacheResource( "particle", "particles/econ/generic/generic_buff_1/generic_buff_1.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_dark_seer/dark_seer_surge_flame.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_ember_spirit/ember_spirit_flameguard.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_sandking/sandking_caustic_finale_explode_c_lv.vpcf", context )
	PrecacheResource( "particle", "particles/econ/items/crystal_maiden/crystal_maiden_maiden_of_icewrack/maiden_freezing_field_explosion_arcana1.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_crystalmaiden/maiden_base_attack.vpcf", context )
	
	
	PrecacheResource( "model", "models/props_structures/bad_ancient_destruction.vmdl", context )
	PrecacheResource( "model", "models/props_structures/tower_good2.vmdl", context )
	PrecacheResource( "model", "models/props_structures/radiant_tower001.vmdl", context )
	PrecacheResource( "model", "models/props_structures/tower_bad.vmdl", context )
	PrecacheResource( "model", "models/props_structures/bad_tower_destruction.vmdl", context )
	PrecacheResource( "model", "models/props_structures/good_statue008.vmdl", context )
	PrecacheResource( "model", "models/props_structures/bad_statue003.vmdl", context )
	PrecacheResource( "model", "models/heroes/phantom_assassin/arcana_tombstone.vmdl", context )
	PrecacheResource( "model", "models/props_structures/good_statue010_dest_lvl3.vmdl", context )
	PrecacheResource( "model", "models/props_structures/tower_dragon_white.vmdl", context )
	PrecacheResource( "model", "models/heroes/pedestal/effigy_pedestal_ti5_lv2.vmdl", context )
	PrecacheResource( "model", "models/props_garden/bad_stonewallstatue001.vmdl", context )
	PrecacheResource( "model", "models/props_structures/statue_eel001.vmdl", context )
	PrecacheResource( "model", "models/props_structures/gryphon_statue001.vmdl", context )
	PrecacheResource( "model", "models/props_structures/statue_mystical001.vmdl", context )
	PrecacheResource( "model", "models/props_structures/statue_cuttlefish001.vmdl", context )
	PrecacheResource( "model", "models/items/furion/treant/treant_cis/treant_cis.vmdl", context )
	PrecacheResource( "model", "models/items/earth_spirit/demon_stone_summon/demon_stone_summon.vmdl", context )
	
	
	PrecacheResource("particle_folder", "particles/buildinghelper", context)
	PrecacheResource("particle_folder", "particles/econ/items/earthshaker/earthshaker_gravelmaw/", context)

	-- Resources used
	PrecacheUnitByNameSync("peasant", context)
	PrecacheUnitByNameSync("tower", context)
	PrecacheUnitByNameSync("tower_tier2", context)
	PrecacheUnitByNameSync("city_center", context)
	PrecacheUnitByNameSync("city_center_tier2", context)
	PrecacheUnitByNameSync("tech_center", context)
	PrecacheUnitByNameSync("dragon_tower", context)
	PrecacheUnitByNameSync("dark_tower", context)

	PrecacheItemByNameSync("item_apply_modifiers", context)
	

	-- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
	-- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
	PrecacheUnitByNameSync("npc_dota_hero_drow_ranger", context)
	PrecacheUnitByNameSync("EleTDArrow", context)
	PrecacheUnitByNameSync("EleTDSeige", context)
	PrecacheUnitByNameSync("dummy_unit", context)
	
	

	PrecacheUnitByNameSync("npc_barracks", context) -- Building that spawns units
	PrecacheUnitByNameSync("npc_peasant", context) -- Unit that builds and gathers resources
	PrecacheUnitByNameSync("item_rally", context) -- Flag, should be a clientside particle instead
	GameRules:SetTimeOfDay( 0.75 )
	GameRules:SetHeroRespawnEnabled( true )
	GameRules:SetUseUniversalShopMode( true )
	GameRules:SetHeroSelectionTime( 5.0 )
	GameRules:SetSameHeroSelectionEnabled( true )
	GameRules:SetPreGameTime( 5.0 )
	GameRules:SetPostGameTime( 5.0 )
	GameRules:SetGoldTickTime( 60.0 )
	GameRules:SetGoldPerTick( 0 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 8 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules.AbilityKV = LoadKeyValues("scripts/npc/npc_abilities_custom.txt")
  	GameRules.UnitKV = LoadKeyValues("scripts/npc/npc_units_custom.txt")
  	GameRules.HeroKV = LoadKeyValues("scripts/npc/npc_heroes_custom.txt")
  	GameRules.ItemKV = LoadKeyValues("scripts/npc/npc_items_custom.txt")
  	GameRules.Requirements = LoadKeyValues("scripts/kv/tech_tree.kv")
	ALLOW_SAME_HERO_SELECTION = true 
	CAMERA_DISTANCE_OVERRIDE = 3000
	DISABLE_FOG_OF_WAR_ENTIRELY = true 
	ENABLE_TOWER_BACKDOOR_PROTECTION = false
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	CustomGameEventManager:RegisterListener( "building_helper_build_command", Dynamic_Wrap(BuildingHelper, "BuildCommand"))
	CustomGameEventManager:RegisterListener( "building_helper_cancel_command", Dynamic_Wrap(BuildingHelper, "CancelCommand"))
	CustomGameEventManager:RegisterListener( "update_selected_entities", Dynamic_Wrap(CAddonTemplateGameMode, 'OnPlayerSelectedEntities'))
   	CustomGameEventManager:RegisterListener( "repair_order", Dynamic_Wrap(CAddonTemplateGameMode, "RepairOrder"))  	
	ListenToGameEvent( "entity_killed", Dynamic_Wrap( CAddonTemplateGameMode, 'OnEntityKilled' ), self )
	ListenToGameEvent("dota_player_pick_hero", Dynamic_Wrap(CAddonTemplateGameMode, 'On_player_spawn'), self)
	ListenToGameEvent('npc_spawned', Dynamic_Wrap(CAddonTemplateGameMode, 'OnNPCSpawned'), self)
	ListenToGameEvent('dota_player_pick_hero', Dynamic_Wrap(CAddonTemplateGameMode, 'OnPlayerPickHero'), self)
	GameRules:GetGameModeEntity():SetThink(SpawnUnits)
	GameRules:GetGameModeEntity():SetCameraDistanceOverride(3000)
	GameRules.SELECTED_UNITS = {}
end

function CAddonTemplateGameMode:OnNPCSpawned(keys)
  local npc = EntIndexToHScript(keys.entindex)
  if npc:IsRealHero() then
    print ("here spawned:"..npc:GetName())
	local ability = nil
	  for i=0, npc:GetAbilityCount()-1 do
		ability = npc:GetAbilityByIndex(i)
		if ability and not ability:IsAttributeBonus() then 
		  for level=1, ability:GetMaxLevel() do
			ability:UpgradeAbility(false) -- SetLevel() ignores OnUpgrade events
		  end
		end
	  end
	  npc:SetAbilityPoints(0)
	  npc:SetGold(50,false)
	  --npc:AddNewModifier(npc,nil,"modifier_batrider_firefly",nil)
  end
end

function CAddonTemplateGameMode:OnPlayerSelectedEntities( event )
	local pID = event.pID

	GameRules.SELECTED_UNITS[pID] = event.selected_entities

	-- This is for Building Helper to know which is the currently active builder
	local mainSelected = GetMainSelectedEntity(pID)
	if IsValidEntity(mainSelected) and IsBuilder(mainSelected) then
		local player = PlayerResource:GetPlayer(pID)
		player.activeBuilder = mainSelected
	end
end

function CAddonTemplateGameMode:OnPlayerPickHero(keys)

	local hero = EntIndexToHScript(keys.heroindex)
	local player = EntIndexToHScript(keys.player)
	local playerID = hero:GetPlayerID()
	print("Player "..playerID.." has spawned")
	-- Initialize Variables for Tracking
	player.units = {} -- This keeps the handle of all the units of the player, to iterate for unlocking upgrades
	player.structures = {} -- This keeps the handle of the constructed units, to iterate for unlocking upgrades
	player.buildings = {} -- This keeps the name and quantity of each building
	player.upgrades = {} -- This kees the name of all the upgrades researched
	player.lumber = 99999 -- Secondary resource of the player
	player.lives = 50

	CheckAbilityRequirements( hero, player )

	-- Add the hero to the player units list
	table.insert(player.units, hero)
	hero.state = "idle" --Builder state

	-- Spawn some peasants around the hero
	local position = hero:GetAbsOrigin()
	local HeroLocation  =  Entities:FindByName(nil,"Player"..(playerID+1).."HeroSpawn")
	if HeroLocation then 
		hero:SetRespawnPosition(HeroLocation:GetOrigin())
		hero:SetOrigin(HeroLocation:GetOrigin())
	end
end

function CAddonTemplateGameMode:On_player_spawn(data)
	--PlayerResource:SetGold(data.player-1,50,false)
	PlayerElements[data.player] = {0,0,0,0,0,0}
end

function CAddonTemplateGameMode:OnEntityKilled( event )
	local player = EntIndexToHScript( event.entindex_attacker):GetPlayerOwnerID()
	local victim =  EntIndexToHScript( event.entindex_killed):GetPlayerOwnerID()
	
	if player == nil or player == victim then return end
	UnitstoKill[player+1] = UnitstoKill[player+1] -1
	if UnitstoKill[player+1]==0 then
		roundState = 0
		roundStartTime = GameRules:GetGameTime()+15
		GameRound = GameRound+1
	end
	if EntIndexToHScript( event.entindex_attacker):GetUnitName() == "LifeTower" then PlayerResource:GetPlayer(player).lives = PlayerResource:GetPlayer(player).lives +1 end
	
		-- The Unit that was Killed
	local killedUnit = EntIndexToHScript(event.entindex_killed)
	-- The Killing entity
	local killerEntity
	if event.entindex_attacker then
		killerEntity = EntIndexToHScript(event.entindex_attacker)
	end

	-- Player owner of the unit
	local player = killedUnit:GetPlayerOwner()

	-- Building Killed
	if IsCustomBuilding(killedUnit) then

		 -- Building Helper grid cleanup
		BuildingHelper:RemoveBuilding(killedUnit, true)

		-- Check units for downgrades
		local building_name = killedUnit:GetUnitName()
				
		-- Substract 1 to the player building tracking table for that name
		if player.buildings[building_name] then
			player.buildings[building_name] = player.buildings[building_name] - 1
		end

		-- possible unit downgrades
		for k,units in pairs(player.units) do
		    CheckAbilityRequirements( units, player )
		end

		-- possible structure downgrades
		for k,structure in pairs(player.structures) do
			CheckAbilityRequirements( structure, player )
		end
	end

	-- Table cleanup
	if player then
		-- Remake the tables
		local table_structures = {}
		for _,building in pairs(player.structures) do
			if building and IsValidEntity(building) and building:IsAlive() then
				--print("Valid building: "..building:GetUnitName())
				table.insert(table_structures, building)
			end
		end
		player.structures = table_structures
		
		local table_units = {}
		for _,unit in pairs(player.units) do
			if unit and IsValidEntity(unit) then
				table.insert(table_units, unit)
			end
		end
		player.units = table_units		
	end
end
-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		if roundState==0 then
			if not self._entPrepTimeQuest then
				self._entPrepTimeQuest = SpawnEntityFromTableSynchronous( "quest", { name = "PrepTime", title = "#DOTA_Quest_Holdout_PrepTime" } )
				self._entPrepTimeQuest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_ROUND, GameRound )
			end
			self._entPrepTimeQuest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, roundStartTime - GameRules:GetGameTime() )
			--check if end of round time
			if roundStartTime - GameRules:GetGameTime() <0 then
				GameRules.nextRound  = 0
				UTIL_RemoveImmediate( self._entPrepTimeQuest )
				self._entPrepTimeQuest = nil
				roundState = 1
				--set up the next round
				UnitsToSpawn = 20
				if GameRound % 10 == 0 then  end
				UnitScale = math.log(GameRound/5+1)+0.3
				prevRoundUnit = roundUnit
				roundUnit = UnitsTable[RandomInt(1,268)]
				UnitBounty = math.ceil(math.log(GameRound+1))
				UnitMod = ""
				UnitMod2 = ""
				UnitAbility = ""
				UnitItem = ""
				UnitHealth = (GameRound*150) + math.ceil(math.pow(GameRound*10,1.5))
				print("Unit Health")
				print(UnitHealth)
				if roundUnit == prevRoundUnit then roundUnit = UnitsTable[RandomInt(1,268)] end
				if roundUnit == prevRoundUnit then roundUnit = UnitsTable[RandomInt(1,268)] end
				print("unit:"..roundUnit)
				--if GameRound % 5 == 0 then UnitMod = "modifier_brewmaster_drunken_brawler" GameRules:SendCustomMessage("<font color='#8855EE'>Evasion Round! </font>", 0, 0) end --every 5th round has evasion
				if GameRound % 10 == 0 then 
					UnitsToSpawn = math.ceil(GameRound/10)
					UnitHealth = UnitHealth*10
					UnitScale = UnitScale * 2
					UnitMS = 300
					EmitGlobalSound("Music_Frostivus.WraithKing")
					UnitBounty = math.ceil(math.log(GameRound+1))*20
					UnitChamp = true
					GameRules:SendCustomMessage("<font color='#8855EE'>Boss Round! </font>", 0, 0)
				end --every 10th round is a Boss round
				if GameRound % 6 == 0 then UnitHealth = GameRound*300 GameRules:SendCustomMessage("<font color='#8855EE'>High HP Round! </font>", 0, 0) end --every 6th round is a more health round
				if GameRound % 7 == 0 then UnitMS = 500 GameRules:SendCustomMessage("<font color='#8855EE'>Fast Round! </font>", 0, 0) else UnitMS = 400 end --every 7th round is a fast unit round
				if GameRound % 4 == 0 then UnitST = 0.2 GameRules:SendCustomMessage("<font color='#8855EE'>Pack Round! </font>", 0, 0) else UnitST = 0.5 end --every 4th round is a clumped round
				if GameRound % 8 == 0 then UnitRG = GameRound*5 GameRules:SendCustomMessage("<font color='#8855EE'>Regen Round! </font>", 0, 0) else UnitRG = 0.5 end --every 8th round is a fast regen round
				if GameRound % 9 == 0 then UnitItem = "item_aegis" end --every 9th round has reincarnation
				if GameRound % 11 == 0 then UnitMod2 = "modifier_brewmaster_earth_spell_immunity" GameRules:SendCustomMessage("<font color='#8855EE'>Magic Immune Round! </font>", 0, 0) UnitHealth = UnitHealth/2 end --every 11th has magic immune
				--if GameRound % 13 == 0 then UnitAbility = "windrunner_windrun" end
				for i=1,PlayerResource:GetPlayerCount(),1 do 
					UnitstoKill[i]=UnitsToSpawn
				end
				roundState = 1
				GameRules:GetGameModeEntity():SetThink(SpawnUnits)
				GameRules:SendCustomMessage("<font color='#FF8888'>Spawning "..UnitsToSpawn.."x </font>"..roundUnit, 0, 0)
			end
		end
		
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	if GameRules.nextRound == PlayerResource:GetPlayerCount() then 
		GameRules:SendCustomMessage("<font color='#CC33FF'>Moving onto next round</font>", 0, 0) 
		roundState = 0
		roundStartTime = GameRules:GetGameTime()+2
		GameRound = GameRound+1
		GameRules.nextRound = 0
	end
	return 1
end

UnitsTable = {"npc_weplay_beaver_flying","npc_weplay_beaver","npc_waldi_the_faithful_flying","npc_waldi_the_faithful","npc_virtus_werebear_t3_flying","npc_virtus_werebear_t3",
"npc_virtus_werebear_t1_flying","npc_virtus_werebear_t1","npc_vigilante_fox_red_flying","npc_vigilante_fox_red","npc_vigilante_fox_green_flying","npc_vigilante_fox_green","npc_vaal_the_animated_constructradiant_flying",
"npc_vaal_the_animated_constructradiant","npc_vaal_the_animated_constructdire_flying","npc_vaal_the_animated_constructdire","npc_tory_the_sky_guardian_flying","npc_tory_the_sky_guardian","npc_tinkbot_flying","npc_tinkbot",
"npc_throe_flying","npc_throe","npc_teron_flying","npc_teron","npc_starladder_grillhound_flying","npc_starladder_grillhound","npc_snapjaw_flying","npc_snapjaw","npc_courier_snail_flying",
"npc_courier_snail","npc_snaggletooth_red_panda_flying","npc_snaggletooth_red_panda","npc_sltv_10_courier_flying","npc_sltv_10_courier","npc_shroomy_flying","npc_shroomy","npc_shagbark_flying","npc_shagbark",
"npc_scuttling_scotty_penguin_flying","npc_scuttling_scotty_penguin","npc_scribbinsthescarab_flying","npc_scribbinsthescarab","npc_royal_griffin_cub_flying","npc_royal_griffin_cub","npc_raiq_flying","npc_raiq",
"npc_raidcall_ems_one_turtle_flying","npc_raidcall_ems_one_turtle","npc_pw_zombie_flying","npc_pw_zombie","npc_pw_ostrich_flying","npc_pw_ostrich","npc_pumpkin_courier_flying","npc_pumpkin_courier",
"npc_premier_league_wyrmeleon_flying","npc_premier_league_wyrmeleon","npc_nilbog_flying","npc_nilbog","npc_nexon_turtle_15_red_flying","npc_nexon_turtle_15_red","npc_nexon_turtle_07_green_flying","npc_nexon_turtle_07_green",
"npc_nexon_turtle_01_grey_flying","npc_nexon_turtle_01_grey","npc_mok_flying","npc_mok","npc_mlg_courier_wraith_flying","npc_mlg_courier_wraith","npc_mighty_chicken_flying","npc_mighty_chicken","npc_mei_nei_rabbit_flying",
"npc_mei_nei_rabbit","npc_livery_llama_courier_flying","npc_livery_llama_courier","npc_lilnova_flying","npc_lilnova","npc_lgd_golden_skipper_flying","npc_lgd_golden_skipper","npc_kupu_courier_flying","npc_kupu_courier",
"npc_kanyu_shark_flying","npc_kanyu_shark","npc_jumo_dire_flying","npc_jumo_dire","npc_jumo_flying","npc_jumo","npc_jin_yin_white_fox_flying","npc_jin_yin_white_fox","npc_jin_yin_black_fox_flying","npc_jin_yin_black_fox",
"npc_jilling_ben_courier_flying","npc_jilling_ben_courier","npc_itsy_flying","npc_itsy","npc_ig_dragon_flying","npc_ig_dragon","npc_guardians_of_justice_phoe_flying","npc_guardians_of_justice_phoe",
"npc_guardians_of_justice_enix_flying","npc_guardians_of_justice_enix","npc_grim_wolf_radiant_flying","npc_grim_wolf_radiant","npc_grim_wolf_flying","npc_grim_wolf","npc_green_jade_dragon_flying","npc_green_jade_dragon",
"npc_gnomepig_flying","npc_gnomepig","npc_gama_brothers_flying","npc_gama_brothers","npc_g1_courier_flying","npc_g1_courier","npc_fei_lian_blue_flying","npc_fei_lian_blue","npc_faceless_rex_flying","npc_faceless_rex",
"npc_el_gato_hero_flying","npc_el_gato_hero","npc_el_gato_beyond_the_summit_flying","npc_el_gato_beyond_the_summit","npc_echo_wisp_flying","npc_echo_wisp","npc_duskie_flying","npc_duskie","npc_dokkaebi_nexon_courier_flying",
"npc_dokkaebi_nexon_courier","npc_defense4_radiant_flying","npc_defense4_radiant","npc_defense4_dire_flying","npc_defense4_dire","npc_deathripper_flying","npc_deathripper","npc_deathbringer_flying","npc_deathbringer",
"npc_dc_demon_flying","npc_dc_demon","npc_dc_angel_flying","npc_dc_angel","npc_d2l_steambear_flying","npc_d2l_steambear","npc_courier_mvp_redkita_flying","npc_courier_mvp_redkita","npc_courier_janjou_flying",
"npc_courier_janjou","npc_courier_faun_flying","npc_courier_faun","npc_corsair_ship_flying","npc_corsair_ship","npc_coral_furryfish_flying","npc_coral_furryfish","npc_coco_the_courageous_flying","npc_coco_the_courageous",
"npc_carty_dire_flying","npc_carty_dire","npc_carty_flying","npc_carty","npc_captain_bamboo_flying","npc_captain_bamboo","npc_butch_pudge_dog_flying","npc_butch_pudge_dog","npc_bucktooth_jerry_flying","npc_bucktooth_jerry",
"npc_bts_chirpy_flying","npc_bts_chirpy","npc_boooofus_courier_flying","npc_boooofus_courier","npc_bookwyrm_flying","npc_bookwyrm","npc_blue_lightning_horse_flying","npc_blue_lightning_horse","npc_blotto_flying","npc_blotto",
"npc_billy_bounceback_flying","npc_billy_bounceback","npc_beaverknight_flying","npc_beaverknight","npc_bearzky_flying","npc_bearzky","npc_basim_flying","npc_basim","npc_bajie_pig_flying","npc_bajie_pig","npc_baekho_flying",
"npc_baekho","npc_babka_bewitcher_blue_flying","npc_babka_bewitcher_blue","npc_babka_bewitcher_flying","npc_babka_bewitcher","npc_azuremircourierfinal_flying","npc_azuremircourierfinal","npc_arneyb_rabbit_flying",
"npc_arneyb_rabbit","npc_amphibian_kid_flying","npc_amphibian_kid","npc_alphid_of_lecaciida_flying","npc_alphid_of_lecaciida","npc_flying_desolation","npc_turtle_rider_flying","npc_turtle_rider","npc_trapjaw_flying",
"npc_trapjaw","npc_tegu_flying","npc_tegu","npc_sw_donkey_flying","npc_sw_donkey","npc_stump_flying","npc_stump","npc_stump001_flying","npc_stump001","npc_smeevil_mammoth_flying","npc_smeevil_mammoth",
"npc_smeevil_magic_carpet_flying","npc_smeevil_magic_carpet","npc_smeevil_crab_flying","npc_smeevil_crab","npc_smeevil_bird_flying","npc_smeevil_bird","npc_smeevil_flying","npc_smeevil","npc_skippy_parrot_flying_sailboat",
"npc_skippy_parrot_flying","npc_skippy_parrot","npc_sillydragon_flying","npc_sillydragon","npc_ram_flying","npc_ram","npc_otter_dragon_flying","npc_otter_dragon","npc_octopus_flying","npc_octopus","npc_navi_courier_flying",
"npc_navi_courier","npc_minipudge_flying","npc_minipudge","npc_mechjaw_flying","npc_mechjaw","npc_lockjaw_flying","npc_lockjaw","npc_imp_flying","npc_houndeye_flying","npc_houndeye","npc_gold_greevil_flying",
"npc_gold_greevil","npc_godhorse_flying","npc_godhorse","npc_frull_courier_flying","npc_frog_flying","npc_frog","npc_f2p_courier_flying","npc_f2p_courier","npc_drodo_flying","npc_drodo","npc_doom_demihero_courier_flying",
"npc_doom_demihero_courier","npc_donkey_unicorn_flying","npc_donkey_unicorn","npc_donkey_crummy_wizard_2014_flying","npc_donkey_crummy_wizard_2014","npc_defense3_sheep_flying","npc_defense3_sheep","npc_courier_mech_flying",
"npc_courier_mech","npc_courier_badger_flying","npc_courier_badger","npc_baby_winter_wyvern_flying","npc_baby_winter_wyvern","npc_babyroshan_flying","npc_babyroshan"
}
GameRound = 1
roundState = 0
roundStartTime = GameRules:GetGameTime()+10
roundUnit = UnitsTable[2]
prevRoundUnit = UnitsTable[3]
UnitsToSpawn = 0
UnitScale = 0.9
UnitST = 0.5
UnitMS = 400
UnitHealth = 100
UnitRG = 0.5
UnitBounty = 1
UnitMod = ""
UnitMod2 = ""
UnitAbility = ""
UnitItem = ""
UnitChamp = false
UnitstoKill = {}
PlayerElements = {}

function SpawnUnits ()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS and roundState == 1 then
		if UnitsToSpawn > 0 then
			for i=1,PlayerResource:GetPlayerCount(),1 do 
				local spawner =  Entities:FindByName(nil,"p"..i.."Spawner")
				if PlayerResource:GetPlayer(i-1).lives and PlayerResource:GetPlayer(i-1).lives > 0 then 
					local entUnit = CreateUnitByName( roundUnit, spawner:GetAbsOrigin(), false, nil, nil, DOTA_TEAM_BADGUYS )
					if not entUnit then print("error loading unit") print(roundUnit) end
					entUnit:AddNewModifier(nil,nil,"modifier_item_phase_boots_active",nil)
					entUnit:SetInitialGoalEntity( Entities:FindByName(nil,"p"..i.."Pathstart"))
					entUnit:SetModelScale(UnitScale)
					entUnit:SetBaseMaxHealth(UnitHealth)
					entUnit:SetBaseMoveSpeed(UnitMS)
					entUnit:SetBaseHealthRegen(UnitRG)
					entUnit:SetMaximumGoldBounty(UnitBounty)
					entUnit:SetMinimumGoldBounty(UnitBounty)
					entUnit:SetBaseMagicalResistanceValue(math.ceil(math.log(GameRound+1)))
					entUnit:SetPhysicalArmorBaseValue(math.ceil(math.log(GameRound+1)))
					if UnitMod ~= "" then entUnit:AddNewModifier(nil,nil,UnitMod,nil) end
					if UnitMod2 ~= "" then entUnit:AddNewModifier(nil,nil,UnitMod2,nil) end
					if UnitItem ~= "" then entUnit:AddItemByName(UnitItem) end
					if UnitAbility ~= "" then 
						entUnit:AddAbility(UnitAbility)
						entUnit:GetAbilityByIndex(1):UpgradeAbility(true)
						entUnit:SetMana(500)
					end
					if GameRound %10 == 0 then entUnit.boss = true end
					if string.match(roundUnit, "flying") then entUnit:SetMoveCapability(2) else entUnit:SetMoveCapability(1) end
				end
			end
			UnitsToSpawn = UnitsToSpawn - 1
		else
			roundState = 2
		end
	end
   return UnitST
 end