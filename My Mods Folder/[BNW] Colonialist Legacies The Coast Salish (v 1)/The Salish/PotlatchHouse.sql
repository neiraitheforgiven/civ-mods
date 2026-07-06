--Potlatch House Bank Replacement

INSERT INTO Buildings
			(Type,						BuildingClass,						FreeStartEra,
			Cost,						GoldMaintenance,					PrereqTech,
			Help,									Description,
			Civilopedia,								Strategy,
			ArtDefineTag,				ConquestProb,						HurryCostModifier,
			ArtInfoEraVariation,		DisplayPosition,					IconAtlas,
			PortraitIndex,				SpecialistType,						SpecialistCount,
			TradeRouteRecipientBonus,	TradeRouteTargetBonus)
SELECT		'BUILDING_CLPOTLATCH',		'BUILDINGCLASS_BANK',				FreeStartEra,
			Cost,						GoldMaintenance,					PrereqTech,
			'TXT_KEY_BUILDING_CLPOTLATCH_HELP',		'TXT_KEY_BUILDING_CLPOTLATCH',
			'TXT_KEY_CIV5_BUILDINGS_CLPOTLATCH_TEXT',	'TXT_KEY_BUILDING_CLPOTLATCH_STRATEGY',
			ArtDefineTag,				0,									HurryCostModifier,
			ArtInfoEraVariation,		DisplayPosition,					'CLCOASTSALISH_ATLAS',	
			2,							SpecialistType,						SpecialistCount,
			0,							0
FROM Buildings WHERE (Type = 'BUILDING_BANK');

--Hidden Buildings
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 			Type, 							Description)
VALUES		('BUILDING_CLPLFOODHAP', 	'BUILDINGCLASS_CLPLFOODHAP', 	'TXT_KEY_BUILDING_CLPLFOODHAP');

INSERT INTO Buildings (
Type, 						BuildingClass, 					GreatWorkCount,			Cost,
FaithCost,					GoldMaintenance,				PrereqTech,				NeverCapture,
Description,												Help,
Happiness
) VALUES (
'BUILDING_CLPLFOODHAP', 	'BUILDINGCLASS_CLPLFOODHAP',	-1,						-1, 	
-1,							0,								NULL, 					1,
'TXT_KEY_BUILDING_CLPLFOODHAP',								'TXT_KEY_BUILDING_CLPLFOODHAP_HELP',
1
);

INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType,		Yield)
VALUES		('BUILDING_CLPLFOODHAP',	'YIELD_FOOD',	2);
--==========================================================================================================================
-- Attributes
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		'BUILDING_CLPOTLATCH', 	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_BANK');

INSERT INTO Building_YieldChanges
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_CLPOTLATCH', YieldType, Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_BANK');

INSERT INTO Building_YieldModifiers
			(BuildingType, YieldType, Yield)
SELECT		'BUILDING_CLPOTLATCH', YieldType, Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_BANK');


INSERT INTO Building_ClassesNeededInCity
			(BuildingType, BuildingClassType)
SELECT		'BUILDING_CLPOTLATCH', BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_BANK');

INSERT INTO Language_en_US (Tag, Text)
values 
('TXT_KEY_BUILDING_CLPOTLATCH',			'Potlatch House'),
('TXT_KEY_BUILDING_CLPOTLATCH_HELP',	'Unlike the Bank which it replaces, the Potlatch house ' ||
                                        'causes trade routes with foreign cities to produce +2 '  ||
										'[ICON_FOOD] Food and +1 [ICON_HAPPINESS_1] Happiness in '||
										'both cities, rather than additional gold. Each '        ||
										'Potlatch House increases the influence level of your '  ||
										'Law of Generosity trait.'),
('TXT_KEY_CIV5_BUILDINGS_CLPOTLATCH_TEXT',	'The Potlatch House was the center of Coast Salish '  ||
											'culture, where the Coast Salish would engage in the '||
											'potlatch, a ritual celebration of generosity and '  ||
											'self-denial, that involved giving material and '    ||
											'immaterial gifts, as well of the destruction of '   ||
											'personal property.'),
('TXT_KEY_BUILDING_CLPOTLATCH_STRATEGY',	'Building Potlatch Houses in your happiest cities and '  ||
										'connecting them to as many foreign cities as possible ' ||
										'is a great way to generate Golden Ages. Be careful, '   ||
										'however, as this will cause the city to grow large and '||
										'possibly unhappy.'),
('TXT_KEY_BUILDING_CLPLFOODHAP',	'Secrets of the Coast Salish.'),
('TXT_KEY_BUILDING_CLPLFOODHAP_HELP',	'At some point, this was probably banned by the government.');