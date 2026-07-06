--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
		(Type, 											BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,											Civilopedia,													Help,															Strategy,															ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	IconAtlas,					PortraitIndex)
SELECT	('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER'),	BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER'),	('TXT_KEY_BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER_PEDIA'),	('TXT_KEY_BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER_HELP'),	('TXT_KEY_BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	Water,	AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus,	'NTF_NEZ_PERCE_ATLAS',		3
FROM Buildings WHERE (Type = 'BUILDING_LABORATORY');

--Dummy Building
INSERT INTO Buildings
		(Type,								BuildingClass,							Description,						EnhancedYieldTech,	TechEnhancedTourism,	IconAtlas,				PortraitIndex,	Cost,	PrereqTech,	GreatWorkCount,	FaithCost,	NeverCapture)
VALUES	('BUILDING_NTF_TOURISMWIDGET1',		'BUILDINGCLASS_NTF_TOURISMWIDGET1',		'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		1,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET2',		'BUILDINGCLASS_NTF_TOURISMWIDGET2',		'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		2,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET4',		'BUILDINGCLASS_NTF_TOURISMWIDGET4',		'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		4,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET8',		'BUILDINGCLASS_NTF_TOURISMWIDGET8',		'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		8,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET16',	'BUILDINGCLASS_NTF_TOURISMWIDGET16',	'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		16,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET32',	'BUILDINGCLASS_NTF_TOURISMWIDGET32',	'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		32,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET64',	'BUILDINGCLASS_NTF_TOURISMWIDGET64',	'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		64,						'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1),
		('BUILDING_NTF_TOURISMWIDGET128',	'BUILDINGCLASS_NTF_TOURISMWIDGET128',	'TXT_KEY_BUILDING_NTF_WIDGETS',		'TECH_ECOLOGY',		128,					'NTF_NEZ_PERCE_ATLAS',	0,				-1,		null,		-1,				-1,			1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,										DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_NTF_TOURISMWIDGET1',		'BUILDING_NTF_TOURISMWIDGET1',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET2',		'BUILDING_NTF_TOURISMWIDGET2',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET4',		'BUILDING_NTF_TOURISMWIDGET4',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET8',		'BUILDING_NTF_TOURISMWIDGET8',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET16',		'BUILDING_NTF_TOURISMWIDGET16',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET32',		'BUILDING_NTF_TOURISMWIDGET32',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET64',		'BUILDING_NTF_TOURISMWIDGET64',		'TXT_KEY_BUILDING_NTF_WIDGETS'),
		('BUILDINGCLASS_NTF_TOURISMWIDGET128',		'BUILDING_NTF_TOURISMWIDGET128',	'TXT_KEY_BUILDING_NTF_WIDGETS');

--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,								BuildingClassType)
SELECT	('BUILDINGCLASS_MC_ENCHOPHOROS_PROD'),		BuildingClassType
FROM Building_ClassesNeededInCity WHERE Type = 'BUILDING_LABORATORY';

--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================
INSERT INTO Building_Flavors 	
		(BuildingType, 									FlavorType,					Flavor)
VALUES	('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER', 'FLAVOR_SCIENCE',			75),
		('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER', 'FLAVOR_CULTURE',			15),
		('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER', 'FLAVOR_GREAT_PEOPLE',		2),
		('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER', 'FLAVOR_TILE_IMPROVEMENT',	20);

--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType,			Yield)
VALUES	('BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER',	'YIELD_SCIENCE',	50);

--==========================================================================================================================
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges
            (BuildingType,								ResourceType, YieldType,		Yield)
SELECT 'BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER',	ResourceType, 'YIELD_SCIENCE',	1
FROM Improvement_ResourceTypes WHERE ImprovementType in ('IMPROVEMENT_CAMP', 'IMPROVEMENT_PASTURE');

INSERT INTO Building_ResourceYieldChanges
       (BuildingType,									ResourceType, YieldType,		Yield)
SELECT 'BUILDING_NTF_NEZ_PERCE_CONSERVATION_CENTER',	ResourceType, 'YIELD_CULTURE',	1
FROM Improvement_ResourceTypes WHERE ImprovementType in ('IMPROVEMENT_CAMP', 'IMPROVEMENT_PASTURE');