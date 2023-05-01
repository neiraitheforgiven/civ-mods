--==========================================================================================================================    
-- Buildings
--==========================================================================================================================    
INSERT INTO Buildings   
(Type, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, UnblockedByBelief, Help,
Description, Civilopedia, Strategy, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize,
ConquestProb, HurryCostModifier, IconAtlas, PortraitIndex)
SELECT      
('BUILDING_NTF_CONSERVATIONCENTER', --Type
BuildingClass,
Cost,
GoldMaintenance,
PrereqTech,
FaithCost,
UnblockedByBelief,
'TXT_KEY_BUILDING_NTF_CONSERVATIONCENTER_HELP', --Help
'TXT_KEY_BUILDING_NTF_CONSERVATIONCENTER', --Description
'TXT_KEY_CIV5_BUILDINGS_NTF_CONSERVATIONCENTER_TEXT', --Civilopedia
'TXT_KEY_BUILDING_NTF_CONSERVATIONCENTER_STRATEGY', --Strategy
ArtDefineTag,
SpecialistType,
SpecialistCount,
MinAreaSize,
ConquestProb,
HurryCostModifier,
'NTF_NEZ_ATLAS',
0
FROM Buildings WHERE Type = 'BUILDING_LABORATORY';


INSERT INTO Building_YieldModifiers
(BuildingType, YieldType, Yield)
VALUES
('BUILDING_NTF_CONSERVATIONCENTER', -- BuildingType
'YIELD_SCIENCE', --YieldType
50); --Yield

INSERT INTO Building_ClassesNeededInCity
(BuildingType, BuildingClassType)
SELECT BuildingType, BuildingClassType
FROM Building_ClassesNeededInCity WHERE Type = 'BUILDING_LABORATORY';

INSERT INTO Building_Flavors
(BuildingType, FlavorType, Flavor)
VALUES
('BUILDING_NTF_CONSERVATIONCENTER', 'FLAVOR_SCIENCE', 75),
('BUILDING_NTF_CONSERVATIONCENTER', 'FLAVOR_CULTURE', 15),
('BUILDING_NTF_CONSERVATIONCENTER', 'FLAVOR_GREAT_PEOPLE', 2),
('BUILDING_NTF_CONSERVATIONCENTER', 'FLAVOR_TILE_IMPROVEMENT', 20);

--INSERT SALMON HERE SO IT IS THERE FOR THE NEXT LINE
--This is More Civs' Salmon, not mine.
--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT INTO Resources 
            (Type,                      Description,                        Civilopedia,                                ArtDefineTag,                   ResourceClassType,      Happiness,  AITradeModifier,    ResourceUsage,  AIObjective,    'Unique',   IconString,                 PortraitIndex,  IconAtlas)
VALUES      ('RESOURCE_MC_SALMON',      'TXT_KEY_RESOURCE_MC_SALMON',       'TXT_KEY_CIV5_RESOURCE_MC_SALMON_TEXT',     'ART_DEF_RESOURCE_MC_SALMON',   'RESOURCECLASS_LUXURY', 4,          10,                 2,              0,              2,          '[ICON_RES_MC_SALMON]',     4,              'MC_CHINOOK_ATLAS');
--==========================================================================================================================
-- Resource_YieldChanges
--==========================================================================================================================
INSERT OR REPLACE INTO Resource_YieldChanges   
            (ResourceType,                  YieldType,          Yield)
VALUES      ('RESOURCE_MC_SALMON',          'YIELD_FOOD',       1),
            ('RESOURCE_MC_SALMON',          'YIELD_CULTURE',    1);
--==========================================================================================================================
-- Resource_Flavors
--==========================================================================================================================
INSERT OR REPLACE INTO Resource_Flavors    
            (ResourceType,                  FlavorType,                 Flavor)
VALUES      ('RESOURCE_MC_SALMON',          'FLAVOR_HAPPINESS',         10),
            ('RESOURCE_MC_SALMON',          'FLAVOR_CULTURE',           10);
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT OR REPLACE INTO Improvement_ResourceTypes
            (ResourceType,                  ImprovementType)
VALUES      ('RESOURCE_MC_SALMON',          'IMPROVEMENT_FISHING_BOATS'),
            ('RESOURCE_MC_SALMON',          'IMPROVEMENT_CAMP');
--==========================================================================================================================
-- Improvement_ResourceType_Yields
--==========================================================================================================================
INSERT OR REPLACE INTO Improvement_ResourceType_Yields
            (ResourceType,                  ImprovementType,                YieldType,          Yield)
VALUES      ('RESOURCE_MC_SALMON',          'IMPROVEMENT_FISHING_BOATS',    'YIELD_FOOD',       1),
            ('RESOURCE_MC_SALMON',          'IMPROVEMENT_FISHING_BOATS',    'YIELD_GOLD',       1);
--==========================================================================================================================    
-- Belief_ResourceYieldChanges
--==========================================================================================================================    
INSERT OR REPLACE INTO Belief_ResourceYieldChanges
            (BeliefType,    ResourceType,           YieldType, Yield)
SELECT      BeliefType,     ('RESOURCE_MC_SALMON'), YieldType, Yield
FROM Belief_ResourceYieldChanges WHERE ResourceType = 'RESOURCE_FISH';
--==========================================================================================================================
--==========================================================================================================================        


INSERT INTO Building_ResourceYieldChanges
            (BuildingType,              ResourceType, YieldType, Yield)
SELECT 'BUILDING_NTF_CONSERVATIONCENTER', ResourceType, 'YIELD_SCIENCE', 1
FROM Improvement_ResourceTypes WHERE ImprovementType in ('IMPROVEMENT_CAMP', 'IMPROVEMENT_PASTURE');

INSERT INTO Building_ResourceYieldChanges
            (BuildingType,              ResourceType, YieldType, Yield)
SELECT 'BUILDING_NTF_CONSERVATIONCENTER', ResourceType, 'YIELD_CULTURE', 1
FROM Improvement_ResourceTypes WHERE ImprovementType in ('IMPROVEMENT_CAMP', 'IMPROVEMENT_PASTURE');



