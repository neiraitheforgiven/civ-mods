-- JFD_GreatRelics_Functions
-- Author: JFD
-- DateCreated: 3/17/2018 2:04:37 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  	= Locale.ConvertTextKey
local g_GameSpeedID			= Game.GetGameSpeedType()
local g_GameSpeed			= GameInfo.GameSpeeds[g_GameSpeedID]
local g_GameSpeedMod		= g_GameSpeed.GoldenAgePercent/100
local g_GetRandom	    	= Game.GetRandom
local g_GetRound	    	= Game.GetRound
local g_GetUserSetting  	= Game.GetUserSetting
local g_MathMin				= math.min
local g_MapGetPlot			= Map.GetPlot
local g_MapPlotDistance		= Map.PlotDistance
							
local Players 				= Players
local HexToWorld 			= HexToWorld
local ToHexFromGrid 		= ToHexFromGrid
local Teams 				= Teams
							
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local CUSTOM_MISSION_NO_ACTION		 	= 0
local CUSTOM_MISSION_ACTION			 	= 1
local CUSTOM_MISSION_DONE            	= 2
local CUSTOM_MISSION_ACTION_AND_DONE 	= 3

local missionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]

local unitClassGreatProphetID  = GameInfoTypes["UNITCLASS_PROPHET"]
local unitGreatProphetID	   = GameInfoTypes["UNIT_PROPHET"]
local unitFakeGreatProphetID   = GameInfoTypes["UNIT_JFD_GREAT_PROPHET"]
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive = Game.IsCPActive()
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GREAT PEOPLE
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatRelics_GreatWorkCreated
function JFD_GreatRelics_GreatWorkCreated(playerID, unitID, greatWorkID)
	local player = Players[playerID]
	if (not player:IsHuman()) then return end

	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitClassType() ~= unitClassGreatProphetID then return end

	local descGreatWork = GameInfo.GreatWorks[greatWorkID].Description
	local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
	Events.GameplayFX(hex.x, hex.y, -1)
	Events.AudioPlay2DSound("AS2D_UNIT_GREAT_PROPHET_ACTIVATE")
end
if g_IsCPActive then
	GameEvents.GreatWorkCreated.Add(JFD_GreatRelics_GreatWorkCreated)
end
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatRelics_SerialEventUnitCreated
local function JFD_GreatRelics_SerialEventUnitCreated(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatProphetID then return end

	if player:GetReligionCreatedByPlayer() <= 0 then return end
	if g_IsCPActive then
		if (not player:HasEnhancedReligion()) then return end
	end	

	local plotX, plotY = unit:GetX(), unit:GetY()
	player:InitUnit(unitFakeGreatProphetID, plotX, plotY)
	unit:Kill(-1)
end
Events.SerialEventUnitCreated.Add(JFD_GreatRelics_SerialEventUnitCreated)
--==========================================================================================================================
--==========================================================================================================================

