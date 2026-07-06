-- JFD_Nationalism_Utils
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:10 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--==========================================================================================================================
-- CACHING
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_Nationalism_GlobalDefines.lua");
include("TableSaverLoader016.lua");

tableRoot = JFD_Nationalism
tableName = "JFD_Nationalism"

include("JFD_Nationalism_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)
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
--g_Policy_JFD_NationalismMods_Table
local g_Policy_JFD_NationalismMods_Table = {}
local g_Policy_JFD_NationalismMods_Count = 1
for row in DB.Query("SELECT * FROM Policy_JFD_NationalismMods;") do 	
	g_Policy_JFD_NationalismMods_Table[g_Policy_JFD_NationalismMods_Count] = row
	g_Policy_JFD_NationalismMods_Count = g_Policy_JFD_NationalismMods_Count + 1
end
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive = Game.IsCPActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local defineBasePolicyCost = GameDefines["BASE_POLICY_COST"]
local defineBasePolicyCostExponented = GameDefines["POLICY_COST_EXPONENT"]
local defineBasePolicyCostToBeExponented = GameDefines["POLICY_COST_INCREASE_TO_BE_EXPONENTED"]
--==========================================================================================================================
-- NATIONALISM UTILS
--==========================================================================================================================
-- NATIONALISM YIELD
-------------------------------------------------------------------------------------------------------------------------
--g_Technologies_MaxNationalismPercent_Table
local g_Technologies_MaxNationalismPercent_Table = {}
local g_Technologies_MaxNationalismPercent_Count = 1
for row in DB.Query("SELECT ID, MaxNationalismPercent FROM Technologies WHERE MaxNationalismPercent <> 0;") do 	
	g_Technologies_MaxNationalismPercent_Table[g_Technologies_MaxNationalismPercent_Count] = row
	g_Technologies_MaxNationalismPercent_Count = g_Technologies_MaxNationalismPercent_Count + 1
end

--Player:GetMaxNationalismPercent
function Player.GetMaxNationalismPercent(player)
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()

	local numMax = 0
	
	--g_Policy_JFD_NationalismMods_Table
	local policiesTable = g_Policy_JFD_NationalismMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			numMax = numMax + row.MaxNationalismPercent
		end
	end
		
	--g_Technologies_MaxNationalismPercent_Table
	local techsTable = g_Technologies_MaxNationalismPercent_Table
	local numTechs = #techsTable
	for index = 1, numTechs do
		local row = techsTable[index]
		if teamTechs:HasTech(row.ID) then
			numMax = numMax + row.MaxNationalismPercent
		end
	end
	
	return g_MathMin(numMax,100)
end	
-------------------------------------------------------------------------------------------------------------------------
--Player:GetNationalismPercent
function Player.GetNationalismPercent(player)
	if player:IsHuman() then
		local control = ContextPtr:LookUpControl("/InGame/SocialPolicyPopup/NationalismPercentSlider")
		if control then
			local value = control:GetValue()
			if value == 0 then
				value = JFD_Nationalism["PERCENT"] or 0
			end
			local maxValue = player:GetMaxNationalismPercent()
			value = (g_MathFloor((value*100)*maxValue)/100)
			return value
		end
	else
		local value = (g_GetRound(player:GetFlavorValue("FLAVOR_CULTURE")/2)*10)
		local maxValue = player:GetMaxNationalismPercent()
		value = (g_MathFloor(value*maxValue)/100)
		return value
	end
	return 0
end	
-------------------------------------------------------------------------------------------------------------------------
--Player_SetNationalismPercent
function Player_SetNationalismPercent(player, value)
	JFD_Nationalism["PERCENT"] = value
end	
-------------------------------------------------------------------------------------------------------------------------
--Player:GetNationalismPerTurn
function Player.GetNationalismPerTurn(player)	
	local numCulturePerTurn = player:GetTotalJONSCulturePerTurn()
	local numNationalismPercent = player:GetNationalismPercent()
	local numNationalismPerTurn = g_GetRound((numCulturePerTurn*numNationalismPercent)/100)
	
	local numExtraNationalismPerTurn = 0
	--g_Policy_JFD_NationalismMods_Table
	local policiesTable = g_Policy_JFD_NationalismMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			numExtraNationalismPerTurn = numExtraNationalismPerTurn + g_GetRound((numCulturePerTurn*row.FreeCultureToNationalismModifier)/100) 
		end
	end
	
	return numNationalismPerTurn, numExtraNationalismPerTurn
end
-------------------------------------------------------------------------------------------------------------------------
--Player:GetNationalism
function Player.GetNationalism(player)	
	local playerID = player:GetID()
	return JFD_Nationalism["STORED"] or 0
end
-------------------------------------------------------------------------------------------------------------------------
--Player:ChangeNationalism
function Player.ChangeNationalism(player, value)	
	local currentValue = player:GetNationalism()
	local newValue = value+currentValue
	Player_SetNationalism(player, newValue)
	LuaEvents.UI_Update_NationalismInfo()

	if value > 0 then
		local costNationalismPolicy = player:GetNationalismPolicyCost()
		if newValue >= costNationalismPolicy then
			if (player:IsHuman() and player:GetNumPolicies() > 0) then
				player:SendNotification("NOTIFICATION_JFD_NATIONALISM_POLICY", g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_NATIONALISM_CAN_BE_SPENT_DESC"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_JFD_NATIONALISM_CAN_BE_SPENT_SHORT_DESC"))
			else
				Player_DoAIChooseNationalismPolicy(player)
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
--Player_SetNationalism
function Player_SetNationalism(player, value)	
	JFD_Nationalism["STORED"] = g_MathMax(value,0)
