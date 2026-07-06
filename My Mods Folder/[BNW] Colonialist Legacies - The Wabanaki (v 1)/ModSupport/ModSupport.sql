--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,               TraitTwo)
VALUES  ('LEADER_CLMEMBERTOU', 	'POLICY_SEAFARING_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Henri Membertou [ICON_GREAT_EXPLORER][ICON_PEACE]'
WHERE Type = 'LEADER_CLMEMBERTOU'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_IROQUOIS'
WHERE Type = 'CIVILIZATION_CLWABANAKI'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,				CultureEra)
VALUES	('CIVILIZATION_CLWABANAKI',	'TP_CANADIAN',	'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,			LinguisticType, ColonyName)
SELECT	'CIVILIZATION_CLWABANAKI',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType,	 IdealsTag,		SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_CLWABANAKI',	ArtDefineTag, CultureType, IdealsTag,	SplashScreenTag,	 SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_TribalAmerican'
WHERE Type = 'CIVILIZATION_CLWABANAKI';
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,						FlavorType,					Flavor)
VALUES	('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_MERCENARY',		4);
--==========================================================================================================================	
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			LegislatureName,											OfficeTitle,														GovernmentType,				Weight)
SELECT	'CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI',	'GOVERNMENT_JFD_MONARCHY',	80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_1'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_2'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_3'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_4'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_5'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_6'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_7'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_8'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_9'),
        ('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_10'),
		('CIVILIZATION_CLWABANAKI',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CLWABANAKI_11');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle,											UniqueTitle,															UseAdjective)
VALUES	('CIVILIZATION_CLWABANAKI',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_CLWABANAKI',				0),
		('CIVILIZATION_CLWABANAKI',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_CLWABANAKI',			0),
		('CIVILIZATION_CLWABANAKI',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_CLWABANAKI',				0);
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_GOVERNMENT',		3),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_CULTURE',		6),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_FOREIGN',		3),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_MILITARY',		6),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_REFORM_RELIGION',		3),
		('LEADER_CLMEMBERTOU',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	3);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_CLWABANAKI',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
--==========================================================================================================================
--==========================================================================================================================