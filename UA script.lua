include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

--normalize the UA to the number of Teams expected on a standard map.
--We only care to do this when the maps are small
c_ntf_teamcountmultiplier = math.max(8 / Game.CountCivTeamsEverAlive(), 1)

function countPlayerKeeperStacks(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_SENECA then
    --create a table for this player or don't
    local uaTableName = string.format("senecaUAtable%s", playerId)
    MapModData.uaTableName = MapModData.uaTableName or {}
    local uaTable = MapModData.uaTableName
    local playerTeamId = playerObj:GetTeam()
    local playerTeamObj = Teams[playerTeamId]
    for entryPlayerId, entryPlayerObj in pairs(Players) do
      if entryPlayerObj:IsBarbarian() then
        if uaTable[entryPlayerId] = nil then
          table.insert(uaTable, entryPlayerId, 0)
          continue 
        end
      end
      if playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
        local numberOfWarringCivs = 0
        for otherPlayerId, otherPlayerObj in pairs(Players) do
          local otherTeamObj = Teams[otherPlayerId]
          if not otherTeamObj:IsAtWar(playerTeamId) and 
              otherTeamObj:IsAtaWar(entryPlayerObj:GetTeam()) then
            numberOfWarringCivs = numberOfWarringCivs + 1
          end
        end
        local numberOfSavedWarringCivs = uaTable[entryPlayerId]
        if numberOfSavedWarringCivs = nil then
          table.insert(uaTable, entryPlayerId, numberOfWarringCivs)
        else
          if numberOfWarringCivs > numberOfSavedWarringCivs then
          uaTable[entryPlayerId] = numberOfWarringCivs
        end
      else -- we're not at war with them any more (or maybe never were)
        if uaTable[entryPlayerId] = nil then
          table.insert(uaTable, entryPlayerId, 0)
        end
      end
    end
  end
end
--run on DoPlayerTurn so we only do this once/turn

function GetKeeperStacks(playerId, targetId)
  local uaTableName = string.format("senecaUATable%s", playerId)
  local uaTable = MapModData.uaTableName
  return uaTable[targetId]
end
--intended to be run whenever an enemy unit is encountered on a nearby tile

function KeeperPower(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_SENECA then
    --don't bother to do this if we're not at war with anyone
    local weAreAtWar = false
    local playerTeamId = playerObj:GetTeam()
    local playerTeamObj = Teams[playerTeamId]
    for entryPlayerId, entryPlayerObj in pairs(Players) do
      if entryPlayerObj:IsBarbarian then
        continue
      else
        if playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
          weAreAtWar = true
          break
        end
      end
    end
    if weAreAtWar then
      for unit in playerObj:Units() do
        if unit:IsCombatUnit() then
          local keeperStacks = UnitGetKeeperStacks(playerId, unit)
          if keeperStacks > 0 then
            local promotionName = 'PROMOTION_NTFSENECAKEEPER'..string(keeperStacks)
            unit.SetHasPromotion(GameInfoTypes[promotionName], true)
          else
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
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER1, false)
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER2, false)
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER3, false)
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER4, false)
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER5, false)
  unit:SetHasPromotion(GameInfoTypes.PROMOTION_NTFSENECAKEEPER6, false)
end

function UnitGetKeeperStacks(playerId, unit)
  local keeperStacks = 0
  local range = 3
  local plot = unit:GetPlot()
  local x = plot:GetX()
  local y = plot:GetY()
  local uaTableName = string.format("senecaUAtable%s", playerId)
  local uaTable = MapModData.uaTableName
  for dx = -range, range do
    for dy = -range, range do
      local plotInRange = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
      if plotInRange ~= nil then
        if plotInRange:GetNumUnits() > 0 then
          --we only need the first unit to test for teams as units of different civs
          --can't share hexes
          local plotUnit = plotInRange:GetUnit(0) 
          local plotUnitPlayerId = plotUnit:GetOwner()
          if plotUnitPlayerId ~= playerId then
            local plotUnitKeeperStacks = math.floor(
                uaTable[plotUnitPlayerId] * c_ntf_teamcountmultiplier)
            if plotUnitKeeperStacks >= 6 then
              return 6
            else
              if plotUnitKeeperStacks > keeperStacks then
                keeperStacks = plotUnitKeeperStacks
              end
            end
          end
        end
      end
    end
  end
  return keeperStacks
end