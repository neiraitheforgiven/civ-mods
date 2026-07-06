--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
			(Type, 					PrereqTech, Class, CombatClass, Combat, Cost, Moves, 	FaithCost, HurryCostModifier, RequiresFaithPurchaseEnabled, Domain, DefaultUnitAI, 	Description, 					Civilopedia, 						Help, 								Strategy,								ObsoleteTech, AdvancedStartCost, NoBadGoodies, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,		PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_ZABONAH'),	PrereqTech, Class, CombatClass, Combat, Cost, Moves+1, 	FaithCost, HurryCostModifier, RequiresFaithPurchaseEnabled, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_MC_ZABONAH'), 	('TXT_KEY_CIV5_MC_ZABONAH_TEXT'), 	('TXT_KEY_UNIT_MC_ZABONAH_HELP'), 	('TXT_KEY_UNIT_MC_ZABONAH_STRATEGY'),	ObsoleteTech, AdvancedStartCost, NoBadGoodies, ('ART_DEF_UNIT_MC_ZABONAH'),  	0,					('MC_ZABONAH_FLAG'),				('QUADRUPED'),	2, 				('MC_NABATEA_ATLAS')
FROM Units WHERE (Type = 'UNIT_SCOUT');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_MC_ZABONAH', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_MC_ZABONAH', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_MC_ZABONAH', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';

UPDATE Unit_Flavors 
SET Flavor = 20
WHERE UnitType = 'UNIT_MC_ZABONAH' AND FlavorType = 'FLAVOR_GOLD';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_MC_ZABONAH', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_MC_ZABONAH', 			'PROMOTION_ONLY_DEFENSIVE');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_ZABONAH'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SCOUT');	
--==========================================================================================================================	
--==========================================================================================================================	