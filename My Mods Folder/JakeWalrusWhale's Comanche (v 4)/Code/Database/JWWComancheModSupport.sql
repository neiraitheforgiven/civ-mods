--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
--_AMERICA
--_ANTWERP
--_ARABIA
--_ASSYRIA
--_AUSTRIA
--_AZTEC
--_BABYLON
--_BRAZIL
--_BYZANTIUM
--_CARTHAGE
--_CELTS
--_CHINA
--_DENMARK
--_EGYPT
--_ENGLAND
--_ETHIOPIA
--_FRANCE
--_GARAMANTES
--_GERMANY
--_GREECE
--_HUNS
--_INCA
--_INDIA
--_INDONESIA
--_IROQUOIS
--_JAPAN
--_KOREA
--_LISBON
--_MAYA
--_MONGOL
--_SHOSHONE
--_NETHERLANDS
--_OTTOMAN
--_PERSIA
--_POLAND
--_PORTUGAL
--_POLYNESIA
--_ROME
--_RUSSIA
--_SHOSHONE
--_SIAM
--_SONGHAI
--_SPAIN
--_SWEDEN
--_SHOSHONE
--_VENICE

UPDATE Civilizations 
SET ArtStyleSuffix = '_SHOSHONE'
WHERE Type = 'CIVILIZATION_JWW_COMANCHE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_SHOSHONE');
--==========================================================================================================================
-- YnAEMP
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'Yagem',				139,	59),
		('CIVILIZATION_JWW_COMANCHE',	'Yahem',				19,		51),
		('CIVILIZATION_JWW_COMANCHE',	'Cordiform',			8,		34),
		('CIVILIZATION_JWW_COMANCHE',	'GreatestEarth',		8,		43),
		('CIVILIZATION_JWW_COMANCHE',	'EarthMk3',				134,	62),
		('CIVILIZATION_JWW_COMANCHE',	'Americas',				35,		52),
		('CIVILIZATION_JWW_COMANCHE',	'AmericasGiant',		41,		112),
		('CIVILIZATION_JWW_COMANCHE',	'AtlanticGiant',		41,		78),
		('CIVILIZATION_JWW_COMANCHE',	'NorthAmericaGiant',	60,		44),
		('CIVILIZATION_JWW_COMANCHE',	'NorthAmericaHuge',		63,		32);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JWW_COMANCHE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
--Any items entered into this table will not show in the Civilopedia. There is no technical limitation as to what can be hidden (I think).
--Note that this mod's functonality requires either JFD's Rise to Power or JFD's Conflict Resolution Patch (no references necessary).
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('UNIT_SHOSHONE_COMANCHE_RIDERS');

--The Civilopedia can also support Leaders be linked under a shared Civilization (e.g. Napoleon and Louis are linked to the France article).
--To do this, specify the shared Civilization as the 'DerivativeCiv' for your Civilization.
/*UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_RUSSIA'
WHERE Type = 'CIVILIZATION_JFD_RUSSIA_PUTIN';	*/

--Thanks to Sukritact, you can also fill 'DerivativeCiv' with a text string, which will group this civ with others that also have this text string.
UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_CIV_JWW_COMANCHE_SHORT_DESC'
WHERE Type = 'CIVILIZATION_JWW_COMANCHE';
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LAW'),
		('FLAVOR_JFD_REFORM_DIPLOMACY'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_REFORM_SOCIETY'),
		('FLAVOR_JFD_REFORM_WELFARE'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_DECOLONIZATION',		1),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_MERCENARY',				2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_GOVERNMENT',		3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_LAW',			5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_DIPLOMACY',		7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_ECONOMY',		3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_EDUCATION',		4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_RELIGION',		10),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_SOCIETY',		6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_REFORM_WELFARE',		7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_SLAVERY',				1),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_JFD_STATE_RELIGION',		9);	
--------------------------------------------------------------------------------------------------------------------------	
-- COLONIES
--------------------------------------------------------------------------------------------------------------------------	
--Colony specific city names. Only recommended for Civilizations that historically had colonies (personally, I also only do it for relevant leaders too), as CulDiv will handle the rest.
/*INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 				ColonyName)
VALUES	('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_01'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_02'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_03'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_04'),
		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_COLONY_NAME_JFD_SCOTLAND_05');*/
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
--Standard
--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--Special
--GOVERNMENT_JFD_IMPERIAL (Imperial Dynasty)
--GOVERNMENT_JFD_MERCHANT (Merchant League)
--GOVERNMENT_JFD_MILITARY (Military Dictatorship)
--GOVERNMENT_JFD_NOMADIC (Nomadic Horde)
--GOVERNMENT_JFD_MONASTIC (Monastic Order)
--GOVERNMENT_JFD_REVOLUTIONARY (Revolutionary State)
--GOVERNMENT_JFD_THEOCRATIC (Theocratic State - works with GOVERNMENT_JFD_THEOCRACY too)
--GOVERNMENT_JFD_TOTALITARIAN (Totalitarian Dictatorship - works with GOVERNMENT_JFD_DICTATORSHIP too)
--GOVERNMENT_JFD_TRIBAL (Tribal Confederacy)
--Unique
--GOVERNMENT_JFD_CALIPHATE
--GOVERNMENT_JFD_HOLY_ROMAN  (Holy Roman Empire - works with GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE)
--GOVERNMENT_JFD_MANDATE (Mandate of Heaven - works with GOVERNMENT_JFD_MANDATE_OF_HEAVEN)
--GOVERNMENT_JFD_MAMLUKE (Mamluke Sultanate)
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_SHOGUNATE

INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_JWW_COMANCHE', 	'GOVERNMENT_JFD_NOMADIC',	100);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);
/*
CultureTypes:
CULTURE_JFD_ABORIGINAL
CULTURE_JFD_AMAZONIAN
CULTURE_JFD_ANDEAN
CULTURE_JFD_BANTU
CULTURE_JFD_BHARATA
CULTURE_JFD_CENTRAL
CULTURE_JFD_CENTRAL_AFRICAN
CULTURE_JFD_CLASSICAL
CULTURE_JFD_COLONIAL
CULTURE_JFD_EASTERN
CULTURE_JFD_EAST_AFRICAN
CULTURE_JFD_EAST_INDIES
CULTURE_JFD_FAR_EASTERN
CULTURE_JFD_GREAT_PLAINS
CULTURE_JFD_HIMALAYAN
CULTURE_JFD_INDOCHINA
CULTURE_JFD_LEVANTINE
CULTURE_JFD_MESOAMERICAN
CULTURE_JFD_MESOPOTAMIC
CULTURE_JFD_MID_EASTERN
CULTURE_JFD_NORTHERN
CULTURE_JFD_OCEANIC
CULTURE_JFD_PACIFIC
CULTURE_JFD_POLAR
CULTURE_JFD_STEPPE
CULTURE_JFD_SOUTHERN
CULTURE_JFD_TOTALITARIAN
CULTURE_JFD_WEST_AFRICAN
CULTURE_JFD_WESTERN 
CULTURE_JFD_WOODLANDS

SubCultureType:
SUBCULTURE_JFD_CLASSICAL_ROMAN
SUBCULTURE_JFD_COLONIAL_AMERICAN
SUBCULTURE_JFD_COLONIAL_LATIN
SUBCULTURE_JFD_EAST_AFRICAN_ETHIOPIAN
SUBCULTURE_JFD_EASTERN_BYZANTINE
SUBCULTURE_JFD_MID_EASTERN_OTTOMAN
SUBCULTURE_JFD_FAR_EASTERN_JAPANESE
SUBCULTURE_JFD_STEPPE_TURKIC
SUBCULTURE_JFD_MESOPOTAMIC_EGYPTIAN
SUBCULTURE_JFD_MESOPOTAMIC_PERSIAN
SUBCULTURE_JFD_NORTHERN_CELTIC
SUBCULTURE_JFD_SOUTHERN_PAPAL
SUBCULTURE_JFD_WESTERN_BRITISH

Note: Due to a bug whereby JFD didn't listen to Chrisy earlier the original tag was prefixed CULTURE_SUB_JFD as opposed to the proper prefix of SUBCULTURE_JFD_ but that original method is still valid just in case (or will be).
  
SplashScreenTags (As above, unless otherwise specified):
As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
JFD_ClassicalRoman
JFD_ColonialAmerican
JFD_ColonialLatin
JFD_EastAfricanEthiopic
JFD_EasternByzantine
JFD_FarEasternJapanese
JFD_MesopotamicPersian
JFD_MidEasternOttoman
JFD_MesopotamicEgyptian
JFD_NorthernCeltic
JFD_SouthernPapal
JFD_SteppeTurkic
JFD_WesternBritish
  
SoundtrackTag (As above, unless otherwise specified):
As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
JFD_ClassicalRoman
JFD_ColonialAmerican
JFD_ColonialLatin
JFD_EastAfricanEthiopic
JFD_EasternByzantine
JFD_FarEasternJapanese
JFD_MesopotamicPersian
JFD_MidEasternOttoman
JFD_MesopotamicEgyptian
JFD_NorthernCeltic
JFD_SouthernPapal
JFD_SteppeTurkic
JFD_WesternBritish
  
UnitDialogueTag:
AS2D_SOUND_JFD_AMERICAN
AS2D_SOUND_JFD_AMERICAN_WEST
AS2D_SOUND_JFD_ALBANIAN*
AS2D_SOUND_JFD_ARABIC
AS2D_SOUND_JFD_AZTEC
AS2D_SOUND_JFD_BABYLONIAN
AS2D_SOUND_JFD_BERBER*
AS2D_SOUND_JFD_BURMESE
AS2D_SOUND_JFD_BYZANTINE
AS2D_SOUND_JFD_CARTHAGINIAN
AS2D_SOUND_JFD_CELTIC
AS2D_SOUND_JFD_CHINESE
AS2D_SOUND_JFD_COMANCHE*
AS2D_SOUND_JFD_DUTCH
AS2D_SOUND_JFD_EGYPTIAN
AS2D_SOUND_JFD_ENGLISH
AS2D_SOUND_JFD_ETHIOPIAN
AS2D_SOUND_JFD_FINNISH*
AS2D_SOUND_JFD_FRENCH
AS2D_SOUND_JFD_GAELIC*
AS2D_SOUND_JFD_GERMAN
AS2D_SOUND_JFD_GREEK
AS2D_SOUND_JFD_HOLY_ROMAN
AS2D_SOUND_JFD_HUNNIC
AS2D_SOUND_JFD_INCAN
AS2D_SOUND_JFD_INDIAN
AS2D_SOUND_JFD_ITALIAN
AS2D_SOUND_JFD_JAPANESE
AS2D_SOUND_JFD_KHMER
AS2D_SOUND_JFD_KOREAN
AS2D_SOUND_JFD_LATINO
AS2D_SOUND_JFD_MALINESE
AS2D_SOUND_JFD_MAMLUKE*
AS2D_SOUND_JFD_MAPUDUNGUN
AS2D_SOUND_JFD_MAYAN
AS2D_SOUND_JFD_MOHAWK
AS2D_SOUND_JFD_MONGOL
AS2D_SOUND_JFD_OTTOMAN
AS2D_SOUND_JFD_PERSIAN
AS2D_SOUND_JFD_POLISH
AS2D_SOUND_JFD_PORTUGUESE
AS2D_SOUND_JFD_ROMAN
AS2D_SOUND_JFD_RUSSIAN
AS2D_SOUND_JFD_SIAMESE
AS2D_SOUND_JFD_SIOUX
AS2D_SOUND_JFD_SPANISH
AS2D_SOUND_JFD_SUMERIAN
AS2D_SOUND_JFD_SWEDISH
AS2D_SOUND_JFD_TUPI*
AS2D_SOUND_JFD_VIKING
AS2D_SOUND_JFD_ZAPOTEC*
AS2D_SOUND_JFD_ZULU

*Not recommended as these have few tracks.
*/

