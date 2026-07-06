-- CityPopulation
-- Author: Charsi
-- DateCreated: 04/02/2016 10:51:26 AM
--------------------------------------------------------------

include("FLuaVector.lua")

function CityPopTextClearQueue(iPlayer)
	-- clear the array
	arrQueueTextAt = {}
end

function PopChangeQueueTextAt(iX, iY, sText)
	local iDelay = 0

	-- insert the coordinates into the array
	table.insert(arrQueueTextAt, iX, iY)

	-- count the number of messages popping up at these coordinates (minimum will always be 1)
	for x, y in pairs(arrQueueTextAt) do
		if (x == iX) and (y == iY) then
			iDelay = iDelay + 1
		end
	end

	-- delay the floating text event at these coordinates by x seconds where x is the current number of popup elements at these coordinates
	-- this means the first message at this location on this player's turn will delay 1s, the 2nd 2s, the 3rd 3s, and so forth
	Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sText, iDelay)

	print(string.format("PopChangeQueueTextAt: posting message %s with delay %d", sText, iDelay))
end

function OnCityPopulationChanged(iHexX, iHexY, iPopulation, iCitySize)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))
	local pCity = pPlot:GetPlotCity()
	local iOwner = pCity:GetOwner()

	-- print(string.format("onCityPopulationChanged: %s (owned by %s) has grown to size %d with unknown %d", pCity:GetName(), Players[iOwner]:GetName(), iPopulation, iCitySize))
end

function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

function OnSetPopulation(iHexX, iHexY, iOldPopulation, iNewPopulation)
	local pPlot = Map.GetPlot(iHexX, iHexY)
	local pPlayer = Players[Game.GetActivePlayer()]
	local bShow = false

	if (iOldPopulation ~= iNewPopulation) then
		-- sauce: https://www.reddit.com/r/civ/comments/34zsl6/population_calculation/
		local iOldPopNum = 1000 * (iOldPopulation^2.8)
		local iNewPopNum = 1000 * (iNewPopulation^2.8)
		local sCityFloatingText = ""

		print(string.format("OnSetPopulation: at %d,%d population change from %d to %d", iHexX, iHexY, iOldPopulation, iNewPopulation))

		if (iNewPopNum > iOldPopNum) then
			bShow = bShowGain
			sCityFloatingText = "[COLOR_POSITIVE_TEXT] +" .. comma_value(math.floor(iNewPopNum - iOldPopNum)) .. " [ICON_CITIZEN][ENDCOLOR]"
		else
			bShow = bShowLoss
			sCityFloatingText = "[COLOR_NEGATIVE_TEXT] -" .. comma_value(math.floor(iOldPopNum - iNewPopNum)) .. " [ICON_CITIZEN][ENDCOLOR]"
		end

		-- only float tiles the active player can see (or you reveal cities in the fog!)
		if pPlot:IsRevealed(pPlayer:GetTeam(), false) and bShow then
			PopChangeQueueTextAt(iHexX, iHexY, sCityFloatingText)
			-- Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iHexX, iHexY))), sCityFloatingText, 1)
		end
	end
end

-- Configuration ( MAKE YOUR CHANGES HERE )
bShowGain = false
bShowLoss = true 

-- I hate global variables too, ok?  Deal with it.
arrQueueTextAt = {}

-- Hooking functions...
print("Hooking functions...")

GameEvents.PlayerDoTurn.Add(CityPopTextClearQueue);
Events.SerialEventCityPopulationChanged.Add(OnCityPopulationChanged);
GameEvents.SetPopulation.Add(OnSetPopulation);