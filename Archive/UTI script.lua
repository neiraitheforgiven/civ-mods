--UTI script
include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

NTF_3SisterOutpost = GameInfoTypes.IMPROVEMENT_NTF_SENECA_OUTPOST
NTF_3SisterFarm = GameInfoTypes.IMPROVEMENT_NTF_SENECA_FARM
NTF_SenecaId = GameInfoTypes.CIVILIZATION_NTF_SENECA

function upkeepThreeSisterOutpost(playerId)
  local Player = Players[playerId]
  if Player:GetCivilizationType() == NTF_SenecaId then
    for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
      local Plot = Map.GetPlotByIndex(plotLoop)
      if Plot then
        if Plot:GetImprovementType() == NTF_3SisterOutpost then
          if Plot:IsImprovmentPillaged() then
            save(Plot, '3SisterStockpile', 0)
          else
            if Plot:GetOwner() = playerId then
              local stockpile = load(Plot, '3SisterStockpile')
              if stockpile > 0 then
                local minDistance = 999999999
                local closestCity = nil
                for City in Player:Cities() do
                  local CityPlot = City:Plot()
                  local cityDistance = Map.PlotDistance(
                      Plot:GetX(), Plot:GetY(), CityPlot:GetX(), CityPlot:GetY())
                  if cityDistance < minDistance then
                    minDistance = cityDistance
                    closestCity = City
                  end
                end
                if closestCity then
                  City:ChangeFood(stockpile)
                  save(Plot, '3SisterStockpile', 0)
                  Plot:SetImprovementType(NTF_3SisterFarm)
                end
              end
            else
              local stockpile = load(Plot, '3SisterStockpile')
              if stockpile then
                save(Plot, '3SisterStockpile', stockpile + 1)
              else
                save(Plot, '3SisterStockpile', 0)
              end
            end
          end
        elseif Plot:GetImprovementType() == NTF_3SisterFarm then
          if Plot:GetOwner() ~= playerId then
            Plot:SetImprovementType(NTF_3SisterOutpost)
          end
        end
      end
    end
  end
end

for playerId, playerObj in pairs(Players) do
  if playerObj:GetCivilizationType() == NTF_SenecaId then
    GameEvents.PlayerDoTurn.Add(upkeepThreeSisterOutpost)
    break
  end
end
