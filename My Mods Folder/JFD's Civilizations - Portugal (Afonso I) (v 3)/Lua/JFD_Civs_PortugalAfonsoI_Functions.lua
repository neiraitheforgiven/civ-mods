-- JFD_Civs_PortugalAfonsoI_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingConventoID = GameInfoTypes["BUILDING_JFD_CONVENTO"]

local traitPortugalAfonsoIID = GameInfoTypes["TRAIT_JFD_PORTUGAL_AFONSO_I"]

local unitKnightAvizID = GameInfoTypes["UNIT_JFD_KNIGHT_AVIZ"]
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalAfonsoI_PlayerDoTurn
local buildingDummyPortugalAfonsoIID = GameInfoTypes["BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I"]
local buildingCourthouseID = GameInfoTypes["BUILDING_COURTHOUSE"]
local promotionKnightAvizID = GameInfoTypes["PROMOTION_JFD_KNIGHT_AVIZ"]
local function JFD_PortugalAfonsoI_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE TRAIT
	if HasTrait(player, traitPortugalAfonsoIID) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDummyPortugalAfonsoIID, 0)
			if city:IsHasBuilding(buildingCourthouseID) then
				city:SetNumRealBuilding(buildingDummyPortugalAfonsoIID, 1)
			end
		end
	end

	--UNIQUE UNIT
	local mainReligionID = player:GetReligionCreatedByPlayer()
	if Player.HasStateReligion then
		mainReligionID = player:GetStateReligion()
	end
	if mainReligionID == -1 then
		mainReligionID = playerCapital:GetReligiousMajority() 
	end
	if mainReligionID == -1 then return end
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionKnightAvizID) then
			local unitPlot = unit:GetPlot()
			local unitPlotOwnerID = unitPlot:GetOwner()
			if (unitPlot and unitPlotOwnerID ~= playerID and unitPlotOwnerID > -1) then
				local otherPlayer = Players[unitPlotOwnerID]
				local otherPlayerCapital = otherPlayer:GetCapitalCity()
				if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
					local mainOtherReligionID = otherPlayer:GetReligionCreatedByPlayer()
					if Player.HasStateReligion then
						mainOtherReligionID = otherPlayer:GetStateReligion()
					end
					if mainOtherReligionID == -1 then
						mainOtherReligionID = otherPlayerCapital:GetReligiousMajority() 
					end
					if religionID ~= otherReligionID then
						unit:ChangeDamage(-10)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PortugalAfonsoI_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalAfonsoI_CityTrained
function JFD_PortugalAfonsoI_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--UNIQUE BUILDING
	if (not isFaith) then return end
	local city = player:GetCityByID(cityID)
	if city:IsHasBuilding(buildingConventoID) then
		local unit = player:GetUnitByID(unitID)
		unit:ChangeMoves(unit:MaxMoves())
	end
end
GameEvents.CityTrained.Add(JFD_PortugalAfonsoI_CityTrained)
------------------------------------------------------------------------------------------------------------------------
--JFD_PortugalAfonsoI_UnitPrekill
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end
local function JFD_PortugalAfonsoI_UnitPrekill(unitOwnerID, unitID, unitTypeID, plotX, plotY, isDelay, playerID)
	local player = Players[unitOwnerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if isDelay then return end
	if playerID ~= -1 then return end
	
	--UNIQUE TRAIT
	if HasTrait(player, traitPortugalAfonsoIID) then return end
	local plot = Map.GetPlot(unitX, unitY)
	if plot:GetOwner() ~= unitOwnerID then return end
	if plot:IsCityRadius() ~= 1 then return end
	local mainReligionID = player:GetReligionCreatedByPlayer()
	if Player.HasStateReligion then
		mainReligionID = player:GetStateReligion()
	end
	if mainReligionID == -1 then
		mainReligionID = playerCapital:GetReligiousMajority() 
	end
	if mainReligionID == -1 then return end
	for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local city = loopPlot:GetPlotCity()
		if (city and city:GetOwner() == unitOwnerID) then
			city:ChangeDamage(-10)
			--g_Religions_Table
			local religionsTable = g_Religions_Table
			local numReligions = #religionsTable
			for index = 1, numReligions do
				local row = religionsTable[index]
				local religionID = row.ID
				city:ConvertPercentFollowers(mainReligionID, religionID, 15) 
			end
			city:ConvertPercentFollowers(mainReligionID, -1, 15)
			city:ConvertPercentFollowers(mainReligionID, 0, 15)
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("{1_Icon} {2_Desc}: +15% [ICON_MISSIONARY]", GameInfo.Religions[mainReligionID].IconString, Game.GetReligionName(mainReligionID)), true)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(JFD_PortugalAfonsoI_UnitPrekill)
--=======================================================================================================================
--=======================================================================================================================