--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------  
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,              TraitOne,              	TraitTwo)
SELECT  'LEADER_MC_ARETAS',       'POLICY_MERCANTILE_X',	'POLICY_FINANCIAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'ARETAS III [ICON_CONNECTED][ICON_GOLD]'
WHERE TYPE = 'LEADER_MC_ARETAS'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_MC_NABATEA', 			null,									'JFD_Arabic');
--==========================================================================================================================	
-- JFD's CITIES IN DEVELOPMENT: SLAVERY (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	('LEADER_MC_ARETAS',	'FLAVOR_JFD_SLAVERY',		7);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_NABATEA',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Arabic'
WHERE Type = 'CIVILIZATION_MC_NABATEA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Arabic');
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	('LEADER_MC_ARETAS',	'FLAVOR_JFD_MERCENARY',				7);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_MC_ARETAS',			'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_MC_NABATEA',			CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_GREECE';	
--==========================================================================================================================	
-- JFD's RISE TO POWER: SOVEREIGNTY (eea66053-7579-481a-bb8d-2f3959b59974)
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

--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (if a Const. Monarchy) (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						GovernmentType, 			Weight)
VALUES	('CIVILIZATION_MC_NABATEA',				'GOVERNMENT_JFD_MONARCHY', 		100);
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
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_GOVERNMENT',		7),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_CULTURE',		2),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_ECONOMIC',		3),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_FOREIGN',		5),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_MILITARY',		5),
		('LEADER_MC_ARETAS',	'FLAVOR_JFD_REFORM_RELIGION',		7);
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA' )
    THEN '_ARABIA'
    ELSE '_AFRI' END)
WHERE TYPE = 'CIVILIZATION_MC_NABATEA';
--==========================================================================================================================
-- RYOGA's UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES(
		'TXT_KEY_GENERIC_MC_NABATEA_INFLUENTIAL_ON_AI_1',
		'Our people are now moving into deserts and carving everything into cliffs of stone. I worry the rest of the world will also succumb to the influence of your culture.'
	);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,			CultureEra)
VALUES	('CIVILIZATION_MC_NABATEA',		'ARABIAN',				'ANY');
--=======================================================================================================================	
-- Historical Religions Support
--=======================================================================================================================	
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_AL_ASNAM'
WHERE CivilizationType = 'CIVILIZATION_MC_NABATEA' AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_AL_ASNAM');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,								CivilizationType,				CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_MC_NABATEA_01',		'CIVILIZATION_MC_NABATEA',		'JFD_Arabic');

INSERT INTO Language_en_US 
		(Tag, 										Text) 
VALUES	('TXT_KEY_EVENT_CULDEV_MC_NABATEA_01',		'Priests from {1_City}, have begun opting to use featureless pillars or blocks to represent their gods. They call these figures ''god blocks''.');

--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================	
-- Civilizations_YagemStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  37, 48);
  
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  74, 48);
  
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  48, 19);
  
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  63, 37);
  
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  47, 64);
  
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriAsiaAustRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_AfriGiantStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  97, 123);
  
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriGiantRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriGiantRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  58, 59);
  
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfriSouthEuroRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  135, 1);
  
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  61, 13);
  
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeNewStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  70, 3);
  
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeNewRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  91, 12);
  
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_MesopotamiaGiantStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaGiantStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  67, 39);
  
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaGiantRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaGiantRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_MesopotamiaStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  37, 12);
  
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
------------------------------------------------------------	
-- Civilizations_NileValleyStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
		(TYPE,						  X,  Y)
VALUES  ('CIVILIZATION_MC_NABATEA',	  65, 68);
  
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NileValleyRequestedResource
		(Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_NABATEA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NileValleyRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
--==========================================================================================================================