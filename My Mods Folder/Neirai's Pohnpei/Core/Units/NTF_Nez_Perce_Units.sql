--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,										Class, Cost, Range, PrereqTech, Combat,		RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass,				MilitarySupport, MilitaryProduction, MoveRate,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI,		Description, 										Civilopedia, 												Help, 														Strategy,													AdvancedStartCost,	UnitArtInfo, 										UnitFlagIconOffset,	UnitFlagAtlas,								PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),	Class, Cost, 2,		PrereqTech, Combat-5,	32,				Moves, FaithCost,	RequiresFaithPurchaseEnabled, ('UNITCOMBAT_MOUNTED'),	MilitarySupport, MilitaryProduction, MoveRate,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  ('UNITAI_RANGED'),	('TXT_KEY_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),	('TXT_KEY_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER_PEDIA'), 	('TXT_KEY_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER_HELP'), 	('TXT_KEY_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'),  0,					('MC_NTF_NEZ_PERCE_APPALOOSA_RIDER_FLAG'),	2, 				('NTF_NEZ_PERCE_ATLAS')
FROM Units WHERE (Type = 'UNIT_LANCER');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 									UnitAIType)
SELECT		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_HUN_HORSE_ARCHER');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 									UnitClassType)
SELECT		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,									FlavorType, Flavor)
SELECT		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_HUN_HORSE_ARCHER');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 									PromotionType)
VALUES		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'PROMOTION_NO_DEFENSIVE_BONUSES'),
            ('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'PROMOTION_ONLY_DEFENSIVE'),
            ('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'PROMOTION_ACCURACY_1'),
            ('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
            ('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER',	'PROMOTION_CITY_PENALTY');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 												SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
--==========================================================================================================================