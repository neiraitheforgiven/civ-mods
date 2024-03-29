include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

--normalize the UA to the number of Teams expected on a standard map.
--We only care to do this when the maps are small
c_ntf_teamcountmultiplier = math.max(8 / Game.CountCivTeamsEverAlive(), 1)
NTF_SenecaId = GameInfoTypes.CIVILIZATION_NTF_SENECA
NTF_UAPromo1 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER1
NTF_UAPromo2 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER2
NTF_UAPromo3 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER3
NTF_UAPromo4 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER4
NTF_UAPromo5 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER5
NTF_UAPromo6 = GameInfoTypes.PROMOTION_NTFSENECAKEEPER6


function CountPlayerKeeperStacks(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == NTF_SenecaId then
    --create a table for this player or don't if it already exists
    local uaTableName = string.format("senecaUAtable%s", playerId)
    MapModData.uaTableName = MapModData.uaTableName or {}
    local uaTable = MapModData.uaTableName
    local playerTeamId = playerObj:GetTeam()
    local playerTeamObj = Teams[playerTeamId]
    for entryPlayerId, entryPlayerObj in pairs(Players) do
      repeat
        if entryPlayerObj:IsBarbarian() then
          if uaTable[entryPlayerId] = nil then
            table.insert(uaTable, entryPlayerId, 0)
            do break end
          end
        end
        if playerTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
          local numberOfWarringCivs = 0
          for otherPlayerId, otherPlayerObj in pairs(Players) do
            local otherTeamObj = Teams[otherPlayerId]
            if not otherTeamObj:IsAtWar(playerTeamId) and 
                otherTeamObj:IsAtWar(entryPlayerObj:GetTeam()) then
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
          end
        else -- we're not at war with them any more (or maybe never were)
          if uaTable[entryPlayerId] = nil then
            table.insert(uaTable, entryPlayerId, 0)
          end
        end
      until true
    end
  end
end
--run on DoPlayerTurn so we only do this once/turn

function KeeperPower(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == NTF_SenecaId then
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
      local keeperStacks = 0
      for enemyPlayerId, enemyPlayerObj in pairs(Players) do
        local stacks = uaTable.enemyPlayerId
        if stacks >= 6 then
          keeperStacks = 6
          break
        elseif stacks > keeperStacks then
          keeperStacks = stacks
        end
      end
      for unit in playerObj:Units() do
        if unit:IsCombatUnit() then
          if keeperStacks > 0 then
            RemoveKeeperStacks(unit)
            local promotionName = "PROMOTION_NTFSENECAKEEPER"..string(keeperStacks)
            unit:SetHasPromotion(GameInfoTypes[promotionName], true)
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
  unit:SetHasPromotion(NTF_UAPromo1, false)
  unit:SetHasPromotion(NTF_UAPromo2, false)
  unit:SetHasPromotion(NTF_UAPromo3, false)
  unit:SetHasPromotion(NTF_UAPromo4, false)
  unit:SetHasPromotion(NTF_UAPromo5, false)
  unit:SetHasPromotion(NTF_UAPromo6, false)
end

for _, player in pairs(Players) do
  if player:GetCivilizationType() == NTF_SenecaId then
    GameEvents.PlayerDoTurn.Add(CountPlayerKeeperStacks)
    GameEvents.PlayerDoTurn.Add(KeeperPower)
    break
  end
end
