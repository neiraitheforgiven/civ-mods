--============================================================
-- GLOBALS
--============================================================
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")

local iComanche = GameInfoTypes["CIVILIZATION_JWW_COMANCHE"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iComanche)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end
--===========================================================================
-- UA (Comanche Moon)
--===========================================================================
local iHorseProm = GameInfoTypes["PROMOTION_JWW_COMANCHE_HORSE"]
-----------------------------------------------------------------------------
-- Razing cities grant gold per turn, and faith to nearby cities if at peace with the original owner.
-----------------------------------------------------------------------------
function JWW_RazingIsGoodForTheSoil(iPlayer)
	local iGold = 0
	local iFaith = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iComanche then
		for pCity in pPlayer:Cities() do
			if pCity:IsRazing() then
				local iGoldFaithAdded = JFD_GetRandom(15, 25)
				iGold = iGold + iGoldFaithAdded
				if pPlayer:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), "+" .. iGold .. " [ICON_GOLD]", 0)
				end
				local pOwner = Players[pCity:GetOriginalOwner()]
				if pOwner ~= pPlayer then
					local pTeam = Teams[pPlayer:GetTeam()]
					local iOwnerTeam = pOwner:GetTeam()
					if not pTeam:IsAtWar(iOwnerTeam) then
						iFaith = iFaith + iGoldFaithAdded
						if pPlayer:IsHuman() then
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY()))), "[NEWLINE]+" .. iFaith .. " [ICON_PEACE]", 0)
						end
					end
				end
			end
		end
		pPlayer:ChangeGold(iGold)
		pPlayer:ChangeFaith(iFaith)
	end
end
-----------------------------------------------------------------------------
-- Horse units can pillage while at peace in foreign territory at the cost of faith.
-----------------------------------------------------------------------------
tHorseUnits = {}
for row in DB.Query("SELECT ID FROM Units WHERE (CombatClass = 'UNITCOMBAT_MOUNTED') OR (Type = 'UNIT_CHARIOT_ARCHER')") do
	tHorseUnits[row.ID] = true
end

function JWW_HorsesDontNeedRules(iPlayer, iCity, iUnit) --give horse units promotion on creation
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iComanche then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if tHorseUnits[pUnit:GetUnitType()] then
			pUnit:SetHasPromotion(iHorseProm, true)
		end
	end
end

--Thanks TopHat
local iPillageMission = GameInfoTypes["MISSION_PILLAGE"]
local pActivePlayer = Players[Game.GetActivePlayer()]

function IsButtonPossible(pUnit) --Pillage Magic itself
	if pUnit:IsHasPromotion(iHorseProm) then
		local pPlot = pUnit:GetPlot()
		local pPlotOwner = -1
		local pUnitOwner = Players[pUnit:GetOwner()]
		if pPlot:IsOwned() then
			pPlotOwner = Players[pPlot:GetOwner()]
		end
		if pUnitOwner ~= pPlotOwner then
			if pPlot:GetImprovementType() > -1 and not pPlot:IsImprovementPillaged() then
				if pPlot:IsOwned() then
					local pUnitTeam = Teams[pUnitOwner:GetTeam()]
					local iOtherTeam = pPlotOwner:GetTeam()
					if not pUnitTeam:IsAtWar(iOtherTeam) then
						return true
					end
				else
					return true
				end
			end
		end
	end
	return false
end

