--==========================================================================================================================	
-- Improvements
--==========================================================================================================================	
INSERT INTO Improvements
		(Type,											SpecificCivRequired,	CivilizationType,					FreshWaterMakesValid,	RequiresFlatlandsOrFreshWater, OutsideBorders,	DefenseModifier,	Description,										Help,													 Civilopedia,												ArtDefineTag,										PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		1,						'CIVILIZATION_MC_NTF_SENECA',		1,						1,                      1,				30,					'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',	'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS_HELP',	 'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS_PEDIA',	'ART_DEF_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS', 	3,				'MC_NTF_SENECA_ATLAS'),
        ('IMPROVEMENT_MC_NTF_SENECA_OUTPOST',           1,                      'CIVILIZATION_MC_NTF_SENECA',       1,                  1,                  1,              30,                 'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',  'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS_HELP',  'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS_PEDIA',   'ART_DEF_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',  3,              'MC_NTF_SENECA_ATLAS');



--==========================================================================================================================	
-- Improvement_ValidTerrains
--==========================================================================================================================	
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,								TerrainType)
VALUES	('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		'TERRAIN_GRASS'),
		('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		'TERRAIN_PLAINS'),
        ('IMPROVEMENT_MC_NTF_SENECA_OUTPOST',           'TERRAIN_GRASS'),
        ('IMPROVEMENT_MC_NTF_SENECA_OUTPOST',           'TERRAIN_TUNDRA'),
        ('IMPROVEMENT_MC_NTF_SENECA_OUTPOST',           'TERRAIN_PLAINS');

--==========================================================================================================================  
-- Improvement_ResourceTypes
--==========================================================================================================================  
INSERT INTO Improvement_ResourceTypes
      (ImprovementType,                      ResourceType)
VALUES   ('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',     'RESOURCE_WHEAT');


--==========================================================================================================================	
-- Improvement_Yields
--==========================================================================================================================	
INSERT INTO Improvement_Yields
		(ImprovementType,								YieldType,			Yield)
VALUES	('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		'YIELD_FOOD',		1);

--==========================================================================================================================	
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,								TechType,				YieldType,			Yield)
VALUES	('IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',		'TECH_CIVIL_SERVICE',	'YIELD_FOOD',		1);
--==========================================================================================================================	
-- Builds
--==========================================================================================================================	
INSERT INTO Builds
		(Type,									PrereqTech,				ImprovementType, 							Time, Recommendation,									Description,										Help,												OrderPriority,	IconIndex,	IconAtlas,				EntityEvent)
VALUES	('BUILD_MC_NTF_SENECA_THREE_SISTERS',	'TECH_CONSTRUCTION',	'IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',	700,  'TXT_KEY_BUILD_MC_NTF_SENECA_THREE_SISTERS_REC', 'TXT_KEY_IMPROVEMENT_MC_NTF_SENECA_THREE_SISTERS',	'TXT_KEY_BUILD_MC_NTF_SENECA_THREE_SISTERS_HELP',	96,				4,			'MC_NTF_SENECA_ATLAS',	'ENTITY_EVENT_BUILD');

--==========================================================================================================================	
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds
		(UnitType,			BuildType)
VALUES	('UNIT_WORKER',		'BUILD_MC_NTF_SENECA_THREE_SISTERS');
--==========================================================================================================================
--==========================================================================================================================