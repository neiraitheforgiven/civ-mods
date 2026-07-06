-- JFD_PrisonersWar_Functions
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
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
local g_IsNationalismActive = Game.IsNationalismActive()
--==========================================================================================================================
-- GLOBAL DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_ActionAutomated = nil
local g_Actions = {}
	g_Actions[1] = "FLAVOR_RELIGION"
	g_Actions[2] = "FLAVOR_SCIENCE"
	g_Actions[3] = "FLAVOR_GOLD"
	g_Actions[4] = "FLAVOR_CULTURE"
	g_Actions[5] = "FLAVOR_HAPPINESS"
	g_Actions[6] = "FLAVOR_OFFENSE"
local g_LastKilledPlayerID = -1
local g_NotificationID = nil
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_ActivePlayerTurnStart
local function JFD_PrisonersWar_ActivePlayerTurnStart()
	Player_SetNumPrisonersWarCapturedThisTurn(0,0)
end
Events.ActivePlayerTurnStart.Add(JFD_PrisonersWar_ActivePlayerTurnStart)
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UnitKilledInCombat
local function JFD_PrisonersWar_UnitKilledInCombat(killingPlayerID, killedPlayerID, unitTypeID)
	local killingPlayer = Players[killingPlayerID]
	local killedPlayer = Players[killedPlayerID]
	
	local chanceToCapture = Player_GetChanceToCapturePrisonersOfWar(killingPlayer)
	if chanceToCapture >= g_GetRandom(1,100) then
		if g_LastKilledPlayerID ~= killedPlayerID then
			Player_ChangeNumPrisonersWarCapturedThisTurn(1, 1)
		else
			Player_ChangeNumPrisonersWarCapturedThisTurn(1, 0)
		end

		if killingPlayer:IsHuman() then
			g_LastKilledPlayerID = killedPlayerID
			if g_ActionAutomated then
				Player_DoPrisonersOfWarAction(killingPlayer, killedPlayer, g_Actions[g_ActionAutomated])
			else
				LuaEvents.JFD_PrisonersWar_UI_BlockEndTurnButton(true, killingPlayerID, killedPlayerID, unitTypeID)
				activePlayer:SendNotification("NOTIFICATION_JFD_PRISONERS_OF_WAR_CHOICE", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_DESC"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_SHORT_DESC"), false, nil, nil, -1)
				Events.AudioPlay2DSound("AS2D_SOUND_JFD_PRISONERS_WAR_NOTIFICATION")
			end
		else
			Player_DoAIChoosePrisonersOfWarAction(killingPlayer, killedPlayer)
		end
	end
end
GameEvents.UnitKilledInCombat.Add(JFD_PrisonersWar_UnitKilledInCombat)
-------------------------------------------------------------------------------------------------------------------------
--g_Technologies_PrisonerWarChance_Table
local g_Technologies_PrisonerWarChance_Table = {}
local g_Technologies_PrisonerWarChance_Count = 1
for row in DB.Query("SELECT ID FROM Technologies WHERE PrisonerWarChance <> 0;") do 
	g_Technologies_PrisonerWarChance_Table[row.ID] = true
end

--JFD_PrisonersWar_TeamTechResearched
local function JFD_PrisonersWar_TeamTechResearched(teamID, techID) 
	if teamID ~= activeTeamID then return end
	if g_Technologies_PrisonerWarChance_Table[techID] then
		g_ActionAutomated = nil
	end