end
-------------------------------------------------------------------------------------------------------------------------
-- NATIONALISM POLICIES
-------------------------------------------------------------------------------------------------------------------------
--Player:GetNationalismPolicyCost
function Player.GetNationalismPolicyCost(player, policyID)
	local numCost = g_GetRound(player:GetNextPolicyCost()/4)

	local numNationalismPolicies = player:GetNumNationalismPolicies()
	numCost = defineBasePolicyCost + ((defineBasePolicyCostToBeExponented*numNationalismPolicies)^defineBasePolicyCostExponented)
	numCost = ((numCost*gameSpeed.CulturePercent)/100)
	numCost = ((numCost*handicap.PolicyPercent)/100)
	numCost = g_GetRound(numCost/2)

	--g_Policy_JFD_NationalismMods_Table
	local policiesTable = g_Policy_JFD_NationalismMods_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = GameInfoTypes[row.PolicyType]
		if player:HasPolicy(policyID) then
			numCost = numCost + ((numCost*row.NationalismCostModifier)/100)
		end
	end
	
	return g_GetRound(numCost)
end
-------------------------------------------------------------------------------------------------------------------------
--Player_GetNationalismPolicy
function Player_GetNationalismPolicy(player, policyID)
	return GameInfoTypes[GameInfo.Policies[policyID].Type .. "_NATIONALISM"]
end
-------------------------------------------------------------------------------------------------------------------------
--Player:HasNationalismPolicy
function Player.HasNationalismPolicy(player, policyID)
	local nationalismPolicyID = Player_GetNationalismPolicy(player, policyID)
	return player:HasPolicy(nationalismPolicyID)
end
-------------------------------------------------------------------------------------------------------------------------
--Player:SetHasNationalismPolicy
function Player.SetHasNationalismPolicy(player, policyID, setHas)
	if g_IsCPActive then
		player:GrantPolicy(policyID, setHas)
	else
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyID, setHas)
	end
	LuaEvents.UI_UpdateNationalismPolicyInfo()

	local costNationalism = player:GetNationalismPolicyCost(policyID)
	player:ChangeNationalism(-costNationalism)

	if setHas then
		LuaEvents.JFD_PolicyNationalized(player:GetID(), policyID)
	end

	if player:IsHuman() then
		Events.AudioPlay2DSound("AS2D_SOUND_JFD_NATIONALISM_POLICY_ADOPTED");		
	end
end
-------------------------------------------------------------------------------------------------------------------------
--g_NationalismPolicies_Table
local g_NationalismPolicies_Table = {}
local g_NationalismPolicies_Count = 1
for row in DB.Query("SELECT ID FROM Policies WHERE IsNationalism = 1;") do 	
	g_NationalismPolicies_Table[g_NationalismPolicies_Count] = row
	g_NationalismPolicies_Count = g_NationalismPolicies_Count + 1
end

--Player:GetNumNationalismPolicies
function Player.GetNumNationalismPolicies(player)
	local numNationalismPolicies = 0
	
	--g_NationalismPolicies_Table
	local policiesTable = g_NationalismPolicies_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		if player:HasPolicy(row.ID) then
			numNationalismPolicies = numNationalismPolicies + 1
		end
	end
		
	return numNationalismPolicies
end
-------------------------------------------------------------------------------------------------------------------------
--g_Policies_Table
local g_Policies_Table = {}
local g_Policies_Count = 1
for row in DB.Query("SELECT Type FROM Policies WHERE IsNationalism = 0 AND Level = 0 AND PolicyBranchType IS NOT NULL;") do 	
	g_Policies_Table[g_Policies_Count] = row
	g_Policies_Count = g_Policies_Count + 1
end

--Player_DoAIChooseNationalismPolicy
function Player_DoAIChooseNationalismPolicy(player)
	local tableValidPolicies = {}
	local countValidPolicies = 1

	--g_Policies_Table
	local policiesTable = g_Policies_Table
	local numPolicies = #policiesTable
	for index = 1, numPolicies do
		local row = policiesTable[index]
		local policyID = GameInfoTypes[row.Type]
		if player:HasPolicy(policyID) then
			local nationalismPolicyID = Player_GetNationalismPolicy(player, policyID)
			if (not player:HasPolicy(nationalismPolicyID)) then
				tableValidPolicies[countValidPolicies] = nationalismPolicyID
				countValidPolicies = countValidPolicies + 1
			end
		end
	end
	
	if #tableValidPolicies > 0 then
		local nationalismPolicyID = tableValidPolicies[g_GetRandom(1,#tableValidPolicies)]
		player:SetHasNationalismPolicy(nationalismPolicyID, true)
		player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLICY_NATIONALISED_DESC", player:GetName(), player:GetCivilizationShortDescription(), GameInfo.Policies[nationalismPolicyID].Description), false)
	end
end
--=======================================================================================================================
-- CACHING
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--Initialize_Cache
function Initialize_Cache() 
	TableSave(tableRoot, tableName)
end
Initialize_Cache()
--==========================================================================================================================
--==========================================================================================================================