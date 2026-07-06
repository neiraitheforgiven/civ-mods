--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type,							Description,						ShortDescription, 					Adjective,								CivilopediaTag, 			DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 		MapImage,					DawnOfManQuote,							DawnOfManAudio,					DawnOfManImage)
SELECT		('CIVILIZATION_MC_NABATEA'),	('TXT_KEY_MC_NABATEA_DESC'),	('TXT_KEY_MC_NABATEA_SHORT_DESC'), 	('TXT_KEY_MC_NABATEA_ADJECTIVE'), 	('TXT_KEY_CIV5_NABATEA'), 	('PLAYERCOLOR_MC_NABATEA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('MC_NABATEA_ATLAS'), 	0, 				('MC_NABATEA_ALPHA_ATLAS'), 	('Arabia'), 		('NabateaMap512.dds'),		('TXT_KEY_CIV5_DOM_MC_NABATEA_TEXT'),	('AS2D_DOM_SPEECH_MC_NABATEA'),	('DOM_Aretas.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ARABIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_1'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_2'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_3'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_4'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_5'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_6'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_7'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_8'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_9'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_10'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_11'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_12'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_13'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_14'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_15'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_16'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_17'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_18'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_19'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_20'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_21'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_22'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_23'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_24'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_25'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_26'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_27'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_28'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_29'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_30'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_31'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_32'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_33'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_34'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_35'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_36'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_37'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_38'),
			('CIVILIZATION_MC_NABATEA',		'TXT_KEY_CITY_NAME_CIVILIZATION_NABATEA_39');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType,				BuildingClassType)
SELECT		('CIVILIZATION_MC_NABATEA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType,				TechType)
SELECT		('CIVILIZATION_MC_NABATEA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType,				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_MC_NABATEA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_NABATEA',		'LEADER_MC_ARETAS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_MC_NABATEA', 	'UNITCLASS_SCOUT',	'UNIT_MC_ZABONAH');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType,				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_MC_NABATEA', 	'BUILDINGCLASS_MINT', 			'BUILDING_MC_KOKH');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
			(CivilizationType,				ReligionType)
SELECT		('CIVILIZATION_MC_NABATEA'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_0'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_1'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_2'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_3'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_4'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_5'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_6'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_7'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_8'),
			('CIVILIZATION_MC_NABATEA', 		'TXT_KEY_SPY_NAME_MC_NABATEA_9');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_MC_NABATEA', 		'REGION_DESERT');
--==========================================================================================================================
--==========================================================================================================================