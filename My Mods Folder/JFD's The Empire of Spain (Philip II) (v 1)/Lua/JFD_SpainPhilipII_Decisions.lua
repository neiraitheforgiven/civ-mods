-- JFD_SpainPhilipII_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Spain (Philip II) Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("JFD_CID_ColoniesUtils.lua")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingColoniesCore = JFD_GetUserSetting("JFD_CID_COLONIES_CORE") == 1
local userSettingTribesCore   = JFD_GetUserSetting("JFD_EXCE_TRIBES_CORE") == 1
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_SPAIN"]
-------------------------------------------------------------------------------------------------------------------------
-- Spain (Philip II): Issue the Encomiendas
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policyEncomiendasID = GameInfoTypes["POLICY_DECISIONS_JFD_ENCOMIENDAS"]
local Decisions_JFD_SpainPhilipII_Encomiendas = {}
	Decisions_JFD_SpainPhilipII_Encomiendas.Name = "TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS"
	Decisions_JFD_SpainPhilipII_Encomiendas.Desc = "TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_SpainPhilipII_Encomiendas, "CIVILIZATION_SPAIN")
	Decisions_JFD_SpainPhilipII_Encomiendas.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyEncomiendasID) then
			if userSettingTribesCore then
				Decisions_JFD_SpainPhilipII_Encomiendas.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS_ENACTED_DESC_EXCE")
			else
				Decisions_JFD_SpainPhilipII_Encomiendas.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS_ENACTED_DESC")
			end
			return false, false, true
		end 
		local cityRequirement = "5 Cities"
		local cityReward = "Cities"
		local cityModifier = "City"
		local numCities = player:GetNumCities()
		local baseGoldenAgeCost = 100
		if userSettingTribesCore then baseGoldenAgeCost = 150 end
		local goldenAgeCost = mathCeil((baseGoldenAgeCost*numCities)*iMod)
		local numColonies = 0
		if userSettingColoniesCore then
			local playerID = player:GetID()
			numColonies = JFD_GetNumColonies(playerID)
			goldenAgeCost = mathCeil((baseGoldenAgeCost*numColonies)*iMod)
			cityRequirement = "3 [ICON_JFD_COLONY] Colonies"
			cityReward = "[ICON_JFD_COLONY] Colonies"
			cityModifier = "Colony"
		end
		if userSettingTribesCore then
			Decisions_JFD_SpainPhilipII_Encomiendas.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS_DESC_EXCE", cityRequirement, goldenAgeCost, cityReward, cityModifier)
		else
			Decisions_JFD_SpainPhilipII_Encomiendas.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS_DESC", cityRequirement, goldenAgeCost, cityReward, cityModifier)
		end
		if (not userSettingColoniesCore) then
			if numCities < 5 then return true, false end
		else
			if numColonies < 5 then return true, false end
		end
		if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_SpainPhilipII_Encomiendas.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numCities = player:GetNumCities()
		local baseGoldenAgeCost = 100
		if userSettingTribesCore then baseGoldenAgeCost = 150 end
		local goldenAgeCost = mathCeil((baseGoldenAgeCost*numCities)*iMod)
		local numColonies = 0
		if userSettingColoniesCore then
			numColonies = JFD_GetNumColonies(playerID)
			goldenAgeCost = mathCeil((baseGoldenAgeCost*numColonies)*iMod)
		end
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
		if isCPDLL then
			player:GrantPolicy(policyEncomiendasID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyEncomiendasID, true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_SpainPhilipII_Encomiendas", Decisions_JFD_SpainPhilipII_Encomiendas)
-------------------------------------------------------------------------------------------------------------------------
-- Spain (Philip II): Patronize the School of Salamanca
-------------------------------------------------------------------------------------------------------------------------
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local policySchoolSalamancaID = GameInfoTypes["POLICY_DECISIONS_JFD_SCHOOL_SALAMANCA"]
local Decisions_JFD_SpainPhilipII_SchoolSalamanca = {}
	Decisions_JFD_SpainPhilipII_SchoolSalamanca.Name = "TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_SCHOOL_SALAMANCA"
	Decisions_JFD_SpainPhilipII_SchoolSalamanca.Desc = "TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_SCHOOL_SALAMANCA_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_SpainPhilipII_SchoolSalamanca, "CIVILIZATION_SPAIN")
	Decisions_JFD_SpainPhilipII_SchoolSalamanca.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policySchoolSalamancaID) then
			Decisions_JFD_SpainPhilipII_SchoolSalamanca.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_SCHOOL_SALAMANCA_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local faithCost = mathCeil(700*iMod)
		local goldCost = mathCeil(500*iMod)
		Decisions_JFD_SpainPhilipII_SchoolSalamanca.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_SCHOOL_SALAMANCA_DESC", faithCost, goldCost)
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetFaith() < faithCost then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_SpainPhilipII_SchoolSalamanca.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithCost = mathCeil(700*iMod)
		local goldCost = mathCeil(500*iMod)
		player:ChangeFaith(-faithCost)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		if isCPDLL then
			player:GrantPolicy(policyGoldenFleeceID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policySchoolSalamancaID, true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_SpainPhilipII_SchoolSalamanca", Decisions_JFD_SpainPhilipII_SchoolSalamanca)
--=======================================================================================================================
--=======================================================================================================================
