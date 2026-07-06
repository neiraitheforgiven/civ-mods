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
        (LeaderType,              TraitOne,					TraitTwo)
SELECT  'LEADER_SHEIKH_ZAYED',   'POLICY_PHILOSOPHICAL_X',	'POLICY_SEAFARING_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Sheikh Zayed [ICON_GOLD][ICON_PRODUCTION]'
WHERE Type = 'LEADER_SHEIKH_ZAYED'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ARABIA'
WHERE Type = 'CIVILIZATION_UAE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA');
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,													X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_UAE',					            	48,		43,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,													X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_UAE',					            	79,		43,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,													X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_UAE',					            	53,		18,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,													X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_UAE',					            	69,		34,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_UAE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_UAE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_UAE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_UAE'),	            Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType, 								CultureType, CultureEra)
SELECT	'CIVILIZATION_UAE',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--====================================	
-- JFD COLONIES
--====================================	
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,						LinguisticType, ColonyName)
SELECT	'CIVILIZATION_UAE',						LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,						Flavor)
VALUES	('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_DECOLONIZATION',	7);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,						DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_UAE',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,				Flavor)
VALUES	('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_SLAVERY',		8);
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
		(CivilizationType,						ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_UAE',						ArtDefineTag, CultureType,	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD AND POUAKAI MERCENARIES
--====================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_MERCENARY',		9);
--====================================	
-- JFD PIETY
--====================================	
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_STATE_RELIGION',			8);
--====================================
-- JFD PROSPERITY
--====================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,						CurrencyType)
SELECT	'CIVILIZATION_UAE',						CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--====================================	
-- JFD SOVEREIGNTY
--====================================	
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
		(CivilizationType,				LegislatureName, 										OfficeTitle,													GovernmentType,				Weight)
VALUES	('CIVILIZATION_UAE',			'TXT_KEY_US_LEGISLATURE_NAME_CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE',			'GOVERNMENT_JFD_MONARCHY',	60);
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
VALUES  ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_1'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_2'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_3'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_4'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_5'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_6'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_7'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_8'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_9'),
        ('CIVILIZATION_UAE',			'TXT_KEY_US_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UAE_10');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	CultureType							text 		 											default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle						text 		 											default null,
	UniqueTitle							text 		 											default null,
	UseAdjective						boolean													default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle,											UniqueTitle,												UseAdjective)
VALUES	('CIVILIZATION_UAE',			'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_US_DICTATORSHIP_TITLE_GOVERNMENT_UAE',	0),	
		('CIVILIZATION_UAE',			'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_US_DICTATORSHIP_TITLE_LEADER_UAE',		0),	
		('CIVILIZATION_UAE',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_US_MONARCHY_TITLE_GOVERNMENT_UAE',		0),
		('CIVILIZATION_UAE',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_US_MONARCHY_TITLE_LEADER_UAE',			0);
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  					text 										 	default null,
	PolicyType  							text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text	REFERENCES Civilizations(Type) 			default	null,
	CultureType								text											default	null,
	GovernmentType  						text 	 										default null,
	ReligionType							text	REFERENCES Religions(Type) 				default	null,
	UniqueName								text											default	null);

INSERT INTO JFD_PrivyCouncillor_UniqueNames
		(CivilizationType,			PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_UAE',			PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName,												PoliticsType)
VALUES	('CIVILIZATION_UAE',			'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_UAE',				'ASSEMBLY_JFD_MILITARY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_UAE',				'FACTION_JFD_NATIONALIST'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_FACTION_JFD_POPULARIST_UAE',				'FACTION_JFD_POPULARIST'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_UAE',				'FACTION_JFD_REVOLUTIONARY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_BURGHERS_UAE',					'PARTY_JFD_BURGHERS'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_CLERGY_UAE',						'PARTY_JFD_CLERGY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_UAE',					'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_UAE',				'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_FASCIST_UAE',					'PARTY_JFD_FASCIST'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_LIBERAL_UAE',					'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_UAE',				'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_NOBILITY_UAE',					'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_REACTIONARY_UAE',				'PARTY_JFD_REACTIONARY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_UAE',				'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_UAE',			'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_UAE',					'PARTY_JFD_SOCIALIST');
------------------------------------------------------------			
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
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 8),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_LEGAL',			 9),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_ECONOMIC',		 10),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_FOREIGN',		 6),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_SHEIKH_ZAYED',	'FLAVOR_JFD_REFORM_RELIGION',		 4);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,				ReformType)
VALUES	('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_LEGITIMACY_MIGHT'),
		('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_STATE_EMPIRE'),
		('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_CONSTITUTION_CODIFIED'),
		('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_POWER_HARD'),
		('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_CONQUEST_SUBJUGATION'),
		('LEADER_SHEIKH_ZAYED',	'REFORM_JFD_RECRUITMENT_PROFESSIONAL');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('UAE_Decisions.lua');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_ISLAM'
WHERE CivilizationType = 'CIVILIZATION_UAE'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_PESEDJET');
--==========================================================================================================================
--==========================================================================================================================