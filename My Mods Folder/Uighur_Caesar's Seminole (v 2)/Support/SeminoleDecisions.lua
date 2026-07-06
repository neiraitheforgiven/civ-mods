-- Lua Script2
-- Author: pedro
-- DateCreated: 09/24/16 11:16:17 AM
--------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Turkey: Laws
--------------------------------------------------------------------------------------------------------------------------
local techTheologyID = GameInfoTypes["TECH_GUNPOWDER"]
local SeminoleResistanceID = GameInfoTypes["POLICY_SEMINOLE_RESISTANCE"]

local Decisions_SeminoleResistance = {}
	Decisions_SeminoleResistance.Name = "TXT_KEY_DECISIONS_SEMINOLE_RESISTANCE"
	Decisions_SeminoleResistance.Desc = "TXT_KEY_DECISIONS_SEMINOLE_RESISTANCE_DESC"
	HookDecisionCivilizationIcon(Decisions_SeminoleResistance, "CIVILIZATION_UC_SEMINOLE")
	Decisions_SeminoleResistance.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UC_SEMINOLE"] then return false, false end
		if load(player, "Decisions_SeminoleResistance") == true then
			Decisions_SeminoleResistance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_RESISTANCE_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_SeminoleResistance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_RESISTANCE_DESC")
		local goldCost = 1000 *iMod
		Decisions_SeminoleResistance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_RESISTANCE_DESC", goldCost)
		local numChickees = player:GetImprovementCount(GameInfoTypes.IMPROVEMENT_UC_CHICKEE)
		local numSwampChickees = player:GetImprovementCount(GameInfoTypes.IMPROVEMENT_UC_SWAMP_CHICKEE)
		local total = numChickees + numSwampChickees
		if (Teams[player:GetTeam()]:GetAtWarCount(false) < 1) then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		if player:GetGold() < goldCost then return true, false end
		if total < 3 then return true, false end
				
		return true, true
	end
	)
		
	
Decisions_SeminoleResistance.DoFunc = (
    function(player)
        local goldCost = 1000 * iMod
        player:ChangeGold(-goldCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(SeminoleResistanceID, true)
		local tGeneral = InitUnitFromCity(player:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_GENERAL, 1)				
        save(player, "Decisions_SeminoleResistance", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_UC_SEMINOLE, "Decisions_SeminoleResistance", Decisions_SeminoleResistance)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Turkey: Laws
--------------------------------------------------------------------------------------------------------------------------
local techTheologyID = GameInfoTypes["TECH_REFRIGERATION"]
local SeminoleGamblingID = GameInfoTypes["POLICY_SEMINOLE_GAMBLING"]

local Decisions_SeminoleGambling = {}
	Decisions_SeminoleGambling.Name = "TXT_KEY_DECISIONS_SEMINOLE_GAMBLING"
	Decisions_SeminoleGambling.Desc = "TXT_KEY_DECISIONS_SEMINOLE_GAMBLING_DESC"
	HookDecisionCivilizationIcon(Decisions_SeminoleGambling, "CIVILIZATION_UC_SEMINOLE")
	Decisions_SeminoleGambling.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UC_SEMINOLE"] then return false, false end
		if load(player, "Decisions_SeminoleGambling") == true then
			Decisions_SeminoleGambling.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_GAMBLING_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_SeminoleGambling.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_GAMBLING_DESC")
		local goldCost = 1500 *iMod
		local cultureCost = 500 * iMod
		Decisions_SeminoleGambling.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SEMINOLE_GAMBLING_DESC", goldCost, cultureCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		if player:GetGold() < goldCost then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
				
		return true, true
	end
	)
		
	
Decisions_SeminoleGambling.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local goldCost = 800 * iMod
		local cultureCost = 500 * iMod
        player:ChangeGold(-goldCost)
		player:ChangeJONSCulture(-cultureCost) 
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(SeminoleGamblingID, true)
        save(player, "Decisions_SeminoleGambling", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_UC_SEMINOLE, "Decisions_SeminoleGambling", Decisions_SeminoleGambling)