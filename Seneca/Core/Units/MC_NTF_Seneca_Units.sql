--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,								Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 								Civilopedia, 										Help, 											Strategy,											AdvancedStartCost,	UnitArtInfo, 							  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),	Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_PEDIA'), 	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_HELP'), 	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),  0,					('MC_NTF_SENECA_SWIFT_STRIKE_FLAG'),	2, 				('MC_NTF_SENECA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 							UnitAIType)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 							UnitClassType)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,							FlavorType, Flavor)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE',	'PROMOTION_AMPHIBIOUS');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 										SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
--==========================================================================================================================
