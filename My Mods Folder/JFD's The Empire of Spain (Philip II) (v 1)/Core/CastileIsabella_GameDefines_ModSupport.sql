--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE PATCH
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--------------------------------
-- Units
--------------------------------
UPDATE Units 
SET Strategy = 'TXT_KEY_UNIT_JFD_CONQUISTADOR_STRATEGY_CBO'
WHERE Type = 'UNIT_SPANISH_CONQUISTADOR'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_UNITS' AND Value = 1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_SPAIN'
WHERE Type = 'CIVILIZATION_JFD_CASTILE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_SPAIN');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	8,	57);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	54,	53);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	31,	23);
------------------------------------------------------------	
-- Civilizations_EarthStandardStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EarthStandardStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EarthStandardStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	37,	42);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	36,	37);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	14,	37);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	18,	28);
------------------------------------------------------------	
-- Civilizations_NorthSeaEuropeStartPosition (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	15,	21);
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	10,	40);
------------------------------------------------------------	
-- Civilizations_CaribbeanStartPosition (Caribbean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CaribbeanStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		X,	Y
FROM Civilizations_CaribbeanStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_JFD_CASTILE',	85,	8);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		X,	Y
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (Americas Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasGiantStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		X,	Y
FROM Civilizations_AmericasGiantStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_WestAfricaStartPosition (West Africa)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_WestAfricaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_WestAfricaStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		35,	79
FROM Civilizations_WestAfricaStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition (Africa and South Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		17,	68
FROM Civilizations_AfriSouthEuroStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia, Oceania)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_JFD_CASTILE',		15,	73
FROM Civilizations_AfriAsiaAustStartPosition WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Europe Large (new))
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeNewRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_CaribbeanRequestedResource (Caribbean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CaribbeanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CaribbeanRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CaribbeanRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilizations_AmericasGiantRequestedResource (Americas Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CASTILE',		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasGiantRequestedResource WHERE Type = 'CIVILIZATION_SPAIN';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_JFD_CASTILE',		CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SPAIN';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
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
		(CivilizationType,				LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_CASTILE',		LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_SPAIN';
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
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_JFD_CASTILE',		DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_SPAIN';
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
		(CivilizationType,				ArtDefineTag, CultureType,		DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag,  UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_CASTILE',		ArtDefineTag, 'JFD_Southern',	DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, 'JFD_Southern',  'JFD_Southern', UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SPAIN';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Southern'
WHERE Type = 'CIVILIZATION_JFD_CASTILE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Southern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD PIETY
--====================================	
-- Units
------------------------------------------------------------	
UPDATE Units
SET Help = 'TXT_KEY_UNIT_JFD_JINETES_HELP_PIETY', Strategy = 'TXT_KEY_UNIT_JFD_JINETES_STRATEGY_PIETY'
WHERE Type = 'UNIT_JFD_JINETES'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES' AND Value = 1);
------------------------------------------------------------
-- Traits
------------------------------------------------------------	
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_CASTILE_PIETY'
WHERE Type = 'TRAIT_JFD_CASTILE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES' AND Value = 1);
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
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_JFD_CASTILE',		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_SPAIN';
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
		(CivilizationType,				LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_CASTILE',		LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_SPAIN';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,				HeadOfGovernmentName)
SELECT	'CIVILIZATION_JFD_CASTILE',		HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_SPAIN';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_CASTILE',		PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_SPAIN';
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
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_JFD_CASTILE',		DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_SPAIN';
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Castile_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,								CapitalUnhappinessMod,	HappinessPerTradeRoute,		Description)
VALUES	('POLICY_DECISIONS_JFD_CASTILE',	-15,					100,						'TXT_KEY_DECISIONS_JFD_CASTILE_SPAIN');
--==========================================================================================================================
--==========================================================================================================================