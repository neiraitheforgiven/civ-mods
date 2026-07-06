--Stolen from Chrisy
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local civilizationID 		= GameInfoTypes["CIVILIZATION_JWW_COMANCHE"]
local isComancheCivActive	 = JFD_IsCivilisationActive(civilizationID)
local isComancheActivePlayer = activePlayer:GetCivilizationType() == civilizationID
if isComancheCivActive then
	print("JWW Comanche MCIS is loaded!")
end

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JWW_Comanche_MCIS", ["SortOrder"] = 1})
end

if isComancheActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JWW_Comanche_MCIS" then return end
	ProcessCityScreen(instance)
end
if isComancheActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JWW_Comanche_MCIS_TipControls = {}
TTManager:GetTypeControlTable("JWW_Comanche_MCIS_Tooltip", g_JWW_Comanche_MCIS_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local iUBDummy = GameInfoTypes["BUILDING_JWW_COMANCHE_CHURCH_DUMMY"]

function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JWW_Comanche_MCIS_Tooltip")
	IconHookup(2, 64, "JWW_COMANCHE_COLOR_ATLAS", instance.IconImage)
	if not city:IsHasBuilding(iUBDummy) then
		instance.IconFrame:SetHide(true)
		return
	end
	local bonus = city:GetNumBuilding(iUBDummy)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_JWW_COMANCHE_MCIS_DESC")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JWW_COMANCHE_MCIS_HELP", bonus)
	g_JWW_Comanche_MCIS_TipControls.Heading:SetText(textDescription)
	g_JWW_Comanche_MCIS_TipControls.Body:SetText(textHelp)
	g_JWW_Comanche_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
