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
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);
	
				
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, 			CultureType, 			IdealsTag, 				SplashScreenTag, 		SoundtrackTag)
VALUES	('CIVILIZATION_CLCOASTSALISH',	'JFD_TribalAmerican',	'JFD_TribalAmerican',	'JFD_TribalAmerican',	'JFD_TribalAmerican',	'JFD_TribalAmerican');

UPDATE Civilization_JFD_CultureTypes
SET ArtDefineTag = 'JFD_Pacific', CultureType = 'JFD_Pacific', IdealsTag = 'JFD_Pacific', SplashScreenTag = 'JFD_Pacific', SoundtrackTag = 'JFD_Pacific'
WHERE CivilizationType = 'CIVILIZATION_CLCOASTSALISH' AND EXISTS (SELECT * FROM JFD_CultureTypes WHERE Type = 'JFD_Pacific');

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_TribalAmerican'
WHERE Type = 'CIVILIZATION_CLCOASTSALISH'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_TribalAmerican');

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Pacific'
WHERE Type = 'CIVILIZATION_CLCOASTSALISH'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------ 
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,                                                               CultureType,            CultureEra)
VALUES  ('CIVILIZATION_CLCOASTSALISH',      'TP_CANADIAN',  'ANY');
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
       (LeaderType,         TraitOne,					TraitTwo)
VALUES ('LEADER_CL_SHAKES', 'POLICY_CHARISMATIC_X',		'POLICY_FINANCIAL_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = (CASE WHEN EXISTS(SELECT TYPE FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X')
        THEN 'Sheiyksh I [ICON_HAPPINESS_1][ICON_GOLD]'
        ELSE 'TXT_KEY_LEADER_CL_SHAKES' END)
WHERE TYPE = 'LEADER_CL_SHAKES';
 
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
 
INSERT INTO Civilization_Religions
        (CivilizationType,                      ReligionType)
VALUES  ('CIVILIZATION_CLCOASTSALISH',              'RELIGION_CATHOLICISM');
 
UPDATE Civilization_Religions SET ReligionType =
        ( CASE WHEN EXISTS(SELECT TYPE FROM Religions WHERE TYPE="RELIGION_CATHOLICISM" )
                THEN "RELIGION_CATHOLICISM"
                ELSE "RELIGION_CATHOLICISM" END
        ) WHERE CivilizationType = "CIVILIZATION_CLCOASTSALISH";
 
CREATE TRIGGER ColonialistLegaciesSalishReligion
AFTER INSERT ON Religions WHEN 'RELIGION_CATHOLICISM' = NEW.TYPE
BEGIN
        UPDATE Civilization_Religions
        SET ReligionType = 'RELIGION_CATHOLICISM'
        WHERE CivilizationType IN ('CIVILIZATION_CLCOASTSALISH');
END;
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS
Civilization_JFD_ColonialCityNames (
        CivilizationType                                                        text    REFERENCES Civilizations(TYPE)          DEFAULT NULL,
        ColonyName                                                                      text                                                                            DEFAULT NULL,
        LinguisticType                                                          text                                                                            DEFAULT NULL,
        CultureType                                                                     text                                                                            DEFAULT NULL);
 
INSERT INTO Civilization_JFD_ColonialCityNames
                (CivilizationType,                                              ColonyName,                                                             LinguisticType)
VALUES          ('CIVILIZATION_CLCOASTSALISH',                      NULL,                                                                   'JFD_NorthAmerican');
--==========================================================================================================================   
-- JFD's and Pouakai's MERCENARIES
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
                (LeaderType,    FlavorType,                                     Flavor)
VALUES  ('LEADER_CLSEATTLE',	'FLAVOR_JFD_MERCENARY',         8);
--==========================================================================================================================   
-- JFD's PIETY
--==========================================================================================================================   
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
 
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                                     Flavor)
VALUES  ('LEADER_CLSEATTLE',        'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',             5),
		('LEADER_CLSEATTLE',        'FLAVOR_JFD_STATE_RELIGION',					5);
--==========================================================================================================================
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  CurrencyType)
SELECT  ('CIVILIZATION_CLCOASTSALISH'),		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SHOSHONE'; 
--==========================================================================================================================   
-- JFD's SOVEREIGNTY
--==========================================================================================================================
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
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
        (LeaderType,                FlavorType,						        Flavor)
VALUES	('LEADER_CLSEATTLE',		'FLAVOR_JFD_REFORM_GOVERNMENT',			5),
		('LEADER_CLSEATTLE',		'FLAVOR_JFD_REFORM_LEGAL',				6),
        ('LEADER_CLSEATTLE',        'FLAVOR_JFD_REFORM_CULTURE',            5),
        ('LEADER_CLSEATTLE',        'FLAVOR_JFD_REFORM_ECONOMIC',           7),
        ('LEADER_CLSEATTLE',        'FLAVOR_JFD_REFORM_FOREIGN',            5),
        ('LEADER_CLSEATTLE',        'FLAVOR_JFD_REFORM_INDUSTRY',           7),
        ('LEADER_CLSEATTLE',        'FLAVOR_JFD_REFORM_RELIGION',           6);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_IROQUOIS'
WHERE Type = 'CIVILIZATION_CLCOASTSALISH'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS');
--==========================================================================================================================           
--==========================================================================================================================