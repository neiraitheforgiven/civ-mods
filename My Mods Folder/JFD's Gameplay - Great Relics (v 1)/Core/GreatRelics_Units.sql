--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------	
-- Units
--------------------------------------------------------------------------------------------------------------------------
UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_PROPHET_JFD_GREAT_RELICS'
WHERE Type = 'UNIT_PROPHET';

INSERT OR REPLACE INTO Units 	
		(Type, 						ShowInPedia, Class, WorkRate, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, DontShowYields, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI,   Description, Civilopedia, Strategy, UnitArtInfoEraVariation, AdvancedStartCost, CombatLimit, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_JFD_GREAT_PROPHET',	0,			 Class, WorkRate, FoundReligion, SpreadReligion, ReligionSpreads, ReligiousStrength, DontShowYields, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase, Domain, 'UNITAI_ARTIST', Description, Civilopedia, Strategy, UnitArtInfoEraVariation, AdvancedStartCost, CombatLimit, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, MoveRate, PortraitIndex, IconAtlas
FROM Units WHERE Type = 'UNIT_PROPHET';
--------------------------------------------------------------------------------------------------------------------------	
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO JFD_Civilopedia_HideFromPedia 	
		(Type)
VALUES	('UNIT_JFD_GREAT_PROPHET');
--------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_GREAT_PROPHET', 	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PROPHET';
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GREAT_PROPHET',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ARTIST';

INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_GREAT_PROPHET',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PROPHET';
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_GREAT_PROPHET',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PROPHET';
--------------------------------------------------------------------------------------------------------------------------		
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	'UNIT_JFD_GREAT_PROPHET',	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_PROPHET';
--------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,	 Flavor)
SELECT	'UNIT_JFD_GREAT_PROPHET', 	FlavorType,	 Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PROPHET';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
-------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Unit_UniqueNames WHERE UnitType = 'UNIT_PROPHET';
INSERT INTO Unit_UniqueNames
		(UnitType,					UniqueName,								RequiresReligionFounding,	RequiresReligionFounded, RequiresReligionEnhanced,  GreatWorkType)
VALUES	('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_1',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_2',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_3',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_4',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_5',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_6',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_7',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_8',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_9',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_10',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_11',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_12',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_13',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_14',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_15',		1,							0,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_16',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_17',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_18',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_19',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_20',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_21',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_22',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_23',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_24',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_25',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_26',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_27',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_28',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_29',		0,							1,						 0,							null),
		('UNIT_PROPHET',			'TXT_KEY_UNIT_JFD_PROPHET_NAME_30',		0,							1,						 0,							null),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_31',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_1'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_32',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_2'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_33',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_3'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_34',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_4'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_35',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_5'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_36',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_6'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_37',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_7'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_38',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_8'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_39',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_9'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_40',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_10'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_41',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_11'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_42',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_12'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_43',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_13'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_44',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_14'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_45',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_15'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_46',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_16'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_47',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_17'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_48',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_18'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_49',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_19'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_50',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_20'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_51',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_21'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_52',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_22'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_53',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_23'),
		('UNIT_JFD_GREAT_PROPHET',	'TXT_KEY_UNIT_JFD_PROPHET_NAME_54',		0,							0,						 1,							'GREAT_WORK_JFD_RELIC_24');
--==========================================================================================================================
--==========================================================================================================================