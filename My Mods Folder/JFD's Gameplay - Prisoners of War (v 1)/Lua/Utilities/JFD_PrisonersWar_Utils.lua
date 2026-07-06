-- JFD_PrisonersWar_Utils
-- Author: JFD
-- DateCreated: 5/6/2019 2:48:53 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--==========================================================================================================================
-- CACHING
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--g_Building_JFD_PrisonersWarMods_Table
local g_Building_JFD_PrisonersWarMods_Table = {}
local g_Building_JFD_PrisonersWarMods_Count = 1
for row in DB.Query("SELECT * FROM Building_JFD_PrisonersWarMods;") do 	
	g_Building_JFD_PrisonersWarMods_Table[g_Building_JFD_PrisonersWarMods_Count] = row
	g_Building_JFD_PrisonersWarMods_Count = g_Building_JFD_PrisonersWarMods_Count + 1
end

--g_Policy_JFD_PrisonersWarMods_Table
local g_Policy_JFD_PrisonersWarMods_Table = {}
local g_Policy_JFD_PrisonersWarMods_Count = 1
for row in DB.Query("SELECT * FROM Policy_JFD_PrisonersWarMods;") do 	
	g_Policy_JFD_PrisonersWarMods_Table[g_Policy_JFD_PrisonersWarMods_Count] = row
	g_Policy_JFD_PrisonersWarMods_Count = g_Policy_JFD_PrisonersWarMods_Count + 1
end

--g_Trait_JFD_PrisonersWarMods_Table
local g_Trait_JFD_PrisonersWarMods_Table = {}
local g_Trait_JFD_PrisonersWarMods_Count = 1
for row in DB.Query("SELECT * FROM Trait_JFD_PrisonersWarMods;") do 	
	g_Trait_JFD_PrisonersWarMods_Table[g_Trait_JFD_PrisonersWarMods_Count] = row
	g_Trait_JFD_PrisonersWarMods_Count = g_Trait_JFD_PrisonersWarMods_Count + 1
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive = Game.IsCPActive()
local g_IsNationalismActive = Game.IsNationalismActive()
--==========================================================================================================================
-- PRISONERS OF WAR UTILS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- PRISONERS OF WAR CHANCE
-------------------------------------------------------------------------------------------------------------------------
--g_Technologies_PrisonerWarChance_Table
local g_Technologies_PrisonerWarChance_Table = {}
local g_Technologies_PrisonerWarChance_Count = 1
for row in DB.Query("SELECT ID, PrisonerWarChance FROM Technologies WHERE PrisonerWarChance <> 0;") do 	
	g_Technologies_PrisonerWarChance_Table[g_Technologies_PrisonerWarChance_Count] = row
	g_Technologies_PrisonerWarChance_Count = g_Technologies_PrisonerWarChance_Count + 1
end

--Player_GetChanceToCapturePrisonersOfWar
function Player_GetChanceToCapturePrisonersOfWar(player)
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	local numChanceToCapturePrisonersWar = 0

	--g_Building_JFD_PrisonersWarMods_Table
	local buildingsTable = g_Building_JFD_PrisonersWarMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local ID = GameInfoTypes[row.BuildingType]
		if g_IsCPActive then
			if ((player:HasBuilding(ID) and (not row.IsLocal)) or (city and city:IsHasBuilding(ID))) then
				local numBuildings = city:GetNumRealBuilding(ID)
				numChanceToCapturePrisonersWar = numChanceToCapturePrisonersWar + (row.PrisonerWarChance*numBuildings)
			end
		else
			if ((player:CountNumBuildings(ID) > 0 and (not row.IsLocal)) or (city and city:IsHasBuilding(ID))) then
				local numBuildings = city:GetNumRealBuilding(ID)
				numChanceToCapturePrisonersWar = numChanceToCapturePrisonersWar + (row.PrisonerWarChance*numBuildings)
			end
		end
	end
	--g_Policy_JFD_PrisonersWarMods_Table
	local policiesTable = g_Policy_JFD_PrisonersWarMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local ID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(ID) then
			numChanceToCapturePrisonersWar = numChanceToCapturePrisonersWar + row.PrisonerWarChance
		end
	end
	--g_Technologies_PrisonerWarChance_Table
	local techsTable = g_Technologies_PrisonerWarChance_Table
	local numTechs = #techsTable
	for index = 1, numTechs do
		local row = techsTable[index]
		if teamTechs:HasTech(row.ID) then
			numChanceToCapturePrisonersWar = numChanceToCapturePrisonersWar + row.PrisonerWarChance
		end
	end
	if g_IsCPActive then
		--g_Trait_JFD_PrisonersWarMods_Table
		local traitsTable = g_Trait_JFD_PrisonersWarMods_Table
		local numTraits = #traitsTable
		for index = 1, numTraits do
			local row = traitsTable[index]
			local ID = GameInfoTypes[row.TraitType]
			if player:HasTrait(ID) then
				numChanceToCapturePrisonersWar = numChanceToCapturePrisonersWar + row.PrisonerWarChance
			end
		end
	end
	
	return numChanceToCapturePrisonersWar
