WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "UAEFunctions";
include("PlotIterators")

 --==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_InitUAE
----------------------------------------------------------------------------------------------------------------------------	
function JFD_InitUAE(player)
	for iPlayer=0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[iPlayer]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_UAE"] and player:IsAlive() then
			if not player:HasPolicy(GameInfoTypes["POLICY_UAE"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_UAE"], true)	
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_InitUAE)

local bDummy1 = GameInfoTypes.BUILDING_BURJ_TOURISM1;
local bDummy2 = GameInfoTypes.BUILDING_BURJ_TOURISM2;
local bDummy4 = GameInfoTypes.BUILDING_BURJ_TOURISM4;
local bDummy8 = GameInfoTypes.BUILDING_BURJ_TOURISM8;
local bDummy16 = GameInfoTypes.BUILDING_BURJ_TOURISM16;
local bDummy32 = GameInfoTypes.BUILDING_BURJ_TOURISM32;
local bDummy64 = GameInfoTypes.BUILDING_BURJ_TOURISM64;

function toBits(num)
    -- returns a table of bits, least significant first.
	t={} -- will contain the bits
    while num>0 do
        local rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end

function BurjTourism(player, city)
	local num = city:GetNumWorldWonders() 
						toBits(num)
				city:SetNumRealBuilding(bDummy1, t[1]);
				city:SetNumRealBuilding(bDummy2, t[2]);
				city:SetNumRealBuilding(bDummy4, t[3]);
				city:SetNumRealBuilding(bDummy8, t[4]);
				city:SetNumRealBuilding(bDummy16, t[5]);
				city:SetNumRealBuilding(bDummy32, t[6]);
				city:SetNumRealBuilding(bDummy64, t[7]);
				end

function UAEReset(player, city)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_5, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_10, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_15, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_20, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_25, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_30, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_35, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_40, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_45, 0)
city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_50, 0)
end

function UAEPlayerDoTurn(playerID)
local player = Players[playerID]
if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_UAE then 
for city in player:Cities() do
		 if city:IsCapital() or city:GetNumWorldWonders() > 0 then
		UAEReset(player, city)
		local coffer = player:GetGold()
		local bonus = math.floor(coffer / 500)
		if bonus == 1 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_5, 1)
		elseif bonus == 2 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_10, 1)
		elseif bonus == 3 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_15, 1)
		elseif bonus == 4 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_20, 1)
		elseif bonus == 5 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_25, 1)
		elseif bonus == 6 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_30, 1)
		elseif bonus == 7 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_35, 1)
		elseif bonus == 8 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_40, 1)
		elseif bonus == 9 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_45, 1)
		elseif bonus >= 10 then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UAE_UA_50, 1)
			end
		end
		if city:IsHasBuilding(GameInfoTypes.BUILDING_BURJ) then
		local wonders = city:GetNumWorldWonders()
		local tourism = city:GetBaseTourism()
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_BURJ_GOLD, math.floor(tourism / 5))
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_BURJ_WONDER_GOLD, wonders)
		if wonders > 0 then
			BurjTourism(player, city)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(UAEPlayerDoTurn)


function UAEWonderBuilt(playerID, cityID, buildingID)
local player = Players[playerID]
if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes.CIVILIZATION_UAE then 
        local city = player:GetCityByID(cityID)
		local currentBuildingClass = GameInfo.Buildings[buildingID].BuildingClass
		local buildingClass = GameInfo.BuildingClasses[currentBuildingClass]
		if (buildingClass.MaxGlobalInstances == 1) then
		local prodCost = player:GetBuildingProductionNeeded(buildingID)
		local wonders = city:GetNumWorldWonders()
		local goldBoost = ((wonders - 1) * 100) 
			player:ChangeGold(goldBoost)
		if player:IsHuman() then
			local cityName = city:GetName()
			Events.GameplayAlertMessage("The rich and famous have flocked to " .. cityName .. " following the unveiling of its latest wonder! Receive " .. goldBoost .. " [ICON_GOLD] Gold!")
			end
		end
	end
