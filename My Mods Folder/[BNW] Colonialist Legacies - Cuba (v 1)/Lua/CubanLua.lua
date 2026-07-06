-- Lua Script1
-- Author: John
-- DateCreated: 12/5/2015 8:24:39 PM
--------------------------------------------------------------
--Use SaveUtils to make this happen.
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "CLCuba";

--¡Viva la Revolución!: Spies generate "Revolutionary Fervor" in Cities causing them to generate Unhappiness (more after an Ideology is adopted). Unhappiness penalties to Combat and Production are halved.

--Guerrillero: Replacing the Great War Infantry, the Guerrillero can enter the territory of any Civilization generating Revolutionary Fervor. The Guerrillero can be expended to create a "Rebel Camp" improvement that has a chance to spawn Barbarians in territories generating "Revolutionary Fervor".

--Dance Hall: Cheaper than the Opera House it replaces, the Dance Hall provides +1 Happiness and +15% Military Production if the Great Work of Music slot is filled. Revolutionary Fervor in a city with a Dance Hall will contribute Culture towards your next Social Policy during Golden Ages.

function DoCubanCount(pPlayer, pCity)
    local tSpies = pPlayer:GetEspionageSpies()
    for k, spy in pairs(tSpies) do
        local pPlot = Map.GetPlot(spy.CityX, spy.CityY)
        if pPlot ~= nil then
            if pCity == pPlot:GetPlotCity() then
                local pTarget = Players[pCity:GetOwner()]
                local branch = 0
                if pPlayer:GetPolicyBranchChosen(PolicyBranchTypes.POLICY_BRANCH_FREEDOM) then
                    branch = PolicyBranchTypes.POLICY_BRANCH_FREEDOM
                elseif pPlayer:GetPolicyBranchChosen(PolicyBranchTypes.POLICY_BRANCH_ORDER) then
                    branch = PolicyBranchTypes.POLICY_BRANCH_ORDER
                elseif pPlayer:GetPolicyBranchChosen(PolicyBranchTypes.POLICY_BRANCH_AUTOCRACY) then
                    branch = PolicyBranchTypes.POLICY_BRANCH_AUTOCRACY
                end
                local Cmodifier = 1
                if branch ~= 0 then
                    if pTarget:GetPolicyBranchChosen(branch) then
                        Cmodifier = 0.5
                    else
                        Cmodifier = 1.5
                    end
                end
                -- We need to get the spy power now otherwise we won't know who to get it from later
--                print('LOOK FOR ME: ' .. spy.Rank) -- we need to know this so we can code spy power as a thing.
                if spy.Rank == TXT_KEY_SPY_RANK_1 then
                    return math.ceil(2 * Cmodifier)
                elseif spy.Rank == TXT_KEY_SPY_RANK_2 then
                    return math.ceil(3 * Cmodifier)
                else
                    return math.ceil(Cmodifier)
                end
            end
        end
    end
end

function CheckForCubanSpies(playerid)
    local pPlayer = Players[playerid]
    if pPlayer:IsBarbarian() == false then
        for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local pCuban = Players[i]
            local numSpies = 0
            if pCuban:IsEverAlive() and pCuban:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
                for pCity in pPlayer:Cities() do
                    local CubanCount = DoCubanCount(pCuban, pCity)
                    if CubanCount == nil then
                        return
                    end
                    pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_HAPPINESSKILLER, CubanCount)
                    if CubanCount > 0 then
                        numSpies = numSpies + 1
                    end
                end
                if numSpies > 2 then
                    if pPlayer:IsHuman() == false and pPlayer ~= pCuban then
                        if pPlayer:IsDenouncing(i) == false then
                            pPlayer:DoForceDenounce(i)
                        end
                    end
                end
            end
        end
    end
end

local CubaTab = {}
CubaTab[6] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_1;
CubaTab[5] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_2;
CubaTab[4] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_4;
CubaTab[3] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_8;
CubaTab[2] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_16;
CubaTab[1] = GameInfoTypes.PROMOTION_CL_UC_COMBAT_32;

function CubanUA(playerId)
    local pPlayer = Players[playerId]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        local pCap = pPlayer:GetCapitalCity()
        pCap:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_UNHAPPY_YIELD_REDUCTION, pPlayer:GetUnhappiness())
        for pUnit in pPlayer:Units() do
            print(tostring(pPlayer:GetExcessHappiness()))
            local RevolAmount = (-1 - pPlayer:GetExcessHappiness())
            for i = 1, 6 do --                                              This portion of the script was taken from LastSword pack IV
                if RevolAmount > 0 then
                    if not ( RevolAmount < math.pow(2,6 - i) ) then --      LS provided it to me
                        pUnit:SetHasPromotion(CubaTab[i], true) --          since he is so boss
                        RevolAmount = RevolAmount - math.pow(2,6 - i) --    and is a Lua machine
                    else
                        pUnit:SetHasPromotion(CubaTab[i], false);
                    end
                else
                    pUnit:SetHasPromotion(CubaTab[i], false);
                end
            end --                                                      End LS script.
        end
    end
