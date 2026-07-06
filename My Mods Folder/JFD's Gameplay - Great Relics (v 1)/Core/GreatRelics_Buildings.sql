--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 
		(Type, 									DefaultBuilding, 					Description, 								MaxGlobalInstances,  MaxPlayerInstances)
VALUES	('BUILDINGCLASS_JFD_SOLOMONS_TEMPLE',	'BUILDING_JFD_SOLOMONS_TEMPLE',		'TXT_KEY_BUILDING_JFD_SOLOMONS_TEMPLE', 	1,					 -1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(BuildingClassType, 					CivilizationType, 		BuildingType)
SELECT	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE',	Type, 					null
FROM Civilizations WHERE Type IN ('CIVILIZATION_BARBARIAN', 'CIVILIZATION_MINOR');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 						
		(Type, 								BuildingClass, 							Cost, 	PrereqTech, 		MaxStartEra, 		GreatWorkSlotType,			GreatWorkCount,  CapturePlunderModifier, Description, 								Help, 								 			Civilopedia, 						 			Quote,  										NukeImmune, HurryCostModifier,  MinAreaSize,	ConquestProb, 	ArtDefineTag,	IconAtlas, 						PortraitIndex, 	WonderSplashAudio,							WonderSplashImage, 			 WonderSplashAnchor)
VALUES	('BUILDING_JFD_SOLOMONS_TEMPLE',	'BUILDINGCLASS_JFD_SOLOMONS_TEMPLE',	185,	'TECH_THE_WHEEL',	'ERA_CLASSICAL', 	'GREAT_WORK_SLOT_RELIC',	2,				 200,					 'TXT_KEY_BUILDING_JFD_SOLOMONS_TEMPLE',	'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_HELP',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_PEDIA',		'TXT_KEY_WONDER_JFD_SOLOMONS_TEMPLE_QUOTE',		1,			-1,					-1,				100,			null,			'JFD_GREAT_RELICS_ICON_ATLAS',	2,				'AS2D_WONDER_SPEECH_JFD_SOLOMONS_TEMPLE',	'Wonder_TempleSolomon.dds',	 'L,B');	

--Monastery
UPDATE Buildings
SET FaithCost = 0, UnlockedByBelief = 0, Cost = 100, GoldMaintenance = 1, PrereqTech = 'TECH_THEOLOGY', GreatWorkSlotType = 'GREAT_WORK_SLOT_RELIC',  GreatWorkCount = 1, Strategy = 'TXT_KEY_BUILDING_MONASTERY_STRATEGY_JFD_GREAT_RELICS'
WHERE Type = 'BUILDING_MONASTERY';
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONASTERY' AND YieldType IN ('YIELD_FAITH', 'YIELD_CULTURE');

INSERT INTO Building_YieldChanges 
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_JFD_SOLOMONS_TEMPLE', 	'YIELD_CULTURE',	1),
		('BUILDING_JFD_SOLOMONS_TEMPLE', 	'YIELD_FAITH',		2);

CREATE TRIGGER JFD_GreatRelics_Building_YieldChanges
AFTER INSERT ON Building_YieldChanges 
WHEN NEW.BuildingType IN (SELECT Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_MONASTERY')
BEGIN
	DELETE FROM Building_YieldChanges WHERE BuildingType = NEW.BuildingType AND YieldType IN ('YIELD_FAITH', 'YIELD_CULTURE');
END;
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors 
		(BuildingType, 						FlavorType,			Flavor)
VALUES	('BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_WONDER',	20),
		('BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_CULTURE',	10),
		('BUILDING_JFD_SOLOMONS_TEMPLE', 	'FLAVOR_RELIGION',	20);
--==========================================================================================================================
--==========================================================================================================================


