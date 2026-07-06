-- OpalchentsiLua
-- Author: Firebug
-- DateCreated: 2/16/2016 4:37:43 AM
--------------------------------------------------------------
function OpalchentsiGreatAwakening(iPlayer)
	local pPlayer = Players[iPlayer]
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_FB_BULGARIA) then return end
	local pHappiness = math.ceil(1/3*pPlayer:GetExcessHappiness())
	if (pHappiness < 0 or pHappiness == nil) then pHappiness = 0 end
	local pRifleman = GameInfoTypes.UNIT_OPALCHENTSI
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() ==  pRifleman then
			pUnit:SetBaseCombatStrength(34+pHappiness)
		end
	end	
end
if Game.IsCivEverActive(GameInfoTypes.CIVILIZATION_FB_BULGARIA) then
	GameEvents.PlayerDoTurn.Add(OpalchentsiGreatAwakening)
end