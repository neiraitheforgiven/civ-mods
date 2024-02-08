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

for _, player in pairs(Players) do
  if player:GetCivilizationType() == NTF_POHNPEI then
    print('Pohnpei found. Loading functions')
    Events.SerialEventCityFounded.Add(OnCityCreated)
    GameEvents.CityConstructed.Add(OnWonderCompleted)
    break
  end
end