function DoButtonEffect(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	pPlot:SetImprovementPillaged(true)
	pUnit:ChangeMoves(-120)
	if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
	pUnit:ChangeDamage(-25)
	pPlayer:ChangeGold(20)
	pPlayer:ChangeFaith(-30) --Comanche thing
	if pPlayer:IsHuman() then
		local iX = pUnit:GetX()
		local iY = pUnit:GetY()
		local sMessage = "[COLOR_YIELD_GOLD]+20 [ICON_GOLD][ENDCOLOR][NEWLINE]-30 [ICON_PEACE]"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
	end
end

function Pillager_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	DoButtonEffect(pActivePlayer, pUnit)
end

function Pillager_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if IsButtonPossible(pUnit) then
		Controls.PillageButton:SetHide(false)
	else
		Controls.PillageButton:SetHide(true)
	end
	
	local buildCityButtonActive = pUnit:IsFound();
				
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
	primaryStack:CalculateSize();
	primaryStack:ReprocessAnchoring();

	local stackSize = primaryStack:GetSize();
	local stretchySize = primaryStretchy:GetSize();
	local buildCityButtonSize = 0
	if buildCityButtonActive then
		if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
			buildCityButtonSize = 36;
		else
			buildCityButtonSize = 60;
		end
	end
	primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
end

local function Pillager_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.PillageButton:SetSizeVal(50,50)
		Controls.PillageIcon:SetSizeVal(64,64)
		Controls.PillageIcon:SetTexture("JWWComanchePillageAtlas45.dds")
	else
		Controls.PillageButton:SetSizeVal(36,36)
		Controls.PillageIcon:SetSizeVal(45,45)
		Controls.PillageIcon:SetTexture("JWWComanchePillageAtlas45.dds")
	end
	Controls.PillageIcon:LocalizeAndSetToolTip("TXT_KEY_JWW_COMANCHE_PILLAGE_HELP")
	Controls.PillageButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function CheckIfCanPillage(playerID, unitID, missionID)
	-- thanks to chrisy for reminding me that CanStartMission exists
	if missionID == iPillageMission then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == iZimba then
			return false
		end
	end
	return true
end

function AI_Pillage(playerID)
	local pPlayer = Players[playerID]
	if (not pPlayer:IsHuman()) and pPlayer:GetCivilizationType() == iComanche then
		for pUnit in pPlayer:Units() do
			if IsButtonPossible(pUnit) then
				if JFD_GetRandom(1,2) == 1 then
					pPlot:SetImprovementPillaged(true)
					pUnit:ChangeMoves(-120)
					if pUnit:MovesLeft() < 0 then pUnit:SetMoves(0) end
					pUnit:ChangeDamage(-25)
					pPlayer:ChangeGold(20)
					pPlayer:ChangeFaith(-30)
					pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() + 1)
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Pillager_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Pillager_SerialEventUnitInfoDirty);
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_RazingIsGoodForTheSoil)
	GameEvents.CityTrained.Add(JWW_HorsesDontNeedRules)

	Controls.PillageButton:RegisterCallback(Mouse.eLClick, Pillager_UnitActionButton);
	IconHookup(0, 45, "JWW_COMANCHE_PILLAGE_ATLAS", Controls.PillageIcon)
	GameEvents.CanStartMission.Add(CheckIfCanPillage)
	GameEvents.PlayerDoTurn.Add(AI_Pillage)
	Initialize();
end
--===========================================================================
-- UU (Quickstinger)
--===========================================================================
local iQuickstinger = GameInfoTypes["UNIT_JWW_QUICKSTINGER"]
local iBaseCombat = GameInfo.Units["UNIT_JWW_QUICKSTINGER"].Combat
local iCalvaryClass = GameInfoTypes["UNITCLASS_CAVALRY"]
-----------------------------------------------------------------------------
-- Declaring war grants this unit +50% Combat strength permanently.
-----------------------------------------------------------------------------
function JWW_GiveCombatStrength(iTeam, iOtherTeam)
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() then
			if (pPlayer:GetTeam() == iTeam) or (pPlayer:GetTeam() == iOtherTeam) then
				if pPlayer:HasUnitOfClassType(iCalvaryClass) then
					for pUnit in pPlayer:Units() do
						if pUnit:GetUnitType() == iQuickstinger then
							pUnit:SetBaseCombatStrength(math.floor(pUnit:GetBaseCombatStrength() * 1.5))
						end
					end
					break
				end
			end
		end
	end
