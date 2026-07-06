-- JFD_Castile_Functions
-- Author: JFD
-- DateCreated: 6/13/2016 11:12:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
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
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
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

--HasTrait
function HasTrait(player, traitID)
	if isCPDLL then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end

--JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBAL
----------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
----------------------------------------------------------------------------------------------------------------------------
-- RECONQUISTA
----------------------------------------------------------------------------------------------------------------------------
local buildingReligionMarkerID = GameInfoTypes["BUILDING_JFD_CASTILE"]
local traitCastileID		   = GameInfoTypes["TRAIT_JFD_CASTILE"]

--JFD_Castile_Reconquista
function JFD_Castile_Reconquista(oldPlayerID, isCapital, plotX, plotY, newPlayerID, population)
	local player = Players[newPlayerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitCastileID)) then return end
	local religionID = player:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	if religionID <= 0 then religionID = player:GetCapitalCity():GetReligiousMajority() end
	if religionID <= 0 then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()
	if (city:IsHasBuilding(buildingReligionMarkerID)) then return end
	if city:GetReligiousMajority() ~= religionID then	
		local faithReward = (player:GetTotalFaithPerTurn()*population)
		local goldReward = (player:CalculateGoldRate()*population)
		if isCapital then faithReward = (faithReward*2) end
		player:ChangeFaith(faithReward)
		player:ChangeGold(goldReward)
		for religion in GameInfo.Religions("ID <> '" .. religionID .. "'") do
			city:ConvertPercentFollowers(religionID, religion.ID, 100)
		end
		city:AdoptReligionFully(religionID)
		city:ConvertPercentFollowers(religionID, -1, 100)
		city:SetNumRealBuilding(buildingReligionMarkerID, 1)
		if (player:IsHuman() and faithReward > 0) then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_WHITE]+{1_Num}[ENDCOLOR] [ICON_PEACE] [COLOR_YIELD_GOLD]+{2_Num}[ENDCOLOR] [ICON_GOLD] {3_FontIcon}", faithReward, goldReward, GameInfo.Religions[religionID].IconString), true)
		end
		JFD_Castile_Jinetes(playerID, city)
	end
end
GameEvents.CityCaptureComplete.Add(JFD_Castile_Reconquista)

--JFD_Castile_CityConvertsReligion
function JFD_Castile_CityConvertsReligion(ownerID, newReligionID, plotX, plotY)
	local player = Players[ownerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitCastileID)) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity() 
	if (not city:IsHasBuilding(buildingReligionMarkerID)) then return end
	local religionID = player:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	if religionID <= 0 then religionID = player:GetCapitalCity():GetReligiousMajority() end
	if religionID <= 0 then return end
	if religionID == newReligionID then return end
	city:AdoptReligionFully(religionID) 
end				
GameEvents.CityConvertsReligion.Add(JFD_Castile_CityConvertsReligion)
----------------------------------------------------------------------------------------------------------------------------
-- CONQUISTADOR
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- JINETE
----------------------------------------------------------------------------------------------------------------------------
--JFD_Castile_Jinetes
local promotionJinetesHealID = GameInfoTypes["PROMOTION_JFD_JINETES_HEAL"]
function JFD_Castile_Jinetes(playerID, city)
	local unit = city:GetGarrisonedUnit()
	if (unit and unit:IsHasPromotion(promotionJinetesHealID)) then
		unit:ChangeDamage(-100)
		unit:ChangeMoves(120)
	end
end
--==========================================================================================================================
--==========================================================================================================================