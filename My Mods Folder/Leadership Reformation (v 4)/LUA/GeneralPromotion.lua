include("EnginseerConfig.lua")
include("PlotIterators.lua")
include("GGTraits.lua")
local iFirstTimeThroughKillerData = "NONE"
local iDomainLand = GameInfoTypes.DOMAIN_LAND
local iNothing = GameInfoTypes.PROMOTION_NOTHING
local iUnhappy = GameInfoTypes.PROMOTION_NOTHING_2
local iGeneral = GameInfoTypes.UNITCLASS_GREAT_GENERAL
local iArcher = GameInfoTypes.UNITCOMBAT_ARCHER
local iSiege = GameInfoTypes.UNITCOMBAT_SIEGE

--returns true/false as to whether the Greeat General already has AT LEAST ONE of the basic promotions a Great General can be given
function GreatGeneralHasAlreadyRecievedBasicPromotion(pUnit)
	for k,v in pairs(tLevel1GeneralshipPromotions) do
		if pUnit:IsHasPromotion(v) then
			return true
		end
	end
	return pUnit:IsHasPromotion(iNothing)
end

--This is how the game determine a promotion for a general!--
function GeneralSpawned(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if (pPlayer == nil or pUnit == nil or pUnit:IsDead()) then
		return
	end
	if pUnit:GetUnitClassType() ~= iGeneral then
		return 
	end 
	--PrintDebug("GeneralSpawned function fired for a great general")
	if GreatGeneralHasAlreadyRecievedBasicPromotion(pUnit) then
		--PrintDebug("The Generalship selection was not applied because the Great General already had one of the basic promotions from the list")
		return
	else
		--PrintDebug("The Great General does not already have one of the basic GG promotions or any of the ideology promotions: The Generalship selection will be applied")
		GeneralshipChoices = { tLevel1GeneralshipPromotions.Homeguard, tLevel1GeneralshipPromotions.Nationalism, tLevel1GeneralshipPromotions.LocalIntelligence, tLevel1GeneralshipPromotions.Cowardly, tLevel1GeneralshipPromotions.Butcher, tLevel1GeneralshipPromotions.Sufficient, tLevel1GeneralshipPromotions.Commando, tLevel1GeneralshipPromotions.Foreign, tLevel1GeneralshipPromotions.Forced, tLevel1GeneralshipPromotions.Strict, tLevel1GeneralshipPromotions.Skirmish, tLevel1GeneralshipPromotions.Banzai, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing }
		if isUsingCP and pPlayer:IsHuman() then
			GeneralshipChoices = {tLevel1GeneralshipPromotions.Homeguard, tLevel1GeneralshipPromotions.Nationalism, tLevel1GeneralshipPromotions.Reeducation,
				tLevel1GeneralshipPromotions.LocalIntelligence, tLevel1GeneralshipPromotions.Cowardly, tLevel1GeneralshipPromotions.Butcher,
				tLevel1GeneralshipPromotions.Pious, tLevel1GeneralshipPromotions.Scavenger, tLevel1GeneralshipPromotions.Sufficient,
				tLevel1GeneralshipPromotions.Commando, tLevel1GeneralshipPromotions.Foreign, tLevel1GeneralshipPromotions.Forced, tLevel1GeneralshipPromotions.Strict,
				tLevel1GeneralshipPromotions.Skirmish, tLevel1GeneralshipPromotions.Banzai, iNothing, iNothing, iNothing, iNothing, iNothing } --A list of your promotions!
		elseif isUsingCP then
			GeneralshipChoices = {tLevel1GeneralshipPromotions.Homeguard, tLevel1GeneralshipPromotions.Nationalism, tLevel1GeneralshipPromotions.Reeducation, tLevel1GeneralshipPromotions.LocalIntelligence, tLevel1GeneralshipPromotions.Pious, tLevel1GeneralshipPromotions.Scavenger, tLevel1GeneralshipPromotions.Sufficient, tLevel1GeneralshipPromotions.Commando, tLevel1GeneralshipPromotions.Foreign, tLevel1GeneralshipPromotions.Banzai, iNothing, iNothing, iNothing, iNothing, iNothing }
		elseif not pPlayer:IsHuman() then
		GeneralshipChoices = { tLevel1GeneralshipPromotions.Homeguard, tLevel1GeneralshipPromotions.Nationalism, tLevel1GeneralshipPromotions.LocalIntelligence, tLevel1GeneralshipPromotions.Cowardly, tLevel1GeneralshipPromotions.Butcher, tLevel1GeneralshipPromotions.Sufficient, tLevel1GeneralshipPromotions.Commando, tLevel1GeneralshipPromotions.Foreign, tLevel1GeneralshipPromotions.Banzai, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing, iNothing }
		end
		local iGeneralshipSelection = GeneralshipChoices[math.random(#GeneralshipChoices)] --Game will setup a random number for you!
		--PrintDebug("iGeneralshipSelection = " .. iGeneralshipSelection .. " (" .. GameInfo.UnitPromotions[iGeneralshipSelection].Type .. ")")
		pUnit:SetHasPromotion(iGeneralshipSelection, true)
		if CityYieldTraits then
			local CityTraits = CityTraitsList[math.random(#CityTraitsList)]
			if CityTraits ~= "NONE" then
				pUnit:SetHasPromotion(CityTraits, true)
			end
		end
	end
end


--This checks the General's custom promotion and any unit on him!--
function GeneralAtPlot(pPlot, iPlayer)
	local iGeneralType = "NONE"
	local pGeneral = nil
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iGeneral) and (pUnit:GetOwner() == iPlayer) then
				pGeneral = pUnit
			end
		end
	end
	if pGeneral then
		if not pGeneral:IsHasPromotion(iNothing) then
			for key1,value1 in pairs(tLevel1GeneralshipPromotions) do
				if pGeneral:IsHasPromotion(value1) then
					iGeneralType = value1
					for key2,value2 in pairs(tLevel2GeneralshipPromotions) do
						if pGeneral:IsHasPromotion(value2) then
							iGeneralType = value2
							for key3,value3 in pairs(tLevel3GeneralshipPromotions) do
								if pGeneral:IsHasPromotion(value3) then
									iGeneralType = value3
								end
							end
						end
					end
				end
				if iGeneralType ~= "NONE" then
					break
				end
			end
		end
	end
	return iGeneralType
end
--This sets what unit gets what. General's Promotions now stack because of this function!--
function SetGeneralEffect(pUnit, iGeneralType)
	if iGeneralType ~= "NONE" then
		pUnit:SetHasPromotion(tGeneralToUnitCorrespondances[iGeneralType], true)
	end
end

function GeneralCheckLevelUp(pUnit)
	if pUnit:GetExperience() >= Expneeded2 then
		local sGeneralshipLine = "NONE"
		for k,v in pairs (tLevel1GeneralshipPromotions) do
			if pUnit:IsHasPromotion(v) then
				sGeneralshipLine = k
			end
		end
		if pUnit:IsHasPromotion(tLevel2GeneralshipPromotions[sGeneralshipLine]) and pUnit:GetExperience() >= Expneeded3 then
			if not pUnit:IsHasPromotion(tLevel3GeneralshipPromotions[sGeneralshipLine]) then
				pUnit:SetHasPromotion(tLevel3GeneralshipPromotions[sGeneralshipLine], true)
			end
		end
		if not pUnit:IsHasPromotion(tLevel2GeneralshipPromotions[sGeneralshipLine]) then
			pUnit:SetHasPromotion(tLevel2GeneralshipPromotions[sGeneralshipLine], true)
		end
	end
end
--This find units adjacent to the general!--
function GeneralAdjacentPlotCheck(pPlot, iPlayer)
	local iGeneralType = "NONE"
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
		if pAdjacentPlot and pAdjacentPlot:IsUnit() then
			iGeneralType = GeneralAtPlot(pAdjacentPlot, iPlayer)
			if iGeneralType ~= "NONE" then
				return iGeneralType
			end
		end
	end
	return iGeneralType
end
--This find untis in the promixity of two tiles to the general!--
function General2ndRingPlotCheck(pUnitPlot, iPlayer)
	local iGeneralType = "NONE"
	for pEdgePlot in PlotRingIterator(pUnitPlot, 2, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
	--      PrintDebug(pEdgePlot:GetX(), pEdgePlot:GetY())
		if pEdgePlot:IsUnit() then
			iGeneralType = GeneralAtPlot(pEdgePlot, iPlayer)
			if iGeneralType ~= "NONE" then
				return iGeneralType
			end
		end
	end
	return iGeneralType
end
--This opens up and gives the promotions to the unit!--
--runs on PlayerDoTurn and adds correct promotions to normal combat units.
function UnitsNearGeneral(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() then
			if pUnit:GetDomainType() == iDomainLand then
				for k,v in pairs(tCombatUnitMasterPromotionList) do
					if pUnit:IsHasPromotion(v) then
						pUnit:SetHasPromotion(v, false)
					end
				end
				if pUnit:IsNearGreatGeneral() then
					pUnitPlot = pUnit:GetPlot()
					local iGeneralType = GeneralAtPlot(pUnitPlot, iPlayer) --Also known as a Local Great General (Unit earns the promotion from the Great General on them!)
					SetGeneralEffect(pUnit, iGeneralType)
					if iGeneralType == "NONE" then
						iGeneralType = GeneralAdjacentPlotCheck(pUnitPlot, iPlayer) --Also known as a Regional Great General (Units adjacent to the Great General may earn the promotion, but priority of the better promotions is considered!)
						SetGeneralEffect(pUnit, iGeneralType)
					end
					if iGeneralType == "NONE" then
						iGeneralType = General2ndRingPlotCheck(pUnitPlot, iPlayer) --Also known as a Territorial Great General (Same rule applies like the Regional Great General.)
						SetGeneralEffect(pUnit, iGeneralType)
					end
				end
			end
		end
		--if pUnit:GetUnitClassType() == iGeneral then
			--PrintDebug(pUnit:GetName() .. " has " .. pUnit:GetExperience() .. " experience")
		--end
	end	
end

function CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID)
	--PrintDebug("In function CheckPlotForMatchingGeneral: iVictoriousUnitOwner is " .. tostring(iVictoriousUnitOwner))
	--PrintDebug("In function CheckPlotForMatchingGeneral: pPlot is " .. tostring(pPlot))
	--PrintDebug("In function CheckPlotForMatchingGeneral: iCombatUnitPromoID is " .. tostring(iCombatUnitPromoID))
	local pGeneralUnit = "NONE"
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iGeneral) and (pUnit:GetOwner() == iVictoriousUnitOwner) and pUnit:IsHasPromotion(tUnitToGeneralCorrespondances[iCombatUnitPromoID]) then
				return pUnit
			end
		end
	end
	return pGeneralUnit
end

function SearchForMatchingGeneralAndAssignXP(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID, bIncludePlot)
	--PrintDebug("The Combat Unit promotion " .. iCombatUnitPromoID .. ":" .. GameInfo.UnitPromotions[iCombatUnitPromoID].Type .. " is to be used for matching with a nearby great general")
	if tUnitToGeneralCorrespondances[iCombatUnitPromoID] then
		--PrintDebug("The Combat Unit Promotion is listed as a key in table tUnitToGeneralCorrespondances and the matching Great General Promotion is " .. tUnitToGeneralCorrespondances[iCombatUnitPromoID] ..  ":" .. GameInfo.UnitPromotions[tUnitToGeneralCorrespondances[iCombatUnitPromoID]].Type)
	end
	--PrintDebug("In function SearchForMatchingGeneralAndAssignXP: iVictoriousUnitOwner is " .. tostring(iVictoriousUnitOwner))
	--PrintDebug("In function SearchForMatchingGeneralAndAssignXP: pPlot is " .. tostring(pPlot))
	--PrintDebug("In function SearchForMatchingGeneralAndAssignXP: iCombatUnitPromoID is " .. tostring(iCombatUnitPromoID))
	local pGeneralUnit = "NONE"
	local bGeneralMatch = false
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check 'center' plot when bIncludePlot is set to true
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	if bIncludePlot then
		pGeneralUnit = CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID)
		if pGeneralUnit ~= "NONE" then
			bGeneralMatch = true
		end
	end
	if bGeneralMatch then
		if RandomExperience then
			pGeneralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		else
			pGeneralUnit:ChangeExperience(XPEarnedOnTile)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check adjacent plots
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("Adjacent Plots are being checked")
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		if not bGeneralMatch then
			local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
			if pAdjacentPlot and pAdjacentPlot:IsUnit() then
				pGeneralUnit = CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pAdjacentPlot, iCombatUnitPromoID)
				if pGeneralUnit ~= "NONE" then
					bGeneralMatch = true
				end
			end
		end
	end
	if bGeneralMatch then
		if RandomExperience and bIncludePlot then
			pGeneralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pGeneralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pGeneralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pGeneralUnit:ChangeExperience(XPEarnedAdjacentTile)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 2nd ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("2nd ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bGeneralMatch then
			if pEdgePlot:IsUnit() then
				pGeneralUnit = CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pGeneralUnit ~= "NONE" then
					bGeneralMatch = true
				end
			end
		end
	end
	if bGeneralMatch then
		if RandomExperience and bIncludePlot then
			pGeneralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pGeneralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pGeneralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pGeneralUnit:ChangeExperience(XPEarned2ndTileAway)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 3rd ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("3rd ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bGeneralMatch then
			if pEdgePlot:IsUnit() then
				pGeneralUnit = CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pGeneralUnit ~= "NONE" then
					bGeneralMatch = true
				end
			end
		end
	end
	if bGeneralMatch then
		if RandomExperience and bIncludePlot then
			pGeneralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pGeneralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pGeneralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pGeneralUnit:ChangeExperience(XPEarned3rdTileAway)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 4th ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("4th ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 4, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bGeneralMatch then
			if pEdgePlot:IsUnit() then
				pGeneralUnit = CheckPlotForMatchingGeneral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pGeneralUnit ~= "NONE" then
					bGeneralMatch = true
				end
			end
		end
	end
	if bGeneralMatch then
		if RandomExperience and bIncludePlot then
			pGeneralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pGeneralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pGeneralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pGeneralUnit:ChangeExperience(XPEarned4thTileAway)
			return
		end
	end
end

function NearGeneralKiller(iOwner, iUnit, iUnitType, iX, iY, bDelay, iKiller)
	if bDelay then
		iFirstTimeThroughKillerData = iKiller
		return
	end
	if iFirstTimeThroughKillerData == -1 then
		iFirstTimeThroughKillerData = "NONE"
		return
	end
	if iFirstTimeThroughKillerData == "NONE" then
		return
	end
	local pOwnerPlayer = Players[iOwner]
	local pUnitKilled = pOwnerPlayer:GetUnitByID(iUnit)
	if not pUnitKilled:IsCombatUnit() then return end
	if pUnitKilled:GetDomainType() ~= iDomainLand then return end
	local pKillerPlayer = Players[iFirstTimeThroughKillerData]
	iFirstTimeThroughKillerData = "NONE"
	local pPlot = Map.GetPlot(iX, iY)
	local iNumTileUnits = pPlot:GetNumUnits()
	if iNumTileUnits > 1 then
		for i = 0, pPlot:GetNumUnits() do
			local pUnit = pPlot:GetUnit(i)
			if pUnit then
				local iUnitOwner = pUnit:GetOwner()
				if iUnitOwner ~= iOwner then
					local iCombatUnitPromotion = "NONE"		
					for k,v in pairs(tGeneralToUnitCorrespondances) do
						if pUnit:IsHasPromotion(v) then
							iCombatUnitPromotion = v
							break
						end
					end
					if iCombatUnitPromotion ~= "NONE" then
						--PrintDebug("The Combat Unit has promotion " .. iCombatUnitPromotion .. ":" .. GameInfo.UnitPromotions[iCombatUnitPromotion].Type .. " for matching with a nearby great general")
						--PrintDebug("In function NearGeneralKiller: iUnitOwner is " .. tostring(iUnitOwner))
						--PrintDebug("In function NearGeneralKiller: pPlot is " .. tostring(pPlot))
						--PrintDebug("In function NearGeneralKiller: iCombatUnitPromotion is " .. tostring(iCombatUnitPromotion))
						SearchForMatchingGeneralAndAssignXP(iUnitOwner, pPlot, iCombatUnitPromotion, false)
					else
						--PrintDebug("No valid combat unit promotion was found from within table tGeneralToUnitCorrespondances")
					end
				end
			end
		end
	end
end

function GeneralLevelUp(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == iGeneral then
			for k,v in pairs(tLevel1GeneralshipPromotions) do
				if pUnit:IsHasPromotion(v) then
					GeneralCheckLevelUp(pUnit)
					if pUnit:GetExperience() > Expneeded3 then
						pUnit:SetExperience(Expneeded3)
					end
				end
			end
		end
	end	
end
---------------------------------------------------------------------------------------------
--Ideology Generals Coding
---------------------------------------------------------------------------------------------
function SetIdeologyEffect(pUnit, sIdeologyType)
	if sIdeologyType == "FREEDOM" then
		pUnit:SetHasPromotion(GeneralTraits.Freedom, true)
	elseif sIdeologyType == "ORDER" then
		pUnit:SetHasPromotion(GeneralTraits.Order, true)
	elseif sIdeologyType == "AUTOCRACY" then
		pUnit:SetHasPromotion(GeneralTraits.Autocracy, true)
	end
end
function IdeologyAtPlot(pPlot, iPlayer)
	local sIdeologyType = "NONE"
	local pGeneral = nil
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iGeneral) and (pUnit:GetOwner() == iPlayer) then
				pGeneral = pUnit
			end
		end
	end
	if pGeneral then
		if pGeneral:IsHasPromotion(GeneralTraits.Freedom_GG) then
			sIdeologyType = "FREEDOM"
		elseif pGeneral:IsHasPromotion(GeneralTraits.Order_GG) then
			sIdeologyType = "ORDER"
		elseif pGeneral:IsHasPromotion(GeneralTraits.Autocracy_GG) then
			sIdeologyType = "AUTOCRACY"
		end
	end
	return sIdeologyType
end
function IdeologyAdjacentPlotCheck(pPlot, iPlayer)
	local sIdeologyType = "NONE"
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
		if pAdjacentPlot and pAdjacentPlot:IsUnit() then
			sIdeologyType = IdeologyAtPlot(pAdjacentPlot, iPlayer)
			if sIdeologyType ~= "NONE" then
				return sIdeologyType
			end
		end
	end
	return sIdeologyType
end

function Ideology2ndRingPlotCheck(pUnitPlot, iPlayer)
	local sIdeologyType = "NONE"
	for pEdgePlot in PlotRingIterator(pUnitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
	--      PrintDebug(pEdgePlot:GetX(), pEdgePlot:GetY())
		if pEdgePlot:IsUnit() then
			sIdeologyType = IdeologyAtPlot(pEdgePlot, iPlayer)
			if sIdeologyType ~= "NONE" then
				return sIdeologyType
			end
		end
	end
	return sIdeologyType
end
function UnitsNearIdeologicalGeneral(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() then
			if pUnit:GetDomainType() == iDomainLand then
				for k,v in pairs(GeneralTraits) do
					if pUnit:IsHasPromotion(v) then
						pUnit:SetHasPromotion(v, false)
					end
				end
				if pUnit:IsNearGreatGeneral() then
					pUnitPlot = pUnit:GetPlot()
					local sIdeologyType = IdeologyAtPlot(pUnitPlot, iPlayer)
					SetIdeologyEffect(pUnit, sIdeologyType)
					if sIdeologyType == "NONE" then
						sIdeologyType = IdeologyAdjacentPlotCheck(pUnitPlot, iPlayer)
						SetIdeologyEffect(pUnit, sIdeologyType)
					end
					if sIdeologyType == "NONE" then
						sIdeologyType = Ideology2ndRingPlotCheck(pUnitPlot, iPlayer)
						SetIdeologyEffect(pUnit, sIdeologyType)
					end
				end
			end
		end
	end	
end
function PraiseTheIdeology(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == iGeneral then
			if (pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) or pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY)) then
				pUnit:SetHasPromotion(iUnhappy, false)
				pUnit:SetHasPromotion(GeneralTraits.Freedom_GG, false)	
				pUnit:SetHasPromotion(GeneralTraits.Order_GG, false)
				pUnit:SetHasPromotion(GeneralTraits.Autocracy_GG, false)
				if pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_FREEDOM) then
					pUnit:SetHasPromotion(iUnhappy, false)
					pUnit:SetHasPromotion(GeneralTraits.Freedom_GG, true)
				elseif pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_ORDER) then
					pUnit:SetHasPromotion(iUnhappy, false)
					pUnit:SetHasPromotion(GeneralTraits.Order_GG, true)
				elseif pPlayer:IsPolicyBranchUnlocked(GameInfoTypes.POLICY_BRANCH_AUTOCRACY) then
					pUnit:SetHasPromotion(iUnhappy, false)
					pUnit:SetHasPromotion(GeneralTraits.Autocracy_GG, true)
				end
				if pPlayer:IsEmpireSuperUnhappy() then
					pUnit:SetHasPromotion(iUnhappy, true)
					pUnit:SetHasPromotion(GeneralTraits.Freedom_GG, false)	
					pUnit:SetHasPromotion(GeneralTraits.Order_GG, false)
					pUnit:SetHasPromotion(GeneralTraits.Autocracy_GG, false)
				end
			end
		end
	end	
end


function OnRangedKills(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local mUnitHealth = iDefenderMaxHP - iDefenderFinalDamage
	local iPlayer = Players[iAttackingPlayer]
	if iPlayer then
		local iUnit = iPlayer:GetUnitByID(iAttackingUnit)
		local iUnitOwner = iUnit:GetOwner()
		if mUnitHealth <= 0 and (iUnit:GetUnitCombatType() == iArcher or iUnit:GetUnitCombatType() == iSiege) then
			local iCombatUnitPromotion = "NONE"
			for k,v in pairs(tGeneralToUnitCorrespondances) do
				if iUnit:IsHasPromotion(v) then
					iCombatUnitPromotion = v
						break
					end
			end
			if iCombatUnitPromotion ~= "NONE" then
				pPlot = iUnit:GetPlot()
				SearchForMatchingGeneralAndAssignXP(iUnitOwner, pPlot, iCombatUnitPromotion, true)
			end
		end
	end
end
---------------------------------------------------------------------------------------------
--Subscribe to Required Game Event Hooks
---------------------------------------------------------------------------------------------

GameEvents.UnitPrekill.Add(NearGeneralKiller)
Events.SerialEventUnitCreated.Add(GeneralSpawned)
GameEvents.PlayerDoTurn.Add(UnitsNearGeneral)
GameEvents.PlayerDoTurn.Add(GeneralLevelUp)
if isUsingCP then
	GameEvents.PlayerDoTurn.Add(UnitsNearIdeologicalGeneral)
	GameEvents.PlayerDoTurn.Add(PraiseTheIdeology)
	GameEvents.CombatEnded.Add(OnRangedKills)
end





