--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 						ShortDescription, 				Adjective, 								CivilopediaTag, 						DefaultPlayerColor, 			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 								DawnOfManImage,				DawnOfManAudio)
SELECT		('CIVILIZATION_MC_NTF_SENECA'), 	('TXT_KEY_MC_NTF_SENECA_DESC'), 	('TXT_KEY_MC_NTF_SENECA'),		('TXT_KEY_MC_NTF_SENECA_ADJECTIVE'), 	('TXT_KEY_CIVLOPEDIA_MC_NTF_SENECA'),	('PLAYERCOLOR_MC_NTF_SENECA'), 	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('MC_NTF_SENECA_ATLAS'), 	0, 				('MC_NTF_SENECA_ALPHA_ATLAS'), ('Iroquois'), 	('MC_NTF_SENECA_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_MC_NTF_SENECA_TEXT'), 	('MC_NTF_SENECA_DoM.dds'),	('AS2D_DOM_SPEECH_MC_NTF_SENECA')
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'LEADER_MC_NTF_CORNPLANTER');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType,			UnitType)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'UNITCLASS_MUSKETMAN',	'UNIT_MC_NTF_SENECA_SWIFT_STRIKE');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_MC_NTF_SENECA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 		Green, 		Blue, 		Alpha)
VALUES		('COLOR_PLAYER_MC_NTF_SENECA_ICON', 		1,			0.792,		0.545,		1),
			('COLOR_PLAYER_MC_NTF_SENECA_BACKGROUND',	0.212,		0.090,		0.365,		1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_MC_NTF_SENECA',	'COLOR_PLAYER_MC_NTF_SENECA_ICON', 'COLOR_PLAYER_MC_NTF_SENECA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_GANONDAGAN'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_NUNDAWAO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_GENUNDOWA'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KANAWAGAS'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_CHENUSSIO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KAYAHSUTOKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_OHIO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KAOTO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_THANONOKEO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_ONOTAKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KATAEAEKESKEO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TOSYOWE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_THANOWOTE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TKETSOA'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TYOETSESYO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_SKANEHTATI'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_WASTOKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KASTEEKO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KANYEKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KANOWOKO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TSYOKOWOTI'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_SWEKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KAYAHAKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TSYONESHIYO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TYOSSKWAEAETASE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_KANOKTIYOKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_HEYOOKE'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TWASKO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_HATEYOYAYAKTO'),
		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_CITY_NAME_MC_NTF_SENECA_TYONOHSATEKE');			

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_0'),	
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_1'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_2'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_3'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_4'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_5'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_6'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_7'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_8'),
			('CIVILIZATION_MC_NTF_SENECA', 	'TXT_KEY_SPY_NAME_MC_NTF_SENECA_9');
--==========================================================================================================================	
--==========================================================================================================================	
