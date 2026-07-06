---------------------------------------------------------------------------------------------
--Debugging Print-Out Function
---------------------------------------------------------------------------------------------
--DebugPrintMessages = false --Setting this to true slows the game process time by miliseconds, but it gives me from having accurate LUA analysis arise a bug occurs.
function PrintDebug(sMessage)
	if DebugPrintMessages then
		print(sMessage)
	end
end

---------------------------------------------------------------------------------------------
--Determine if CP is being used and set variable flag accordingly
---------------------------------------------------------------------------------------------

isUsingCP = false
--This checks for the Community Patch!--
for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd") then
		isUsingCP = true
		--PrintDebug("Community Patch is installed!")
	end
	if isUsingCP == false then
		--PrintDebug("Community Patch is not installed!")
	end
end

---------------------------------------------------------------------------------------------
--Promotions Data Table Constructions
---------------------------------------------------------------------------------------------

GeneralPromotions_GG = {}
GeneralTraits = {}
tGeneralToUnitCorrespondances = {}
tUnitToGeneralCorrespondances = {}
tLevel1GeneralshipPromotions = {}
tLevel2GeneralshipPromotions = {}
tLevel3GeneralshipPromotions = {}
tCombatUnitMasterPromotionList = {}
AdmiralPromotions_GG = {}
tAdmiralToUnitCorrespondances = {}
tUnitToAdmiralCorrespondances = {}
tLevel1AdmiralshipPromotions = {}
tLevel2AdmiralshipPromotions = {}
tLevel3AdmiralshipPromotions = {}
tCombatShipMasterPromotionList = {}
CityTraits = {}


GeneralPromotions_GG.Homeguard = { [1] = { General=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG2, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG3, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_3, Level=3 } }
GeneralPromotions_GG.Nationalism = { [1] = { General=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM_GG, Combat=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM_GG2, Combat=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM_2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM_GG3, Combat=GameInfoTypes.PROMOTION_INSPIRED_NATIONALISM_3, Level=3 } }
GeneralPromotions_GG.Sufficient = { [1] = { General=GameInfoTypes.PROMOTION_SUFFICIENT_GG, Combat=GameInfoTypes.PROMOTION_SUFFICIENT, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_SUFFICIENT_GG2, Combat=GameInfoTypes.PROMOTION_SUFFICIENT2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_SUFFICIENT_GG3, Combat=GameInfoTypes.PROMOTION_SUFFICIENT3, Level=3 } }
GeneralPromotions_GG.Foreign = { [1] = { General=GameInfoTypes.PROMOTION_FOREIGN_GG, Combat=GameInfoTypes.PROMOTION_FOREIGN, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_FOREIGN_GG2, Combat=GameInfoTypes.PROMOTION_FOREIGN2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_FOREIGN_GG3, Combat=GameInfoTypes.PROMOTION_FOREIGN3, Level=3 } }
GeneralPromotions_GG.Commando = { [1] = { General=GameInfoTypes.PROMOTION_COMMANDO_GG, Combat=GameInfoTypes.PROMOTION_COMMANDO, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_COMMANDO_GG2, Combat=GameInfoTypes.PROMOTION_COMMANDO2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_COMMANDO_GG3, Combat=GameInfoTypes.PROMOTION_COMMANDO3, Level=3 } }
GeneralPromotions_GG.LocalIntelligence = { [1] = { General=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE_GG, Combat=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE_GG2, Combat=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE_GG3, Combat=GameInfoTypes.PROMOTION_LOCAL_INTELLIGENCE3, Level=3 } }
GeneralPromotions_GG.Cowardly = { [1] = { General=GameInfoTypes.PROMOTION_COWARDLY_GG, Combat=GameInfoTypes.PROMOTION_COWARDLY, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_COWARDLY_GG2, Combat=GameInfoTypes.PROMOTION_COWARDLY2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_COWARDLY_GG3, Combat=GameInfoTypes.PROMOTION_COWARDLY3, Level=3 } }
GeneralPromotions_GG.Forced = { [1] = { General=GameInfoTypes.PROMOTION_FORCED_GG, Combat=GameInfoTypes.PROMOTION_FORCED, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_FORCED_GG2, Combat=GameInfoTypes.PROMOTION_FORCED2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_FORCED_GG3, Combat=GameInfoTypes.PROMOTION_FORCED3, Level=3 } }
GeneralPromotions_GG.Butcher = { [1] = { General=GameInfoTypes.PROMOTION_BUTCHER_GG, Combat=GameInfoTypes.PROMOTION_BUTCHER, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_BUTCHER_GG2, Combat=GameInfoTypes.PROMOTION_BUTCHER2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_BUTCHER_GG3, Combat=GameInfoTypes.PROMOTION_BUTCHER3 } }
GeneralPromotions_GG.Skirmish = { [1] = { General=GameInfoTypes.PROMOTION_SKIRMISH_GG, Combat=GameInfoTypes.PROMOTION_SKIRMISH, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_SKIRMISH_GG2, Combat=GameInfoTypes.PROMOTION_SKIRMISH2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_SKIRMISH_GG3, Combat=GameInfoTypes.PROMOTION_SKIRMISH3, Level=3 } }
GeneralPromotions_GG.Strict = { [1] = { General=GameInfoTypes.PROMOTION_STRICT_GG, Combat=GameInfoTypes.PROMOTION_STRICT, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_STRICT_GG2, Combat=GameInfoTypes.PROMOTION_STRICT2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_STRICT_GG3, Combat=GameInfoTypes.PROMOTION_STRICT3, Level=3 } }
GeneralPromotions_GG.Banzai = { [1] = { General=GameInfoTypes.PROMOTION_BANZAI_GG, Combat=GameInfoTypes.PROMOTION_BANZAI, Level=1 },
	[2] = { General=GameInfoTypes.PROMOTION_BANZAI_GG2, Combat=GameInfoTypes.PROMOTION_BANZAI2, Level=2 },
	[3] = { General=GameInfoTypes.PROMOTION_BANZAI_GG3, Combat=GameInfoTypes.PROMOTION_BANZAI3, Level=3 } }

