-- BulgTrait
-- Author: Firebug
-- DateCreated: 2/13/2016 5:26:15 PM
--------------------------------------------------------------

	function BulgariaTrait(playerID)
print("Bulgaria function is running")
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_FB_BULGARIA"] and player:IsAlive() then
		for city in player:Cities() do
		if (city:GetWeLoveTheKingDayCounter() > 0) then
			if (not city:IsHasBuilding(GameInfoTypes["BUILDING_TRAIT_UNHAPPINESS"])) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TRAIT_UNHAPPINESS"], 1)
			end
		else 
			if (city:IsHasBuilding(GameInfoTypes["BUILDING_TRAIT_UNHAPPINESS"])) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TRAIT_UNHAPPINESS"], 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(BulgariaTrait)

print("my lua loaded to the end")