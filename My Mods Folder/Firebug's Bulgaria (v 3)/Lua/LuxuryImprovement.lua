-- LuxuryImprovement
-- Author: Calcul8or and DJSHenninger
-- DateCreated: 2/17/2016 1:03:12 PM
--------------------------------------------------------------
function RoseLuxury(PlayerID)
local pPlayer = Players[PlayerID]
if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_FB_BULGARIA"]) then
local Impr = GameInfoTypes["IMPROVEMENT_BULG_ROSE"];
local ImprCount = pPlayer:GetImprovementCount(Impr) / 4
local XPBldg = GameInfoTypes["BUILDING_DUMMY_ROSE"];
pPlayer:GetCapitalCity():SetNumRealBuilding(XPBldg, ImprCount)
end
end
GameEvents.PlayerDoTurn.Add(RoseLuxury)

function RoseLuxuryWLTKD(PlayerID)
local pPlayer = Players[PlayerID]
if (pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_FB_BULGARIA"]) then
local Impr = GameInfoTypes["IMPROVEMENT_BULG_ROSE_WLTKD"];
local ImprCount = pPlayer:GetImprovementCount(Impr) / 4
local XPBldg = GameInfoTypes["BUILDING_DUMMY_ROSE"];
pPlayer:GetCapitalCity():SetNumRealBuilding(XPBldg, ImprCount)
end
end
GameEvents.PlayerDoTurn.Add(RoseLuxuryWLTKD)

