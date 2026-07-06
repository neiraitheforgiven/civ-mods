--=======================================================================================================================
--=======================================================================================================================
-- Include other lua stuff:
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Leugi_Barbarian_Unhappiness_Scripts";
include("Leugi_Barbarian_Settings")

--=======================================================================================================================
--=======================================================================================================================


function Leugi_BarbarianUnhappiness(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		n = 0
		for _, bPlayer in pairs(Players) do
			if bPlayer:IsBarbarian() then
				for bUnit in bPlayer:Units() do
					local uPlot = bUnit:GetPlot();
					local iOwner = uPlot:GetOwner();
					if iOwner == pPlayer then
						n = n + 1
					end
				end
			end
		end
		iBarbarianUnhappiness = load( pPlayer, "BarbarianUnhappiness")
		save(  pPlayer,  "BarbarianUnhappiness", n)
		if iOldFood == nil then
			pPlayer:ChangeUnhappinessFromUnits(n)
		else
			pPlayer:ChangeUnhappinessFromUnits(n - iBarbarianUnhappiness)
        end
	end
end

if settings_BarbarianUnhappiness == 1 then
	GameEvents.PlayerDoTurn.Add(Leugi_BarbarianUnhappiness)
	print ("Barbarian Unhappiness Active")
end