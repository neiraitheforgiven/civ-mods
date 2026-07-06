--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass, PrereqTech, Cost, MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, ArtInfoCulturalVariation, NeverCapture,  Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_CONVENTO',	BuildingClass, PrereqTech, Cost, MinAreaSize, AllowsRangeStrike, Defense, ExtraCityHitPoints, HurryCostModifier, ArtInfoCulturalVariation, 1, 			'TXT_KEY_BUILDING_JFD_CONVENTO', 	'TXT_KEY_BUILDING_JFD_CONVENTO_HELP',   'TXT_KEY_BUILDING_JFD_CONVENTO_STRATEGY',	'TXT_KEY_BUILDING_JFD_CONVENTO_TEXT',   ArtDefineTag, 3, 			 'JFD_PORTUGAL_AFONSO_I_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,  Flavor)
SELECT	'BUILDING_JFD_CONVENTO',	FlavorType,  Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CASTLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_JFD_CONVENTO',	'FLAVOR_RELIGION',	20);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges 
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType, 		Yield)
VALUES	('BUILDING_JFD_CONVENTO', 	'YIELD_FAITH',	2);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,  Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_KNIGHT_AVIZ',	0,				  'TXT_KEY_PROMOTION_JFD_KNIGHT_AVIZ',	'TXT_KEY_PROMOTION_JFD_KNIGHT_AVIZ_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_KNIGHT_AVIZ');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									Strategy, 									Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,							  UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_KNIGHT_AVIZ',		Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_KNIGHT_AVIZ',	'TXT_KEY_UNIT_JFD_KNIGHT_AVIZ_HELP', 	'TXT_KEY_UNIT_JFD_KNIGHT_AVIZ_STRATEGY', 	'TXT_KEY_UNIT_JFD_KNIGHT_AVIZ_TEXT',	'ART_DEF_UNIT_JFD_KNIGHT_AVIZ',		'JFD_PORTUGAL_AFONSO_I_UNIT_FLAG_ATLAS',  0,					'JFD_PORTUGAL_AFONSO_I_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_KNIGHT';	

UPDATE Units
SET Cost = Cost+30
WHERE Type = 'UNIT_JFD_KNIGHT_AVIZ';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_KNIGHT_AVIZ', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_KNIGHT_AVIZ', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_KNIGHT_AVIZ', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_KNIGHT_AVIZ', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_KNIGHT_AVIZ',	'PROMOTION_JFD_KNIGHT_AVIZ');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_KNIGHT_AVIZ',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';		
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PORTUGAL_AFONSO_I', 	'JFD_PortugalAfonsoI_Scene.xml',	'JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 3,
Boldness = 7,
DiploBalance = 6,
WarmongerHate = 5,
DenounceWillingness = 6,
DoFWillingness = 5,
Loyalty = 5,
Neediness = 5,
Forgiveness = 5,
Chattiness = 5,
Meanness = 5
WHERE Type = 'LEADER_JFD_PORTUGAL_AFONSO_I';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'MINOR_CIV_APPROACH_BULLY', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_RECON', 					3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_MOBILE', 					7),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_NAVAL', 					5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_EXPANSION', 				52),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_RELIGION', 					8),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_NUKE', 						3),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_PORTUGAL_AFONSO_I', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_DEFEATED%', 					 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_REQUEST%', 		  						500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_DENOUNCE%', 					  			500),
		('LEADER_JFD_PORTUGAL_AFONSO_I',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_PORTUGAL_AFONSO_I_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_PORTUGAL_AFONSO_I', 	'TRAIT_JFD_PORTUGAL_AFONSO_I');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_PORTUGAL_AFONSO_I',		'TXT_KEY_TRAIT_JFD_PORTUGAL_AFONSO_I',		'TXT_KEY_TRAIT_JFD_PORTUGAL_AFONSO_I_SHORT');	
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_PORTUGAL_AFONSO_I',	'BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I',		'TXT_KEY_BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 										BuildingClass,									ReligiousPressureModifier,	GreatWorkCount,	Cost, FaithCost, PrereqTech, NeverCapture,	Description,										Help)
VALUES	('BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I',	'BUILDINGCLASS_DUMMY_JFD_PORTUGAL_AFONSO_I',	25,							-1,				-1,   -1,		 null,		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I',		'TXT_KEY_BUILDING_DUMMY_JFD_PORTUGAL_AFONSO_I_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Building_JFD_HelpTexts
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Building_JFD_HelpTexts(BuildingType, CivilizationType, PolicyType, HelpText, IsWrittenFirst boolean, NotOnceBuilt boolean);
INSERT INTO Building_JFD_HelpTexts 		
		(BuildingType, 				CivilizationType,						HelpText)
VALUES	('BUILDING_COURTHOUSE',		'CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_BUILDING_JFD_PORTUGAL_AFONSO_I_COURTHOUSE_HELP');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'CIVILIZATION_PORTUGAL',	'Portugal', 	'JFD_MapPortugalAfonsoI512.dds',	'TXT_KEY_CIV_DAWN_JFD_PORTUGAL_AFONSO_I_TEXT',	'JFD_DOM_PortugalAfonsoI.dds',	'TXT_KEY_CIV_JFD_PORTUGAL_AFONSO_I_DESC', 	'TXT_KEY_CIV_JFD_PORTUGAL_AFONSO_I_SHORT_DESC',	'TXT_KEY_CIV_JFD_PORTUGAL_AFONSO_I_ADJECTIVE',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_PORTUGAL_AFONSO_I',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_PORTUGAL_AFONSO_I_ICON_ATLAS',	0,				'JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_PORTUGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_1'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_2'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_3'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_4'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_5'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_6'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_7'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_8'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_9'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_10'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_11'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_12'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_13'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_14'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_15'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'TXT_KEY_CITY_NAME_JFD_PORTUGAL_AFONSO_I_16');

INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
SELECT	'CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PORTUGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'LEADER_JFD_PORTUGAL_AFONSO_I');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'BUILDINGCLASS_CASTLE',		'BUILDING_JFD_CONVENTO');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'UNITCLASS_KNIGHT',			'UNIT_JFD_KNIGHT_AVIZ');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_0'),	
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_1'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_2'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_3'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_4'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_5'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_6'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_7'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_8'),
		('CIVILIZATION_JFD_PORTUGAL_AFONSO_I',	'TXT_KEY_SPY_NAME_JFD_PORTUGAL_AFONSO_I_9');
--==========================================================================================================================
--==========================================================================================================================