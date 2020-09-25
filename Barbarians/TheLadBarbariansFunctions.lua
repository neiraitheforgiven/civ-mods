import math

local function InvalidBarbStart(pPlot, pPlayer)
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local plot = Map.GetPlotByIndex(plotLoop)
		local unit = plot:GetUnit(0)
		if unit ~= nil then
			if unit:GetOwner() ~= pPlayer then
				if Map.PlotDistance(plot:GetX(), plot:GetY(), pPlot:GetX(), pPlot:GetY()) < 8 then
					print("Distance is " .. Map.PlotDistance(plot:GetX(), plot:GetY(), pPlot:GetX(), pPlot:GetY()))
					print("Enemy Unit too close")
					return true
				end
			end
		end
	end
	return false
end

local function AuditBarbStartArea(pPlot, pPlayer)
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	local range = 1
	local snowplots = 0
	local waterplots = 0
	local iceplots = 0
	local otherplots = 0
	local otherunit = false
	local noplots = 0
	if pPlot:GetPlotType() == PlotTypes.PLOT_MOUNTAIN then
		print("This is a bad plot because it's a mountain!")
		return false
	end
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if (SpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN) then
						waterplots = waterplots + 1
					end
					if (SpecificPlot:GetFeatureType() == GameInfoTypes.FEATURE_ICE) then
						iceplots = iceplots + 1
					end
				else
					print("This is a bad plot because it's nil")
					return false
				end
			end
		end
	end
	if waterplots > 4 then
		print("This is a bad plot because it's too wet!")
		return false
	end
	if (iceplots > 2) then
		print ("This is a bad plot because there's too much ice!")
		return false
	end
	waterplots = 0
	iceplots = 0
	range = 3
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if SpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
						snowplots = snowplots + 1
					elseif (SpecificPlot:IsWater()) then
						waterplots = waterplots + 1
					elseif (SpecificPlot:GetFeatureType() == GameInfoTypes.FEATURE_ICE) then
						iceplots = iceplots + 1
					else
						otherplots = otherplots + 1
					end
				else
					noplots = noplots + 1
				end
			end
		end
	end
	if InvalidBarbStart(pPlot, pPlayer) then
		print("Someone is in this plot")
		return false
	elseif noplots > 4 then
		print("This is a bad plot because there's too much nil around it!")
		return false
	else
		return true
	end
end

local function ShuffleTiles(ResourceTable) -- This function brought to you by wikipedia
	local n = #ResourceTable
	while n >= 2 do
		local k = math.random(n)
	    ResourceTable[n], ResourceTable[k] = ResourceTable[k], ResourceTable[n]
		n = n - 1
	end
	n = 2
	print("Shuffled")
	for k,v in pairs(ResourceTable) do print(k,v) end
	return ResourceTable
end

function FindBarbStartPlots(pPlayer)
	print("Finding A Start Plot")
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		local nearestLandPlot = pPlot:GetNearestLandPlot()
		local uaTableName = string.format("the_lads_barbarian_start%s", playerId)
    	MapModData.uaTableName = MapModData.uaTableName or {}
    	local uaTable = MapModData.uaTableName
    	if uaTable[nearestLandPlot] == nil then
            table.insert(uaTable, nearestLandPlot, AuditBarbStartArea(nearestLandPlot, pPlayer))
        end
		ShuffleTiles(uaTable)
		local numberPlaced = 0
		for i, campPlot in pairs(uaTable) do
            if uaTable[campPlot] == true then
            	if InvalidBarbStart(campPlot, pPlayer) then
            		uaTable[campPlot] == false
            	else
            		spawnBarbCamp(v, pPlayer)
            		numberPlaced = numberPlaced + 1
            		if numberPlaced >= 3 then
            			break
            		end
            	end
            end
        end
	end
end


local lbCampId = GameInfoTypes.IMPROVEMENT_THE_LADS_BARBARIANS_CAMP
local lbCivId = GameInfoTypes.CIVILIZATION_THE_LADS_BARBARIANS
local settlerId = GameInfoTypes.UNIT_SETTLER
local bruteId = GameInfoTypes.UNIT_BRUTE
local unitCombats = []
unitCombats[0] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombats[1] = GameInfoTypes.UNITCOMBAT_ARCHER
unitCombats[2] = GameInfoTypes.UNITCOMBAT_MOUNTED
unitCombats[3] = GameInfoTypes.UNITCOMBAT_GUN
unitCombats[4] = GameInfoTypes.UNITCOMBAT_ARMOR
unitCombats[5] = GameInfoTypes.UNITCOMBAT_ARCHER
unitCombats[6] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombats[7] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombats[8] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombats[9] = GameInfoTypes.UNITCOMBAT_MELEE

