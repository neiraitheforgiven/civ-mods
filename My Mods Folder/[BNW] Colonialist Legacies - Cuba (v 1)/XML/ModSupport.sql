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
VALUES  ('LEADER_CL_UC_CASTRO',    'POLICY_AGGRESSIVE_X',  'POLICY_CHARISMATIC_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = 'Castro [ICON_WAR][ICON_HAPPINESS_1]'
WHERE TYPE = 'LEADER_CL_UC_CASTRO'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------ 
UPDATE Civilizations
SET ArtStyleSuffix = '_BRAZIL'
WHERE TYPE = 'CIVILIZATION_CL_UC_CUBA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_BRAZIL');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    149,    51);
------------------------------------------------------------   
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',        28, 44);
------------------------------------------------------------   
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    8,  27);
------------------------------------------------------------   
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    21, 37);
------------------------------------------------------------   
-- Civilizations_AmericasStartPosition
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    44, 44);
------------------------------------------------------------   
-- Civilizations_CaribbeanStartPosition
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
        (TYPE,                          X,  Y)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    31, 36);
--------------------------------------------------
------------------------------------------------------------   
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CL_UC_CUBA', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CL_UC_CUBA', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CL_UC_CUBA', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_EastAsiaRequestedResource (East Asia)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CL_UC_CUBA', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CL_UC_CUBA', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------ 
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,                       CultureType,                CultureEra)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    'MOD_TP_MESO_AMERICAN',   'ANY');
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
    CivilizationType                            text    REFERENCES Civilizations(TYPE)          DEFAULT NULL,
    CultureType                                 text                                            DEFAULT NULL,
    ArtDefineTag                                text                                            DEFAULT NULL,
    IdealsTag                                   text                                            DEFAULT NULL,
    SplashScreenTag                             text                                            DEFAULT NULL,
    SoundtrackTag                               text                                            DEFAULT NULL,
    UnitDialogueTag                             text                                            DEFAULT NULL);
 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,          ArtDefineTag, CultureType,   IdealsTag,     SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_CL_UC_CUBA', ArtDefineTag, CultureType,   IdealsTag,     SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------ 
-- Civilizations
------------------------------ 
UPDATE Civilizations
SET SoundtrackTag = 'JFD_Colonial'
WHERE TYPE = 'CIVILIZATION_CL_UC_CUBA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE TYPE = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND VALUE = 1);
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
VALUES  ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_MERCENARY',     8);
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
SELECT  'CIVILIZATION_CL_UC_CUBA', 'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_CL_UC_CUBA',    'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA',    'GOVERNMENT_JFD_REPUBLIC',  100
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, 				UniqueName)
VALUES	('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_CONSERVATIVE',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_CL_UC_CUBA');
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_LIBERAL',	'TXT_KEY_JFD_PARTY_JFD_LIBERAL_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_COMMUNIST',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_CLERGY',	'TXT_KEY_JFD_PARTY_JFD_CLERGY_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA',	'PARTY_JFD_FASCIST',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_CL_UC_CUBA'),
		('CIVILIZATION_CL_UC_CUBA', 'PARTY_JFD_SOCIALIST', 'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_CL_UC_CUBA');
------------------------------------------------------------   
-- Civilization_JFD_HeadsOfGovernment  
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (   
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    HeadOfGovernmentName            text                                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,              HeadOfGovernmentName)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_1'),
        ('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_2'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_3'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_4'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_5'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_6'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_7'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_8'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_9'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_10'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_11'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_12'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_13'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_14'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_15'),
	('CIVILIZATION_CL_UC_CUBA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_16');
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
VALUES  ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_GOVERNMENT',     1),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_CULTURE',        3),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_ECONOMIC',       6),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_FOREIGN',        7),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_INDUSTRY',       4),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_MILITARY',       8),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_REFORM_RELIGION',       5),
        ('LEADER_CL_UC_CASTRO',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE', 5);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(TYPE)  DEFAULT NULL,
    CurrencyType                    text                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,          CurrencyType)
VALUES  ('CIVILIZATION_CL_UC_CUBA',    'TXT_KEY_JFD_CURRENCY_CIVILIZATION_CL_UC_CUBA_1');

--Language_en_US

insert into Language_en_US (Tag, Text)
values 

('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_1', 'Raúl Castro'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_2', 'Osvaldo Dorticós Torrado'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_3', 'Manuel Urrutia Lleó'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_4', 'Carlos Manuel Piedra'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_5', 'Anselmo Alliegro y Milá'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_6', 'Fulgencio Batista'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_7', 'Ramón Grau'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_8', 'Carlos Prío Socarrás'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_9', 'Federico Laredo Brú'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_10', 'Miguel Mariano Gómez'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_11', 'José Agripino Barnet'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_12', 'Carlos Mendieta'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_13', 'Manuel Márquez Sterling'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_14', 'Carlos Hevia'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_15', 'Carlos Manuel de Céspedes'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CL_UC_CUBA_16', 'Tomás Estrada Palma'),
('TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_CL_UC_CUBA', 'Partido Auténtico'),
('TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_CL_UC_CUBA', 'Partido Ortodoxo'),
('TXT_KEY_JFD_PARTY_JFD_LIBERAL_CL_UC_CUBA', 'Partido Solidaridad Democratica'),
('TXT_KEY_JFD_PARTY_JFD_COMMUNIST_CL_UC_CUBA', 'Partido Communista de Cuba'),
('TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_CL_UC_CUBA', 'Movimiento Libertario'),
('TXT_KEY_JFD_PARTY_JFD_CLERGY_CL_UC_CUBA', 'Babalao'),
('TXT_KEY_JFD_PARTY_JFD_FASCIST_CL_UC_CUBA', 'Los Pichy Boys'),
('TXT_KEY_JFD_CURRENCY_CIVILIZATION_CL_UC_CUBA_1', 'Peso'),
('TXT_KEY_JFD_PARTY_JFD_SOCIALIST_CL_UC_CUBA', 'Partido Socialista Popular');