end		
-----------------------------------------------------------------------------
-- Each turn while at war, lose 1 Combat strength until at original combat strength.
-----------------------------------------------------------------------------
function JWW_LoseCombatStrength(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		local pTeam = Teams[pPlayer:GetTeam()]
		if pTeam:GetAtWarCount(false) > 0 then
			if pPlayer:HasUnitOfClassType(iCalvaryClass) then
				for pUnit in pPlayer:Units() do
					if pUnit:GetUnitType() == iQuickstinger then
						if pUnit:GetBaseCombatStrength() > iBaseCombat then
							local iNumWar = pTeam:GetAtWarCount(false)
							pUnit:SetBaseCombatStrength(pUnit:GetBaseCombatStrength() - iNumWar)
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.DeclareWar.Add(JWW_GiveCombatStrength)
	GameEvents.PlayerDoTurn.Add(JWW_LoseCombatStrength)
end
--===========================================================================
-- UB (Half-Moon Church)
--===========================================================================
local iHalfMoon = GameInfoTypes["BUILDING_JWW_HALF_MOON_CHURCH"]
local iUBDummy = GameInfoTypes["BUILDING_JWW_COMANCHE_CHURCH_DUMMY"]
local iComancheMissionary = GameInfoTypes["UNIT_JWW_COMANCHE_MISSIONARY"]
-----------------------------------------------------------------------------
-- During peace, trains units in this city faster depending on the faith output of the city.
-----------------------------------------------------------------------------
function JWW_FaithStronk(iPlayer)
	local pPlayer = Players[iPlayer]
	local iNumRazing = 0
	if pPlayer:IsAlive() then
		local pTeam = Teams[pPlayer:GetTeam()]

		--UA bonus to UB
		for pCity in pPlayer:Cities() do
			if pCity:IsRazing() then
				iNumRazing = iNumRazing + 1
			end
		end

		for pCity in pPlayer:Cities() do
			if pTeam:GetAtWarCount(false) == 0 then
				if pCity:IsHasBuilding(iHalfMoon) then
					local iFaith = (math.ceil(pCity:GetFaithPerTurn() * 1.5) + (iNumRazing * 4))
					pCity:SetNumRealBuilding(iUBDummy, iFaith) -- 1.5% Unit Production per Faith, 4% per Razing City at peace (UA)
					print(iFaith, iNumRazing)
				end
			else
				pCity:SetNumRealBuilding(iUBDummy, 0)
			end
		end
	end
end
-----------------------------------------------------------------------------
-- When making peace, spawn a missionary with one religion spread.
-----------------------------------------------------------------------------
function JWW_FreeMissionaryByPeace(iTeam, iOtherTeam) --Make Peace Normally
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() then
			if (pPlayer:GetTeam() == iTeam) or (pPlayer:GetTeam() == iOtherTeam) then
				for pCity in pPlayer:Cities() do
					if pCity:IsHasBuilding(iHalfMoon) then
						if (not pCity:IsOccupied()) and (not pCity:IsResistance()) then
							local pReligion = pPlayer:GetReligionCreatedByPlayer()
							if pReligion then --checks if player created a religion
								local pHolyCity = Game.GetHolyCityForReligion(pReligion, iPlayer)
								if (pCity:GetReligiousMajority() == pReligion) then
									if pCity:IsHolyCityAnyReligion() and (pCity ~= pHolyCity) then --for when the city is a holy city of another religion or smth, otherwise it will spawn a missionary of the wrong religion
										local pUnit = pPlayer:InitUnit(iComancheMissionary, pHolyCity:GetX(), pHolyCity:GetY())
										pUnit:SetXY(pCity:GetX(), pCity:GetY())
									else
										local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
										pUnit:JumpToNearestValidPlot()
									end
								end
							elseif pReligion == nil then
								local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
								pUnit:JumpToNearestValidPlot()
							end
						end
					end
				end
			end
		end
	end
end
function JWW_FreeMissionaryByConquest(iPlayer, bCapital, iX, iY, iNewPlayer) --Peace is made by taking last city
	if bWar then --bWar to ensure a civ is at War with Comanche
		local pOtherPlayer = Players[iPlayer]
		if (pOtherPlayer:GetNumCities() == 0) and (pOtherPlayer:GetNumUnits() == 0) then
			local pPlayer = GetPlayerByCivilization(iComanche) --just in case someone not Comanche kills last city
			local iTeam = pPlayer:GetTeam()
			if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iComanche) then
				if not (Teams[iTeam]:GetAtWarCount(false) > 0) then --only triggers when there are no wars
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(iHalfMoon) then
							if (not pCity:IsOccupied()) and (not pCity:IsResistance()) then
								local pReligion = pPlayer:GetReligionCreatedByPlayer()
								if pReligion then --checks if player created a religion
									local pHolyCity = Game.GetHolyCityForReligion(pReligion, iPlayer)
									if (pCity:GetReligiousMajority() == pReligion) then
										if pCity:IsHolyCityAnyReligion() and (pCity ~= pHolyCity) then --for when the city is a holy city of another religion or smth, otherwise it will spawn a missionary of the wrong religion
											local pUnit = pPlayer:InitUnit(iComancheMissionary, pHolyCity:GetX(), pHolyCity:GetY())
											pUnit:SetXY(pCity:GetX(), pCity:GetY())
										else
											local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
											pUnit:JumpToNearestValidPlot()
										end
									end
								elseif pReligion == nil then
									local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
									pUnit:JumpToNearestValidPlot()
								end
							end
						end
					end
				end
			end
		end
	end