end
-------------------------------------------------------------------------------------------------------------------------
-- PRISONERS OF WAR ACTIONS
-------------------------------------------------------------------------------------------------------------------------
--Player_GetPrisonersOfWarActionReward
local yieldTypes = {}
	yieldTypes["FLAVOR_CULTURE"] = "YIELD_CULTURE"
	yieldTypes["FLAVOR_GOLD"] = "YIELD_GOLD"
	yieldTypes["FLAVOR_HAPPINESS"] = "YIELD_GOLDEN_AGE_POINTS"
	yieldTypes["FLAVOR_OFFENSE"] = "YIELD_NATIONALISM"
	yieldTypes["FLAVOR_RELIGION"] = "YIELD_FAITH"
	yieldTypes["FLAVOR_SCIENCE"] = "YIELD_SCIENCE"
local yieldMods = {}
	yieldMods["YIELD_CULTURE"] = 3
	yieldMods["YIELD_GOLD"] = 2
	yieldMods["YIELD_GOLDEN_AGE_POINTS"] = 1
	yieldMods["YIELD_FAITH"] = 2
	yieldMods["YIELD_NATIONALISM"] = 3
	yieldMods["YIELD_SCIENCE"] = 5
function Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
	local numWarPrisonersThisTurn = Player_GetNumPrisonersWarCapturedThisTurn()

	local numBaseReward = 10
	local numReward = Game.GetEraAdjustedValue(player:GetID(), numBaseReward)

	local yieldType = yieldTypes[flavourType]
	local yieldMod = yieldMods[yieldType]
	numReward = g_GetRound(numReward/yieldMod)

	local numPrisonerWarYieldMods = 0

	--g_Building_JFD_PrisonersWarMods_Table
	local buildingsTable = g_Building_JFD_PrisonersWarMods_Table
	local numBuildings = #buildingsTable
	for index = 1, numBuildings do
		local row = buildingsTable[index]
		local ID = GameInfoTypes[row.BuildingType]
		if row.PrisonerWarYieldType == yieldType then
			if g_IsCPActive then
				if ((player:HasBuilding(ID) and (not row.IsLocal)) or (city and city:IsHasBuilding(ID))) then
					local numBuildings = city:GetNumRealBuilding(ID)
					numPrisonerWarYieldMods = numPrisonerWarYieldMods + (row.PrisonerWarYieldMod*numBuildings)
				end
			else
				if ((player:CountNumBuildings(ID) > 0 and (not row.IsLocal)) or (city and city:IsHasBuilding(ID))) then
					local numBuildings = city:GetNumRealBuilding(ID)
					numPrisonerWarYieldMods = numPrisonerWarYieldMods + (row.PrisonerWarYieldMod*numBuildings)
				end
			end
		end
	end
	--g_Policy_JFD_PrisonersWarMods_Table
	local policiesTable = g_Policy_JFD_PrisonersWarMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local ID = GameInfoTypes[row.PolicyType]
		if row.PrisonerWarYieldType == yieldType then
			if player:HasPolicy(ID) then
				numPrisonerWarYieldMods = numPrisonerWarYieldMods + row.PrisonerWarYieldMod
			end
		end
	end
	if g_IsCPActive then
		--g_Trait_JFD_PrisonersWarMods_Table
		local traitsTable = g_Trait_JFD_PrisonersWarMods_Table
		local numTraits = #traitsTable
		for index = 1, numTraits do
			local row = traitsTable[index]
			local ID = GameInfoTypes[row.TraitType]
			if row.PrisonerWarYieldType == yieldType then
				if player:HasTrait(ID) then
					numPrisonerWarYieldMods = numPrisonerWarYieldMods + row.PrisonerWarYieldMod
				end
			end
		end
	end

	if numPrisonerWarYieldMods ~= 0 then
		numReward = numReward + ((numReward*numPrisonerWarYieldMods)/100)
	end

	numReward = numReward * numWarPrisonersThisTurn

	return numReward
