-- Nabatea Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Nabatea Decisions: loaded")

iBuilding = GameInfoTypes.BUILDING_DECISIONS_NABATEANARCHITECTURE
-------------------------------------------------------------------------------------------------------------------------
-- MC_Nabatea_GetRoutesFromCity
-------------------------------------------------------------------------------------------------------------------------
function GetInternationalLandRoutes(iPlayer)

	local tRoutes = {}
	local pPlayer = Players[iPlayer]
	
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.FromID == iPlayer) and (tRoute.ToID ~= iPlayer) and (tRoute.Domain == DomainTypes.DOMAIN_LAND) then
			table.insert(tRoutes, tRoute)
		end
	end	
	
	return tRoutes
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Nabatea: Syncretise Foreign Architecture
-------------------------------------------------------------------------------------------------------------------------
local Decisions_NabateanArchitecture = {}
	Decisions_NabateanArchitecture.Name = "TXT_KEY_DECISIONS_NABATEANARCHITECTURE"
	Decisions_NabateanArchitecture.Desc = "TXT_KEY_DECISIONS_NABATEANARCHITECTURE_DESC"
	HookDecisionCivilizationIcon(Decisions_NabateanArchitecture, "CIVILIZATION_MC_NABATEA")
	Decisions_NabateanArchitecture.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_NABATEA then return false, false end
		if load(pPlayer, "Decisions_NabateanArchitecture") == true then
			Decisions_NabateanArchitecture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NABATEANARCHITECTURE_ENACTED_DESC")
			return false, false, true
		end

		local iGold = math.ceil(300 * iMod)

		local iResource = iMagistrate
		local sResource = "[ICON_MAGISTRATES] Magistrates"
		if GameInfoTypes.RESOURCE_JFD_DIGNITARIES then
			iResource = GameInfoTypes.RESOURCE_JFD_DIGNITARIES
			sResource = "[ICON_JFD_DIGNITARY] Dignitaries"
		end

		Decisions_NabateanArchitecture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NABATEANARCHITECTURE_DESC", iGold, sResource)

		if pPlayer:GetNumResourceAvailable(iResource, false) < 2 then return true, false end
		if (pPlayer:GetGold() < iGold) then return true, false end

		local tRoutes = GetInternationalLandRoutes(pPlayer:GetID())
		local bLandRoute = #tRoutes > 0		
		if not(bLandRoute) then return true, false end

		return true, true
	end
	)
	
	Decisions_NabateanArchitecture.DoFunc = (
	function(pPlayer)
		local iGold = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iGold)

		local iResource = iMagistrate
		if GameInfoTypes.RESOURCE_JFD_DIGNITARIES then
			iResource = GameInfoTypes.RESOURCE_JFD_DIGNITARIES
		end
		pPlayer:ChangeNumResourceTotal(iResource, -2)

		save(pPlayer, "Decisions_NabateanArchitecture", true)
		Decisions_NabateanArchitecture.Monitors[GameEvents.PlayerDoTurn](pPlayer:GetID())
	end
	)

	Decisions_NabateanArchitecture.Monitors = {}
	Decisions_NabateanArchitecture.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_NabateanArchitecture") ~= true then return end
		
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iBuilding, 0)
		end	

		local tRoutes = GetInternationalLandRoutes(pPlayer:GetID())
		for iKey, tRoute in ipairs(tRoutes) do
			local iNum = tRoute.FromCity:GetNumBuilding(iBuilding)
			tRoute.FromCity:SetNumRealBuilding(iBuilding, iNum + 1)	
		end
	end
	)	
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_NABATEA, "Decisions_NabateanArchitecture", Decisions_NabateanArchitecture)
-------------------------------------------------------------------------------------------------------------------------
-- Nabatea: Sponsor Pleasure Gardens
-------------------------------------------------------------------------------------------------------------------------
local Decisions_NabateanGardens = {}
	Decisions_NabateanGardens.Name = "TXT_KEY_DECISIONS_NABATEANGARDENS"
	Decisions_NabateanGardens.Desc = "TXT_KEY_DECISIONS_NABATEANGARDENS_DESC"
	HookDecisionCivilizationIcon(Decisions_NabateanGardens, "CIVILIZATION_MC_NABATEA")
	Decisions_NabateanGardens.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_NABATEA then return false, false end
		if load(pPlayer, "Decisions_NabateanGardens") == true then
			Decisions_NabateanGardens.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NABATEANGARDENS_ENACTED_DESC")
			return false, false, true
		end

		local iGold = math.ceil(800 * iMod)
		Decisions_NabateanGardens.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NABATEANGARDENS_DESC", iGold)

		if (pPlayer:GetGold() < iGold) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end					

		local iEra = pPlayer:GetCurrentEra()
		if (iEra < GameInfoTypes.ERA_CLASSICAL) then return true, false end

		return true, true
	end
	)
	
	Decisions_NabateanGardens.DoFunc = (
	function(pPlayer)
		local iGold = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iGold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)		

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_NABATEANGARDENS, true)

		save(pPlayer, "Decisions_NabateanGardens", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_NABATEA, "Decisions_NabateanGardens", Decisions_NabateanGardens)
--=======================================================================================================================
--=======================================================================================================================