AdmiralPromotions_GG.Homeguard = { [1] = { Admiral=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG2, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_GG3, Combat=GameInfoTypes.PROMOTION_INSPIRED_HOMEGUARD_3, Level=3 } }
AdmiralPromotions_GG.Impressment = { [1] = { Admiral=GameInfoTypes.PROMOTION_IMPRESSMENT_GG, Combat=GameInfoTypes.PROMOTION_IMPRESSMENT, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_IMPRESSMENT_GG2, Combat=GameInfoTypes.PROMOTION_IMPRESSMENT2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_IMPRESSMENT_GG3, Combat=GameInfoTypes.PROMOTION_IMPRESSMENT3, Level=3 } }
AdmiralPromotions_GG.Blockader = { [1] = { Admiral=GameInfoTypes.PROMOTION_BLOCKADER_GG, Combat=GameInfoTypes.PROMOTION_BLOCKADER, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_BLOCKADER_GG2, Combat=GameInfoTypes.PROMOTION_BLOCKADER2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_BLOCKADER_GG3, Combat=GameInfoTypes.PROMOTION_BLOCKADER3, Level=3 } }
AdmiralPromotions_GG.Piloting = { [1] = { Admiral=GameInfoTypes.PROMOTION_PILOTING_GG, Combat=GameInfoTypes.PROMOTION_PILOTING, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_PILOTING_GG2, Combat=GameInfoTypes.PROMOTION_PILOTING2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_PILOTING_GG3, Combat=GameInfoTypes.PROMOTION_PILOTING3, Level=3 } }
AdmiralPromotions_GG.Gunnery = { [1] = { Admiral=GameInfoTypes.PROMOTION_GUNNERY_GG, Combat=GameInfoTypes.PROMOTION_GUNNERY, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_GUNNERY_GG2, Combat=GameInfoTypes.PROMOTION_GUNNERY2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_GUNNERY_GG3, Combat=GameInfoTypes.PROMOTION_GUNNERY3, Level=3 } }
AdmiralPromotions_GG.Banzai = { [1] = { Admiral=GameInfoTypes.PROMOTION_BANZAI_GG, Combat=GameInfoTypes.PROMOTION_BANZAI, Level=1 },
	[2] = { Admiral=GameInfoTypes.PROMOTION_BANZAI_GG2, Combat=GameInfoTypes.PROMOTION_BANZAI2, Level=2 },
	[3] = { Admiral=GameInfoTypes.PROMOTION_BANZAI_GG3, Combat=GameInfoTypes.PROMOTION_BANZAI3, Level=3 } }
	
