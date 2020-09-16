include("FLuaVector.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

--normalize the UA to the number of Teams expected on a standard map.
--We only care to do this when the maps are small
MC_NTF_SenecaId = GameInfoTypes.CIVILIZATION_MC_NTF_SENECA
MC_NTF_UAPromo1 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER1
MC_NTF_UAPromo2 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER2
MC_NTF_UAPromo3 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER3
MC_NTF_UAPromo4 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER4
MC_NTF_UAPromo5 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER5
MC_NTF_UAPromo6 = GameInfoTypes.PROMOTION_MC_NTF_SENECAKEEPER6


function CountPlayerKeeperStacks(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == MC_NTF_SenecaId then
    --create a table for this player or don't if it already exists
    local uaTableName = string.format("senecaUAtable%s", playerId)
    MapModData.uaTableName = MapModData.uaTableName or {}
    local uaTable = MapModData.uaTableName
    print(tostring(uaTable))
    local playerTeamId = playerObj:GetTeam()
    local playerTeamObj = Teams[playerTeamId]
    for entryPlayerId, entryPlayerObj in pairs(Players) do
      repeat
        if entryPlayerObj:IsBarbarian() or not entryPlayerObj:IsAlive() then
          if uaTable[entryPlayerId] == nil then
            table.insert(uaTable, entryPlayerId, 0)
            print('inserted barbarian or dead player')
            do break end
          else
            uaTable[entryPlayerId] = 0
            print('inserted 0 for player ' .. tostring(entryPlayerId))
            do break end
          end
        end
        if playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
          local numberOfWarringCivs = 0
          for otherPlayerId, otherPlayerObj in pairs(Players) do
            if otherPlayerId ~= playerId then
              local otherTeamObj = Teams[otherPlayerId]
              if not otherTeamObj:IsAtWar(playerTeamId) and 
                  otherTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
                numberOfWarringCivs = numberOfWarringCivs + 1
              end
            end
          end
          local numberOfSavedWarringCivs = uaTable[entryPlayerId]
          if numberOfSavedWarringCivs == nil then
            table.insert(uaTable, entryPlayerId, numberOfWarringCivs)
            print('inserted ' .. tostring(numberOfWarringCivs) .. ' for player ' .. tostring(entryPlayerId))
          else
            if numberOfWarringCivs > numberOfSavedWarringCivs then
              uaTable[entryPlayerId] = numberOfWarringCivs
               print('inserted ' .. tostring(numberOfWarringCivs) .. ' for player ' .. tostring(entryPlayerId))
            end
          end
        else -- we're not at war with them any more (or maybe never were)
          if uaTable[entryPlayerId] == nil then
            table.insert(uaTable, entryPlayerId, 0)
             print('inserted 0 for player ' .. tostring(entryPlayerId))
          end
        end
      until true
    end
  end
end
--run on DoPlayerTurn so we only do this once/turn

function KeeperPower(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == MC_NTF_SenecaId then
    --don't bother to do this if we're not at war with anyone
    local weAreAtWar = false
    local playerTeamId = playerObj:GetTeam()
    local playerTeamObj = Teams[playerTeamId]
    for entryPlayerId, entryPlayerObj in pairs(Players) do
      if entryPlayerObj and not entryPlayerObj:IsBarbarian() and 
          playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
        weAreAtWar = true
      end
    end
    if weAreAtWar then
      local uaTableName = string.format("senecaUAtable%s", playerId)
      local uaTable = MapModData.uaTableName
      print(tostring(uaTable))
      local keeperStacks = 0
      for enemyPlayerId, enemyPlayerObj in pairs(Players) do
        local stacks = uaTable[enemyPlayerId]
        print('loaded ' .. tostring(stacks) .. ' stacks for player ' .. tostring(enemyPlayerId))
        if stacks then
          if stacks >= 6 then
            keeperStacks = 6
            break
          elseif stacks > keeperStacks then
            keeperStacks = stacks
          end
        end
      end
      for unit in playerObj:Units() do
        if unit:IsCombatUnit() then
          if keeperStacks > 0 then
            RemoveKeeperStacks(unit)
            local promotionName = "PROMOTION_MC_NTF_SENECAKEEPER"..tostring(keeperStacks)
            unit:SetHasPromotion(GameInfoTypes[promotionName], true)
            print('we found stacks, there should be promotions')
          else
            print('no stacks, removing promotions')
            RemoveKeeperStacks(unit)
          end
        end
      end
    else
      --Remove the buff
      for unit in playerObj:Units() do
        if unit:IsCombatUnit() then
          RemoveKeeperStacks(unit)
        end
      end
    end
  end
end

function RemoveKeeperStacks(unit)
  unit:SetHasPromotion(MC_NTF_UAPromo1, false)
  unit:SetHasPromotion(MC_NTF_UAPromo2, false)
  unit:SetHasPromotion(MC_NTF_UAPromo3, false)
  unit:SetHasPromotion(MC_NTF_UAPromo4, false)
  unit:SetHasPromotion(MC_NTF_UAPromo5, false)
  unit:SetHasPromotion(MC_NTF_UAPromo6, false)
end

--UTI Script
MC_NTF_3SisterOutpost = GameInfoTypes.IMPROVEMENT_MC_NTF_SENECA_OUTPOST
MC_NTF_3SisterFarm = GameInfoTypes.IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS
MC_NTF_SenecaId = GameInfoTypes.CIVILIZATION_MC_NTF_SENECA

function upkeepThreeSisterOutpost(playerId)
  local Player = Players[playerId]
  if Player:GetCivilizationType() == MC_NTF_SenecaId then
    for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
      local Plot = Map.GetPlotByIndex(plotLoop)
      if Plot then
        if Plot:GetImprovementType() == MC_NTF_3SisterOutpost then
          if Plot:IsImprovementPillaged() then
            save(Plot, '3SisterStockpile', 0)
          else
            if Plot:GetOwner() == playerId then
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
                  closestCity:ChangeFood(stockpile)
                  save(Plot, '3SisterStockpile', 0)
                  Plot:SetImprovementType(MC_NTF_3SisterFarm)
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
        elseif Plot:GetImprovementType() == MC_NTF_3SisterFarm then
          if Plot:GetOwner() ~= playerId then
            Plot:SetImprovementType(MC_NTF_3SisterOutpost)
          end
        end
      end
    end
  end
end

MC_NTF_AfterRandom = GameInfoTypes.PROMOTION_MC_NTF_SENECA_AFTERRANDOM
MC_NTF_BeforeRandom = GameInfoTypes.PROMOTION_MC_NTF_SENECA_BEFORERANDOM
MC_NTF_GunnerMoves = GameInfoTypes.PROMOTION_MC_NTF_SENECA_GUNNER_MOVES
MC_NTF_IsGunner = GameInfoTypes.PROMOTION_MC_NTF_SENECA_GUNNER
MC_NTF_SenecaId = GameInfoTypes.CIVILIZATION_MC_NTF_SENECA
MC_NTF_Tortured = GameInfoTypes.PROMOTION_MC_NTF_SENECA_NERFBAT

function GetExtraMoveFromAdjacentEnemy(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == MC_NTF_SenecaId then
    local playerTeamId = playerObj:GetTeam()
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotion(MC_NTF_IsGunner) then
        if IsAdjacentToEnemy(playerId, playerTeamId, unitObj) then
          unitObj:SetHasPromotion(MC_NTF_GunnerMoves, true)
          print("Maximum moves is " .. tostring(unitObj:MaxMoves()))
          unitObj:SetMoves(unitObj:MaxMoves())
        else
          unitObj:SetHasPromotion(MC_NTF_GunnerMoves, false)
        end
      end
    end
  end
end

function IsAdjacentToEnemy(playerId, playerTeamId, unitObj)
  local centerPlot = unitObj:GetPlot()
  local x = centerPlot:GetX()
  local y = centerPlot:GetY()
  local range = 1
  for dx = -range, range do
    for dy = -range, range do
      local plotInRange = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
      --sometimes plots can be off of the map
      if plotInRange ~= nil then
        if plotInRange:GetNumUnits() > 0 then
          --we only need the first unit to test for teams as units of different civs
          --can't share hexes
          local plotUnit = plotInRange:GetUnit(0)
          local plotUnitPlayerId = plotUnit:GetOwner()
          if plotUnitPlayerId ~= playerId then
            local otherTeamObj = Teams[Players[plotUnitPlayerId]:GetTeam()]
            if otherTeamObj:IsAtWar(playerTeamId) then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function ListenSEUSD(playerId, unitId, newDamage, oldDamage)
  if newDamage > oldDamage then --filter out heals
    local playerObj = Players[playerId]
    if not playerObj then
      --this unit is probably a barbarian
      return
    end
    local unitObj = playerObj:GetUnitByID(unitId)
    if not unitObj then
      return
    end
    if not unitObj:IsHasPromotion(MC_NTF_AfterRandom) then
      local unitPlot = unitObj:GetPlot()
      --this unit took damage from somewhere, check around for a unit that dealt damage
      --all the units we care about are melee units
      for i = 0, 5 do
        local adjPlot = Map.PlotDirection(unitPlot:GetX(), unitPlot:GetY(), i);
        if adjPlot ~= nil then
          if adjPlot:GetNumUnits() > 0 then
            for j = 0, adjPlot:GetNumUnits() - 1 do
              local adjPlotUnitObj = adjPlot:GetUnit(j)
              if adjPlotUnitObj:IsHasPromotion(MC_NTF_AfterRandom) then
                --this is the unit that did the thing                
                --which means unitObj is the guy we attacked
                print('Setting an ' .. tostring(unitObj:GetUnitType()) .. ' to tortured.')
                unitObj:SetHasPromotion(MC_NTF_Tortured, true)
                for k = 0, 5 do
                  local otherPlot = Map.PlotDirection(unitPlot:GetX(), unitPlot:GetY(), k);
                  if otherPlot ~= nil then
                    if otherPlot:GetNumUnits() > 0 then
                      for m = 0, otherPlot:GetNumUnits() - 1 do
                        local otherPlotUnitObj = otherPlot:GetUnit(m)
                        if otherPlotUnitObj:GetOwner() == unitObj:GetOwner() then
                          print('Setting an ' .. tostring(otherPlotUnitObj:GetUnitType()) .. ' to tortured.')
                          otherPlotUnitObj:SetHasPromotion(MC_NTF_Tortured, true)
                        end
                      end
                    end
                  end
                end
                adjPlotUnitObj:SetHasPromotion(MC_NTF_AfterRandom, false)
                adjPlotUnitObj:SetHasPromotion(MC_NTF_BeforeRandom, true)
                return -- we found the dude, stop doing anything.
              end
            end
          end
        end
      end
    end
  end
end

function ResetOnPT(playerId) -- all else has failed, we'll do this on the next turn
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == MC_NTF_SenecaId then
    --check for failed listeners
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotion(MC_NTF_AfterRandom) then
        unitObj:SetHasPromotion(MC_NTF_AfterRandom, false)
        unitObj:SetHasPromotion(MC_NTF_BeforeRandom, true)
      end
    end
  end
  --reset the last player's MC_NTF_Tortured.
  if playerId > 0 then
    playerObj = Players[playerId - 1]
  elseif playerId == 0 then
    playerObj = Players[Game.CountCivPlayersEverAlive() - 1]
  end
  for unitObj in playerObj:Units() do
    if unitObj:IsHasPromotion(MC_NTF_Tortured) then
      unitObj:SetHasPromotion(MC_NTF_Tortured, true)
    end
  end
end

for _, player in pairs(Players) do
  if player:GetCivilizationType() == MC_NTF_SenecaId then
    print('Seneca found. Loading functions')
    Events.SerialEventUnitSetDamage.Add(ListenSEUSD)
    GameEvents.PlayerDoTurn.Add(CountPlayerKeeperStacks)
    GameEvents.PlayerDoTurn.Add(GetExtraMoveFromAdjacentEnemy)
    GameEvents.PlayerDoTurn.Add(KeeperPower)
    GameEvents.PlayerDoTurn.Add(ResetOnPT)
    GameEvents.PlayerDoTurn.Add(upkeepThreeSisterOutpost)
    break
  end
end