--This is an example of support which copies all attributes from an existing civ. 
--For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_I' to the tag of your custom civ.
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JWW_COMANCHE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JWW_COMANCHE')
WHERE Type = 'CIVILIZATION_JWW_COMANCHE'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
MinorCivilization_JFD_CultureTypes (
	MinorCivilizationType 			text 	REFERENCES MinorCivilizations(Type) default null,
	CultureType 					text										default null);
	
/*DELETE FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType = 'MINOR_CIV_SAMARKAND';
INSERT INTO MinorCivilization_JFD_CultureTypes
		(MinorCivilizationType,		CultureType)
VALUES	('MINOR_CIV_SAMARKAND',		'CULTURE_JFD_ISLAMIC');*/
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,					Response,													Bias)
VALUES	('LEADER_JWW_IRON_JACKET',		'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_JWW_IRON_JACKET_INFLUENTIAL_ON_AI%',		1),
		('LEADER_JWW_IRON_JACKET',		'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_LEADER_JWW_IRON_JACKET_INFLUENTIAL_ON_HUMAN%',		1);
--=========================================================================================================================
-- BINGLES CIV IV TRAITS
--=========================================================================================================================
--POLICY_AGGRESSIVE_X [ICON_WAR] (Military)
--POLICY_CHARISMATIC_X [ICON_HAPPINESS_1] (Happiness)
--POLICY_CREATIVE_X [ICON_CULTURE] (Culture)
--POLICY_DIPLOMATIC_X [ICON_INFLUENCE] (City States)
--POLICY_EXPANSIVE_X [ICON_FOOD] (Food)
--POLICY_FINANCIAL_X [ICON_GOLD] (City Connections, Domestic Trade Routes)
--POLICY_IMPERIALISTIC_X [ICON_CITY_STATE] (Admirals, Generals)
--POLICY_INDUSTRIOUS_X [ICON_PRODUCTION] (Production)
--POLICY_INVENTIVE_X [ICON_RESEARCH] (Science)
--POLICY_MERCANTILE_X [ICON_TRADE] (Gold)
--POLICY_PHILOSOPHICAL_X [ICON_GREAT_PEOPLE] (Great People)
--POLICY_PROTECTIVE_X [ICON_STRENGTH] (Defense)
--POLICY_SEAFARING_X [ICON_MOVES] (Navy)
--POLICY_SPIRITUAL_X [ICON_PEACE] (Faith)
------------------------------	
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_JWW_IRON_JACKET',	'POLICY_AGGRESSIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Iron Jacket [ICON_WAR][ICON_PEACE]'
WHERE Type = 'LEADER_JWW_IRON_JACKET'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,			CultureEra)
SELECT	'CIVILIZATION_JWW_COMANCHE',	CultureType,			CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_SHOSHONE';
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
/*UPDATE Civilization_Religions 
SET ReligionType = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_PROTESTANT_METHODISM')
THEN 'RELIGION_PROTESTANT_CALVINISM'
ELSE 'RELIGION_PROTESTANTISM' END)
WHERE CivilizationType = 'CIVILIZATION_JWW_COMANCHE';*/
--==========================================================================================================================
--==========================================================================================================================
