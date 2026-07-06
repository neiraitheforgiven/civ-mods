-- MC_Zabonah
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("PlotIterators")
include("FLuaVector.lua")

--=======================================================================================================================
-- Globals
--=======================================================================================================================
local iZabonah = GameInfoTypes.UNIT_MC_ZABONAH
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
--=======================================================================================================================
-- Core Functions: Zabonah
--=======================================================================================================================
-- Zabonah: City Discovery
-------------------------------------------------------------------------------------------------------------------------
function ZabonahDiscovery(iPlayer, iUnit, iX, iY)
	
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() ~= iZabonah then return end

	local iTeam = pUnit:GetTeam()
	
	-- Iterate to find cities
	local pPlot = Map.GetPlot(iX, iY)
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, pUnit:VisibilityRange() + 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local pCity = pAdjacentPlot:GetPlotCity()
		if pCity then
			if not(pCity:IsRevealed(iTeam)) then
				pAdjacentPlot:SetRevealed(iTeam, true);

				local iReward = 15
				--if pCity:IsCapital() then iReward = 75 end
				iReward = math.ceil(iReward * iMod)

				pPlayer:ChangeGold(iReward)
				pUnit:ChangeExperience(5)

				if pPlayer:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_GOLD] Gold[ENDCOLOR] from discovering {2_City} with a Zabonah", iReward, pCity:GetName()))
				end				

			end
		end
	end

	if pUnit == UI.GetHeadSelectedUnit() then
		ZabonahRouteHighlight(iPlayer, iUnit)
	end
end
GameEvents.UnitSetXY.Add(ZabonahDiscovery)
-------------------------------------------------------------------------------------------------------------------------
-- Zabonah: Gold from Trade Routes (Highlight)
-------------------------------------------------------------------------------------------------------------------------
function ZabonahRouteHighlight(iPlayer, iUnitID)

	Events.ClearHexHighlightStyle("GroupBorder")
	if iUnitID == -1 then return end	

	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnitID)

	if not(pUnit) then return end
	if pUnit:GetUnitType() ~= iZabonah then
		return
	end

	local pPlot = pUnit:GetPlot()
	for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		
		local tTradeRoutes = pPlayer:GetInternationalTradeRoutePlotToolTip(pAdjacentPlot);
		local bIsRoute = #tTradeRoutes > 0

		if bIsRoute then
			local iX = pAdjacentPlot:GetX()
			local iY = pAdjacentPlot:GetY()	
			local pHexPos = ToHexFromGrid{x=iX, y=iY}	
			Events.SerialEventHexHighlight(pHexPos, true, nil, "GroupBorder")		
		end
	end
end
Events.UnitSelectionChanged.Add(ZabonahRouteHighlight)
-------------------------------------------------------------------------------------------------------------------------
-- Zabonah: Gold from Trade Routes
-------------------------------------------------------------------------------------------------------------------------
function ZabonahRouteGold(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == iZabonah then

			--Gold if on Trade Route
			local pPlot = pUnit:GetPlot()
			local tTradeRoutes = pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot);
			local bIsRoute = #tTradeRoutes > 0

			if bIsRoute then
				pPlayer:ChangeGold(2)
				pUnit:ChangeExperience(2)

				-- Fancy Notification
				if iPlayer == Game.GetActivePlayer() then
					local iX = pPlot:GetX()
					local iY = pPlot:GetY()
					local pHexPos = ToHexFromGrid{x=iX, y=iY}
					local pWorldPos = HexToWorld(pHexPos)

					Events.AddPopupTextEvent(pWorldPos, "[COLOR_YIELD_GOLD]+2 [ICON_GOLD] Gold[ENDCOLOR]")
				end
			end

		end
	end
end
GameEvents.PlayerDoTurn.Add(ZabonahRouteGold)
--=======================================================================================================================
--=======================================================================================================================