--------------------------------------------------------------
-- Variables
--------------------------------------------------------------
local buildingCaerID = GameInfoTypes["BUILDING_US_CAER"]
local buildingCaerTourismID = GameInfoTypes["BUILDING_US_CAER_TOURISM"]
local buildingCaerCultureID = GameInfoTypes["BUILDING_US_CAER_CULTURE"]
local buildingHappyWorksID = GameInfoTypes["BUILDING_UA_HAPPY_WORKS"]
 
local civilizationID = GameInfoTypes["CIVILIZATION_US_WALES"]
   
local improvementCitadelID  = GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID = GameInfoTypes["IMPROVEMENT_FORT"]
 
local specialistMusicianID = GameInfoTypes["SPECIALIST_MUSICIAN"]
 
local promotionSaethwyrID = GameInfoTypes["PROMOTION_URDNOT_SAETHWYR"]
local promotionSaethwyrHillfortID = GameInfoTypes["PROMOTION_URDNOT_SAETHWYR_FORT"]
 
include("FLuaVector.lua")
--------------------------------------------------------------
-- ryflleglifflelygh hwr harlech
--------------------------------------------------------------
function urdnot_Wales_RhyfelgyrchGwyrHarlech(playerID)
    local player = Players[playerID]
    local capital = player:GetCapitalCity()
    if player:IsGoldenAge() then
        local reward = capital:GetLocalHappiness()
        capital:ChangeSpecialistGreatPersonProgressTimes100(specialistMusicianID, reward*100)
        if player:IsHuman() then
            local hex = ToHexFromGrid(Vector2(capital:GetX(), capital:GetY()))
            Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE]", reward), true)
        end
    end
end
 
GameEvents.PlayerDoTurn.Add(urdnot_Wales_RhyfelgyrchGwyrHarlech)
--------------------------------------------------------------
-- Happy Great Works yo
--------------------------------------------------------------
function urdnot_Wales_Caer(playerID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
        for city in player:Cities() do
            local numGreatWorks = city:GetNumGreatWorks()
            city:SetNumRealBuilding(buildingHappyWorksID, numGreatWorks)
        end
    end
end
 
GameEvents.PlayerDoTurn.Add(urdnot_Wales_Caer)
--------------------------------------------------------------
-- Swap till u drop
--------------------------------------------------------------
local iHillCastle = GameInfoTypes["BUILDING_US_HILL_CAER"]
 
function C15_SwapDemCastles (playerID, cityID, buildingID)
    local pPlayer = Players[playerID]
    if pPlayer:GetCivilizationType() == civilizationID then
        if buildingID == buildingCaerID then -- If you don't want this to be the default, just say
            local pCity = pPlayer:GetCityByID(cityID)
            local pPlot = pCity:Plot()
            if pPlot:IsHills() then
                pCity:SetNumRealBuilding(buildingCaerID, 0)
                pCity:SetNumRealBuilding(iHillCastle, 1)
            end
        end
    end
end
 
GameEvents.CityConstructed.Add(C15_SwapDemCastles)
--------------------------------------------------------------
-- fortests
--------------------------------------------------------------
function urdnot_Wales_Saethwyr_Hillfort(playerID, unitID, plotX, plotY)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
        local unit = player:GetUnitByID(unitID)
        local plot = Map.GetPlot(plotX, plotY)
		if plot then
			if not plot:GetImprovementType() == improvementCitadelID or plot:GetImprovementType() == improvementFortID then
				unit:SetHasPromotion(promotionSaethwyrID, true)
				unit:SetHasPromotion(promotionSaethwyrHillfortID, false)
			end
			if unit:IsHasPromotion(promotionSaethwyrID) then
				if plot and not plot:GetImprovementType() == improvementCitadelID or plot:GetImprovementType() == improvementFortID then
					if plot:GetOwner() == playerID then
						if plot:IsHills() then
							unit:SetHasPromotion(promotionSaethwyrID, true)
							unit:SetHasPromotion(promotionSaethwyrHillfortID, false)
						end
					end
				end
			end
		end
    end
end
 
GameEvents.UnitSetXY.Add(urdnot_Wales_Saethwyr_Hillfort)
 
function urdnot_Wales_Saethwyr_Culture(playerID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
        for unit in player:Units() do
            if unit:IsHasPromotion(promotionSaethwyrID) or unit:IsHasPromotion(promotionSaethwyrHilfortID) then
                if unit:GetFortifyTurns() > 0 then
					local plot = Map.GetPlot(unit:GetX(), unit:GetY())
                    if plot:GetOwner() == playerID then
                        if plot:IsHills() then
                            local cultureReward = (unit:GetLevel())*2
                            player:ChangeJONSCulture(cultureReward)
                           --[[ if player:IsHuman() then
                                local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
                                Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num} [ICON_CULTURE]", cultureReward), true)
                            end]]
							if playerID == Game.GetActivePlayer() then
								--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_YIELD_GOLD]+"..iPop.."[ICON_GOLD] Gold[ENDCOLOR]", 0)
								local iX = plot:GetX()
								local iY = plot:GetY()
								local pHexPos = ToHexFromGrid{x=iX, y=iY}
								local pWorldPos = HexToWorld(pHexPos)
								Events.AddPopupTextEvent(pWorldPos, "[COLOR_CULTURE_STORED]+"..cultureReward.."[ICON_CULTURE] Culture[ENDCOLOR]")
							end
                        end
                    end
                end
            end
        end
    end
end
 
GameEvents.PlayerDoTurn.Add(urdnot_Wales_Saethwyr_Culture)
--------------------------------------------------------------
-- i caer about u
--------------------------------------------------------------
function urdnot_Wales_Caer(playerID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
        if player:IsGoldenAge() then
            for city in player:Cities() do
                if city:IsHasBuilding(buildingCaerID) or city:IsHasBuilding(iHillCastle) then
                    local numGreatWorks = city:GetNumGreatWorks()
                    city:SetNumRealBuilding(buildingCaerTourismID, 1)
                    city:SetNumRealBuilding(buildingCaerCultureID, numGreatWorks)
                end
            end
        else
            for city in player:Cities() do
                city:SetNumRealBuilding(buildingCaerTourismID, 0)
                city:SetNumRealBuilding(buildingCaerCultureID, 0)
            end
        end
    end
end
 
GameEvents.PlayerDoTurn.Add(urdnot_Wales_Caer)