--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------  
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
      
INSERT OR REPLACE INTO Leader_SharedTraits
        (LeaderType,                TraitOne,               TraitTwo)
VALUES  ('LEADER_LEVSKI',      'POLICY_CHARISMATIC_X', 'POLICY_PROTECTIVE_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
    THEN 'Vasil Levski [ICON_HAPPINESS_1][ICON_STRENGTH]'
    ELSE 'TXT_KEY_LEADER_LEVSKI' END) 
WHERE Type = 'LEADER_LEVSKI';
 
CREATE TRIGGER CivIVTraitsBulgaria
AFTER INSERT ON Leaders WHEN 'LEADER_LEVSKI' = NEW.Type
BEGIN
    UPDATE Leaders 
    SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
        THEN 'Vasil Levski [ICON_HAPPINESS_1][ICON_STRENGTH]'
        ELSE 'TXT_KEY_LEADER_LEVSKI' END) 
    WHERE Type = 'LEADER_LEVSKI';
END;        
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_EURO' )
    THEN '_POLAND'
    ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_FB_BULGARIA';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_FB_BULGARIA',					30,		62,		null,	null);		
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_FB_BULGARIA',					67,		55,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_FB_BULGARIA',					43,		26,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_FB_BULGARIA',					56,		47,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_FB_BULGARIA',					52,		34,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_FB_BULGARIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_FB_BULGARIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_FB_BULGARIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_FB_BULGARIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europea Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_FB_BULGARIA'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,               CultureType,        CultureEra)
VALUES  ('CIVILIZATION_FB_BULGARIA', 'SLAVIC',    'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    CultureType                                 text                                        default null,
    SplashScreenTag                             text                                        default null,
    SoundtrackTag                               text                                        default null);
 
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
        (CivilizationType,      CultureType,            SplashScreenTag,        SoundtrackTag)
VALUES  ('CIVILIZATION_FB_BULGARIA', 'JFD_Eastern',    'JFD_Eastern',    'JFD_Eastern');
------------------------------  
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Eastern' )
    THEN 'JFD_Eastern'
    ELSE 'Greece' END) 
WHERE Type = 'CIVILIZATION_FB_BULGARIA';
--==========================================================================================================================    
-- JFD's Piety & Prestige
--==========================================================================================================================            
-- Flavors
------------------------------  
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                          Flavor)
VALUES  ('LEADER_LEVSKI',  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',  5);
--==========================================================================================================================    
-- Tomatekh's Historical Religions
--==========================================================================================================================            
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HELLENISM' )
    THEN 'RELIGION_ORTHODOXY'
    ELSE 'RELIGION_ORTHODOXY' END) 
WHERE Type = 'CIVILIZATION_FB_BULGARIA';
 
CREATE TRIGGER ReligionFB_BULGARIA
AFTER INSERT ON Religions WHEN 'RELIGION_ORTHODOXY' = NEW.Type
BEGIN
    UPDATE Civilizations 
    SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ORTHODOXY' )
        THEN 'RELIGION_ORTHODOXY'
        ELSE 'RELIGION_ORTHODOXY' END) 
    WHERE Type = 'CIVILIZATION_FB_BULGARIA';
END;    
--==========================================================================================================================
--==========================================================================================================================