end
GameEvents.TeamTechResearched.Add(JFD_PrisonersWar_TeamTechResearched)
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_KilledPlayer = nil
-------------------------------------------------------------------------------------------------------------------------
-- PRISONERS OF WAR POPUP
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup
local function JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup(killingPlayerID, killedPlayerID, unitTypeID)
	if killingPlayerID ~= activePlayerID then
		killingPlayerID = activePlayerID
		killedPlayerID = g_LastKilledPlayerID
	end
	if (not killingPlayerID) then
		killingPlayerID = activePlayerID
	end
	if (not killedPlayerID) then
		killedPlayerID = g_LastKilledPlayerID
	end

	local killingPlayer = Players[killingPlayerID]
	
	local killedPlayer = Players[killedPlayerID]
	g_KilledPlayer = killedPlayer
	
	local numWarPrisonersThisTurn, numWarPrisonersDiffCivThisTurn = Player_GetNumPrisonersWarCapturedThisTurn()
	if numWarPrisonersDiffCivThisTurn > 1 or (not killedPlayer) then
		Controls.PopupText:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_SUMMARY_VARIOUS")
	else
		Controls.PopupText:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_SUMMARY", killedPlayer:GetCivilizationShortDescription())
	end

	--local chancePrisonersWar = Player_GetChanceToCapturePrisonersOfWar(killingPlayer)
	--Controls.PrisonerWarChanceLabel:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_CHANCE", chancePrisonersWar)
	--Controls.PrisonerWarChanceLabel:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHANCE_TT")

	local canSacrifice = Player_CanSacrificePrisonersOfWar(killingPlayer)
	if (not canSacrifice) then
		Controls.Button1Text:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_1_DISABLED")
		Controls.Button1:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_1_HELP_DISABLED", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_RELIGION", numWarPrisonersThisTurn))
	else
		Controls.Button1Text:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_1")
		Controls.Button1:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_1_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_RELIGION", numWarPrisonersThisTurn))
	end
	Controls.Button1:SetDisabled(not canSacrifice)
	Controls.Button1Check:SetDisabled(not canSacrifice)

	Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_2_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_SCIENCE", numWarPrisonersThisTurn))

	Controls.Button3Text:LocalizeAndSetText("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_3")
	Controls.Button3:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_3_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_GOLD", numWarPrisonersThisTurn))

	Controls.Button4:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_4_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_CULTURE", numWarPrisonersThisTurn))

	Controls.Button5:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_5_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_HAPPINESS", numWarPrisonersThisTurn))

	Controls.Button6:LocalizeAndSetToolTip("TXT_KEY_JFD_PRISONERS_WAR_CHOICE_6_HELP", Player_GetPrisonersOfWarActionReward(killingPlayer, killedPlayer, "FLAVOR_OFFENSE", numWarPrisonersThisTurn))
	Controls.Button6:SetHide(not g_IsNationalismActive)

	Events.AudioPlay2DSound("AS2D_SOUND_JFD_PRISONERS_WAR_POPUP")

	ContextPtr:SetHide(false);
end
LuaEvents.JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup.Add(JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup);
-----------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_HidePrisonersOfWarPopup
local function JFD_PrisonersWar_UI_HidePrisonersOfWarPopup()
	LuaEvents.JFD_PrisonersWar_UI_BlockEndTurnButton(false)
	LuaEvents.NotificationButtonRemoved(g_NotificationID)
	ContextPtr:SetHide(true);
end
JFD_PrisonersWar_UI_HidePrisonersOfWarPopup()
-------------------------------------------------------------------------------------------------------------------------
local g_ActionSelected = nil

--JFD_PrisonersWar_UI_Yes
local function JFD_PrisonersWar_UI_Yes()
	Player_DoPrisonersOfWarAction(activePlayer, g_KilledPlayer, g_Actions[g_ActionSelected])
	Controls.ActionConfirm:SetHide(true)
	JFD_PrisonersWar_UI_HidePrisonersOfWarPopup();
	Events.AudioPlay2DSound("AS2D_SOUND_JFD_GENERIC_CHOICE")
end
Controls.Yes:RegisterCallback(Mouse.eLClick, JFD_PrisonersWar_UI_Yes);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_No
local function JFD_PrisonersWar_UI_No()
	Controls.ActionConfirm:SetHide(true)
end
Controls.No:RegisterCallback(Mouse.eLClick, JFD_PrisonersWar_UI_No);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_SetInputHandler
local function JFD_PrisonersWar_UI_SetInputHandler(uiMsg, wParam, lParam)
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE then
			if Controls.ActionConfirm:IsHidden() then
				ContextPtr:SetHide(true);
			else
				Controls.ActionConfirm:SetHide(true)
			end
        end
    end
end
ContextPtr:SetInputHandler(JFD_PrisonersWar_UI_SetInputHandler);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button1
local function JFD_PrisonersWar_UI_Button1()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 1
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_PrisonersWar_UI_Button1);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button2
local function JFD_PrisonersWar_UI_Button2()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 2
end
Controls.Button2:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_Button2);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button3
local function JFD_PrisonersWar_UI_Button3()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 3
end
Controls.Button3:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_Button3);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button4
local function JFD_PrisonersWar_UI_Button4()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 4
end
Controls.Button4:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_Button4);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button5
local function JFD_PrisonersWar_UI_Button5()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 5
end
Controls.Button5:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_Button5);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_Button6
local function JFD_PrisonersWar_UI_Button6()
	Controls.ActionConfirm:SetHide(false)
	g_ActionSelected = 6
