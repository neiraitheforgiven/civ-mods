-- Lua Script1
-- Author: Scotty
-- DateCreated: 9/20/2016 5:17:08 PM
--------------------------------------------------------------

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_US_WALES"]
local mathCeil = math.ceil
local policyWelsh_LawID = GameInfoTypes["POLICY_US_WELSH_LAW"]
local buildingConstabularyID = GameInfoTypes["BUILDING_CONSTABLE"]
--------------------------------------------------------------------------------------------------------------------------
--Laws of Mr Dda
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Welsh_Law = {}
	Decisions_Welsh_Law.Name = "TXT_KEY_DECISIONS_US_WELSH_LAW"
	Decisions_Welsh_Law.Desc = "TXT_KEY_DECISIONS_US_WELSH_LAW_DESC"
	HookDecisionCivilizationIcon(Decisions_Welsh_Law, "CIVILIZATION_US_WALES")
	Decisions_Welsh_Law.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Welsh_Law") == true then
			Decisions_Welsh_Law.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_WELSH_LAW_ENACTED_DESC")
			return false, false, true 
		end
		
		local cultureCost = mathCeil(200 * iMod)
		Decisions_Welsh_Law.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_WELSH_LAW_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if not(Teams[player:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then return true, false end
		if player:GetJONSCulture() < cultureCost								then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Welsh_Law.DoFunc = (
	function(player)
		local cultureCost = mathCeil(200 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGoldenAgeTurns(10)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyWelsh_LawID, true)
		local capital = player:GetCapitalCity()
		capital:SetNumRealBuilding(buildingConstabularyID, 1)
		save(player, "Decisions_Welsh_Law", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Welsh_Law", Decisions_Welsh_Law)
-------------------------------------------------------------------------------------------------------------------------
-- Promote the Welsh Language
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Language = {}
	Decisions_Language.Name = "TXT_KEY_DECISIONS_WELSH_LANGUAGE"
	Decisions_Language.Desc = "TXT_KEY_DECISIONS_WELSH_LANGUAGE_DESC"
	Decisions_Language.Pedia = "TXT_KEY_WELSH_LANGUAGE_DESC"
	HookDecisionCivilizationIcon(Decisions_Language, "CIVILIZATION_US_WALES")
	Decisions_Language.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_US_WALES then return false, false end
		if load(pPlayer, "Decisions_Language") == true then
			Decisions_Language.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_WELSH_LANGUAGE_ENACTED_DESC")
			return false, false, true
		end

		local iCost = math.ceil(150 * iMod)
		Decisions_Language.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_WELSH_LANGUAGE_DESC", iCost)
		if pPlayer:GetJONSCulture() < iCost then return true, false end
		if pPlayer:GetGold() < iCost then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHAEOLOGY)) then return true, false end
		if not(pPlayer:GetCapitalCity()) then return true, false end

		return true, true
	end
	)
	
	Decisions_Language.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(150 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iPlayer = pPlayer:GetID()
		
		local capital = pPlayer:GetCapitalCity()

		capital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_US_WELSH_LANGUAGE, 1)

		capital:SetName("Caerdydd")

		PreGame.SetCivilizationDescription(iPlayer, Locale.ConvertTextKey("TXT_KEY_CIV_US_CYMRU_DESC"))
		PreGame.SetCivilizationShortDescription(iPlayer, Locale.ConvertTextKey("TXT_KEY_CIV_US_CYMRU_SHORT_DESC"))

		save(pPlayer, "Decisions_Language", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_US_WALES, "Decisions_Language", Decisions_Language)
--=======================================================================================================================
--=======================================================================================================================