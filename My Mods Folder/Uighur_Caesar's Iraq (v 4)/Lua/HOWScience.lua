-- Lua Script1
-- Author: pedro
-- DateCreated: 03/26/15 6:46:02 PM
--------------------------------------------------------------
include("PlotIterators")

local IraqID = GameInfoTypes["CIVILIZATION_IRAQ"]

function JFD_IsCivilisationActive(IraqID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == IraqID then
				return true
			end
		end
	end

	return false
end

local isIraqActive = JFD_IsCivilisationActive(IraqID)


local buildingHOWID = GameInfoTypes["BUILDING_HOW"]
local specialistScientistID = GameInfoTypes["SPECIALIST_SCIENTIST"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
																
function HOWScience(playerID)
	local player = Players[playerID];
    if (player:IsAlive() and player:GetCivilizationType() == IraqID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingHOWID) then
				local scientistBoost = math.ceil(city:GetBaseYieldRate(yieldFaithID) * 25/100)
				city:ChangeSpecialistGreatPersonProgressTimes100(specialistScientistID, scientistBoost*100)
			end	
		end
	end
end

if isIraqActive then
GameEvents.PlayerDoTurn.Add(HOWScience)
end

function GetNumAdjacentRivers(playerID, city)
	local numAdjacentRivers = 0
	local plot = Map.GetPlot(city:GetX(), city:GetY())
    for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local x = adjacentPlot:GetX()
		local y = adjacentPlot:GetY()
		if adjacentPlot:GetOwner() == playerID and adjacentPlot:IsRiver() then
			numAdjacentRivers = numAdjacentRivers + 1
		end
	end

    return numAdjacentRivers    
end

-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function IraqRivers(playerID, iX, iY)
	local player = Players[playerID]
	if player:GetCivilizationType() == IraqID and player:IsAlive() then
	local plot = Map.GetPlot(iX, iY)
	local city = plot:GetPlotCity()
	if plot:IsRiver() then
	city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_IRAQ_HAPPY, 1)
    for riverPlots in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if riverPlots:IsFreshWater() and riverPlots:IsOpenGround() then
		if (riverPlots:GetResourceType() == GameInfoTypes.RESOURCE_WHEAT) then
		riverPlots:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM, 1)
		else
		if riverPlots:GetResourceType(-1) == -1 then
		if JFD_GetRandom(1,10) >= 6 then
		riverPlots:SetImprovementType(GameInfoTypes.IMPROVEMENT_FARM, 1)
		end
	end
end
end
end
end
end
end

if isIraqActive then
GameEvents.PlayerCityFounded.Add(IraqRivers)
end

function HealAdjacentToRiver(iPlayer)
	if Players[iPlayer]:GetUnitClassCount(GameInfoTypes.UNITCLASS_GREAT_WAR_INFANTRY) > 0 then
		for iUnit in Players[iPlayer]:Units() do
			if iUnit:GetUnitType() == GameInfoTypes.UNIT_UC_ASSYRIAN_LEVY then
				RiverHeal(iUnit)
			end
		end
	end
end
Events.AIProcessingEndedForPlayer.Add(HealAdjacentToRiver)

function RiverHeal(cUnit)
	local cPlot = cUnit:GetPlot();
		if cPlot:IsRiver() then
				cUnit:ChangeDamage(-10);
				return;
			end
		end

function IraqGoldenAges(playerID)
local player = Players[playerID]
	if player:GetCivilizationType() == IraqID and player:IsAlive() then
	if player:IsGoldenAge() then
	for city in player:Cities() do
	if (not city:IsHasBuilding(GameInfoTypes.BUILDING_RIVERDUMMY)) then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_RIVERDUMMY, 1)
	end
	end
	else
	for city in player:Cities() do
	if city:IsHasBuilding(GameInfoTypes.BUILDING_RIVERDUMMY) then
							city:SetNumRealBuilding(GameInfoTypes.BUILDING_RIVERDUMMY, 0)
						end
					end
				end
			end
		end

if isIraqActive then
GameEvents.PlayerDoTurn.Add(IraqGoldenAges)
end