end
Controls.Button6:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_Button6);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck1
local function JFD_PrisonersWar_UI_ButtonCheck1(isChecked)
	g_ActionAutomated = 1
	if isChecked then
		Controls.Button2Check:SetCheck(not isChecked)
		Controls.Button3Check:SetCheck(not isChecked)
		Controls.Button4Check:SetCheck(not isChecked)
		Controls.Button5Check:SetCheck(not isChecked)
		Controls.Button6Check:SetCheck(not isChecked)
	end
end
Controls.Button1Check:RegisterCheckHandler( JFD_PrisonersWar_UI_ButtonCheck1);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck2
local function JFD_PrisonersWar_UI_ButtonCheck2(isChecked)
	g_ActionAutomated = 2
	if isChecked then
		Controls.Button1Check:SetCheck(not isChecked)
		Controls.Button3Check:SetCheck(not isChecked)
		Controls.Button4Check:SetCheck(not isChecked)
		Controls.Button5Check:SetCheck(not isChecked)
		Controls.Button6Check:SetCheck(not isChecked)
	end
end
Controls.Button2Check:RegisterCheckHandler( JFD_PrisonersWar_UI_ButtonCheck2 );
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck3
local function JFD_PrisonersWar_UI_ButtonCheck3(isChecked)
	g_ActionAutomated = 3
	if isChecked then
		Controls.Button1Check:SetCheck(not isChecked)
		Controls.Button2Check:SetCheck(not isChecked)
		Controls.Button4Check:SetCheck(not isChecked)
		Controls.Button5Check:SetCheck(not isChecked)
		Controls.Button6Check:SetCheck(not isChecked)
	end
end
Controls.Button3Check:RegisterCheckHandler( JFD_PrisonersWar_UI_ButtonCheck3);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck4
local function JFD_PrisonersWar_UI_ButtonCheck4(isChecked)
	g_ActionAutomated = 4
	if isChecked then
		Controls.Button1Check:SetCheck(not isChecked)
		Controls.Button2Check:SetCheck(not isChecked)
		Controls.Button3Check:SetCheck(not isChecked)
		Controls.Button5Check:SetCheck(not isChecked)
		Controls.Button6Check:SetCheck(not isChecked)
	end
end
Controls.Button4Check:RegisterCheckHandler( JFD_PrisonersWar_UI_ButtonCheck4);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck5
local function JFD_PrisonersWar_UI_ButtonCheck5(isChecked)
	g_ActionAutomated = 5
	if isChecked then
		Controls.Button1Check:SetCheck(not isChecked)
		Controls.Button2Check:SetCheck(not isChecked)
		Controls.Button3Check:SetCheck(not isChecked)
		Controls.Button4Check:SetCheck(not isChecked)
		Controls.Button6Check:SetCheck(not isChecked)
	end
end
Controls.Button5Check:RegisterCheckHandler( JFD_PrisonersWar_UI_ButtonCheck5);
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_ButtonCheck6
local function JFD_PrisonersWar_UI_ButtonCheck6(isChecked)
	g_ActionAutomated = 6
	if isChecked then
		Controls.Button1Check:SetCheck(not isChecked)
		Controls.Button2Check:SetCheck(not isChecked)
		Controls.Button3Check:SetCheck(not isChecked)
		Controls.Button4Check:SetCheck(not isChecked)
		Controls.Button5Check:SetCheck(not isChecked)
	end
end
Controls.Button6Check:RegisterCheckHandler(JFD_PrisonersWar_UI_ButtonCheck6);
-----------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_CloseButton
local function JFD_PrisonersWar_UI_CloseButton()
	ContextPtr:SetHide(true);
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_CloseButton);
-------------------------------------------------------------------------------------------------------------------------
-- PRISONERS OF WAR NOTIFICATION
-------------------------------------------------------------------------------------------------------------------------
--JFD_PrisonersWar_UI_NotificationButtonAdded
local function JFD_PrisonersWar_UI_NotificationButtonAdded(button, notificationID, notificationType, notificationToolTip, strSummary, gameValue, extraGameData, playerID)
	if notificationType == NotificationTypes.NOTIFICATION_JFD_PRISONERS_OF_WAR_CHOICE then
		g_NotificationID = notificationID
		button:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup)
		button:RegisterCallback( Mouse.eLClick, JFD_PrisonersWar_UI_ShowPrisonersOfWarPopup )
	end
end
LuaEvents.NotificationButtonAdded.Add(JFD_PrisonersWar_UI_NotificationButtonAdded)
--==========================================================================================================================
--==========================================================================================================================