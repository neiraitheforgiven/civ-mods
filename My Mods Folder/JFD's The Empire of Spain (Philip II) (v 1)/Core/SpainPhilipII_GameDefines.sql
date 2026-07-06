--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 							Description, 							Help, 										Sound, 				RangedSupportFire,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SEMINARY', 		'TXT_KEY_PROMOTION_JFD_SEMINARY',		'TXT_KEY_PROMOTION_JFD_SEMINARY_HELP', 		'AS2D_IF_LEVELUP', 	0,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SEMINARY'),
		('PROMOTION_JFD_TERCIO', 		'TXT_KEY_PROMOTION_JFD_TERCIO',			'TXT_KEY_PROMOTION_JFD_TERCIO_HELP', 		'AS2D_IF_LEVELUP', 	1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TERCIO');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
------------------------------
UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_JFD_TERCIO', Strategy = 'TXT_KEY_UNIT_JFD_TERCIO_STRATEGY'
WHERE Type = 'UNIT_SPANISH_TERCIO';
------------------------------
-- Unit_FreePromotions
------------------------------
INSERT INTO Unit_FreePromotions 
		(UnitType, 						PromotionType)
VALUES	('UNIT_SPANISH_TERCIO',			'PROMOTION_JFD_TERCIO');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_SPAIN_PHILIP_II', 	'BUILDING_JFD_SPAIN_PHILIP_II', 	'TXT_KEY_BUILDING_JFD_SPAIN_PHILIP_II');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,							PrereqTech, Cost,	FaithCost, GreatWorkCount, UnlockedByBelief,	SpecialistType, SpecialistCount, GoldMaintenance,	MinAreaSize, NeverCapture,	Description, 								Help, 											Civilopedia, 						Strategy,									ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_SEMINARY',			BuildingClass,							PrereqTech, Cost,	FaithCost, GreatWorkCount, UnlockedByBelief,	SpecialistType, SpecialistCount, GoldMaintenance,	MinAreaSize, 0,				'TXT_KEY_BUILDING_JFD_SEMINARY',			'TXT_KEY_BUILDING_JFD_SEMINARY_HELP',			'TXT_KEY_CIV5_JFD_SEMINARY_TEXT',	'TXT_KEY_BUILDING_JFD_SEMINARY_STRATEGY',	ArtDefineTag, 3, 				'JFD_SPAIN_PHILIP_II_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';	

INSERT INTO Buildings 	
		(Type, 								BuildingClass,							PrereqTech, Cost,	FaithCost,  GreatWorkCount, UnlockedByBelief,	SpecialistType, SpecialistCount, GoldMaintenance,	MinAreaSize, NeverCapture,	Description, 								Help, 											Civilopedia, 						Strategy,									ArtDefineTag, PortraitIndex,	IconAtlas)
VALUES	('BUILDING_JFD_SPAIN_PHILIP_II',	'BUILDINGCLASS_JFD_SPAIN_PHILIP_II',	null,		-1,		-1,			-1,				0,					null,			0,				 0,					-1,			 1,				'TXT_KEY_BUILDING_JFD_SPAIN_PHILIP_II',		'TXT_KEY_BUILDING_JFD_SPAIN_PHILIP_II_HELP',	null,								null,										null,		  0, 				'JFD_SPAIN_PHILIP_II_ATLAS');
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_SEMINARY',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';		
--------------------------------	
-- Building_FeatureYieldChanges
--------------------------------	
INSERT INTO Building_FeatureYieldChanges 	
		(BuildingType, 					FeatureType, YieldType, Yield)
SELECT	'BUILDING_JFD_SEMINARY',		FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--------------------------------	
-- Building_YieldModifiers
--------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,		Yield)
SELECT	'BUILDING_JFD_SEMINARY',		YieldType,		Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';	

INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,		Yield)
VALUES	('BUILDING_JFD_SEMINARY',		'YIELD_FAITH',	3);	
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_SEMINARY',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';
--------------------------------	
-- Unit_ProductionModifierBuildings
--------------------------------	
INSERT INTO Unit_ProductionModifierBuildings 	
		(BuildingType, 					UnitType,		ProductionModifier)
SELECT	'BUILDING_JFD_SPAIN_PHILIP_II',	Type,			100
FROM Units WHERE Type IN ('UNIT_SETTLER', 'UNIT_JFD_COLONIST', 'UNIT_COLONIST', 'UNIT_PIONEER', 'UNIT_WORKER', 'UNIT_JFD_WORKER', 'UNIT_WORKBOAT');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_PHILIP_II', 		'TXT_KEY_LEADER_JFD_PHILIP_II',		'TXT_KEY_LEADER_JFD_PHILIP_II_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PHILIP_II', 	'Janboruta_PhilipII_Scene.xml',		8, 						3, 						3, 							8, 			5, 				5, 				6, 						5, 				6, 			3, 			6, 				5, 			4, 			'JFD_SPAIN_PHILIP_II_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_PHILIP_II', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_PHILIP_II', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_PHILIP_II', 		'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_PHILIP_II', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_PHILIP_II', 		'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_JFD_PHILIP_II', 		'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------		
-- Leader_Flavors
--------------------------------								
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_PHILIP_II', 		'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_RECON', 					5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_RANGED', 					3),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_AIR', 						2),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_EXPANSION', 				10),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_GOLD', 						6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_HAPPINESS', 				8),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_WONDER', 					3),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_RELIGION', 					9),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_NUKE', 						3),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_PHILIP_II', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------		
-- Leader_Traits
--------------------------------		
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_PHILIP_II', 		'TRAIT_JFD_SPAIN_PHILIP_II');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_SPAIN_PHILIP_II',	'TXT_KEY_TRAIT_JFD_SPAIN_PHILIP_II',	'TXT_KEY_TRAIT_JFD_SPAIN_PHILIP_II_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------
UPDATE Civilizations
SET DawnOfManAudio = null
WHERE Type = 'CIVILIZATION_SPAIN';
--------------------------------
-- Civilization_Leaders
--------------------------------	
DELETE FROM Civilization_Leaders WHERE CivilizationType = 'CIVILIZATION_SPAIN';	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_SPAIN',			'LEADER_JFD_PHILIP_II');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_SPAIN',			'BUILDINGCLASS_UNIVERSITY',		'BUILDING_JFD_SEMINARY');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SPAIN';	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_SPAIN',			'UNITCLASS_MUSKETMAN',			'UNIT_SPANISH_TERCIO');
--==========================================================================================================================
--==========================================================================================================================