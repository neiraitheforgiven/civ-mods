include("FLuaVector.lua")
include("Sukritact_SaveUtiles.lua"); MY_MOD_NAME = "Neirai-Pohnpei-Lua";

--=======================================================================================================================
--Place City on coast when founding a city on the coast.

-- Event handler for city creation
function OnCityCreated(
    hexPos, playerID, cityID, cultureType, eraType, continent, populationSize, size, fogState)
  local plot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y))
  local city = Players[playerID]:GetCityByID(cityID)
  local player = Players[playerID]
  if player.GetCivilizationType() == NTF_POHNPEI then
    if not load(player, 'HasFoundedNanMadol') then
      --check if the city is on the coast
      if plot:IsCoastalLand() then
        --get an eligible plot
        local nanMadolPlot = GetNanMadolPlot(plot)
        --create the city
        local nanMadol = player:InitCity(nanMadolPlot:GetX(), nanMadolPlot:GetY())
        nanMadol:SetName("Nan Madol")
        --save that the city has been founded
        save(player, 'HasFoundedNanMadol', true)
        --add the duplicate palace to the city
        nanMadol:SetHasBuildingType(GameInfoTypes["BUILDING_NAN_MADOL_PALACE"], 1)
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
              if buyablePlot:IsWater() then
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
              if not buyablePlot:IsWater() then
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
  if player:GetCivilizationType() == NTF_POHNPEI and
      --check if the building is a wonder
      GameInfo.Buildings[buildingId].BuildingClass == "BUILDINGCLASS_WORLD_WONDER" then
    local city = player:GetCityByID(cityId)
    if city.GetName() == "Nan Madol" then
      for i = 0, city:GetNumCityPlots() - 1, 1 do
        plot = city:GetCityIndexPlot(i)
        if plot:IsWater() then
          if plot:GetImprovementType() == -1 and plot:GetResourceType() == -1 then
            table.insert(plots, plot)
          end
        end
      end
      if #plots = 0 then
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

--At the end of turn, record the position of each Sounpei unit
function OnTurnEnd()
  local player = Players[Game.GetActivePlayer()]
  if player:GetCivilizationType() == NTF_POHNPEI then
    local units = player:GetUnits()
    for i = 0, units:GetCount() - 1, 1 do
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
  if player:GetCivilizationType() == NTF_POHNPEI then
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
  if player:GetCivilizationType() == NTF_POHNPEI then
    for city in player:GetCities() do
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

for _, player in pairs(Players) do
  if player:GetCivilizationType() == NTF_POHNPEI then
    print('Pohnpei found. Loading functions')
    Events.SerialEventCityFounded.Add(OnCityCreated)
    GameEvents.CityConstructed.Add(OnWonderCompleted)
    Events.SerialEventTurnEnd.Add(OnTurnEnd)
    Events.SerialEventTurnStart.Add(OnTurnStart)
    Events.SerialEventTurnStart.Add(OnTurnStartTombEffect)
    break
  end
end
