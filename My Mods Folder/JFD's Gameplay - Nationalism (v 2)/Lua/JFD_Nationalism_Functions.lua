-- JFD_Nationalism_Functions
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_Nationalism_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive = Game.IsCPActive()
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--JFD_Nationalism_PlayerDoTurn
local function JFD_Nationalism_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsMinorCiv()) then return end
	if (player:IsBarbarian()) then return end

	local numNationalismPerTurn, numExtraNationalismPerTurn = player:GetNationalismPerTurn()	
	if numNationalismPerTurn ~= 0 or numExtraNationalismPerTurn ~= 0 then
		player:ChangeNationalism(numNationalismPerTurn+numExtraNationalismPerTurn)
		if numNationalismPerTurn > 0 then
			player:ChangeJONSCulture(-numNationalismPerTurn)
		end
	end

	if player:IsHuman() then
		LuaEvents.UI_Update_NationalismInfo()
	end
end
GameEvents.PlayerDoTurn.Add(JFD_Nationalism_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--g_Technologies_MaxNationalismPercent_Table
local g_Technologies_MaxNationalismPercent_Table = {}
local g_Technologies_MaxNationalismPercent_Count = 1
for row in DB.Query("SELECT ID FROM Technologies WHERE MaxNationalismPercent <> 0;") do 	
	g_Technologies_MaxNationalismPercent_Table[row.ID] = true
end

--JFD_Nationalism_TeamTechResearched
local function JFD_Nationalism_TeamTechResearched(teamID, techID) 
	if teamID ~= activeTeamID then return end
	if g_Technologies_MaxNationalismPercent_Table[techID] then
		LuaEvents.Update_UI_NationalismPercentSlider()
	end
end
GameEvents.TeamTechResearched.Add(JFD_Nationalism_TeamTechResearched)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- SOCIAL POLICY POPUP
-------------------------------------------------------------------------------------------------------------------------
--JFD_Nationalism_UI_UpdateSocialPolicyPopup
local function JFD_Nationalism_UI_UpdateSocialPolicyPopup()
	ContextPtr:LookUpControl("/InGame/SocialPolicyPopup/NationalismPercentSlider"):SetValue(activePlayer:GetNationalismPercent());
end
Events.LoadScreenClose.Add(JFD_Nationalism_UI_UpdateSocialPolicyPopup)
-------------------------------------------------------------------------------------------------------------------------
-- TOP PANEL
-------------------------------------------------------------------------------------------------------------------------
--JFD_Nationalism_UI_UpdateTopPanel
local function JFD_Nationalism_UI_UpdateTopPanel()
	local player = activePlayer
	
	local strCultureStr;
	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_POLICIES)) then
		strCultureStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_POLICIES_OFF");
	else
	
		if (player:GetNextPolicyCost() > 0) then
			strCultureStr = string.format("%i/%i (+%i) [COLOR_JFD_NATIONALISM](-%i)[ENDCOLOR]", player:GetJONSCulture(), player:GetNextPolicyCost(), player:GetTotalJONSCulturePerTurn(), player:GetNationalismPerTurn());
		else
			strCultureStr = string.format("%i (+%i) [COLOR_JFD_NATIONALISM](-%i)[ENDCOLOR]", player:GetJONSCulture(), player:GetTotalJONSCulturePerTurn(), player:GetNationalismPerTurn());
		end
	
		strCultureStr = "[ICON_CULTURE][COLOR:255:0:255:255]" .. strCultureStr .. "[/COLOR]";
	end
			
	ContextPtr:LookUpControl("/InGame/TopPanel/CultureString"):SetText(strCultureStr);
end
LuaEvents.JFD_Nationalism_UI_UpdateTopPanel.Add(JFD_Nationalism_UI_UpdateTopPanel)
 -------------------------------------------------------------------------------------------------------------------------
local function Initialize()	
	Events.LoadScreenClose.Add(			  JFD_Nationalism_UI_UpdateTopPanel);
	Events.SerialEventGameDataDirty.Add(  JFD_Nationalism_UI_UpdateTopPanel);
	Events.SerialEventTurnTimerDirty.Add( JFD_Nationalism_UI_UpdateTopPanel);
	Events.SerialEventCityInfoDirty.Add(  JFD_Nationalism_UI_UpdateTopPanel);
end
Initialize();
-------------------------------------------------------------------------------------------------------------------------
-- NATIONALISM NOTIFICATION
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ShowSocialPolicyPopup
local function JFD_PrisonersWar_UI_ShowSocialPolicyPopup()
	Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_CHOOSEPOLICY } );
end
-------------------------------------------------------------------------------------------------------------------------
--JFD_Nationalsim_UI_NotificationButtonAdded
local function JFD_PrisonersWar_UI_NotificationButtonAdded(button, notificationID, notificationType, notificationToolTip, strSummary, gameValue, extraGameData, playerID)
	if notificationType == NotificationTypes.NOTIFICATION_JFD_NATIONALISM_POLICY then
		button:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_ShowSocialPolicyPopup)
	end
end
LuaEvents.NotificationButtonAdded.Add(JFD_Nationalsim_UI_NotificationButtonAdded)
--==========================================================================================================================
--==========================================================================================================================