include("FLuaVector.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Neirai-NezPerce-Lua";

EcologyId = GameInfoTypes.TECH_ECOLOGY
ForestId = GameInfoTypes.FEATURE_FOREST
GoldId = GameInfoTypes.YIELD_GOLD
HillsId = GameInfoTypes.PLOT_HILLS
HorsesId = GameInfoTypes.RESOURCE_HORSE
JungleId = GameInfoTypes.FEATURE_JUNGLE
LandId = GameInfoTypes.PLOT_LAND
MC_SalmonId = GameInfoTypes.RESOURCE_MC_SALMON
MountedUnits = {}
for row in GameInfo.Units("CombatClass='UNITCOMBAT_MOUNTED'") do
  if not MountedUnits[GameInfoTypes[row.Type]] then
    MountedUnits[GameInfoTypes[row.Type]] = true
  end
end
local NoFeatureId = GameInfoTypes.NO_FEATURE
local NTF_AppaloosaId = GameInfoTypes.UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER
local NTF_ConservCenterId = GameInfoTypes.BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER
local NTF_NezPerceId = GameInfoTypes.CIVILIZATION_NTF_NEZ_PERCE

function AdjacentSalmon(plot)
  for i = 0, 5 do
    local testPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), i)
    if testPlot ~= nil then
      if testPlot:GetResourceType() == MC_SalmonId then
        return true
      end
    end
  end
  return false
end

function CityGoldenAge(playerId)
  local player = Players[playerId]
  if player:GetCivilizationType() == NTF_NezPerceId then
    for city in player:Cities() do
      if MountedUnits[city:GetProductionUnit()] then
        local gold = 0
        for cityPlotId = 1, city:GetNumCityPlots() - 1, 1 do
          --if a plot has at least one gold yield, add one to gold
          local plot = city:GetCityIndexPlot(cityPlotId)
          if plot and plot:GetYield(GoldId) > 0 then
            gold = gold + 1
          end
        end
        local culture = math.floor(city:GetJONSCulturePerTurn() * 0.2)
        local production = math.floor(city:GetProduction() * 0.2)
        local plot = city:Plot()
        local callout = nil
        if gold > 0 or culture > 0 or production > 0 then
          callout = 'Thunder Rolling to Great Heights:[NEWLINE]'
        end
        if gold > 0 then
          player:ChangeGold(gold)
          callout = callout..'[COLOR_YIELD_GOLD]+ '..gold..' [ICON_GOLD] Gold[NEWLINE]'
        end
        if culture > 0 then
          player:ChangeJONSCulture(culture)
          callout = callout..'[COLOR_CULTURE_STORED]+ '..culture..' [ICON_CULTURE] Culture[NEWLINE]'
        end
        if production > 0 then
          city:ChangeProduction(production)
          callout = callout..'[COLOR_YIELD_FOOD]+ '..production..' [ICON_PRODUCTION] Production'
        end
        if callout then
          Events.AddPopupTextEvent(
              HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), callout, 0)
        end
      end
    end
  end
end

local TourismWidgets = {}
TourismWidgets[8] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET1
TourismWidgets[7] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET2
TourismWidgets[6] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET4
TourismWidgets[5] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET8
TourismWidgets[4] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET16
TourismWidgets[3] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET32
TourismWidgets[2] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET64
TourismWidgets[1] = GameInfoTypes.BUILDING_NTF_TOURISMWIDGET128

function GreatWorkHorses(playerId)
  local player = Players[playerId]
  local team = Teams[player:GetTeam()]
  print("John")
  if team:IsHasTech(EcologyId) then
    print("John")
    numMountedUnitsTrained = load(player, 'numMountedUnitsTrained')
    print("John: "..numMountedUnitsTrained)
    if numMountedUnitsTrained == nil or numMountedUnitsTrained == 0 then return end
    amount = numMountedUnitsTrained
    cap = player:GetCapitalCity()
    plot = cap:Plot()
    for i = 1, 8 do
      if amount > 0 then
        if amount > math.pow(2, 8 - i) then
          cap:SetNumRealBuilding(TourismWidgets[i], 1)
          amount = amount - math.pow(2, 8 - i)
        else
          cap:SetNumRealBuilding(TourismWidgets[i], 0)
        end
      else
        cap:SetNumRealBuilding(TourismWidgets[i], 0)
      end
    end
    Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))),
        '[COLOR_CULTURE_STORED]+ '..numMountedUnitsTrained..' [ICON_TOURISM] Tourism and [ICON_CULTURE] Culture from trained [ICON_RES_HORSE] mounted units.', 0)
  end
end


function TrainedAppaloosa(playerId, cityId, unitId)
  local player = Players[playerId]
  if player:GetCivilizationType() == NTF_NezPerceId then
    local unit = player:GetUnitByID(unitId)
    if unit:GetUnitType() == NTF_AppaloosaId then
      --calculate the number of imported horses
      local horses = player:GetNumResourceTotal(HorsesId, true) - player:GetNumResourceTotal(HorsesId, false)
      print("John horses: "..tostring(horses)..' '..player:GetNumResourceTotal(HorsesId, true)..' '..player:GetNumResourceTotal(HorsesId, false))
      if horses == 0 then return end
      local happy = horses * 15
      player:ChangeGoldenAgeProgressMeter(happy)
      print("John!")
      if playerId == Game.GetActivePlayer() then
        local city = player:GetCityByID(cityId)
        local plot = city:Plot()
        local callout = "[COLOR_YIELD_GOLD] +"..happy.."[ICON_HAPPINESS] Happiness[ENDCOLOR]"
        Events.AddPopupTextEvent(
            HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), callout, 0)
      end
    end
  end
end

function TrainedMounted(playerId, cityId, unitId)
  local player = Players[playerId]
  if player:GetCivilizationType() == NTF_NezPerceId then
    local unit = player:GetUnitByID(unitId)
    if MountedUnits[unit:GetUnitType()] then
      local numMountedUnitsTrained = load(player, 'numMountedUnitsTrained')
      if numMountedUnitsTrained == nil then
        numMountedUnitsTrained = 0
      end
      numMountedUnitsTrained = numMountedUnitsTrained + 1
      save(player, 'numMountedUnitsTrained', numMountedUnitsTrained)
    end
  end
end

function PlaceSalmon(playerId, cityId, buildingId)
  local player = Players[playerId]
  if player:GetCivilizationType() == NTF_NezPerceId and buildingId == NTF_ConservCenterId then
    local city = player:GetCityByID(cityId)
    for cityPlotId = 1, city:GetNumCityPlots() - 1, 1 do
      --add a salmon to each river plot that does not have a resource, improvement, or adjacent salmon
      local plot = city:GetCityIndexPlot(cityPlotId)
      if plot:IsRiver() then
        if plot:GetResourceType() == -1 and plot:GetImprovementType() == -1 then
          local feature = plot:GetFeatureType()
          if feature == ForestId or feature == JungleId or feature == NoFeatureId then
            if not AdjacentSalmon(plot) then
              plot:SetResourceType(MC_SalmonId)
            end
          end
        end
      end
    end
  end
end


for _, player in pairs(Players) do
  if player:GetCivilizationType() == NTF_NezPerceId then
    print('Nez Perce found. Loading functions')
    GameEvents.CityConstructed.Add(PlaceSalmon)
    GameEvents.CityTrained.Add(TrainedAppaloosa)
    GameEvents.CityTrained.Add(TrainedMounted)
    GameEvents.PlayerDoTurn.Add(CityGoldenAge)
    GameEvents.PlayerDoTurn.Add(GreatWorkHorses)
    break
  end
end
