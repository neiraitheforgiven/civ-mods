--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("PlotIterators.lua")
include("FLuaVector.lua")
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()
--------------------------------------------------------------
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
end
--------------------------------------------------------------
-- Localized Variables
--------------------------------------------------------------
local civilizationID = GameInfoTypes.CIVILIZATION_MC_NTF_SENECA
local isCivActive = JFD_IsCivilizationActive(civilizationID)
local defineMaxMajorCivs = GameDefines.MAX_MAJOR_CIVS

local traitMycenaeID = GameInfoTypes.TRAIT_MC_WORKS_OF_THE_CYCLOPES
local numHP = 10
local validBuildings = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE GreatWorkCount > -1 AND Cost > -1") do
	validBuildings[row.ID] = true
end

local unitclassSpearmanID = GameInfoTypes.UNITCLASS_SPEARMAN
local unitEnchophorosID = GameInfoTypes.UNIT_MC_NTF_SENECA_SWIFT_STRIKE
local buildingEnchophorosProdID = GameInfoTypes.BUILDING_MC_ENCHOPHOROS_PROD

local buildingTholosID = GameInfoTypes.BUILDING_MC_NTF_SENECAAN_THOLOS

if isCivActive then
	print("King Agamemnon is in this game.")
end
--------------------------------------------------------------
-- MC_Mycenae_OnCityCaptureComplete
--------------------------------------------------------------
function MC_Mycenae_OnCityCaptureComplete(oldPlayerID, isCapital, plotX, plotY, newPlayerID, isConquest)
	if not isConquest then return end
	local player = Players[newPlayerID]
	-- WORKS OF THE CYCLOPES
	if HasTrait(player, traitMycenaeID) then
		for city in player:Cities() do
			local numModifier = 10
			local numRawBonus = city:GetPopulation()
			local numBonus = numRawBonus * numModifier
			city:ChangeProduction(numBonus)
			if not (player:IsHuman() and player:IsTurnActive()) then return end
			local hex = HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY())))
			Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [PRODUCTION]", numBonus))
		end
	end
end

GameEvents.CityCaptureComplete.Add(MC_Mycenae_OnCityCaptureComplete)
--------------------------------------------------------------
-- MC_Mycenae_OnCityConstructed
--------------------------------------------------------------
function MC_Mycenae_OnCityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	-- WORKS OF THE CYCLOPES
	if HasTrait(player, traitMycenaeID) then
		for k,v in ipairs(validBuildings) do
			if buildingID ~= k then return end
			for iterPlot in PlotAreaSpiralIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local iterUnit = iterPlot:GetUnit()
				if not (iterPlot or iterUnit) then return end
				iterUnit:ChangeDamage(-numHP)
			end
		end
	end
end

GameEvents.CityConstructed.Add(MC_Mycenae_OnCityConstructed)
--------------------------------------------------------------
-- MC_Mycenae_OnPlayerDoTurn
--------------------------------------------------------------
function MC_Mycenae_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	-- ENCHOPHOROS
	if player:HasUnitOfClassType(unitclassSpearmanID) then
		for city in player:Cities() do
			local cityGarrison = city:GetGarrisonedUnit()
			if not cityGarrison then return end
			local isEnchophoros = 0
			if cityGarrison:GetUnitType() == unitEnchophorosID then
				isEnchophoros = 1
			end
			city:SetNumRealBuilding(buildingEnchophorosProdID, isEnchophoros)
		end
	end
	-- THOLOS
	if player:CountNumBuildings(buildingTholosID) > 0 then
		for city in player:Cities() do
			if not city:IsHasBuilding(buildingTholosID) then return end
			local cityGarrison = city:GetGarrisonedUnit()
			if not cityGarrison then return end
			cityGarrison:ChangeExperience(1)
		end
	end
end

GameEvents.PlayerDoTurn.Add(MC_Mycenae_OnPlayerDoTurn)
--------------------------------------------------------------
print("MycenaeFunctions.lua loaded successfully!")