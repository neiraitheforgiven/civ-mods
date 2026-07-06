--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
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
        (LeaderType,             	TraitOne,               TraitTwo)
SELECT  'LEADER_JFD_PHILIP_II', 	'POLICY_EXPANSIVE_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Philip II [ICON_FOOD][ICON_PEACE]'
WHERE Type = 'LEADER_JFD_PHILIP_II'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY BALANCE OVERHAUL
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
------------------------------
-- Buildings
------------------------------	
UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_JFD_SEMINARY_HELP_CBO'
WHERE Type = 'BUILDING_JFD_SEMINARY'
AND EXISTS (SELECT * FROM COMMUNITY WHERE Type = 'COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value = 1);
--------------------------------	
-- Building_GrowthExtraYield
--------------------------------	
CREATE TABLE IF NOT EXISTS 
    Building_GrowthExtraYield (
    BuildingType     text	   REFERENCES Buildings(Type)   default null,
    YieldType        text    
    Yield            integer								default 0);
	
INSERT INTO Building_GrowthExtraYield 	
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_JFD_SEMINARY',		YieldType, Yield
FROM Building_GrowthExtraYield WHERE BuildingType = 'BUILDING_UNIVERSITY';
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
VALUES	('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_DECOLONIZATION',	0);
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
VALUES	('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_SLAVERY',	4);
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
VALUES	('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_MERCENARY',		8);
--====================================	
-- JFD PIETY
--====================================	
-- Traits
------------------------------------------------------------	
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_SPAIN_PHILIP_II_PIETY'
WHERE Type = 'TRAIT_JFD_SPAIN_PHILIP_II'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_CIVILIZATION_CHANGES' AND Value = 1);
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
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_JFD_PHILIP_II',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8),
		('LEADER_JFD_PHILIP_II',		'FLAVOR_JFD_STATE_RELIGION',			8);
--====================================	
-- JFD SOVEREIGNTY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 6),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_ECONOMIC',		 7),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_FOREIGN',		 9),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_LEGAL',			 4),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_MILITARY',		 5),
		('LEADER_JFD_PHILIP_II',	'FLAVOR_JFD_REFORM_RELIGION',		 4);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_SpainPhilipII_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,										FaithCostModifier,  Description)
VALUES	('POLICY_DECISIONS_JFD_ENCOMIENDAS',		0,					'TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_ENCOMIENDAS'),
		('POLICY_DECISIONS_JFD_SCHOOL_SALAMANCA',	-10,				'TXT_KEY_DECISIONS_JFD_SPAIN_PHILIP_II_SCHOOL_SALAMANCA');
------------------------------
-- Policy_CityYieldChanges
------------------------------
INSERT INTO Policy_CityYieldChanges
		(PolicyType,								YieldType,			Yield)
VALUES	('POLICY_DECISIONS_JFD_ENCOMIENDAS',		'YIELD_GOLD',		2),
		('POLICY_DECISIONS_JFD_ENCOMIENDAS',		'YIELD_PRODUCTION',	1);
DELETE FROM Policy_CityYieldChanges WHERE PolicyType = 'POLICY_DECISIONS_JFD_ENCOMIENDAS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,								BuildingClassType,	YieldType,			YieldChange)
SELECT	'POLICY_DECISIONS_JFD_ENCOMIENDAS',			BuildingClass,		'YIELD_GOLD',		2
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_JFD_GOVERNORS_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);

INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType,								BuildingClassType,	YieldType,			YieldChange)
SELECT	'POLICY_DECISIONS_JFD_ENCOMIENDAS',			BuildingClass,		'YIELD_PRODUCTION',	1
FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_JFD_GOVERNORS_MANSION'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_COLONIES_CORE' AND Value = 1);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType,								BuildingClassType,	Happiness)
SELECT	'POLICY_DECISIONS_JFD_ENCOMIENDAS',			BuildingClass,		1
FROM Buildings WHERE IconAtlas = 'JFD_TRIBE_ATLAS'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_EXCE_TRIBES_CORE' AND Value = 1);
--==========================================================================================================================    
-- ZWEI883 RENAISSANCE ERA REVISED
--==========================================================================================================================    
-- Units
------------------------------
UPDATE Units
SET Help = 'TXT_KEY_UNIT_HELP_RER_TERCIO', Strategy = 'TXT_KEY_UNIT_RER_TERCIO_STRATEGY'
WHERE Type = 'UNIT_SPANISH_TERCIO'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_RER_PIKE_AND_SHOT');
------------------------------
-- Unit_FreePromotions
------------------------------
DELETE FROM Unit_FreePromotions
WHERE PromotionType = 'PROMOTION_JFD_TERCIO' AND UnitType = 'UNIT_SPANISH_TERCIO'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_RER_PIKE_AND_SHOT');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------    
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SPAIN' AND UnitType = 'UNIT_SPANISH_TERCIO'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_RER_PIKE_AND_SHOT');
INSERT INTO Civilization_UnitClassOverrides 
         (CivilizationType,		UnitClassType,			UnitType)
SELECT   'CIVILIZATION_SPAIN',	'UNITCLASS_2HANDER',	'UNIT_RODELEROS'
FROM Technologies WHERE Type = 'TECH_RER_PIKE_AND_SHOT';
--==========================================================================================================================
--==========================================================================================================================