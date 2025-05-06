include("FLuaVector.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Neirai-Pohnpei-Lua";

--=======================================================================================================================
--Place City on coast when founding a city on the coast.

function GetNanMadolPlot(plot)
  local x = plot:GetX()
  local y = plot:GetY()
  local range = 1
  for dx = -range, range do
    for dy = -range, range do
      local plotInRange = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
      if plotInRange ~= nil then
        if plotInRange:IsWater() then
          if plotInRange:GetResourceType() == -1 then
            return plotInRange
          end
        end
      end
    end
    for dy = -range, range do
      local plotInRange = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
      if plotInRange ~= nil then
        if plotInRange:IsWater() then
          return plotInRange
        end
      end
    end
  end
  return nil
end

-- Event handler for city creation
function OnCityCreated(playerID, x, y)
  local plot = Map.GetPlot(x, y)
  local city = plot:GetPlotCity()
  local player = Players[playerID]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    local hasFoundedNanMadol = load(player, 'HasFoundedNanMadol')
    if hasFoundedNanMadol == nil then
      --check if the city is on the coast
      if plot:IsAdjacentToShallowWater() or plot:IsCoastalLand() then
        --get an eligible plot
        local nanMadolPlot = GetNanMadolPlot(plot)
        --create the city
        save(player, 'HasFoundedNanMadol', true)
        local nanMadol = player:InitCity(nanMadolPlot:GetX(), nanMadolPlot:GetY())
        nanMadol:SetName("Nan Madol")
        --add the duplicate palace to the city
        nanMadol:SetNumRealBuilding(GameInfoTypes["BUILDING_PALACE"], 1)
        --check all plots owned by both cities
        for i = 0, nanMadol:GetNumCityPlots() - 1, 1 do
          local plot = nanMadol:GetCityIndexPlot(i)
          --if the plot is land, swap it with the other city
          if plot:GetOwner() == playerID and not plot:IsWater() then
            plot:SetOwner(playerID, cityID)
            -- give nan madol another water plot
            local aPurchasablePlots = {nanMadol:GetBuyablePlotList()};
            for p = 0, #aPurchasablePlots do
              local buyablePlot = aPurchasablePlots[p]
              if buyablePlot ~= nil and buyablePlot:IsWater() then
                buyablePlot:SetOwner(playerID, nanMadol:GetID())
                break
              end
            end
          end
        end
        --give all water plots on other city to nan madol
        for i = 0, city:GetNumCityPlots() - 1, 1 do
          local plot = city:GetCityIndexPlot(i)
          if plot:GetOwner() == playerID and plot:IsWater() then
            plot:SetOwner(playerID, nanMadol:GetID())
            --give the city another land plot
            local aPurchasablePlots = {city:GetBuyablePlotList()};
            for p = 0, #aPurchasablePlots do
              local buyablePlot = aPurchasablePlots[p]
              if buyablePlot ~= nil and not buyablePlot:IsWater() then
                buyablePlot:SetOwner(playerID, city:GetID())
                break
              end
            end
          end
        end
      end
    end
  end
end

--Completing a wonder should make a new Improvement in the water around Nan Madol
function OnWonderCompleted(playerId, cityId, buildingId)
  local player = Players(playerId)
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI and
      --check if the building is a wonder
      GameInfo.Buildings[buildingId].BuildingClass == "BUILDINGCLASS_WORLD_WONDER" then
    local city = player:GetCityByID(cityId)
    if city.GetName() == "Nan Madol" then
      plots = {}
      for i = 0, city:GetNumCityPlots() - 1, 1 do
        plot = city:GetCityIndexPlot(i)
        if plot:IsWater() then
          if plot:GetImprovementType() == -1 and plot:GetResourceType() == -1 then
            table.insert(plots, plot)
          end
        end
      end
      if plots == nil then
        -- if there are no nice water plots, make a nasty one
        for i = 0, city:GetNumCityPlots() - 1, 1 do
          plot = city:GetCityIndexPlot(i)
          if plot:IsWater() then
            if plot:GetImprovementType() == -1 then
              table.insert(plots, plot)
            end
          end
        end
      end
      --create a new improvement on one of the plots
      local randomPlot = plots[math.random(#plots)]
      player:SetImprovementType(randomPlot, GameInfo.Improvements["IMPROVEMENT_NAN_MADOL_TOMB"].ID)
    end
  end
end

--At the end of turn (really, the start of the next player's turn), record the position of each Sounpei unit
function OnTurnEnd()
  local playerId = Game.GetActivePlayer()
  if playerId == 0 then
    return
  else
    playerId = playerId - 1
  end
  local player = Players[playerId]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    for i = 0, player:Units() - 1, 1 do
      local unit = units:Item(i)
      if unit:GetUnitType() == GameInfo.Units["UNIT_SOUNPEI"].ID then
        local plot = unit:GetPlot()
        --save the position of the unit
        save(player, 'SounpeiUnitPosition ' + unit.unitId, plot)
      end
    end
  end
end

--At the start of turn, check if the Sounpei unit is in the same position as last turn
function OnTurnStart()
  local player = Players[Game.GetActivePlayer()]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    local units = player:GetUnits()
    for i = 0, units:GetCount() - 1, 1 do
      local unit = units:Item(i)
      if unit:GetUnitType() == GameInfo.Units["UNIT_SOUNPEI"].ID then
        local plot = unit:GetPlot()
        local lastPlot = load(player, 'SounpeiUnitPosition' + unit.unitId)
        if lastPlot ~= nil then
          --check if the unit is in the same position as last turn
          if plot:GetX() == lastPlot:GetX() and plot:GetY() == lastPlot:GetY() then
            --switch promotions on the unit
            unit:SetHasPromotion(GameInfo.Promotions["PROMOTION_WITHDRAW"].ID, false)
            unit:SetHasPromotion(GameInfo.Promotions["PROMOTION_HEAVY_ATTACK"].ID, true)
          end
        end
      end
    end
  end
end

--At the start of turn, check each yield and whether a wonder in Nan Madol produces it. Then, add the yield to nan madol for each tomb of the saudeleur you own.
function OnTurnStartTombEffect()
  local player = Players[Game.GetActivePlayer()]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    for city in player:Cities() do
      --check if the city is Nan Madol
      if city:GetName() == "Nan Madol" then
        local tombs = 0
        for i = 0, city:GetNumCityPlots() - 1, 1 do
          local plot = city:GetCityIndexPlot(i)
          if plot:GetImprovementType() == GameInfo.Improvements["IMPROVEMENT_NAN_MADOL_TOMB"].ID then
            --add the yield to the city for each tomb of the saudeleur you own
            tombs = tombs + 1
          end
        end
        if tombs > 0 then
          --check if the city has a wonder that produces a yield
          for yieldType = 0, GameInfo.Yields.Count - 1, 1 do
            yieldDone = false
            for i = 0, city:GetNumBuildingClassTypes() - 1, 1 do
              if yieldDone then break end
              local buildingClass = city:GetBuildingClassType(i)
              if GameInfo.Buildings[buildingClass].BuildingClass == "BUILDINGCLASS_WORLD_WONDER" then
                --check if the building produces the yield
                if city.GetBuildingYieldChange(buildingClass, yieldType) > 0 then
                  --add the yield to the city for each tomb of the saudeleur you own
                  city:ChangeYield(yieldType, tombs)
                  yieldDone = true
                elseif Game.GetBuildingYieldModifier(buildingClass, yieldType) > 0 then
                  --add the yield to the city for each tomb of the saudeleur you own
                  city:ChangeYield(yieldType, tombs)
                  yieldDone = true
                end
              end
            end
          end
        end
      end
    end
  end
end

function OnTurnStartEelEffect()
  local player = Players[Game.GetActivePlayer()]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    for city in player:Cities() do
      --check if the city is Nan Madol
      if city:GetName() == "Nan Madol" then
        local eel = 0
        for otherCity in player:GetCities() do
          if otherCity ~= city then
            if otherCity:GetBuildingType(GameInfoTypes["BUILDING_NTF_TEMPLEOFTHEEEL"]) > 0 then
              eel = eel + 1
            end
          end
        end
        city:SetHasBuildingType(GameInfoTypes["BUILDING_NTF_EELPOWER"], eel)
      end
    end
  end
end

--Prevent the Temple of the Eel from being built in Nan Madol
function CanBuildTempleOfTheEel(playerId, cityId, buildingId)
  local player = Players[playerId]
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    local city = player:GetCityByID(cityId)
    local plot = city:GetCityIndexPlot(0)
    if plot:IsWater() then
      return false
    end
    if city:GetName() == "Nan Madol" then
      return false
    end
  end
  return true
end

for _, player in pairs(Players) do
  if player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_POHNPEI then
    print('Pohnpei found. Loading functions')
    GameEvents.PlayerCityFounded.Add(OnCityCreated)
    GameEvents.CityConstructed.Add(OnWonderCompleted)
    GameEvents.PlayerDoTurn.Add(OnTurnEnd)
    GameEvents.PlayerDoTurn.Add(OnTurnStart)
    GameEvents.PlayerDoTurn.Add(OnTurnStartTombEffect)
    GameEvents.PlayerDoTurn.Add(OnTurnStartEelEffect)
    GameEvents.CityCanConstruct.Add(CanBuildTempleOfTheEel)
    break
  end
end
