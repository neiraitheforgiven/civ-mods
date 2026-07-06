-- JFD_SpainPhilipII_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM\
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
include("UniqueDiplomacyUtilsV2.lua")
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
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local mathCeil		 = math.ceil
----------------------------------------------------------------------------------------------------------------------------
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
--JFD_SpainPhilipII_UniqueResponses
local leaderCharlesVID	= GameInfoTypes["LEADER_JFD_CHARLES_V"]
local leaderElizabethID = GameInfoTypes["LEADER_ELIZABETH"]
local leaderIsabellaID  = GameInfoTypes["LEADER_ISABELLA"]
local leaderPhilipIIID  = GameInfoTypes["LEADER_JFD_PHILIP_II"]
local leaderWilliamID	= GameInfoTypes["LEADER_WILLIAM"]
function JFD_SpainPhilipII_UniqueResponses()
	if activePlayer:GetLeaderType() == leaderPhilipIIID then return end
	-- If the player is JFD's Charles V.
	if (leaderCharlesVID and activePlayer:GetLeaderType() == leaderCharlesVID) then
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_FIRST_GREETING",		"TXT_KEY_LEADER_JFD_PHILIP_II_FIRSTGREETING%", 		"TXT_KEY_LEADER_JFD_PHILIP_II_CHARLES_V_GREETING_1",		500)
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_DEFEATED,",			"TXT_KEY_LEADER_JFD_PHILIP_II_DEFEATED%", 	 		"TXT_KEY_LEADER_JFD_PHILIP_II_CHARLES_V_DEFEATED_1",		500)
	-- If the player is Elizabeth.
	elseif activePlayer:GetLeaderType() == leaderElizabethID then
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_FIRST_GREETING",			"TXT_KEY_LEADER_JFD_PHILIP_II_FIRSTGREETING%", 		"TXT_KEY_LEADER_JFD_PHILIP_II_ELIZABETH_GREETING_1",		500)
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_DEFEATED,",				"TXT_KEY_LEADER_JFD_PHILIP_II_DEFEATED%", 	 		"TXT_KEY_LEADER_JFD_PHILIP_II_ELIZABETH_DEFEATED_1",		500)
	-- If the player is Isabella.
	elseif activePlayer:GetLeaderType() == leaderIsabellaID then
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_FIRST_GREETING",			"TXT_KEY_LEADER_JFD_PHILIP_II_FIRSTGREETING%", 		"TXT_KEY_LEADER_JFD_PHILIP_II_ISABELLA_GREETING_1",			500)
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_DEFEATED,",				"TXT_KEY_LEADER_JFD_PHILIP_II_DEFEATED%", 	 		"TXT_KEY_LEADER_JFD_PHILIP_II_ISABELLA_DEFEATED_1",			500)
	-- If the player is William I.
	elseif activePlayer:GetLeaderType() == leaderWilliamID then
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_FIRST_GREETING",			"TXT_KEY_LEADER_JFD_PHILIP_II_FIRSTGREETING%", 		"TXT_KEY_LEADER_JFD_PHILIP_II_WILLIAM_GREETING_1",			500)
		ChangeDiplomacyResponse("LEADER_JFD_PHILIP_II",	"RESPONSE_DEFEATED,",				"TXT_KEY_LEADER_JFD_PHILIP_II_DEFEATED%", 	 		"TXT_KEY_LEADER_JFD_PHILIP_II_WILLIAM_DEFEATED_1",			500)
	end
end
Events.SequenceGameInitComplete.Add(JFD_SpainPhilipII_UniqueResponses)
----------------------------------------------------------------------------------------------------------------------------
-- PLUS ULTRA
----------------------------------------------------------------------------------------------------------------------------
local traitSpainPhilipIIID = GameInfoTypes["TRAIT_JFD_SPAIN_PHILIP_II"]

--JFD_SpainPhilipII_SunNeverSets
function JFD_SpainPhilipII_SunNeverSets(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitSpainPhilipIIID)) then return end
	local plot = Map.GetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if player:IsGoldenAge() then
		for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if adjacentPlot:GetOwner() == -1  then
				adjacentPlot:SetOwner(playerID, city:GetID(), true, true)
				adjacentPlot:SetRevealed(player:GetTeam(), true)
			end
		end
	end
	local religionID = player:GetReligionCreatedByPlayer()
	if userSettingPietyCore then religionID = player:GetStateReligion() end
	if religionID <= 0 then religionID = player:GetCapitalCity():GetReligiousMajority() end
	if religionID <= 0 then return end
	for religion in GameInfo.Religions("ID <> '" .. religionID .. "'") do
		city:ConvertPercentFollowers(religionID, religion.ID, 100)
	end
	city:AdoptReligionFully(religionID)
	city:ConvertPercentFollowers(religionID, -1, 100)
