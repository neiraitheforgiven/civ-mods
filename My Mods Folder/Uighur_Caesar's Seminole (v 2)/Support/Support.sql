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
        (LeaderType,                TraitOne,               TraitTwo)
VALUES  ('LEADER_UC_MICANOPY',    'POLICY_PROTECTIVE_X',  'POLICY_EXPANSIVE_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = 'Micanopy [ICON_STRENGTH][ICON_FOOD]'
WHERE TYPE = 'LEADER_UC_MICANOPY'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PROTECTIVE_X');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('SeminoleDecisions.lua');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------ 
UPDATE Civilizations
SET ArtStyleSuffix = '_IROQUOIS'
WHERE TYPE = 'CIVILIZATION_UC_SEMINOLE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_UC_SEMINOLE',    154,    4);
------------------------------------------------------------   
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_UC_SEMINOLE',        32, 5);
------------------------------------------------------------   
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_UC_SEMINOLE',    17,  3);
------------------------------------------------------------   
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_UC_SEMINOLE',    24, );
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------ 
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,                       CultureType,                CultureEra)
VALUES  ('CIVILIZATION_UC_SEMINOLE',    'MOD_NORTH_AMERICA',   'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS
JFD_GlobalUserSettings (
    TYPE                                            text                                        DEFAULT NULL,
    VALUE                                           INTEGER                                     DEFAULT 1);
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
SELECT	'CIVILIZATION_UC_SEMINOLE',	ArtDefineTag, CultureType, IdealsTag,	SplashScreenTag,	 SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_TribalAmerican'
WHERE Type = 'CIVILIZATION_UC_SEMINOLE';
--==========================================================================================================================   
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------   
INSERT INTO Leader_Flavors
        (LeaderType,                        FlavorType,                 Flavor)
VALUES  ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_MERCENARY',     6);
--==========================================================================================================================   
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================   
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    LegislatureName                 text                                                        DEFAULT NULL,
    OfficeTitle                     text                                                        DEFAULT NULL,
    GovernmentType                  text                                                        DEFAULT NULL,
    Weight                          INTEGER                                                     DEFAULT 0);
 
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName,                                            OfficeTitle,                                                        GovernmentType,             Weight)
SELECT  'CIVILIZATION_UC_SEMINOLE', 'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_UC_SEMINOLE',    'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_SEMINOLE',    'GOVERNMENT_JFD_REPUBLIC',  100
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
------------------------------------------------------------           
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
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
        (LeaderType,                FlavorType,                         Flavor)
VALUES  ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_GOVERNMENT',     8),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_CULTURE',        8),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_ECONOMIC',       6),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_FOREIGN',        6),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_INDUSTRY',       5),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_MILITARY',       9),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_REFORM_RELIGION',       5),
        ('LEADER_UC_MICANOPY',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE', 3);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_MAHOMA'
WHERE CivilizationType = 'CIVILIZATION_UC_SEMINOLE'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_MAHOMA');