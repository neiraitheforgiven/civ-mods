--------------------------------------------------------------
include( "SaveUtils" ); MY_MOD_NAME = "UAE_Decisions";

--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetNumCitiesBuildingWonders
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumCitiesBuildingWonders(player)
	local numWonderBuildings = 0
	for city in player:Cities() do
		if city:GetProductionBuilding() ~= -1 then
			local currentBuildingClass = GameInfo.Buildings[city:GetProductionBuilding()].BuildingClass
			local buildingClass = GameInfo.BuildingClasses[currentBuildingClass]
			if buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1 then
				numWonderBuildings = numWonderBuildings + 1
			end
		end
	end

	return numWonderBuildings
end
--------------------------------------------------------------------------------------------------------------------------
--  JFD_GetNumAlliedAndFriendlyCS
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumAlliedAndFriendlyCS(playerID)
	local numAlliedAndFriendlyCS = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1 then
			numAlliedAndFriendlyCS = numAlliedAndFriendlyCS + 1
		end
	end

	return numAlliedAndFriendlyCS
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- UAE: Establish Fund
-------------------------------------------------------------------------------------------------------------------------
local Decisions_EstablishArabFund = {}
	Decisions_EstablishArabFund.Name = "TXT_KEY_DECISIONS_UAE_FUND"
	Decisions_EstablishArabFund.Desc = "TXT_KEY_DECISIONS_UAE_FUND_DESC"
	HookDecisionCivilizationIcon(Decisions_EstablishArabFund, "CIVILIZATION_UAE")
	Decisions_EstablishArabFund.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UAE"]) then return false, false end
		if load(pPlayer, "Decisions_EstablishArabFund") == true then
			Decisions_EstablishArabFund.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UAE_FUND_ENACTED_DESC")
			return false, false, true
		end
		
		local numCSNeeded = 7
		if Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_DUEL"] or Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_TINY"] then
			numCSNeeded = 3
		elseif Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_SMALL"] or Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_STANDARD"] then
			numCSNeeded = 5
		end

		local numCSGot = JFD_GetNumAlliedAndFriendlyCS(pPlayer:GetID())
		Decisions_EstablishArabFund.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UAE_FUND_DESC", numCSNeeded, numCSGot)
		if not (pPlayer:GetCapitalCity()) then return true, false end
		if (JFD_GetNumAlliedAndFriendlyCS(pPlayer:GetID()) < numCSNeeded) then return true, false end
		if (pPlayer:GetGold() < 1000) then return true, false end

		return true, true
	end
	)
	
	Decisions_EstablishArabFund.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeGold(-1000)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_UAE_FUND"], true)
		save(pPlayer, "Decisions_EstablishArabFund", true)
	end
	)
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_UAE"], "Decisions_EstablishArabFund", Decisions_EstablishArabFund)
--=======================================================================================================================
--=======================================================================================================================
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UAE: Dubai Corp
--------------------------------------------------------------------------------------------------------------------------
local techTheologyID = GameInfoTypes["TECH_ECONOMICS"]
local DubaiCorpID = GameInfoTypes["POLICY_DUBAI_CORP"]

local Decisions_DubaiCorp = {}
	Decisions_DubaiCorp.Name = "TXT_KEY_DECISIONS_DUBAI_CORP"
	Decisions_DubaiCorp.Desc = "TXT_KEY_DECISIONS_DUBAI_CORP_DESC"
	HookDecisionCivilizationIcon(Decisions_DubaiCorp, "CIVILIZATION_UAE")
	Decisions_DubaiCorp.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UAE"] then return false, false end
		if load(player, "Decisions_DubaiCorp") == true then
			Decisions_DubaiCorp.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUBAI_CORP_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_DubaiCorp.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUBAI_CORP_DESC")
		local goldCost = 800 *iMod
		local cultureCost = 400 * iMod
		Decisions_DubaiCorp.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUBAI_CORP_DESC", cultureCost, goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetGold() < goldCost then return true, false end
		if JFD_GetNumCitiesBuildingWonders(player) == 0 			then return true, false end
		
		return true, true
	end
	)
		
	
Decisions_DubaiCorp.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local cultureCost = 400 * iMod
        local goldCost = 800 * iMod
        player:ChangeJONSCulture(-cultureCost)
        player:ChangeGold(-goldCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(DubaiCorpID, true)
        player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DUBAI_CORP, 1)
        save(player, "Decisions_DubaiCorp", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_UAE, "Decisions_DubaiCorp", Decisions_DubaiCorp)

	function UAEFund(playerID)
		local pPlayer = Players[playerID]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UAE"]) then return end
		if load(pPlayer, "Decisions_EstablishArabFund") == true then
			if load(player, "arabFundReset") == true then
			for city in pPlayer:Cities() do
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_FUND_FOOD, 0)
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_FUND_PRODUCTION, 0)
		end
		save(pPlayer, "arabFundReset", nil)
	end
		save(pPlayer, "arabFundReset", true)
		local tradeRoutes = pPlayer:GetTradeRoutes()
		local anyInternalTradeRoute = false
		for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
			local originatingCity = tradeRoute.FromCity
			local targetCity = tradeRoute.ToCity
			local target = Players[targetCity:GetOwner()]
			if target:IsMinorCiv() then
				local extraGold = originatingCity:GetNumBuilding(GameInfoTypes.BUILDING_UAE_FUND_FOOD) + 1
				local extraGrowth = originatingCity:GetNumBuilding(GameInfoTypes.BUILDING_UAE_FUND_PRODUCTION) + 1
				originatingCity:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_FUND_FOOD, extraGold)
				originatingCity:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_FUND_PRODUCTION, extraGrowth)
				end
          		end
		end
	end
GameEvents.PlayerDoTurn.Add(UAEFund)

function DubaiCorpUnit(iPlayer, iCity, iUnit, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_UAE then 
	if not(pPlayer:HasPolicy(GameInfoTypes.POLICY_DUBAI_CORP)) then return end

	local strength = math.max(pUnit:GetBaseRangedCombatStrength(), pUnit:GetBaseCombatStrength())

	if strength > 0 then

	pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_ENGINEER, strength*100)
		
		end
	end	
end
GameEvents.CityTrained.Add(DubaiCorpUnit)

function DubaiCorpBuilding(playerID, cityID, buildingID, isGold)
local player = Players[playerID]
if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_UAE then 
	if player:HasPolicy(GameInfoTypes.POLICY_DUBAI_CORP) then
	if isGold then
        local city = player:GetCityByID(cityID)
		local prodCost = player:GetBuildingProductionNeeded(buildingID)
		local engineerBoost = math.floor(prodCost * .1 * iMod)
			city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_ENGINEER, engineerBoost*100)
			end
		end
	end
end
GameEvents.CityConstructed.Add(DubaiCorpBuilding)

	

