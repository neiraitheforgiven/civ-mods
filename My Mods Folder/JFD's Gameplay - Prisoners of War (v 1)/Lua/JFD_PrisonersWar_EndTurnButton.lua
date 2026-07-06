--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_PrisonersWar_Utils.lua")
 --==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]

local gameSpeedID		= Game.GetGameSpeedType()
local gameSpeed			= GameInfo.GameSpeeds[gameSpeedID]

local handicapID		= Game.GetHandicapType()
local handicap			= GameInfo.HandicapInfos[handicapID]
--==========================================================================================================================
 -- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_KillingPlayerID = -1
local g_KilledPlayerID = -1
local g_UnitTypeID = -1
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_BlockEndTurnButton
local function JFD_PrisonersWar_UI_BlockEndTurnButton(isBlocks, killingPlayerID, killedPlayerID, unitTypeID)
	print(killingPlayerID, killedPlayerID, unitTypeID, "killingPlayerID, killedPlayerID, unitTypeID")
	g_KillingPlayerID = killingPlayerID
	g_KilledPlayerID = killedPlayerID
	g_UnitTypeID = unitTypeID
	
	ContextPtr:SetHide(not isBlocks);

	Controls.EndTurnText:LocalizeAndSetText("TXT_KEY_END_TURN_JFD_PRISONERS_WAR")
	Controls.EndTurnButton:LocalizeAndSetToolTip("TXT_KEY_END_TURN_JFD_PRISONERS_WAR_TT")
end
LuaEvents.JFD_PrisonersWar_UI_BlockEndTurnButton.Add(JFD_PrisonersWar_UI_BlockEndTurnButton)
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_EndTurnButton
local function JFD_PrisonersWar_UI_EndTurnButton()
	LuaEvents.JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup(g_KillingPlayerID, g_KilledPlayerID, unitTypeID)
end
Controls.EndTurnButton:RegisterCallback(Mouse.eLClick, JFD_PrisonersWar_UI_EndTurnButton);
-------------------------------------------------------------------------------------------------------------------------
ContextPtr:SetHide(true);
 --==========================================================================================================================
--==========================================================================================================================