end
-------------------------------------------------------------------------------------------------------------------------
--Player_DoPrisonersOfWarAction
function Player_DoPrisonersOfWarAction(player, killedPlayer, flavourType, numWarPrisonersThisTurn)
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()

	local strNotificationShortDesc = nil
	local strNotificationDesc = nil
	local strWorldEvent = nil
	if flavourType == "FLAVOR_CULTURE" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		player:ChangeJONSCulture(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_ASSIMILATE_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_ASSIMILATE_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_ASSIMILATE_DESC"
	elseif flavourType == "FLAVOR_GOLD" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		player:ChangeGold(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_RANSOM_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_RANSOM_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_RANSOM_DESC"
	elseif flavourType == "FLAVOR_HAPPINESS" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		player:ChangeGoldenAgeProgressMeter(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_LIBERATE_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_LIBERATE_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_LIBERATE_DESC"
	elseif flavourType == "FLAVOR_OFFENSE" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		player:ChangeNationalism(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_EXECUTE_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_EXECUTE_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_EXECUTE_DESC"
	elseif flavourType == "FLAVOR_RELIGION" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		player:ChangeFaith(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_SACRIFICE_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_SACRIFICE_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_SACRIFICE_DESC"
	elseif flavourType == "FLAVOR_SCIENCE" then
		local numReward = Player_GetPrisonersOfWarActionReward(player, killedPlayer, flavourType)
		teamTechs:ChangeResearchProgress(numReward)

		strNotificationDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_ENSLAVE_DESC", numReward)
		strNotificationShortDesc = g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_PRISONERS_WAR_ENSLAVE_SHORT_DESC", numReward)
		strWorldEvent = "TXT_KEY_WORLD_EVENT_JFD_PRISONERS_WAR_ENSLAVE_DESC"
	end

	if (not player:IsHuman()) then
		if killedPlayer:IsHuman() then
			strWorldEvent = strWorldEvent .. "_HUMAN"
		end
		player:SendWorldEvent(g_ConvertTextKey(strWorldEvent, player:GetName(), player:GetCivilizationShortDescription(), killedPlayer:GetCivilizationShortDescription()), false)
	else
		player:SendNotification("NOTIFICATION_JFD_PRISONERS_OF_WAR", strNotificationDesc, strNotificationShortDesc, false, nil, nil, -1)
	end

	LuaEvents.JFD_PrisonersOfWarActionTaken(player:GetID(), killedPlayer:GetID(), flavourType)
end
-------------------------------------------------------------------------------------------------------------------------
--g_Beliefs_AllowsSacrifce_Table
local g_Beliefs_AllowsSacrifce_Table = {}
local g_Beliefs_AllowsSacrifce_Count = 1
for row in DB.Query("SELECT ID FROM Beliefs WHERE AllowsSacrifce = 1;") do 	
	g_Beliefs_AllowsSacrifce_Table[g_Beliefs_AllowsSacrifce_Count] = row
	g_Beliefs_AllowsSacrifce_Count = g_Beliefs_AllowsSacrifce_Count + 1
end

--Player_CanSacrificePrisonersOfWar
function Player_CanSacrificePrisonersOfWar(player)
		
	if g_IsCPActive then
		--g_Trait_JFD_PrisonersWarMods_Table
		local traitsTable = g_Trait_JFD_PrisonersWarMods_Table
		local numTraits = #traitsTable
		for index = 1, numTraits do
			local row = traitsTable[index]
			local ID = GameInfoTypes[row.TraitType]
			if row.AllowsSacrifce then
				if player:HasTrait(ID) then
					return true
				end
			end
		end
	end

	local pantheonBeliefID = player:GetBeliefInPantheon()
	--g_Beliefs_AllowsSacrifce_Table
	local beliefsTable = g_Beliefs_AllowsSacrifce_Table
	local numBeliefs = #beliefsTable
	for index = 1, numBeliefs do
		local row = beliefsTable[index]
		local ID = row.ID
		if pantheonBeliefID == ID then
			return true
		end
		if g_IsCPActive then
			if player:HasBelief(ID) then
				return true
			end
		end
	end


	return false
end
-------------------------------------------------------------------------------------------------------------------------
--Player_DoAIChoosePrisonersOfWarAction
local flavoursTable = {"FLAVOR_CULTURE", "FLAVOR_HAPPINESS", "FLAVOR_GOLD", "FLAVOR_RELIGION", "FLAVOR_SCIENCE"}
if g_IsNationalsimActive then
	flavoursTable = {"FLAVOR_CULTURE", "FLAVOR_HAPPINESS", "FLAVOR_GOLD", "FLAVOR_OFFENSE", "FLAVOR_RELIGION", "FLAVOR_SCIENCE"}
end
function Player_DoAIChoosePrisonersOfWarAction(killingPlayer, killedPlayer)
	local tableValidPolicies = {}
	local countValidPolicies = 1

	local highestFlavour = nil
	local numHighestFlavour = 0
	for index = 1, #flavoursTable do
		local flavour = flavoursTable[index]
		local numFlavour = killingPlayer:GetFlavorValue(flavour)
		if numFlavour > numHighestFlavour then
			highestFlavour = flavour
			numHighestFlavour = numFlavour
		end
	end
	Player_DoPrisonersOfWarAction(killingPlayer, killedPlayer, highestFlavour)
end
-------------------------------------------------------------------------------------------------------------------------
-- PRISONERS OF WAR THIS TURN
-------------------------------------------------------------------------------------------------------------------------
local g_NumWarPrisonersThisTurn = 0
local g_NumWarPrisonersDiffCivThisTurn = 0

--Player_GetNumPrisonersWarCapturedThisTurn
function Player_GetNumPrisonersWarCapturedThisTurn()
	return g_NumWarPrisonersThisTurn, g_NumWarPrisonersDiffCivThisTurn
end
-------------------------------------------------------------------------------------------------------------------------
--Player_ChangeNumPrisonersWarCapturedThisTurn
function Player_ChangeNumPrisonersWarCapturedThisTurn(numNewWarPrisonersThisTurn, numNewWarPrisonersDiffCivThisTurn)
	g_NumWarPrisonersThisTurn = g_NumWarPrisonersThisTurn + numNewWarPrisonersThisTurn
	g_NumWarPrisonersDiffCivThisTurn = g_NumWarPrisonersDiffCivThisTurn + numNewWarPrisonersDiffCivThisTurn
end
-------------------------------------------------------------------------------------------------------------------------
--Player_SetNumPrisonersWarCapturedThisTurn
function Player_SetNumPrisonersWarCapturedThisTurn(numWarPrisonersThisTurn, numWarPrisonersDiffCivThisTurn)
	g_NumWarPrisonersThisTurn =numWarPrisonersThisTurn
	g_NumWarPrisonersDiffCivThisTurn = numWarPrisonersDiffCivThisTurn
end
--==========================================================================================================================
--==========================================================================================================================