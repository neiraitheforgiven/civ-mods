--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 						ShortDescription, 				Adjective, 								CivilopediaTag, 						DefaultPlayerColor, 			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 								DawnOfManImage,				DawnOfManAudio)
SELECT		('CIVILIZATION_NTF_NEZ_PERCE'), 	('TXT_KEY_NTF_NEZ_PERCE_DESC'), 	('TXT_KEY_NTF_NEZ_PERCE'),		('TXT_KEY_NTF_NEZ_PERCE_ADJECTIVE'), 	('TXT_KEY_CIVLOPEDIA_NTF_NEZ_PERCE'),	('PLAYERCOLOR_NTF_NEZ_PERCE'), 	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('NTF_NEZ_PERCE_ATLAS'), 	0, 				('NTF_NEZ_PERCE_ALPHA_ATLAS'), ('Shoshone'), 	('NTF_NEZ_PERCE_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_NTF_NEZ_PERCE_TEXT'), 	('NTF_NEZ_PERCE_DoM.dds'),	('AS2D_DOM_SPEECH_NTF_NEZ_PERCE')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SHOSHONE');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'LEADER_NTF_JOSEF');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType,		UnitType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'UNITCLASS_LANCER',	'UNIT_MC_NTF_NEZ_PERCE_APPALOOSA_RIDER');
			
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'BUILDINGCLASS_LABORATORY',	'BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_NTF_NEZ_PERCE', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SHOSHONE');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 		Green, 		Blue, 		Alpha)
VALUES		('COLOR_PLAYER_NTF_NEZ_PERCE_ICON', 		0.773,      0.596,      0.522,      1),
            ('COLOR_PLAYER_NTF_NEZ_PERCE_BACKGROUND',   0.129,      0.141,      0.278,      1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_NTF_NEZ_PERCE',	'COLOR_PLAYER_NTF_NEZ_PERCE_ICON', 'COLOR_PLAYER_NTF_NEZ_PERCE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_KAMIAH'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_ALLPAWAWAII'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_WALLOWA'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_SAHATP'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_TUCANNON'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_WILLIWEWIX'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_NACOXKUUS'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_WAWAWIH'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_SILAYLOO'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_WEYIKESPE'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_XUYELP'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_PINAWAWI'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_SHIMINEKEM'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_AHSAHKA'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_KAMIAHP'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_LAMTAMA'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_LEEPWEY'),  
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_SAKAN'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_IWASNIMA'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_YAKTOIN'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_IWATOIN'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_TUNEHE'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_PALOT'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_HASUTIN'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_HASEIWAWIH'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_ANATOIN'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_HINSEPU'), 
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_PIPUINIMU'),            
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_KUSEYNEISEKIT'),
        ('CIVILIZATION_NTF_NEZ_PERCE',  'TXT_KEY_CITY_NAME_NTF_NEZ_PERCE_UMATILLA');			

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_0'),	
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_1'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_2'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_3'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_4'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_5'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_6'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_7'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_8'),
			('CIVILIZATION_NTF_NEZ_PERCE', 	'TXT_KEY_SPY_NAME_NTF_NEZ_PERCE_9');
--==========================================================================================================================	
--==========================================================================================================================	
