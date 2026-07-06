--HuntingGrounds.lua

function HuntingGroundsCapture(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLWABANAKI then
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(plotLoop)
			if pPlot:GetOwner() == player then
				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CLWABHUNTING then
					if not pPlot:IsImprovementPillaged() then
						for i = 0, 5 do
							local pAdj = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
							if pAdj:GetOwner() == -1 then
								if pAdj:IsCoastalLand() or pAdj:GetTerrainType() == TerrainTypes.TERRAIN_COAST then
									pAdj:SetOwner(player)
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HuntingGroundsCapture)