end

function CheckBananas(pPlot)
    for i = 0, 5 do
        local CheckPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
        if CheckPlot ~= nil then
            if CheckPlot:GetNumUnits() > 0 then
                for i = 0, CheckPlot:GetNumUnits() - 1 do
                    local CheckUnit = CheckPlot:GetUnit(i)
                    if CheckUnit:GetUnitType() == GameInfoTypes.UNIT_CL_UC_GUERRILLERO then
                        --print('Bananananaanananaananaaas')
                        return true
                    end
                end
            end
        end
    end
   -- print('I am not a banana :(')
    return false
end

function GoBananas(playerid, unitid, x, y)
    local pPlayer = Players[playerid]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        local pUnit = pPlayer:GetUnitByID(unitid)
        if pUnit ~= nil then
            print(tostring(pUnit:GetName()))
            local pPlot = pUnit:GetPlot()
            if pPlot ~= nil then
                print(tostring(pUnit:GetUnitType()))
                if pUnit:GetUnitType() == GameInfoTypes.UNIT_CL_UC_GUERRILLERO then
                    if CheckBananas(pPlot) then
                        print('Unleash the monkey!')
                        pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CL_UC_GOBANANAS, true)
                    else
                        print('Un-Unleash the monkey!')
                        pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_CL_UC_GOBANANAS, false)
                    end
                end
            end
        end
    end
end
                
function TestSwapMove(playerid, unitid, x, y)
    print('TSM')
    local pPlayer = Players[playerid]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        print('Cuba')
        local unit = pPlayer:GetUnitByID(unitid)
        if unit ~= nil then
            if unit:GetUnitType() == GameInfoTypes.UNIT_CL_UC_GUERRILLERO then
                local yesno = TestBananas(playerid, unit)
                print('yesno == '..tostring(yesno))
                if yesno then
                    Teams[pPlayer:GetTeam()]:SetHasTech(GameInfoTypes.TECH_GORILLAWARFARE, true)
                else
                    Teams[pPlayer:GetTeam()]:SetHasTech(GameInfoTypes.TECH_GORILLAWARFARE, false)
				end
            else
                Teams[pPlayer:GetTeam()]:SetHasTech(GameInfoTypes.TECH_GORILLAWARFARE, false)
            end
        end
    end
end

function TestBananas(playerId, unit)
    local pPlayer = Players[playerId]
    local pPlot = unit:GetPlot()
    if pPlot ~= nil then
        local pOwner = pPlot:GetOwner()
        if pOwner == -1 or pOwner == playerId then
            return false
        elseif checkRF(pPlayer, pOwner) then
            return true
        end
    end
    return false
end

function SwapBananaTech(playerId, unitId, x, y, k, isSelected)
    print('SwapBananasTech ran')
    if isSelected == false then
        return
    else
        TestSwapMove(playerId, unitId)
    end
end

function checkRF(pPlayer, playerId)
    print('Checking RF!')
    if playerId == -1 then
        return false
    end
    local pHost = Players[playerId]
    if pHost == pPlayer then
        return false
    else
        local tSpies = pPlayer:GetEspionageSpies()
        for k, spy in pairs(tSpies) do
            local pPlot = Map.GetPlot(spy.CityX, spy.CityY)
            for pCity in pHost:Cities() do
                if pCity ~= nil then
                    local cPlot = pCity:Plot()
                    if cPlot == pPlot then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function TestBorders(playerId, unit)
    print('TestBorders Ran!')
    local pPlayer = Players[playerId]
    local pPlot = unit:GetPlot()
    if pPlot ~= nil then
        local pOwner = pPlot:GetOwner()
        if pOwner ~= playerId then
            print('target acquired')
            local doesRF = checkRF(pPlayer, pOwner)
            print('doesRF == ' .. tostring(doesRF))
            if doesRF == true then
                return true
            else
                for i = 0, 5 do
                    local CheckPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
                    if CheckPlot ~= nil then
                        pOwner = CheckPlot:GetOwner()
                        doesRF = checkRF(pPlayer, pOwner)
                        print('doesRF == ' .. tostring(doesRF))
                        if doesRF == true then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

function TestBordersOnMove(playerid, unitid)
    print('TBOM')
    local pPlayer = Players[playerid]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        print('Cuba')
        local unit = pPlayer:GetUnitByID(unitid)
        if unit ~= nil then
            if unit:GetUnitType() == GameInfoTypes.UNIT_CL_UC_GUERRILLERO then
                local yesno = TestBorders(playerid, unit)
                print('yesno == '..tostring(yesno))
                if yesno then
                    unit:SetHasPromotion(GameInfoTypes.PROMOTION_RIVAL_TERRITORY, true)
                else
                    unit:SetHasPromotion(GameInfoTypes.PROMOTION_RIVAL_TERRITORY, false)
                end
            end
        end
    end