if isUsingCP then
	GeneralPromotions_GG.Reeducation = { [1] = { General=GameInfoTypes.PROMOTION_REEDUCATION_GG, Combat=GameInfoTypes.PROMOTION_REEDUCATION, Level=1 },
		[2] = { General=GameInfoTypes.PROMOTION_REEDUCATION_GG2, Combat=GameInfoTypes.PROMOTION_REEDUCATION2, Level=2 },
		[3] = { General=GameInfoTypes.PROMOTION_REEDUCATION_GG3, Combat=GameInfoTypes.PROMOTION_REEDUCATION3, Level=3 } }
	GeneralPromotions_GG.Pious = { [1] = { General=GameInfoTypes.PROMOTION_PIOUS_GG, Combat=GameInfoTypes.PROMOTION_PIOUS, Level=1 },
		[2] = { General=GameInfoTypes.PROMOTION_PIOUS_GG2, Combat=GameInfoTypes.PROMOTION_PIOUS2, Level=2 },
		[3] = { General=GameInfoTypes.PROMOTION_PIOUS_GG3, Combat=GameInfoTypes.PROMOTION_PIOUS3, Level=3 } }
	GeneralPromotions_GG.Scavenger = { [1] = { General=GameInfoTypes.PROMOTION_SCAVENGER_GG, Combat=GameInfoTypes.PROMOTION_SCAVENGER, Level=1 },
		[2] = { General=GameInfoTypes.PROMOTION_SCAVENGER_GG2, Combat=GameInfoTypes.PROMOTION_SCAVENGER2, Level=2 },
		[3] = { General=GameInfoTypes.PROMOTION_SCAVENGER_GG3, Combat=GameInfoTypes.PROMOTION_SCAVENGER3, Level=3 } }
	AdmiralPromotions_GG.Reeducation = { [1] = { Admiral=GameInfoTypes.PROMOTION_REEDUCATION_GG, Combat=GameInfoTypes.PROMOTION_REEDUCATION, Level=1 },
		[2] = { Admiral=GameInfoTypes.PROMOTION_REEDUCATION_GG2, Combat=GameInfoTypes.PROMOTION_REEDUCATION2, Level=2 },
		[3] = { Admiral=GameInfoTypes.PROMOTION_REEDUCATION_GG3, Combat=GameInfoTypes.PROMOTION_REEDUCATION3, Level=3 } }
	AdmiralPromotions_GG.Pious = { [1] = { Admiral=GameInfoTypes.PROMOTION_PIOUS_GG, Combat=GameInfoTypes.PROMOTION_PIOUS, Level=1 },
		[2] = { Admiral=GameInfoTypes.PROMOTION_PIOUS_GG2, Combat=GameInfoTypes.PROMOTION_PIOUS2, Level=2 },
		[3] = { Admiral=GameInfoTypes.PROMOTION_PIOUS_GG3, Combat=GameInfoTypes.PROMOTION_PIOUS3, Level=3 } }
	AdmiralPromotions_GG.Scavenger = { [1] = { Admiral=GameInfoTypes.PROMOTION_SCAVENGER_GG, Combat=GameInfoTypes.PROMOTION_SCAVENGER, Level=1 },
		[2] = { Admiral=GameInfoTypes.PROMOTION_SCAVENGER_GG2, Combat=GameInfoTypes.PROMOTION_SCAVENGER2, Level=2 },
		[3] = { Admiral=GameInfoTypes.PROMOTION_SCAVENGER_GG3, Combat=GameInfoTypes.PROMOTION_SCAVENGER3, Level=3 } }
	GeneralTraits.Freedom = GameInfoTypes.PROMOTION_MUHFREEDOM
	GeneralTraits.Order =  GameInfoTypes.PROMOTION_MUHORDER
	GeneralTraits.Autocracy = GameInfoTypes.PROMOTION_MUHAUTOCRACY
	GeneralTraits.Freedom_GG = GameInfoTypes.PROMOTION_MUHFREEDOM_GG
	GeneralTraits.Order_GG = GameInfoTypes.PROMOTION_MUHORDER_GG
	GeneralTraits.Autocracy_GG = GameInfoTypes.PROMOTION_MUHAUTOCRACY_GG
