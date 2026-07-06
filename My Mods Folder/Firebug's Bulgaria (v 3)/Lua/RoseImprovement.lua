-- RoseImprovement
-- Author: Richard
-- DateCreated: 2/14/2016 2:44:36 PM
--------------------------------------------------------------


function ToggleWLTKDRoseBonus (iPlayer)
	local pPlayer = Players[iPlayer];
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == GameInfoTypes.IMPROVEMENT_BULG_ROSE then
							if (pCity:GetWeLoveTheKingDayCounter() > 0) then
								if not plot:IsImprovementPillaged() then
									plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_BULG_ROSE_WLTKD)
								end
							end
						end
						if ImpID == GameInfoTypes.IMPROVEMENT_BULG_ROSE_WLTKD then
							if (pCity:GetWeLoveTheKingDayCounter() < 1) then
								if not plot:IsImprovementPillaged() then
									plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_BULG_ROSE)
								end
							end
						end
					end
				end
			end
		end
end

GameEvents.PlayerDoTurn.Add(ToggleWLTKDRoseBonus);
Events.EndCombatSim.Add(ToggleWLTKDRoseBonus);

function GetImprovementReplace (ImpID)
	return GameInfo.Improvements[ImpID].WLTKD_Improvement
end

function GetImprovementOriginal (ImpID)
	return GameInfo.Improvements[ImpID].Original_Improvement
end

