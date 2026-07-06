--Cuban Decisions
--By Neirai

print("Loading the Cuban Decisions")
-----------------------------------
-- Cuban: Formalize the Tobacco Trades
--  COSTS:
--  500 Gold
--  2 Magistrates
--  REQS:
--  At least 3 cities and a total of 15 farms
--  GIVES:
--  + 2 Gold for each Specialist
--  + 1 Gold for each Farm
--  If the Tobacco resource exists, +1 Tobacco. Else, +4 Happiness.

local Decisions_CL_UC_TobaccoFarms = {}
print("Loading the Cuban Tobacco Farms")
Decisions_CL_UC_TobaccoFarms.Name = 'TXT_KEY_DECISIONS_CL_UC_TOBACCOFARMS_NAME'
Decisions_CL_UC_TobaccoFarms.Desc = 'The climate of our nation is perfect for growing tobacco, and the world demands its medicinal properties. We must encourage every landowner to place a tobacco mound in the center of their farm and to work it themselves, since the plant is to delicate for slaves. A little toil for the freemen will not hurt, and they will prosper.[NEWLINE]Requires:[NEWLINE][ICON_BULLET]Player must be Cuba[NEWLINE][ICON_BULLET]At least 3 cities and a total of at least 15 Farms [NEWLINE] Costs: [NEWLINE][ICON_BULLET] 500 [ICON_GOLD] Gold [NEWLINE][ICON_BULLET] 2 Magistrates [NEWLINE] Rewards: [NEWLINE][ICON_BULLET] 2 [ICON_GOLD] Gold for each Specialist [NEWLINE][ICON_BULLET] 1 [ICON_GOLD] Gold for each Farm[NEWLINE][ICON_BULLET]Gain a source of Tobacco (More Luxuries mod required) or 4 [ICON_HAPPINESS_1] Happiness.'
HookDecisionCivilizationIcon(Decisions_CL_UC_TobaccoFarms, 'CIVILIZATION_CL_UC_CUBA')
Decisions_CL_UC_TobaccoFarms.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
			return false, false
		end
		if load(pPlayer, 'Decisions_CL_UC_TobaccoFarms') == true then
			Decisions_CL_UC_TobaccoFarms.Desc = 'The climate of our nation is perfect for growing tobacco, and the world demands its medicinal properties. We must encourage every landowner to place a tobacco mound in the center of their farm and to work it themselves, since the plant is to delicate for slaves. A little toil for the freemen will not hurt, and they will prosper.[NEWLINE] Rewards: [NEWLINE][ICON_BULLET] 2 [ICON_GOLD] Gold for each Specialist [NEWLINE][ICON_BULLET] 1 [ICON_GOLD] Gold for each Farm[NEWLINE][ICON_BULLET]Gain a source of Tobacco (More Luxuries mod required) or 4 [ICON_HAPPINESS_1] Happiness.'
			return false, false, true
		end
		local pCap = pPlayer:GetCapitalCity()
		if pCap == nil then
			return true, false
		end
		if pPlayer:GetGold() < 500 then
			return true, false
		end
		if pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 2 then
			return true, false
		end
		if pPlayer:GetNumCities() < 3 then
			return true, false
		end
		if pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_FARM) < 15 then
			return true, false
		end
		return true, true
	end
)
Decisions_CL_UC_TobaccoFarms.DoFunc = (
	function(pPlayer)
		local pCap = pPlayer:GetCapitalCity()
		pPlayer:ChangeGold(-500)
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_CL_UC_TOBACCO, true)
		pPlayer:SetNumFreePolicies(0)
		if GameInfoTypes.RESOURCE_TOBACCO ~= nil then
			pCap:SetNumRealBuilding(GameInfoTypes.BUILDING_TOBACCOFARMS, 1)
		else
			pCap:SetNumRealBuilding(GameInfoTypes.BUILDING_HAPPYFARMS, 1)
		end
		save(pPlayer, 'Decisions_CL_UC_TobaccoFarms', true)
	end
)
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CL_UC_CUBA, "Decisions_CL_UC_TobaccoFarms", Decisions_CL_UC_TobaccoFarms)

