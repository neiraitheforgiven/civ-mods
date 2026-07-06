-- JFD_Castile_Decisions
-- Author: JFD
-- DateCreated: 6/13/2016 11:12:15 AM
--=======================================================================================================================
-- USER SETTINGS
--=======================================================================================================================
--JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingPietyCore = JFD_GetUserSetting("JFD_RTP_PIETY_CIVILIZATION_CHANGES") == 1
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_CASTILE"]
local mathCeil		 = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Castile: Fund Columbus's Expedition
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_SpainColumbus = nil
local Decisions_SpainColumbus = {}
    Decisions_SpainColumbus.ID = "Decisions_SpainColumbus"
	Decisions_SpainColumbus.Name = "TXT_KEY_DECISIONS_SPAINCOLUMBUS"
	Decisions_SpainColumbus.Desc = "TXT_KEY_DECISIONS_SPAINCOLUMBUS_DESC"
	HookDecisionCivilizationIcon(Decisions_SpainColumbus, "CIVILIZATION_JFD_CASTILE")
	Decisions_SpainColumbus.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilizationID) then
			return false, false
		end
		if load(pPlayer, "Decisions_SpainColumbus") == true then
		Decisions_SpainColumbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPAINCOLUMBUS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(700*iMod)
		Decisions_SpainColumbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPAINCOLUMBUS_DESC", iCost)
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ASTRONOMY)) and (pPlayer:GetGold() >= iCost) and (pPlayer:GetCapitalCity() ~= nil) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_SpainColumbus.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(700*iMod)
		local tCaravels = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_CARAVEL, 2)
		tCaravels[1]:SetName("Pinta")
		tCaravels[1]:JumpToNearestValidPlot()
		tCaravels[2]:SetName("Niña")
		tCaravels[2]:JumpToNearestValidPlot()
		local tAdmiral = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_ADMIRAL, 1)
		tAdmiral[1]:SetName("Cristóbal Colón")
		tAdmiral[1]:JumpToNearestValidPlot()
		pPlayer:ChangeGold(-iCost)
		save(pPlayer, "Decisions_SpainColumbus", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_SpainColumbus", Decisions_SpainColumbus)
--------------------------------------------------------------------------------------------------------------------------
-- Castile: The Spanish Inquisition
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_SpanishInquisition = nil
--------------------------------------------------------------------------------------------------------------------------
-- Castile: Form the Spanish Nation 
-------------------------------------------------------------------------------------------------------------------------
local eraMedievalID   = GameInfoTypes["ERA_MEDIEVAL"]
local policyCastileID = GameInfoTypes["POLICY_DECISIONS_JFD_CASTILE"]
local Decisions_JFD_Castile_Spain = {}
	Decisions_JFD_Castile_Spain.Name = "TXT_KEY_DECISIONS_JFD_CASTILE_SPAIN"
	Decisions_JFD_Castile_Spain.Desc = "TXT_KEY_DECISIONS_JFD_CASTILE_SPAIN_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Castile_Spain, "CIVILIZATION_JFD_CASTILE")
	Decisions_JFD_Castile_Spain.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyCastileID) then
			Decisions_JFD_Castile_Spain.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CASTILE_SPAIN_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(800*iMod)
		local faithCost = mathCeil(800*iMod)
		local religionID = GetPlayerMajorityReligion(player)
		if userSettingPietyCore then religionID = player:GetStateReligion() end
		local religiousUnity = GetReligiousUnity(player, religionID)
		Decisions_JFD_Castile_Spain.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CASTILE_SPAIN_DESC", mathCeil(religiousUnity*100), goldCost, faithCost)
		if religiousUnity < .80 then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetNumCities() < 5 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if player:GetFaith() < faithCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Castile_Spain.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(800*iMod)
		local faithCost = mathCeil(800*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12*iGAMod)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyCastileID, true)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_SPAIN_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_SPAIN_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_SPAIN_ADJECTIVE")
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CASTILE_SPAIN", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_Castile_Spain", Decisions_JFD_Castile_Spain)
--=======================================================================================================================
--=======================================================================================================================
