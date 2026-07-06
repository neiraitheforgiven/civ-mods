include("EnginseerConfig.lua")
local foodpromo = GameInfoTypes.PROMOTION_FOOD_ADDER
local productionpromo = GameInfoTypes.PROMOTION_PRODUCTION_ADDER
local culturepromo = GameInfoTypes.PROMOTION_CULTURE_ADDER
local goldpromo = GameInfoTypes.PROMOTION_GOLD_ADDER
local faithpromo = GameInfoTypes.PROMOTION_FAITH_ADDER
local xppromo = GameInfoTypes.PROMOTION_MILITARY_ADDER
local sciencepromo = GameInfoTypes.PROMOTION_SCIENCE_ADDER
local foodbuild = GameInfoTypes.BUILDING_DUMMY_FOOD
local productionbuild = GameInfoTypes.BUILDING_DUMMY_PRODUCTION
local culturebuild = GameInfoTypes.BUILDING_DUMMY_CULTURE
local goldbuild = GameInfoTypes.BUILDING_DUMMY_GOLD
local faithbuild = GameInfoTypes.BUILDING_DUMMY_FAITH
local xpbuild = GameInfoTypes.BUILDING_DUMMY_MILITARY
local sciencebuild = GameInfoTypes.BUILDING_DUMMY_SCIENCE
local iGeneral = GameInfoTypes.UNITCLASS_GREAT_GENERAL
local iAdmiral = GameInfoTypes.UNITCLASS_GREAT_ADMIRAL
function CityTraiter (iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end
	if not pPlayer:IsAlive() then return end
	local lfood = 0
	local lproduction = 0
	local lculture = 0
	local lgold = 0
	local lfaith = 0
	local lxp = 0
	local lscience = 0
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitClassType() == iGeneral or pUnit:GetUnitClassType() == iAdmiral) then
			if pUnit:IsHasPromotion(foodpromo) then lfood = lfood + 1
			elseif pUnit:IsHasPromotion(productionpromo) then lproduction = lproduction + 1
			elseif pUnit:IsHasPromotion(culturepromo) then lculture = lculture + 1
			elseif pUnit:IsHasPromotion(goldpromo) then lgold = lgold + 1
			elseif pUnit:IsHasPromotion(faithpromo) then lfaith = lfaith + 1
			elseif pUnit:IsHasPromotion(xppromo) then lxp = lxp + 1
			elseif pUnit:IsHasPromotion(sciencepromo) then lscience = lscience + 1
			end
		end
	end
	if Teams[pPlayer:GetTeam()]:GetAtWarCount(true) ~= 0 then
		lfood = 0
		lproduction = 0
		lculture = 0
		lgold = 0
		lfaith = 0
		lxp = 0
		lscience = 0
	end
	for pCity in pPlayer:Cities() do
		pCity:SetNumRealBuilding(foodbuild, lfood)
		pCity:SetNumRealBuilding(productionbuild, lproduction)
		pCity:SetNumRealBuilding(culturebuild, lculture)
		pCity:SetNumRealBuilding(goldbuild, lgold)
		pCity:SetNumRealBuilding(faithbuild, lfaith)
		pCity:SetNumRealBuilding(xpbuild, lxp)
		pCity:SetNumRealBuilding(sciencebuild, lscience)
	end
end

GameEvents.PlayerDoTurn.Add(CityTraiter)