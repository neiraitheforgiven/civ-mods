include("FLuaVector.lua")
include("Sukritact_saveutils.lua"); MY_MOD_NAME = "Neirai-Seneca-Lua";

NTF_UsingHatchet = 

function FindCivsForStrength(playerId, centerPlot)
  local foundCivs = {}
  local foundCivCount = 0
  local x = centerPlot:GetX()
  local y = centerPlot:GetY()
  local range = 3
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
            if foundCivs[playerId] then
              --we've already found this civ
            else
              foundCivCount = foundCivCount + 1
              foundCivs[playerId] = true
            end
          end
        end
      end
    end
  end
  return foundCivCount
end


function GetExtraMoveFromAdjacentEnemy(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NTF_SENECA then
    local playerTeamId = playerObj:GetTeam()
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotionType(GameInfoTypes.PROMOTION_NTF_SENECA_GUNNER) then
        if IsAdjacentToEnemy(playerId, playerTeamId, unitObj) then
          unitObj:SetHasPromotion(GetInfoTypes.PROMOTION_NTF_SENECA_GUNNER_MOVES, true)
        else
          unitObj:SetHasPromotion(GetInfoTypes.PROMOTION_NTF_SENECA_GUNNER_MOVES, false)
        end
      end
    end
  end
end

function GetAttackPowerFromNearbyCivs(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType == GameInfoTypes.CIVILIZATION_NTF_SENECA then
    for unitObj in playerObj:Units() do
      if unitObj:IsHasPromotionType(GameInfoTypes.PROMOTION_NTF_SENECA_GUNNER) then
        --reload or remember the base combat strength because it's going to change.
        local cachedStrength = load(unitObj, 'baseCombatStrength')
        if cachedStrength == nil then
          cachedStrength = unitObj:GetBaseCombatStrength()
          save(unitObj, 'baseCombatStrength', cachedStrength)
        end
        local centerPlot = unitObj:GetPlot()
        local foundCivCount = FindCivsForStrength(playerId, centerPlot)
        unitObj:SetBaseCombatStrength(cachedStrength + (foundCivCount * 2))
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
            local otherTeamObj = Teams[plotUnitPlayerId]
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

function OnTurnGoBackToYourself(playerId)
  local playerObj = Players[playerId]
  if playerObj:GetCivilizationType == GameInfoTypes.CIVILIZATION_NTF_SENECA then
    for unitObj in playerObj:Units() do
      unitObj:SetHasPromotion(NTF_UsingHatchet, false)
    end
  end
end


function ListenSEUSD(playerId, unitId, newDamage, oldDamage)
  if newDamage > oldDamage then --filter out heals
    local playerObj = Players[playerId]
    local unitObj = PlayerObj:GetUnitById(unitId)
    if not unitObj:IsHasPromotion(GameInfoTypes.PROMOTION_NTF_SENECA_RANDOMDONE) then
      local unitPlot = unitObj:GetPlot()
      --this unit took damage from somewhere, check around for a unit that dealt damage
      --all the units we care about are melee units
      for i = 0, 5 do
        local adjacentPlot = Map.PlotDirection(unitPlot:GetX(), unitPlot:GetY(), i);
        if adjacentPlot ~= nil then
          if adjacentPlot:GetNumUnits() > 0 then
            for i = 0, adjacentPlot:GetNumUnits() - 1 do
              local adjacentPlotUnitObj = adjacentPlot:GetUnit(i)
              if adjacentPlotUnitObj:IsHasPromotion(
                  GameInfoTypes.PROMOTION_NTF_SENECA_HATCHETBACKUP) then
                local adjacentPlotUnitOwnerId = adjacentPlotUnitObj:GetOwner()
                local foundCivCount = FindCivsForStrength(
                    adjacentPlotUnitOwnerId, adjacentPlot)
                save(adjacentPlotUnitObj, "pre-hatchet strength", 
                    adjacentPlotUnitObj:GetBaseCombatStrength())
                adjacentPlotUnitObj:SetBaseCombatStrength(16)
                adjacentPlotUnitObj:SetHasPromotion(
                    NTF_UsingHatchet, true) -- range + 1, blitz
                adjacentPlotUnitObj:SetHasPromotion(
                    GameInfoTypes.PROMOTION_NTF_SENECA_AFTERRANDOM, false)
                adjacentPlotUnitObj:SetHasPromotion(
                    GameInfoTypes.PROMOTION_NTF_SENECA_BEFORERANDOM, true)
                return -- we found the dude, stop doing anything.
              end
            end
          end
        end
      end
    end
  end
end
Events.SerialEventUnitSetDamage.Add(ListenSEUSD)


function ListenPT(playerId) -- all else has failed, we'll do this on the next turn
    local playerObj = Players[playerId]
    for unitObj in playerObj:Units() do
       if unitObj:IsHasPromotion(GameInfoTypes.PROMOTION_NTF_SENECA_AFTERRANDOM) then
            unitObj:SetHasPromotion(GameInfoTypes.PROMOTION_NTF_SENECA_AFTERRANDOM, false)
            unitObj:SetHasPromotion(GameInfoTypes.PROMOTION_NTF_SENECA_BEFORERANDOM, true)
        end
    end
end
GameEvents.PlayerDoTurn.Add(ListenPT)