end

function EnterBorders(playerId, unitId, x, y, k, isSelected)
    print('EnterBorders ran')
    if isSelected == false then
        return
    else
        TestBordersOnMove(playerId, unitId)
    end
end

function SpawnBarbs(pPlot)
    print('Trying to spawn barbarians!')
    local favoredtype = GameInfoTypes.UNIT_BARBARIAN_WARRIOR
    local classcount = 0
    local pPlayer = Players[pPlot:GetOwner()]
    for pUnit in pPlayer:Units() do
        local combat = pUnit:GetUnitCombatType()
        if combat > -1 and combat < 7 then
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
				local class = pUnit:GetUnitClassType()
				if pPlayer:GetUnitClassCountPlusMaking(class) > classcount then
					classcount = pPlayer:GetUnitClassCountPlusMaking(class)
					favoredtype = pUnit:GetUnitType()
				end
            end
        end
    end
    local bPlayer = Players[63] -- it's always 63 for barbs
    bPlayer:InitUnit(favoredtype, pPlot:GetX(), pPlot:GetY(), GameInfoTypes.UNITAI_ATTACK)
end

function RebelCampDo(playerid)
    pPlayer = Players[playerid]
--    print('Rebel Camp Do')
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
            local pPlot = Map.GetPlotByIndex(plotLoop)
            if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CL_UC_REBEL_CAMP then
--                print('Rebel Camp found!')
                local rebelcount = load(pPlot, 'RebelCamp')
--                print('Rebels: '..tostring(rebelcount))
                if rebelcount == nil then
                    save(pPlot, 'RebelCamp', 1)
                elseif math.fmod(rebelcount, 3) == 0 then
                    SpawnBarbs(pPlot)
                    if rebelcount == 9 then
                        pPlot:SetImprovementType(-1)
                    else
                        save(pPlot, 'RebelCamp', rebelcount + 1)
                    end
                else
                    save(pPlot, 'RebelCamp', rebelcount + 1)
                end
            end
        end
    end
end

function DanceHallDo(player)
    local pPlayer = Players[player]
    if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        for pCity in pPlayer:Cities() do
            if pCity:IsHasBuilding(GameInfoTypes.BUILDING_CL_UC_DANCE_HALL) then
                if pCity:GetNumGreatWorksInBuilding(GameInfoTypes.BUILDINGCLASS_OPERA_HOUSE) > 0 then
                    pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_DANCE_HALL_DUMMY, 1)
                else
                    pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_DANCE_HALL_DUMMY, 0)
                end
                local DCC = DoCubanCount(pPlayer, pCity)
                if DCC ~= nil and DCC > 0 then
                    local pCapital = pPlayer:GetCapitalCity()
                    local AwardCity = pCapital
                    local uHap = math.ceil(pPlayer:GetUnhappinessFromCityForUI(pCity) / 4)
                    for pCity in pPlayer:Cities() do
                        if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MUSICIANS_GUILD) then
                            AwardCity = pCity
                        end
                    end
                    AwardCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfo.Specialists.SPECIALIST_MUSICIAN.ID, uHap)
                    print((uHap / 100) .. " Points Awarded to Capital")
                    if AwardCity ~= pCapital then
                        local CapProgress = ((pCapital:GetSpecialistGreatPersonProgress(GameInfo.Specialists.SPECIALIST_MUSICIAN.ID)) * 100)
                        pCapital:ChangeSpecialistGreatPersonProgressTimes100(GameInfo.Specialists.SPECIALIST_MUSICIAN.ID, -uHap)    
                        AwardCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfo.Specialists.SPECIALIST_MUSICIAN.ID, uHap)
                        print((uHap / 100) .. " Points Awarded.")
                    end
                end
            end
        end
    end
end

for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
    local pPlayer = Players[i]
    if pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
        print("Cuban lua loaded!")
        GameEvents.PlayerDoTurn.Add(DanceHallDo)
        GameEvents.PlayerDoTurn.Add(RebelCampDo)
        GameEvents.UnitSetXY.Add(TestSwapMove)
        GameEvents.UnitSetXY.Add(GoBananas)
        GameEvents.UnitSetXY.Add(TestBordersOnMove)
        GameEvents.PlayerDoTurn.Add(CubanUA)
        GameEvents.PlayerDoTurn.Add(CheckForCubanSpies)
        Events.UnitSelectionChanged.Add(SwapBananaTech)
        Events.UnitSelectionChanged.Add(EnterBorders)
        break
    end
end
