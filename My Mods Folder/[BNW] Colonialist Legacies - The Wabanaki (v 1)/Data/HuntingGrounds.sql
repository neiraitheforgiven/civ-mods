--==========================================================================================================================
-- Improvements
--==========================================================================================================================	
INSERT INTO Improvements (Type, SpecificCivRequired, CivilizationType,	Description, 
                          Help, Civilopedia, ArtDefineTag, DestroyedWhenPillaged, 
						  PillageGold, PortraitIndex, IconAtlas, Coastal, NoTwoAdjacent)
                  values ('IMPROVEMENT_CLWABHUNTING',
				          1,
						  'CIVILIZATION_CLWABANAKI',
						  'TXT_KEY_IMPROVEMENT_CLWABHUNTING_DESC',
						  'TXT_KEY_IMPROVEMENT_CLWABHUNTING_HELP',
						  'TXT_KEY_IMPROVEMENT_CLWABHUNTING_PEDIA',
						  'ART_DEF_IMPROVEMENT_CLWABHUNTING',
						  1,
						  0,
						  3,
						  'CLWABANAKI_ATLAS',
						  1,
						  1);
--==========================================================================================================================
-- Builds
--==========================================================================================================================	
INSERT INTO Builds
			(Type,						PrereqTech,		ImprovementType,				Time,	Description,					Help,									Kill,	EntityEvent,			HotKey,		OrderPriority,	HotKeyPriority,	IconIndex,	IconAtlas)
VALUES		('BUILD_CLWABHUNTING',		'TECH_OPTICS',	'IMPROVEMENT_CLWABHUNTING',		700,	'TXT_KEY_BUILD_CLWABHUNTING',	'TXT_KEY_BUILD_CLWABHUNTING_HELP',		0,		'ENTITY_EVENT_BUILD',	'KB_W',		98,				1,				4,			'CLWABANAKI_ATLAS');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds
			(UnitType,			BuildType)
VALUES		('UNIT_WORKER',		'BUILD_CLWABHUNTING');

insert into Improvement_Flavors (ImprovementType,            FlavorType,					 Flavor)
						 values ('IMPROVEMENT_CLWABHUNTING', 'FLAVOR_NAVAL_TILE_IMPROVEMENT', 2),
								('IMPROVEMENT_CLWABHUNTING', 'FLAVOR_EXPANSION',              10);

insert into Improvement_Yields (ImprovementType,            YieldType,          Yield)
                        values ('IMPROVEMENT_CLWABHUNTING', 'YIELD_PRODUCTION', 1),
							   ('IMPROVEMENT_CLWABHUNTING', 'YIELD_FOOD',       1);

insert into Improvement_TechYieldChanges (ImprovementType,            TechType,         YieldType,     Yield)
                                  values ('IMPROVEMENT_CLWABHUNTING', 'TECH_NAVIGATION', 'YIELD_GOLD', 2),
										 ('IMPROVEMENT_CLWABHUNTING', 'TECH_NAVIGATION', 'YIELD_FOOD', 1);

INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_DESERT'),
			('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_TUNDRA'),
			('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_SNOW'),
			('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_GRASS'),
			('IMPROVEMENT_CLWABHUNTING',	'TERRAIN_HILL');

INSERT INTO BuildFeatures
		(BuildType,			FeatureType,		PrereqTech,					Time,		Remove,		Production)
VALUES	('BUILD_CLWABHUNTING',	'FEATURE_FOREST',	'TECH_MINING',				400,		1,			20),
		('BUILD_CLWABHUNTING',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',		700,		1,			0),
		('BUILD_CLWABHUNTING',	'FEATURE_MARSH',	'TECH_MASONRY',				600,		1,			0);

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_IMPROVEMENT_CLWABHUNTING_DESC',		'Anapi''gann'),
			('TXT_KEY_IMPROVEMENT_CLWABHUNTING_PEDIA',		'The Wabanaki were a seminomadic people, who settled down during the summer to claim fertile shore and riverbank lands for both farming and fishing purposes.'),
			('TXT_KEY_BUILD_CLWABHUNTING',					'Construct an Anapi''gann'),
			('TXT_KEY_BUILD_CLWABHUNTING_HELP',				'Can only be constucted on coasts, and not adjacent to other Anapi''gann. Produces +1 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production, and captures all adjacent coastal land and coastal sea tiles. After Navigation is researched, provides an additional +1 [ICON_FOOD] Food and +2 [ICON_GOLD] Gold.'),
			('TXT_KEY_IMPROVEMENT_CLWABHUNTING_HELP',		'Can only be constucted on coasts, and not adjacent to other Anapi''gann. Produces +1 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production, and captures all adjacent coastal land and coastal sea tiles. After Navigation is researched, provides an additional +1 [ICON_FOOD] Food and +2 [ICON_GOLD] Gold.');