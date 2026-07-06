include("EnginseerConfig.lua")
include("PlotIterators.lua")
include("GGTraits.lua")
local iFirstTimeThroughKillerData = "NONE"
local iDomainWater = GameInfoTypes.DOMAIN_SEA
local iNothing = GameInfoTypes.PROMOTION_NOTHING
local iUnhappy = GameInfoTypes.PROMOTION_NOTHING_2
local iAdmiral = GameInfoTypes.UNITCLASS_GREAT_ADMIRAL
local iNavalRanged = GameInfoTypes.UNITCOMBAT_NAVALRANGED
local iSubmarine = GameInfoTypes.UNITCOMBAT_SUBMARINE

function GreatAdmiralHasAlreadyRecievedBasicPromotion(pUnit)
	for k,v in pairs(tLevel1AdmiralshipPromotions) do
		if pUnit:IsHasPromotion(v) then
			return true
		end
	end
	return pUnit:IsHasPromotion(iNothing)
end
function AdmiralSpawned(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if (pPlayer == nil or pUnit == nil or pUnit:IsDead()) then
		return
	end
	if pUnit:GetUnitClassType() ~= iAdmiral then
		return 
	end 
	--PrintDebug("AdmiralSpawned function fired for a great admiral")
	if GreatAdmiralHasAlreadyRecievedBasicPromotion(pUnit) then
		--PrintDebug("The Admiralship selection was not applied because the Great Admiral already had one of the basic promotions from the list")
		return
	else
		--PrintDebug("The Great Admiral does not already have one of the basic GA promotions or any of the ideology promotions: The Admiralship selection will be applied")
		AdmiralshipChoices = { tLevel1AdmiralshipPromotions.Homeguard, tLevel1AdmiralshipPromotions.Impressment, tLevel1AdmiralshipPromotions.Blockader, tLevel1AdmiralshipPromotions.Piloting, tLevel1AdmiralshipPromotions.Gunnery, tLevel1AdmiralshipPromotions.Banzai, iNothing, iNothing, iNothing, iNothing, iNothing}
		if isUsingCP then
			AdmiralshipChoices = {tLevel1AdmiralshipPromotions.Homeguard, tLevel1AdmiralshipPromotions.Impressment, tLevel1AdmiralshipPromotions.Blockader, tLevel1AdmiralshipPromotions.Piloting, tLevel1AdmiralshipPromotions.Gunnery, tLevel1AdmiralshipPromotions.Reeducation, tLevel1AdmiralshipPromotions.Pious, tLevel1AdmiralshipPromotions.Scavenger, tLevel1AdmiralshipPromotions.Banzai, iNothing, iNothing} --A list of your promotions!
		end
		local iAdmiralshipSelection = AdmiralshipChoices[math.random(#AdmiralshipChoices)] --Game will setup a random number for you!
		local CityTraits = CityTraitsList[math.random(#CityTraitsList)]
		--PrintDebug("iAdmiralshipSelection = " .. iAdmiralshipSelection .. " (" .. GameInfo.UnitPromotions[iAdmiralshipSelection].Type .. ")")
		pUnit:SetHasPromotion(iAdmiralshipSelection, true)
		if CityYieldTraits then
			local CityTraits = CityTraitsList[math.random(#CityTraitsList)]
			if CityTraits ~= "NONE" then
				pUnit:SetHasPromotion(CityTraits, true)
			end
		end
	end
end

function AdmiralAtPlot(pPlot, iPlayer)
	local iAdmiralType = "NONE"
	local pAdmiral = nil
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iAdmiral) and (pUnit:GetOwner() == iPlayer) then
				pAdmiral = pUnit
			end
		end
	end
	if pAdmiral then
		if not pAdmiral:IsHasPromotion(iNothing) then
			for key1,value1 in pairs(tLevel1AdmiralshipPromotions) do
				if pAdmiral:IsHasPromotion(value1) then
					iAdmiralType = value1
					for key2,value2 in pairs(tLevel2AdmiralshipPromotions) do
						if pAdmiral:IsHasPromotion(value2) then
							iAdmiralType = value2
							for key3,value3 in pairs(tLevel3AdmiralshipPromotions) do
								if pAdmiral:IsHasPromotion(value3) then
									iAdmiralType = value3
								end
							end
						end
					end
				end
				if iAdmiralType ~= "NONE" then
					break
				end
			end
		end
	end
	return iAdmiralType
end

function SetAdmiralEffect(pUnit, iAdmiralType)
	if iAdmiralType ~= "NONE" then
		pUnit:SetHasPromotion(tAdmiralToUnitCorrespondances[iAdmiralType], true)
	end
end

function AdmiralCheckLevelUp(pUnit)
	if pUnit:GetExperience() >= Expneeded2 then
		local sAdmiralshipLine = "NONE"
		for k,v in pairs (tLevel1AdmiralshipPromotions) do
			if pUnit:IsHasPromotion(v) then
				sAdmiralshipLine = k
			end
		end
		if pUnit:IsHasPromotion(tLevel2AdmiralshipPromotions[sAdmiralshipLine]) and pUnit:GetExperience() >= Expneeded3 then
			if not pUnit:IsHasPromotion(tLevel3AdmiralshipPromotions[sAdmiralshipLine]) then
				pUnit:SetHasPromotion(tLevel3AdmiralshipPromotions[sAdmiralshipLine], true)
			end
		end
		if not pUnit:IsHasPromotion(tLevel2AdmiralshipPromotions[sAdmiralshipLine]) then
			pUnit:SetHasPromotion(tLevel2AdmiralshipPromotions[sAdmiralshipLine], true)
		end
	end
end
function AdmiralAdjacentPlotCheck(pPlot, iPlayer)
	local iAdmiralType = "NONE"
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
		if pAdjacentPlot and pAdjacentPlot:IsUnit() then
			iAdmiralType = AdmiralAtPlot(pAdjacentPlot, iPlayer)
			if iAdmiralType ~= "NONE" then
				return iAdmiralType
			end
		end
	end
	return iAdmiralType
end
function Admiral2ndRingPlotCheck(pUnitPlot, iPlayer)
	local iAdmiralType = "NONE"
	for pEdgePlot in PlotRingIterator(pUnitPlot, 2, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
	--      PrintDebug(pEdgePlot:GetX(), pEdgePlot:GetY())
		if pEdgePlot:IsUnit() then
			iAdmiralType = AdmiralAtPlot(pEdgePlot, iPlayer)
			if iAdmiralType ~= "NONE" then
				return iAdmiralType
			end
		end
	end
	return iAdmiralType
end

function UnitsNearAdmiral(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() then
			if pUnit:GetDomainType() == iDomainWater then
				for k,v in pairs(tCombatShipMasterPromotionList) do
					if pUnit:IsHasPromotion(v) then
						pUnit:SetHasPromotion(v, false)
					end
				end
				if pUnit:IsNearGreatGeneral() then
					pUnitPlot = pUnit:GetPlot()
					local iAdmiralType = AdmiralAtPlot(pUnitPlot, iPlayer)
					SetAdmiralEffect(pUnit, iAdmiralType)
					if iAdmiralType == "NONE" then
						iAdmiralType = AdmiralAdjacentPlotCheck(pUnitPlot, iPlayer)
						SetAdmiralEffect(pUnit, iAdmiralType)
					end
					if iAdmiralType == "NONE" then
						iAdmiralType = Admiral2ndRingPlotCheck(pUnitPlot, iPlayer)
						SetAdmiralEffect(pUnit, iAdmiralType)
					end
				end
			end
		end
	end	
end

function CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID)
	--PrintDebug("In function CheckPlotForMatchingGeneral: iVictoriousUnitOwner is " .. tostring(iVictoriousUnitOwner))
	--PrintDebug("In function CheckPlotForMatchingGeneral: pPlot is " .. tostring(pPlot))
	--PrintDebug("In function CheckPlotForMatchingGeneral: iCombatUnitPromoID is " .. tostring(iCombatUnitPromoID))
	local pAdmiralUnit = "NONE"
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iAdmiral) and (pUnit:GetOwner() == iVictoriousUnitOwner) and pUnit:IsHasPromotion(tUnitToAdmiralCorrespondances[iCombatUnitPromoID]) then
				return pUnit
			end
		end
	end
	return pAdmiralUnit
end

function SearchForMatchingAdmiralAndAssignXP(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID, bIncludePlot)
	--PrintDebug("The Combat Unit promotion " .. iCombatUnitPromoID .. ":" .. GameInfo.UnitPromotions[iCombatUnitPromoID].Type .. " is to be used for matching with a nearby great Admiral")
	if tUnitToAdmiralCorrespondances[iCombatUnitPromoID] then
		--PrintDebug("The Combat Unit Promotion is listed as a key in table tUnitToAdmiralCorrespondances and the matching Great Admiral Promotion is " .. tUnitToAdmiralCorrespondances[iCombatUnitPromoID] ..  ":" .. GameInfo.UnitPromotions[tUnitToAdmiralCorrespondances[iCombatUnitPromoID]].Type)
	end
	--PrintDebug("In function SearchForMatchingAdmiralAndAssignXP: iVictoriousUnitOwner is " .. tostring(iVictoriousUnitOwner))
	--PrintDebug("In function SearchForMatchingAdmiralAndAssignXP: pPlot is " .. tostring(pPlot))
	--PrintDebug("In function SearchForMatchingAdmiralAndAssignXP: iCombatUnitPromoID is " .. tostring(iCombatUnitPromoID))
	local pAdmiralUnit = "NONE"
	local bAdmiralMatch = false
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check 'center' plot when bIncludePlot is set to true
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	if bIncludePlot then
		pAdmiralUnit = CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pPlot, iCombatUnitPromoID)
		if pAdmiralUnit ~= "NONE" then
			bAdmiralMatch = true
		end
	end
	if bAdmiralMatch then
		if RandomExperience then
			pAdmiralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		else
			pAdmiralUnit:ChangeExperience(XPEarnedOnTile)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check adjacent plots
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("Adjacent Plots are being checked")
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		if not bAdmiralMatch then
			local pAdjacentPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction)
			if pAdjacentPlot and pAdjacentPlot:IsUnit() then
				pAdmiralUnit = CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pAdjacentPlot, iCombatUnitPromoID)
				if pAdmiralUnit ~= "NONE" then
					bAdmiralMatch = true
				end
			end
		end
	end
	if bAdmiralMatch then
		if RandomExperience and bIncludePlot then
			pAdmiralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pAdmiralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pAdmiralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pAdmiralUnit:ChangeExperience(XPEarnedAdjacentTile)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 2nd ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("2nd ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bAdmiralMatch then
			if pEdgePlot:IsUnit() then
				pAdmiralUnit = CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pAdmiralUnit ~= "NONE" then
					bAdmiralMatch = true
				end
			end
		end
	end
	if bAdmiralMatch then
		if RandomExperience and bIncludePlot then
			pAdmiralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pAdmiralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pAdmiralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pAdmiralUnit:ChangeExperience(XPEarned2ndTileAway)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 3rd ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("3rd ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bAdmiralMatch then
			if pEdgePlot:IsUnit() then
				pAdmiralUnit = CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pAdmiralUnit ~= "NONE" then
					bAdmiralMatch = true
				end
			end
		end
	end
	if bAdmiralMatch then
		if RandomExperience and bIncludePlot then
			pAdmiralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pAdmiralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pAdmiralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pAdmiralUnit:ChangeExperience(XPEarned3rdTileAway)
			return
		end
	end
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--check plots in the 4th ring
	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	--PrintDebug("4th ring Plots are being checked")
	for pEdgePlot in PlotRingIterator(pPlot, 4, SECTOR_NORTH, DIRECTION_ANTICLOCKWISE) do
		if not bAdmiralMatch then
			if pEdgePlot:IsUnit() then
				pAdmiralUnit = CheckPlotForMatchingAdmiral(iVictoriousUnitOwner, pEdgePlot, iCombatUnitPromoID)
				if pAdmiralUnit ~= "NONE" then
					bAdmiralMatch = true
				end
			end
		end
	end
	if bAdmiralMatch then
		if RandomExperience and bIncludePlot then
			pAdmiralUnit:ChangeExperience(XPEarnedRangedExperience[math.random(#XPEarnedRangedExperience)])
			return
		elseif RandomExperience then
			pAdmiralUnit:ChangeExperience(XPEarnedMeleeExperience[math.random(#XPEarnedMeleeExperience)])
			return
		elseif bIncludePlot then 
			pAdmiralUnit:ChangeExperience(XPEarnedOnTile) 
			return
		else
			pAdmiralUnit:ChangeExperience(XPEarned4thTileAway)
			return
		end
	end
end

function NearAdmiralKiller(iOwner, iUnit, iUnitType, iX, iY, bDelay, iKiller)
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
	if pUnitKilled:GetDomainType() ~= iDomainWater then return end
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
					for k,v in pairs(tAdmiralToUnitCorrespondances) do
						if pUnit:IsHasPromotion(v) then
							iCombatUnitPromotion = v
							break
						end
					end
					if iCombatUnitPromotion ~= "NONE" then
						--PrintDebug("The Combat Unit has promotion " .. iCombatUnitPromotion .. ":" .. GameInfo.UnitPromotions[iCombatUnitPromotion].Type .. " for matching with a nearby great Admiral")
						--PrintDebug("In function NearAdmiralKiller: iUnitOwner is " .. tostring(iUnitOwner))
						--PrintDebug("In function NearAdmiralKiller: pPlot is " .. tostring(pPlot))
						--PrintDebug("In function NearAdmiralKiller: iCombatUnitPromotion is " .. tostring(iCombatUnitPromotion))
						SearchForMatchingAdmiralAndAssignXP(iUnitOwner, pPlot, iCombatUnitPromotion, false)
					else
						--PrintDebug("No valid combat unit promotion was found from within table tAdmiralToUnitCorrespondances")
					end
				end
			end
		end
	end
end

function AdmiralLevelUp(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == iAdmiral then
			for k,v in pairs(tLevel1AdmiralshipPromotions) do
				if pUnit:IsHasPromotion(v) then
					AdmiralCheckLevelUp(pUnit)
					if pUnit:GetExperience() > Expneeded3 then
						pUnit:SetExperience(Expneeded3)
					end
				end
			end
		end
	end	
end

---------------------------------------------------------------------------------------------
--Ideology Admirals Coding
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
	local pAdmiral = nil
	for i = 0, pPlot:GetNumUnits() do
		local pUnit = pPlot:GetUnit(i)
		if pUnit then
			if (pUnit:GetUnitClassType() == iAdmiral) and (pUnit:GetOwner() == iPlayer) then
				pAdmiral = pUnit
			end
		end
	end
	if pAdmiral then
		if pAdmiral:IsHasPromotion(GeneralTraits.Freedom_GG) then
			sIdeologyType = "FREEDOM"
		elseif pAdmiral:IsHasPromotion(GeneralTraits.Order_GG) then
			sIdeologyType = "ORDER"
		elseif pAdmiral:IsHasPromotion(GeneralTraits.Autocracy_GG) then
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
function UnitsNearIdeologicalAdmiral(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:IsCombatUnit() then
			if pUnit:GetDomainType() == iDomainWater then
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
function ApplaudTheIdeology(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == iAdmiral then
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

function OnRangedShipKills(iAttackingPlayer, iAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, iDefendingPlayer, iDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, iInterceptingPlayer, iInterceptingUnit, iInterceptorDamage, iPlotX, iPlotY)
	local mUnitHealth = iDefenderMaxHP - iDefenderFinalDamage
	local iPlayer = Players[iAttackingPlayer]
	if iPlayer then
		local iUnit = iPlayer:GetUnitByID(iAttackingUnit)
		local iUnitOwner = iUnit:GetOwner()
		if mUnitHealth <= 0 and (iUnit:GetUnitCombatType() == iNavalRanged or iUnit:GetUnitCombatType() == iSubmarine) then
			local iCombatUnitPromotion = "NONE"
			for k,v in pairs(tAdmiralToUnitCorrespondances) do
				if iUnit:IsHasPromotion(v) then
					iCombatUnitPromotion = v
						break
					end
			end
			if iCombatUnitPromotion ~= "NONE" then
				pPlot = iUnit:GetPlot()
				SearchForMatchingAdmiralAndAssignXP(iUnitOwner, pPlot, iCombatUnitPromotion, true)
			end
		end
	end
end

GameEvents.UnitPrekill.Add(NearAdmiralKiller)
Events.SerialEventUnitCreated.Add(AdmiralSpawned)
GameEvents.PlayerDoTurn.Add(UnitsNearAdmiral)
GameEvents.PlayerDoTurn.Add(AdmiralLevelUp)
if isUsingCP then
	GameEvents.PlayerDoTurn.Add(UnitsNearIdeologicalAdmiral)
	GameEvents.PlayerDoTurn.Add(ApplaudTheIdeology)
	GameEvents.CombatEnded.Add(OnRangedShipKills)
end