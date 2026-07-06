-- Lua Script1
-- Author: pedro
-- DateCreated: 07/05/16 8:31:38 PM
--------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- Maktabs
-------------------------------------------------------------------------------------------------------------------------
local iraqID = GameInfoTypes.CIVILIZATION_IRAQ

local Decisions_IraqMaktab = {}
	Decisions_IraqMaktab.Name = "TXT_KEY_DECISIONS_UC_IRAQ_MAKTAB"
	Decisions_IraqMaktab.Desc = "TXT_KEY_DECISIONS_UC_IRAQ_MAKTAB_DESC"
	Decisions_IraqMaktab.Pedia = "TXT_KEY_BUILDING_UC_IRAQ_MAKTAB"
	HookDecisionCivilizationIcon(Decisions_IraqMaktab, "CIVILIZATION_IRAQ")
	Decisions_IraqMaktab.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= iraqID then return false, false end
		if load(player, "Decisions_IraqMaktab") == true then
			Decisions_IraqMaktab.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_IRAQ_MAKTAB_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = math.ceil(500*iMod)
		Decisions_IraqMaktab.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_IRAQ_MAKTAB_DESC", goldCost)
		if player:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE then return true, false end
		if player:GetGold() < goldCost	then return true, false end
		local iraqUni = player:GetBuildingClassCount(GameInfoTypes.BUILDINGCLASS_UNIVERSITY)
		if iraqUni < 3 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		return true, true
	end
	)
	
	Decisions_IraqMaktab.DoFunc = (
	function(player)
		local goldCost = math.ceil(500 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes.POLICY_UC_IRAQ_MAKTAB, true)
		save(player, "Decisions_IraqMaktab", true)
	end
	)

Decisions_AddCivilisationSpecific(iraqID, "Decisions_IraqMaktab", Decisions_IraqMaktab)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Oil
--------------------------------------------------------------------------------------------------------------------------
local IraqOilID = GameInfoTypes["POLICY_UC_IRAQ_OIL"]

local Decisions_IraqOil = {}
	Decisions_IraqOil.Name = "TXT_KEY_DECISIONS_UC_IRAQ_OIL"
	Decisions_IraqOil.Desc = "TXT_KEY_DECISIONS_UC_IRAQ_OIL_DESC"
	HookDecisionCivilizationIcon(Decisions_IraqOil, "CIVILIZATION_IRAQ")
	Decisions_IraqOil.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= iraqID then return false, false end
		if load(player, "Decisions_IraqOil") == true then
			Decisions_IraqOil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_IRAQ_OIL_ENACTED_DESC")
			return false, false, true
		end
		
		local oil = player:GetNumResourceAvailable(GameInfoTypes.RESOURCE_OIL)
		local gold = 100 + (50 * oil)
		Decisions_IraqOil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_IRAQ_OIL_DESC", gold)
		if player:GetNumResourceAvailable(GameInfoTypes.RESOURCE_OIL, false) <	6	then return true, false end	
		if player:GetJONSCulture() < 300 then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) <	2	then return true, false end	
		return true, true
	end
	)
		
	
	Decisions_IraqOil.DoFunc = (
	function(player)
	local oil = player:GetNumResourceAvailable(GameInfoTypes.RESOURCE_OIL)
		player:ChangeGold(100 + (oil * 50))
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeJONSCulture(-300)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(IraqOilID, true)
		save(player, "Decisions_IraqOil", true)
	end
	)
	
Decisions_AddCivilisationSpecific(iraqID, "Decisions_IraqOil", Decisions_IraqOil)