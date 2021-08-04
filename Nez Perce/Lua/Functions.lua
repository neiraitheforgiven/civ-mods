include("FLuaVector.lua")
include("Sukritact_SaveUtiles.lua"); MY_MOD_NAME = "Neirai-NezPerce-Lua";

EcologyId = GameInfoTypes.TECH_ECOLOGY
ForestId = GameInfoTypes.FEATURE_FOREST
GoldId = GameInfoTypes.YIELD_GOLD
HillsId = GameInfoTypes.PLOT_HILLS
HorsesId = GameInfoTypes.RESOURCE_HORSES
JungleId = GameInfoTypes.FEATURE_JUNGLE
LandId = GameInfoTypes.PLOT_LAND
MC_SalmonId = GameInfoTypes.RESOURCE_MC_SALMON
MountedUnits = {}
for row in GameInfo.Units("CombatClass='Mounted'") do
  if not MountedUnits[GameInfoTypes[row.Type]] then
    MountedUnits[GameInfoTypes[row.Type]] = true
  end
end
NoFeatureId = GameInfoTypes.NO_FEATURE
NTF_AppaloosaId = GameInfoTypes.UNIT_NTF_APPALOOSA
NTF_ConservCenterId = GameInfoTypes.BUILDING_NTF_CONSERVATIONCENTER
NTF_NezPerceId = GameInfoTypes.CIVILIZATION_NTF_NEZPERCE

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
  local player = Players(playerId)
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
        local culture = math.floor(city.GetJONSCulturePerTurn() * 0.2)
        local production = math.floor(city.GetProduction() * 0.2)
        plot = city:Plot()
        if gold > 0 or culture > 0 or production > 0 then
          Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(plot:GetX(), plot:GetY()))),
              'Thunder Rolling to Great Heights:', 0)
        end
        if gold > 0 then
          player:ChangeGold(gold)
          Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(plot:GetX(), plot:GetY()))),
              '[COLOR_YIELD_GOLD]+ '..gold..' [ICON_GOLD] Gold', 0)
        end
        if culture > 0 then
          player:ChangeJONSCulture(culture)
          Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(plot:GetX(), plot:GetY()))),
              '[COLOR_CULTURE_STORED]+ '..culture..' [ICON_CULTURE] Culture', 0)
        end
        if production > 0 then
          city:ChangeProduction(production)
          Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(plot:GetX(), plot:GetY()))),
              '[COLOR_YIELD_FOOD]+ '..production..' [INCON_PRODUCTION] Production', 0)
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
  local player = Players(playerId)
  local team = Teams[player:GetTeam()]
  if Team:IsHasTech(EcologyId) then
    numMountedUnitsTrained = load(player, 'numMountedUnitsTrained')
    if numMountedUnitsTrained == nil or numMountedUnitsTrained == 0 then return end
    amount = numMountedUnitsTrained
    cap = player:GetCapitalCity()
    plot = cap:GetPlot()
    for i = 1, 8 do
      if amount > 0 then
        if not amount < math.pow(2, 8 - i) then
          cap:SetNumRealBuilding(TourismWidgets[i], 1)
          amount = amount - math.pow(2, 8 - i)
        else
          cap:SetNumRealBuilding(TourismWidgets[i], 0)
        end
      else
        cap:SetNumRealBuilding(TourismWidgets[i], 0)
      end
    end
    Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(plot:GetX(), plot:GetY()))),
        '[COLOR_CULTURE_STORED]+ '..numMountedUnitsTrained..' [ICON_TOURISM] Tourism and [ICON_CULTURE] Culture from trained [ICON_RES_HORSE] mounted units.', 0)
  end
end


function TrainedAppaloosa(playerId, cityId, unitId)
  local player = Players(playerId)
  if player:GetCivilizationType() == NTF_NezPerceId then
    local unit = player:GetUnitByID(unitId)
    if unit:GetUnitType == NTF_AppaloosaId then
      --calculate the nubmer of imported horses
      local horses = player:GetResourceImport(HorsesId)
      if horses = 0 then return end
      local happy = horses * 15
      player:ChangeGoldenAgeMeter(happy)
      if playerId = Game.GetActivePlayer then
        local city = player:GetCityByID(cityId)
        local plot = city:Plot()
        local callout = "[COLOR_YIELD_GOLD] +"..happy.."[ICON_HAPPINESS] Happiness[ENDCOLOR]"
        Events.AddPopupTextEvent(
            HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY(), callout, 0))))
      end
    end
  end
end

function TrainedMounted(playerId, cityId, unitId)
  local player = Players(playerId)
  if player:GetCivilizationType() == NTF_NezPerceId then
    local unit = player:GetUnitByID(unitId)
    if MountedUnits[unit:GetUnitType()] then
      local numMountedUnitsTrained = load(player, 'numMountedUnitsTrained')
      if numMountedUnitsTrained == nil then
        numMountedUnitsTrained = 0
      else
        numMountedUnitsTrained = numMountedUnitsTrained + 1
      end
      save(player, 'numMountedUnitsTrained', numMountedUnitsTrained)
    end
  end
end

function PlaceSalmon(playerId, cityId, buildingId)
  local player = Players(playerId)
  if player:GetCivilizationType() == NTF_NezPerceId and 
      buildingId == GameInfoTypes.BUILDING_NTF_CONSERVATIONCENTER then
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