end
function JWW_FreeMissionaryByKillingLastUnit(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer) --Peace is made by killing last unit
	if bDelay and bWar then --bWar to ensure a civ is at War with Comanche
		local pOtherPlayer = Players[iPlayer]
		if (pOtherPlayer:GetNumCities() == 0) and (pOtherPlayer:GetNumUnits() <= 1) then
			local pPlayer = GetPlayerByCivilization(iComanche) --just in case someone not Comanche kills last unit
			if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iComanche) then
				if not (Teams[iTeam]:GetAtWarCount(false) > 0) then --only triggers when there are no wars
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(iHalfMoon) then
							if (not pCity:IsOccupied()) and (not pCity:IsResistance()) then
								local pReligion = pPlayer:GetReligionCreatedByPlayer()
								if pReligion then --checks if player created a religion
									local pHolyCity = Game.GetHolyCityForReligion(pReligion, iPlayer)
									if (pCity:GetReligiousMajority() == pReligion) then
										if pCity:IsHolyCityAnyReligion() and (pCity ~= pHolyCity) then --for when the city is a holy city of another religion or smth, otherwise it will spawn a missionary of the wrong religion
											local pUnit = pPlayer:InitUnit(iComancheMissionary, pHolyCity:GetX(), pHolyCity:GetY())
											pUnit:SetXY(pCity:GetX(), pCity:GetY())
										else
											local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
											pUnit:JumpToNearestValidPlot()
										end
									end
								elseif pReligion == nil then
									local pUnit = pPlayer:InitUnit(iComancheMissionary, pCity:GetX(), pCity:GetY())
									pUnit:JumpToNearestValidPlot()
								end
							end
						end
					end
				end
			end
		end
	end
end

function JWW_WarTracker(iPlayer) --check if Comanche is at War every turn
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iComanche) then
		if Teams[pPlayer:GetTeam()]:GetAtWarCount(false) > 0 then
			bWar = true
		else
			bWar = false
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_FaithStronk)
	GameEvents.MakePeace.Add(JWW_FreeMissionaryByPeace)
	GameEvents.CityCaptureComplete.Add(JWW_FreeMissionaryByConquest)
	GameEvents.UnitPrekill.Add(JWW_FreeMissionaryByKillingLastUnit)
	GameEvents.PlayerDoTurn.Add(JWW_WarTracker)
end
--===========================================================================