end
GameEvents.PlayerCityFounded.Add(JFD_SpainPhilipII_SunNeverSets)

--JFD_SpainPhilipII_SunNeverSets_DoTurn
local buildingSpainPhilipII		= GameInfoTypes["BUILDING_JFD_SPAIN_PHILIP_II"]
local unitClassColonistID		= GameInfoTypes["UNITCLASS_JFD_COLONIST"]
local unitClassColonistCBOID	= GameInfoTypes["UNITCLASS_COLONIST"]
local unitClassPeasantID		= GameInfoTypes["UNITCLASS_WORKER"]
local unitClassPioneerCBOID		= GameInfoTypes["UNITCLASS_PIONEER"]
local unitClassSettlerID		= GameInfoTypes["UNITCLASS_SETTLER"]
local unitClassSlaveID			= GameInfoTypes["UNITCLASS_JFD_SLAVE"]
local unitClassWorkBoatID		= GameInfoTypes["UNITCLASS_WORKBOAT"]
local unitClassWorkerID			= GameInfoTypes["UNITCLASS_JFD_WORKER"]
function JFD_SpainPhilipII_SunNeverSets_DoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitSpainPhilipIIID)) then return end
	local isGoldenAge = player:IsGoldenAge()
	for city in player:Cities() do
		if (not city:IsHasBuilding(buildingSpainPhilipII)) then
			if isGoldenAge then
				city:SetNumRealBuilding(buildingSpainPhilipII, 1)
			end
		end
		if city:IsHasBuilding(buildingSpainPhilipII) then
			if (not isGoldenAge) then
				city:SetNumRealBuilding(buildingSpainPhilipII, 0)
			end
		end
	end
	if isGoldenAge then 
		for unit in player:Units() do
			local unitClassID = unit:GetUnitClassType()
			if unitClassID == unitClassWorkerID or
			unitClassID == unitClassWorkBoatID or
			unitClassID == unitClassPeasantID or
			unitClassID == unitClassColonistID or
			unitClassID == unitClassColonistCBOID or
			unitClassID == unitClassPioneerCBOID or
			unitClassID == unitClassSlaveID or
			unitClassID == unitClassSettlerID then
				unit:ChangeMoves(120)
			end
		end
	end
end

--JFD_SpainPhilipII_SunNeverSets_GoldenAge
function JFD_SpainPhilipII_SunNeverSets_GoldenAge(playerID, isStart, numTurns)
	if (not isStart) then return end
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitSpainPhilipIIID)) then return end
	for city in player:Cities() do
		if (not city:IsHasBuilding(buildingSpainPhilipII)) then
			city:SetNumRealBuilding(buildingSpainPhilipII, 1)
		end
	end
end
if isCPDLL then
	GameEvents.PlayerGoldenAge.Add(JFD_SpainPhilipII_SunNeverSets_GoldenAge)
end
GameEvents.PlayerDoTurn.Add(JFD_SpainPhilipII_SunNeverSets_DoTurn)
----------------------------------------------------------------------------------------------------------------------------
-- TERCIO
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- SEMINARY
----------------------------------------------------------------------------------------------------------------------------
--JFD_SpainPhilipII_Seminary
local buildingSeminaryID = GameInfoTypes["BUILDING_JFD_SEMINARY"]
local promotionSeminaryID = GameInfoTypes["PROMOTION_JFD_SEMINARY"]
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
function JFD_SpainPhilipII_Seminary(playerID, unitID, unitType, plotX, plotY, isDelay, otherPlayerID)
	local player = Players[playerID]
	if (isDelay) then return end
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitSpainPhilipIIID)) then return end
	if playerID == otherPlayerID then return end
	local capital = player:GetCapitalCity() 
	if (not capital) then return end
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitMissionaryID then return end
	if unit:GetSpreadsLeft() > 1 then return end
	local goldenAgeReward = (player:GetTotalFaithPerTurn()*3)
	player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
	if player:IsHuman() then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR][ICON_GOLDEN_AGE]", goldenAgeReward))
		Events.GameplayFX(hex.x, hex.y, -1)
	end
end
GameEvents.UnitPrekill.Add(JFD_SpainPhilipII_Seminary)

--JFD_SpainPhilipII_Seminary_UnitTrained
function JFD_SpainPhilipII_Seminary_UnitTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitSpainPhilipIIID)) then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if city:IsHasBuilding(buildingSeminaryID) then
		if unit:GetUnitType() == unitMissionaryID then
			unit:SetHasPromotion(promotionSeminaryID, true)
			unit:ChangeMoves(unit:MaxMoves()*60)
		end
	end
end
GameEvents.CityTrained.Add(JFD_SpainPhilipII_Seminary_UnitTrained)
--==========================================================================================================================
--==========================================================================================================================