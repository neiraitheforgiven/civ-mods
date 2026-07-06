include('FLuaVector.lua')

-------------------------------------------------------------------------------------------------------
--Build underground houses
--  COSTS:
--  1 Magistrate
--  REQS:
--  Must be Coast Salish
--  Must have researched Engineering
--  GIVES:
--  Each population in your city adds +3 additional hp to that city.

--[[function giveCitiesHealth(playerId)
    local pPlayer = Players[playerId]
    if load(pPlayer, 'Decisions_CLCSUNDERGROUND') == true then
        for pCity in pPlayer:Cities() do
            if pCity:GetPopulation() > pCity:GetNumBuilding(GameInfoTypes.BUILDING_CLCSHEALTH) then
                --doesn't go down if the population is lost
                pCity:SetNumRealBuildings(GameInfoTypes.BUILDING_CLCSHEALTH, pCity:GetPopulation())
            end
            --doesn't reset if the city changes hands, but does no longer change.
        end
    end
end]]

local Decisions_CLCSUNDERGROUND = {}
print('Decisions_CLCSUNDERGROUND loaded')
Decisions_CLCSUNDERGROUND.Name = 'TXT_KEY_DECISIONS_CLCSUNDERGROUND_NAME'
HookDecisionCivilizationIcon(Decisions_CLCSUNDERGROUND, 'CIVILIZATION_CLCOASTSALISH')
Decisions_CLCSUNDERGROUND.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
            return false, false
        end
        Decisions_CLCSUNDERGROUND.Desc = Locale.ConvertTextKey('TXT_KEY_DECISIONS_CLCSUNDERGROUND_DESC')
        if load(pPlayer, 'Decisions_CLCSUNDERGROUND') == true then
            Decisions_CLCSUNDERGROUND.Desc = 
                Locale.ConvertTextKey('TXT_KEY_DECISIONS_CLCSUNDERGROUND_ENACTED')
            return false, false, true
        end
        local pCap = pPlayer:GetCapitalCity()
        if pCap == nil then
            return true, false
        end
        if pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 1 then
            return true, false
        end
        if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ENGINEERING) then
            return true, false
        end
        return true, true
    end
)
Decisions_CLCSUNDERGROUND.DoFunc = (
    function(pPlayer)
        pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -1)
		for pCity in pPlayer:Cities() do
            if pCity:GetPopulation() > pCity:GetNumBuilding(GameInfoTypes.BUILDING_CLCSHEALTH) then
                --doesn't go down if the population is lost
                pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLCSHEALTH, pCity:GetPopulation())
            end
            --doesn't reset if the city changes hands, but does no longer change.
        end
        save(pPlayer, 'Decisions_CLCSUNDERGROUND', true)
    end
)

Decisions_CLCSUNDERGROUND.Monitors = {}
Decisions_CLCSUNDERGROUND.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerId)
    local pPlayer = Players[playerId]
    if load(pPlayer, 'Decisions_CLCSUNDERGROUND') == true then
        for pCity in pPlayer:Cities() do
            if pCity:GetPopulation() > pCity:GetNumBuilding(GameInfoTypes.BUILDING_CLCSHEALTH) then
                --doesn't go down if the population is lost
                pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CLCSHEALTH, pCity:GetPopulation())
            end
            --doesn't reset if the city changes hands, but does no longer change.
        end
    end
end
)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLCOASTSALISH, 'Decisions_CLCSUNDERGROUND',
        Decisions_CLCSUNDERGROUND)

--------------------------------------------------------------------------------------------------------
--Toxic Arrows
-- COSTS: 
-- 40 Science
-- REQS:
-- Trapping
-- Archery
-- GIVES:
-- Bow and gun units stack a debuff on enemy units when they attack.
-- This poison has 5 stacks
-- Each time the target heals, they lose 1 stack
-- When the game reaches the Modern Era, the poison is removed in one heal.
local poison = {}
poison[1] = GameInfoTypes.PROMOTION_CLPOISON1
poison[2] = GameInfoTypes.PROMOTION_CLPOISON2
poison[3] = GameInfoTypes.PROMOTION_CLPOISON3
poison[4] = GameInfoTypes.PROMOTION_CLPOISON4
poison[5] = GameInfoTypes.PROMOTION_CLPOISON5

local iPoisonFound = GameInfoTypes["PROMOTION_CLPOISONFOUND"]
local iPoisonCan = GameInfoTypes["PROMOTION_CLPOISONCAN"]