-----------------------------------
-- Cuban: Send out the Army to promote literacy
--  COSTS:
--  1000 Gold
--  2 Magistrates
--  REQS:
--  At least 5 Gorrilaz
--  GIVES:
--  A National College in every city! (WHAAAAAAT?)
--  Increases unhappiness if a city produces more science than 2x its productivity.

local Decisions_CL_UC_LiteraryCampaign = {}
print("Loading the Cuban Literary Campaign")
Decisions_CL_UC_LiteraryCampaign.Name = 'TXT_KEY_DECISIONS_CL_UC_LITERARYCAMPAIGN_NAME'
Decisions_CL_UC_LiteraryCampaign.Desc = 'Illiteracy is a scourge of our people, a snare that leaves the guarijros trapped under oppression! We must declare this year to be the year of education and send out military literacy brigades to build schools, train teachers, and teach our people to read and write.[NEWLINE]Requirements:[NEWLINE][ICON_BULLET]Player must be Cuba[NEWLINE][ICON_BULLET]At least 5 Guerrilleros[NEWLINE]Costs:[NEWLINE][ICON_BULLET]1000 [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]2 Magistrates[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]A National College in every City![NEWLINE][ICON_BULLET]Increased [ICON_HAPPINESS_4] Unhappiness if a City produces more [ICON_RESEARCH] Science than twice its level of [ICON_PRODUCTION] Production.'
HookDecisionCivilizationIcon(Decisions_CL_UC_LiteraryCampaign, 'CIVILIZATION_CL_UC_CUBA')
Decisions_CL_UC_LiteraryCampaign.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
			return false, false
		end
		if load(pPlayer, 'Decisions_CL_UC_LiteraryCampaign') == true then
			Decisions_CL_UC_LiteraryCampaign.Desc = 'Illiteracy is a scourge of our people, a snare that leaves the guarijros trapped under oppression! We must declare this year to be the year of education and send out military literacy brigades to build schools, train teachers, and teach our people to read and write.[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]A National College in every City![NEWLINE][ICON_BULLET]Increased [ICON_HAPPINESS_4] Unhappiness if a City produces more [ICON_RESEARCH] Science than twice its level of [ICON_PRODUCTION] Production.'
			return false, false, true
		end

		local pCap = pPlayer:GetCapitalCity()
		if pCap == nil then
			return true, false
		end
		if pPlayer:GetGold() < 1000 then
			return true, false
		end
		if pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_MAGISTRATES, false) < 2 then
			return true, false
		end
		if pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_GREAT_WAR_INFANTRY) < 5 then
			return true, false
		end
		return true, true
	end
)
Decisions_CL_UC_LiteraryCampaign.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeGold(-1000)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_NATIONAL_COLLEGE, 1)
		end
		save(pPlayer, 'Decisions_CL_UC_LiteraryCampaign', true)
	end
)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CL_UC_CUBA, 'Decisions_CL_UC_LiteraryCampaign', Decisions_CL_UC_LiteraryCampaign)

function DoCubansGetRestless(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CL_UC_CUBA then
		if load(pPlayer, 'Decisions_CL_UC_LiteraryCampaign') == true then
			for pCity in pPlayer:Cities() do
				if pCity:GetYieldRate(YieldTypes.YIELD_PRODUCTION) < (2 * pCity:GetYieldRate(YieldTypes.YIELD_SCIENCE)) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_HAPPINESSKILLER, 1)
				else
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CL_UC_HAPPINESSKILLER, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(DoCubansGetRestless)

function PutNCInLateCity(player, X, Y)
	local pPlayer = Players[player]
	if load(pPlayer, 'Decisions_CL_UC_LiteraryCampaign') == true then
		local pCity = Map.GetPlot(X, Y):GetPlotCity()
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_NATIONAL_COLLEGE, 1)
	end
end
GameEvents.PlayerCityFounded.Add(PutNCInLateCity)