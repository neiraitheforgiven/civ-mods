--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_PrisonersWar_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- TOP PANEL
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_UpdateTopPanel
local function JFD_PrisonersWar_UI_UpdateTopPanel()
	local chancePrisonersWar = Player_GetChanceToCapturePrisonersOfWar(activePlayer)
	Controls.PrisonersOfWarString:SetHide(false)
	Controls.PrisonersOfWarString:ChangeParent(ContextPtr:LookUpControl("/InGame/TopPanel/TopPanelInfoStack"))
	Controls.PrisonersOfWarString:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_CHANCE", chancePrisonersWar)
end
 -------------------------------------------------------------------------------------------------------------------------
local function Initialize()	
	Events.LoadScreenClose.Add(			  JFD_PrisonersWar_UI_UpdateTopPanel);
	Events.SerialEventGameDataDirty.Add(  JFD_PrisonersWar_UI_UpdateTopPanel);
	Events.SerialEventTurnTimerDirty.Add( JFD_PrisonersWar_UI_UpdateTopPanel);
	Events.SerialEventCityInfoDirty.Add(  JFD_PrisonersWar_UI_UpdateTopPanel);
end
Initialize();
--==========================================================================================================================
--==========================================================================================================================