--Combat Listener ho!
function ListenSEUSD(playerId, unitId, newDamage, oldDamage)
    if newDamage > oldDamage then --filter out heals
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == unitId then
                if not pUnit:IsHasPromotion(iPoisonFound) then -- this is a possible the target
                    local pPlot = pUnit:GetPlot()
                    local range = 3
                    for dx = -range, range do
                        for dy = -range, range do
                            local SpecificPlot = Map.PlotXYWithRangeCheck(pPlot:GetX(), pPlot:GetY(), dx, dy, range)
                            if SpecificPlot ~= nil then
                                if SpecificPlot:GetNumUnits() > 0 then
                                    for i = 0, SpecificPlot:GetNumUnits() - 1 do
                                        local pSH = SpecificPlot:GetUnit(i)
                                        if pSH:IsHasPromotion(iPoisonFound) then
                                            --triggered
                                            local untouched = true
                                            if pUnit:IsHasPromotion(poison[5]) then
                                                pSH:SetHasPromotion(iPoisonFound, false)
                                                pSH:SetHasPromotion(iPoisonCan, true)
                                                return
                                            end
                                            for i = 1, 4, 1 do
                                                if pUnit:IsHasPromotion(poison[i]) then
                                                   pUnit:SetHasPromotion(poison[i], false)
                                                    local ii = i + 1
                                                    pUnit:SetHasPromotion(poison[ii], true)
                                                    Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_YIELD_FOOD] Rank "..ii.." Poison [ENDCOLOR]", 0)
                                                    untouched = false
                                                    break
                                                end
                                            end
                                            if untouched == true then
                                                pUnit:SetHasPromotion(poison[1], true)
                                                Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_YIELD_FOOD] Rank 1 Poison [ENDCOLOR]", 0)
                                            end
                                            print('UKIC Worked. You are the player. Hooray!!!')
                                            pSH:SetHasPromotion(iPoisonFound, false)
                                            pSH:SetHasPromotion(iPoisonCan, true)
                                            return
                                        end
                                    end  
                                end
                            end
                        end
                    end
                end 
            end
        end
    else
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == unitId then
                for i = 1, 5, 1 do
                    if pUnit:IsHasPromotion(poison[i]) then
                        pUnit:SetHasPromotion(poison[i], false)
                        if i > 1 and Game.GetCurrentEra() < GameInfoTypes.ERA_MODERN then
                            pUnit:SetHasPromotion(poison[i - 1], true)
                        end
                        return
                    end
                end
            end
        end
    end
    return --this event expects a return, so it perfoms better if you give it one
end
Events.SerialEventUnitSetDamage.Add(ListenSEUSD)

--[[function SetSalishPoison(ownerId, cityId, unitId)
    local pPlayer = Players[ownerId]
    if load(pPlayer, 'Decisions_CLCSPOISON') == true then
        local pUnit = pPlayer:GetUnitByID(unitId)
        if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_RANGED or
                pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN then
            pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CLPOISONCAN, true)
        end
    end
end
GameEvents.CityTrained.Add(SetSalishPoison)]]

function SetSalishPoison(ownerId, unitId)
	local pPlayer = Players[ownerId]
    if load(pPlayer, 'Decisions_CLCSPOISON') == true then
        local pUnit = pPlayer:GetUnitByID(unitId)
        if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_ARCHER or pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN then
            pUnit:SetHasPromotion(iPoisonCan, true)
        end
    end
end

Events.SerialEventUnitCreated.Add(SetSalishPoison)
	
local Decisions_CLCSPOISON = {}
print('Decisions_CLCSPOISON loaded')
Decisions_CLCSPOISON.Name = 'TXT_KEY_DECISIONS_CLCSPOISON_NAME'
HookDecisionCivilizationIcon(Decisions_CLCSPOISON, 'CIVILIZATION_CLCOASTSALISH')
Decisions_CLCSPOISON.CanFunc = (
    function(pPlayer)
        if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLCOASTSALISH then
            return false, false
        end
        Decisions_CLCSPOISON.Desc = Locale.ConvertTextKey('TXT_KEY_DECISIONS_CLCSPOISON_DESC')
        if load(pPlayer, 'Decisions_CLCSPOISON') == true then
            Decisions_CLCSPOISON.Desc = Locale.ConvertTextKey('TXT_KEY_DECISIONS_CLCSPOISON_ENACTED')
            return false, false, true
        end
        local pCap = pPlayer:GetCapitalCity()
        if pCap == nil then
            return true, false
        end
		if pPlayer:GetCurrentResearch() == -1 then return true, false end
        --if pPlayer:GetCurrentResearch() < 40 then
		if pPlayer:GetResearchProgress(pPlayer:GetCurrentResearch()) <= 40 then
            return true, false
        end
        if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHERY) then
            return true, false
        end
        if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_TRAPPING) then
            return true, false
        end
        return true, true
    end        
)
Decisions_CLCSPOISON.DoFunc = (
    function(pPlayer)
        local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
        pTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), -40)
        for pUnit in pPlayer:Units() do
            --SetSalishPoison(pPlayer:GetID(), pUnit:GetID())
			if pUnit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_ARCHER"] or pUnit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_GUN"] then
				pUnit:SetHasPromotion(iPoisonCan, true)
			end
        end
        save(pPlayer, 'Decisions_CLCSPOISON', true)
    end
)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CLCOASTSALISH, 'Decisions_CLCSPOISON',
        Decisions_CLCSPOISON)