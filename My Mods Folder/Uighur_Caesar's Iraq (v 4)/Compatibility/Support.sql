--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_IRAQ',	42,	51);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_IRAQ',	76, 48);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_IRAQ',	49,	21);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('IraqDecisions.lua');
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
SELECT	'CIVILIZATION_IRAQ',	ArtDefineTag, 'JFD_Islamic', 'JFD_Islamic',	'JFD_Islamic',	 SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Islamic'
WHERE Type = 'CIVILIZATION_IRAQ'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
VALUES	('LEADER_FAISAL',	'FLAVOR_JFD_MERCENARY',		3);
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
SELECT	'CIVILIZATION_IRAQ',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ',	'GOVERNMENT_JFD_MONARCHY',	80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_IRAQ';
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
VALUES  ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_1'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_2'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_3'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_4'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_5'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_6'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_7'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_8'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_9'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_10'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_11'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_12'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_13'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_14'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_15'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_16'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_17'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_18'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_19'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_20'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_21'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_22'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_23'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_24'),
        ('CIVILIZATION_IRAQ',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_IRAQ_25');
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
VALUES	('CIVILIZATION_IRAQ',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_IRAQ',				0),
		('CIVILIZATION_IRAQ',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT_IRAQ',		0),
		('CIVILIZATION_IRAQ',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_IRAQ',			0),
		('CIVILIZATION_IRAQ',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_IRAQ',				0);
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				PoliticsType,				UniqueName)
VALUES	('CIVILIZATION_IRAQ',	'PARTY_JFD_CONSERVATIVE',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_IRAQ');
		('CIVILIZATION_IRAQ',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_IRAQ'),
		('CIVILIZATION_IRAQ',	'PARTY_JFD_LIBERAL',	'TXT_KEY_JFD_PARTY_JFD_LIBERAL_IRAQ'),
		('CIVILIZATION_IRAQ',	'PARTY_JFD_COMMUNIST',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_IRAQ'),
		('CIVILIZATION_LIRAQ',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_IRAQ'),
		('CIVILIZATION_IRAQ',	'PARTY_JFD_FASCIST',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_IRAQ'),
		('CIVILIZATION_IRAQ', 'PARTY_JFD_SOCIALIST', 'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_IRAQ');
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
VALUES	('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_CULTURE',		6),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_FOREIGN',		5),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_INDUSTRY',		7),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_MILITARY',		4),
		('LEADER_FAISAL',	'FLAVOR_JFD_REFORM_RELIGION',		8),
		('LEADER_FAISAL',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	7);
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
SELECT	'CIVILIZATION_IRAQ',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
--==========================================================================================================================
 --=======================================================================================================================
-- Leader_Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
            (LeaderType,                    TraitOne,                   TraitTwo)
VALUES      ('LEADER_FAISAL',          'POLICY_SPIRITUAL_X',      'POLICY_EXPANSIVE_X');
--==========================================================================================================================
--		Reference table for text keys. Use these to keep Leader names accurate.
--		[ICON_WAR] Aggressive
--		[ICON_HAPPINESS_1] Charismatic
--		[ICON_CULTURE] Creative
--		[ICON_INFLUENCE] Diplomatic
--		[ICON_FOOD] Expansive
--		[ICON_TRADE] Financial
--		[ICON_CITY_STATE] Imperialistic
--		[ICON_PRODUCTION] Industrious
--		[ICON_RESEARCH] Inventive
--		[ICON_GOLD] Mercantile
--		[ICON_GREAT_PEOPLE] Philosophical
--		[ICON_STRENGTH] Protective
--		[ICON_GREAT_EXPLORER] Seafaring
--		[ICON_PEACE] Spiritual
--==========================================================================================================================
UPDATE [Language_en_US] SET Text = 'Faisal[ICON_PEACE][ICON_FOOD]' WHERE Tag = 'TXT_KEY_LEADER_FAISAL';