local unitCombatsIncludeNaval = []
unitCombatsIncludeNaval[0] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombatsIncludeNaval[1] = GameInfoTypes.UNITCOMBAT_ARCHER
unitCombatsIncludeNaval[2] = GameInfoTypes.UNITCOMBAT_MOUNTED
unitCombatsIncludeNaval[3] = GameInfoTypes.UNITCOMBAT_GUN
unitCombatsIncludeNaval[4] = GameInfoTypes.UNITCOMBAT_ARMOR
unitCombatsIncludeNaval[5] = GameInfoTypes.UNITCOMBAT_ARCHER
unitCombatsIncludeNaval[6] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombatsIncludeNaval[7] = GameInfoTypes.UNITCOMBAT_MELEE
unitCombatsIncludeNaval[8] = GameInfoTypes.UNITCOMBAT_NAVALMELEE
unitCombatsIncludeNaval[9] = GameInfoTypes.UNITCOMBAT_NAVALMELEE
unitCombatsIncludeNaval[10] = GameInfoTypes.UNITCOMBAT_NAVALMELEE
unitCombatsIncludeNaval[11] = GameInfoTypes.UNITCOMBAT_NAVALRANGED

function AnyTeamHasTech(TechId)
	for i, Team in pairs(Teams) do
		if Team:IsHasTech(TechId) then
			return true
		end
	end
	return false
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function GenerateBarbarianUnitPoints()

function SetCampNextUnit()


function GetNextBarbarianUnit(pPlot)
    --decide which unitCombats
    unitCombat = 0
    if pPlot then
    	if pPlot:IsCoastalLand() then
    		unitCombat = unitCombatsIncludeNaval[math.random(0, 11)]
    	else
    		unitCombat = unitCombats[math.random(0, 9)]
    	end
    else
    	unitCombat = unitCombats[math.random(0, 9)]
    end
    local eligibleUnits = []
    for i, unitClass in pairs(GameInfoTypes.UnitClasses) do
    	defaultUnit = GameInfoTypes.Units[unitClass['DefaultUnit']]
    	if defaultUnit['CombatClass'] == unitCombat then
            local isUnlocked = AnyTeamHasTech(defaultUnit['PrereqTech'])
            local isObsolete = AnyTeamHasTech(defaultUnit['ObsoleteTech'])
            if isUnlocked and not isObsolete then
            	eligibleUnits.insert(defaultUnit)
            end
        end
    end
    eligibleUnitsCount = table
    local selectedUnit = bruteId
    if tablelength(eligibleUnitsCount) > 0 then
    	selectedUnit = eligibleUnits[math.random(0, eligibleUnitsCount)]
    end
    return selectedUnit
end

function SpawnBarbarianUnit(pPlot, pPlayer, unitTypeId)
    pPlayer:InitUnit(unitTypeId, pPlot:GetX(), pPlot:GetY())
end

function SpawnBarbCamp(pPlot, pPlayer)
	pPlot:SetImprovementType(lbCampId)
	SpawnBarbarianUnit(pPlot, pPlayer, GetNextBarbarianUnit(pPlot))
end

function RemoveBarbCamp(pPlot)
	if pPlot:GetImprovementType() == lbCampId then
		pPlot:SetImprovementType(-1)
	end
end

function OnPillageTrader()

function OnCaptureAllTheThings()


function CreateLadsBarbStartingLocation(pPlot, pPlayer)
	spawnBarbCamp(pPlot, pPlayer)
	for i = 0, pPlot:GetNumUnits() - 1 do
		pUnit = pPlot:GetUnit(i)
		if pUnit ~= nil then
			if pUnit:GetUnitType() == settlerId then
				pUnit:Kill()
			end
		end
	end
end

function FindTheLadsBarbarians()
	if Game.GetGameTurn() <= Game.GetStartTurn() then
		for i, possibleLadBarb in pairs(Players) do
			if possibleLadBarb:GetCivilizationType() == lbCivId then
				for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
					local pPlot = Map.GetPlotByIndex(plotLoop)
					local pUnit = pPlot:GetUnit()
					if pUnit ~= nil then
						if (pUnit:GetUnitType() == GameInfoTypes.UNIT_SETTLER) and (pUnit:GetCivilizationType() == lbCivId) then
							CreateLadsBarbStartingLocation(pPlot, possibleLadBarb)
						end
					end
				end
			end
		end
	end
end
FindTheInuit()