end

--for k,v in pairs(GeneralPromotions_GG) do PrintDebug(k,tostring(v)) end
for k,v in pairs(GeneralPromotions_GG) do
	local TempTable = {}
	TempTable = v
	local keyname = k
	--PrintDebug("key " .. keyname .. " has value of " .. tostring(TempTable))
	for Level,Data in pairs(TempTable) do
		--PrintDebug("key " .. Level .. " has value of " .. tostring(Data))
		tUnitToGeneralCorrespondances[Data.Combat] = Data.General
		tGeneralToUnitCorrespondances[Data.General] = Data.Combat
		table.insert(tCombatUnitMasterPromotionList, Data.Combat)
		if Level == 1 then
			tLevel1GeneralshipPromotions[keyname] = Data.General
		elseif Level == 2 then
			tLevel2GeneralshipPromotions[keyname] = Data.General
		elseif Level == 3 then
			tLevel3GeneralshipPromotions[keyname] = Data.General
		end
	end
end
for k,v in pairs(AdmiralPromotions_GG) do
	local TempTable = {}
	TempTable = v
	local keyname = k
	--PrintDebug("key " .. keyname .. " has value of " .. tostring(TempTable))
	for Level,Data in pairs(TempTable) do
		--PrintDebug("key " .. Level .. " has value of " .. tostring(Data))
		tUnitToAdmiralCorrespondances[Data.Combat] = Data.Admiral
		tAdmiralToUnitCorrespondances[Data.Admiral] = Data.Combat
		table.insert(tCombatShipMasterPromotionList, Data.Combat)
		if Level == 1 then
			tLevel1AdmiralshipPromotions[keyname] = Data.Admiral
		elseif Level == 2 then
			tLevel2AdmiralshipPromotions[keyname] = Data.Admiral
		elseif Level == 3 then
			tLevel3AdmiralshipPromotions[keyname] = Data.Admiral
		end
	end
end
--[[PrintDebug("The Contents of table tUnitToGeneralCorrespondances is:")
for k,v in pairs(tUnitToGeneralCorrespondances) do
	PrintDebug("Combat Unit Promotion (k) " .. k .. "(" .. GameInfo.UnitPromotions[k].Type .. ") has a Great General Promotion Correspondance (v) of " .. v .. "(" .. GameInfo.UnitPromotions[v].Type .. ")") 
end
PrintDebug("The Contents of table tGeneralToUnitCorrespondances is:")
for k,v in pairs(tGeneralToUnitCorrespondances) do
	PrintDebug("Great General Promotion (k) " .. k .. "(" .. GameInfo.UnitPromotions[k].Type .. ") has a Combat Unit Promotion Correspondance (v) of " .. v .. "(" .. GameInfo.UnitPromotions[v].Type .. ")") 
end
PrintDebug("The Contents of table tUnitToAdmiralCorrespondances is:")
for k,v in pairs(tUnitToAdmiralCorrespondances) do
	PrintDebug("Combat Unit Promotion (k) " .. k .. "(" .. GameInfo.UnitPromotions[k].Type .. ") has a Great General Promotion Correspondance (v) of " .. v .. "(" .. GameInfo.UnitPromotions[v].Type .. ")") 
end
PrintDebug("The Contents of table tAdmiralToUnitCorrespondances is:")
for k,v in pairs(tAdmiralToUnitCorrespondances) do
	PrintDebug("Great General Promotion (k) " .. k .. "(" .. GameInfo.UnitPromotions[k].Type .. ") has a Combat Unit Promotion Correspondance (v) of " .. v .. "(" .. GameInfo.UnitPromotions[v].Type .. ")") 
end]]--