end
GameEvents.CityConstructed.Add(UAEWonderBuilt)

--------------------------------------------------------------
-- Detect Plunder
-- Globals
--------------------------------------------------------------

local tClasses = {}
tClasses[GameInfoTypes.UNITCLASS_CARGO_SHIP] = GameInfoTypes.UNITCLASS_CARGO_SHIP
--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function DetectPlunder(iPlayer, iUnit)
    local pPlayer = Players[iPlayer]
    local pUnit = pPlayer:GetUnitByID(iUnit)
    local iUnitClass = pUnit:GetUnitClassType()
    
    if tClasses[iUnitClass] ~= nil then
        local pTeam = Teams[pPlayer:GetTeam()]
        local pPlot = pUnit:GetPlot()
        local iNumUnits = pPlot:GetNumUnits()
        for iVal = 0,(iNumUnits - 1) do
            local pLUnit = pPlot:GetUnit(iVal)
            if pLUnit:GetCombatLimit() > 0 and pTeam:IsAtWar(pLUnit:GetTeam()) then
                -- Being plundered, run function
                QasimiRaiderFunction(pLUnit)
		QasimiPillageGold(Players[pLUnit:GetOwner()])
                break
            end
        end
    end
    
    return false
end
GameEvents.CanSaveUnit.Add(DetectPlunder)
--------------------------------------------------------------
-- Corsair Code
-- Globals
--------------------------------------------------------------
--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function QasimiRaiderFunction(pUnit)

    if not(pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_QASIMI_RAIDER)) then
        return
    end
    
    local pPlayer = Players[pUnit:GetOwner()]
    local iUnit = pUnit:GetID()
    local moves = pUnit:MaxMoves()
    
    -- Adjust Info
        -- Moves
        pUnit:SetMoves(moves * 60)
	pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_QASIMI_MOVES, true)
        
    --Adjust end    
end

function QasimiCapture(playerId, unitId, newDamage, oldDamage)
    if newDamage > oldDamage then --filter out heals
        local pPlayer = Players[playerId]
        for pUnit in pPlayer:Units() do
            if pUnit:GetID() == unitId then
                if not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_QASIMI_HIT) then -- this is a possible the target
                    if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA then -- this is a possible target. Fan out for adjacent ships
                        local pPlot = pUnit:GetPlot()
						local iNumUnits = pPlot:GetNumUnits()
						for iVal = 0,(iNumUnits - 1) do
						local cUnit = pPlot:GetUnit(iVal)
                        for i = 0, 5 do
                            local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
                            if pAdj ~= nil then
                                if pAdj:GetNumUnits() > 0 then
                                    for i = 0, pAdj:GetNumUnits() - 1 do
                                        local pSH = pAdj:GetUnit(i)
                                        if pSH:IsHasPromotion(GameInfoTypes.PROMOTION_QASIMI_HIT) then
										pSH:SetHasPromotion(GameInfoTypes.PROMOTION_QASIMI_HIT, false)
                                        pSH:SetHasPromotion(GameInfoTypes.PROMOTION_QASIMI_RAIDER, true)
										if newDamage == 100 then
										pSH:SetMoves(300)			
										pSH:SetHasPromotion(GameInfoTypes.PROMOTION_QASIMI_MOVES, true)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
    return --this event expects a return, so it perfoms better if you give it one
end
Events.SerialEventUnitSetDamage.Add(QasimiCapture)

function QasimiMonitor(iPlayer)
    local pPlayer = Players[iPlayer]
    for pUnit in pPlayer:Units() do
        if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_QASIMI_RAIDER) then
	 if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_QASIMI_MOVES) then            
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_QASIMI_MOVES, false)
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(QasimiMonitor)

function QasimiPillageGold(player)
	local goldPillaged = 100
	player:ChangeGold(goldPillaged)
end