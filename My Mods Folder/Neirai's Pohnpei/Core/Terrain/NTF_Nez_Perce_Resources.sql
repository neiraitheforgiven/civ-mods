--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT OR REPLACE INTO Resources 
            (Type,                      Description,                        Civilopedia,                                ArtDefineTag,                   ResourceClassType,      Happiness,  AITradeModifier,    ResourceUsage,  AIObjective,    'Unique',   IconString,                 PortraitIndex,  IconAtlas)
VALUES      ('RESOURCE_MC_SALMON',      'TXT_KEY_RESOURCE_MC_SALMON',       'TXT_KEY_CIV5_RESOURCE_MC_SALMON_TEXT',     'ART_DEF_RESOURCE_MC_SALMON',   'RESOURCECLASS_LUXURY', 4,          10,                 2,              0,              2,          '[ICON_RES_MC_SALMON]',     4,              'MC_CHINOOK_ATLAS');


-- I am a bit concerned about conflict with the Chinook (because who doesn't play with the Chinook?) so doing this text insert in SQL.
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
(
    'TXT_KEY_RESOURCE_MC_SALMON',
    'Salmon'
),
(
    'TXT_KEY_CIV5_RESOURCE_MC_SALMON_TEXT',
    'The Chinook salmon is the largest species of Pacific salmon. Other commonly used names for the species include king salmon, Quinnat salmon, spring salmon, and Tyee salmon. Chinook are anadromous fish native to the north Pacific Ocean and the river systems of western North America, ranging from California to Alaska. They are also native to Asian rivers ranging from northern Japan to the Palyavaam River in the Siberian far east, although only the Kamchatka Peninsula supports relatively persistent native populations. They have been introduced to other parts of the world, including New Zealand and the Great Lakes. A large Chinook is a prized and sought-after catch for a sporting angler. The flesh of the salmon is also highly valued for its dietary nutritional content. Some populations are endangered, though Chinook salmon have not been assessed for the IUCN Red List.'
);


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
