include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

NTF_AfterRandom = GameInfoTypes.PROMOTION_NTF_SENECA_AFTERRANDOM
NTF_BeforeRandom = GameInfoTypes.PROMOTION_NTF_SENECA_BEFORERANDOM
NTF_GunnerMoves = GameInfoTypes.PROMOTION_NTF_SENECA_GUNNER_MOVES
NTF_IsGunner = GameInfoTypes.PROMOTION_NTF_SENECA_GUNNER
NTF_SenecaId = GameInfoTypes.CIVILIZATION_NTF_SENECA
NTF_Tortured = GameInfoTypes.PROMOTION_NTF_SENECA_NERFBAT

function GetExtraMoveFromAdjacentEnemy(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == NTF_SenecaId then
    local playerTeamId = playerObj:GetTeam()
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotion(NTF_IsGunner) then
        if IsAdjacentToEnemy(playerId, playerTeamId, unitObj) then
          unitObj:SetHasPromotion(NTF_GunnerMoves, true)
        else
          unitObj:SetHasPromotion(NTF_GunnerMoves, false)
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
    local unitObj = PlayerObj:GetUnitById(unitId)
    if not unitObj:IsHasPromotion(NTF_AfterRandom) then
      local unitPlot = unitObj:GetPlot()
      --this unit took damage from somewhere, check around for a unit that dealt damage
      --all the units we care about are melee units
      for i = 0, 5 do
        local adjPlot = Map.PlotDirection(unitPlot:GetX(), unitPlot:GetY(), i);
        if adjPlot ~= nil then
          if adjPlot:GetNumUnits() > 0 then
            for j = 0, adjPlot:GetNumUnits() - 1 do
              local adjPlotUnitObj = adjPlot:GetUnit(j)
              if adjacentPlotUnitObj:IsHasPromotion(NTF_AfterRandom) then
                --this is the unit that did the thing                
                --which means unitObj is the guy we attacked
                unitObj:SetHasPromotion(NTF_Tortured, true)
                for k = 0, 5 do
                  local otherPlot = Map.PlotDirection(unitPlot:GetX(), unitPlot:GetY(), k);
                  if otherPlot ~= nil then
                    if otherPlot:GetNumUnits() > 0 then
                      for m - 0, otherPlot:GetNumUnits() - 1 do
                        local otherPlotUnitObj = otherPlot:GetUnit(m)
                        if otherPlotUnitObj:GetOwner() == adjacentPlotUnitObj:GetOwner() then
                          otherPlotUnitObj:SetHasPromotion(NTF_Tortured, true)
                        end
                      end
                    end
                  end
                end
                adjacentPlotUnitObj:SetHasPromotion(NTF_AfterRandom, false)
                adjacentPlotUnitObj:SetHasPromotion(NTF_BeforeRandom, true)
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
  if playerObj:GetCivilizationType() == NTF_SenecaId then
    --check for failed listeners
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotion(NTF_AfterRandom) then
        unitObj:SetHasPromotion(NTF_AfterRandom, false)
        unitObj:SetHasPromotion(NTF_BeforeRandom, true)
      end
    end
  end
  --reset the last player's NTF_Tortured.
  if playerId > 0 then
    playerObj = Players[playerId - 1]
  elseif playerId == 0 then
    playerObj = Players[Game.CountCivPlayersEverAlive() - 1]
  end
  for unitObj in playerObj:Units() do
    if unitObj:IsHasPromotion(NTF_Tortured) then
      unitObj:SetHasPromotion(NTF_Tortured, true)
    end
  end
end

for playerId, playerObj in pairs(Players) do
  if playerObj:GetCivilizationType() == NTF_SenecaId then
    Events.SerialEventUnitSetDamage.Add(ListenSEUSD)
    GameEvents.PlayerDoTurn.Add(GetExtraMoveFromAdjacentEnemy)
    GameEvents.PlayerDoTurn.Add(ResetOnPT)
    break
  end
end
