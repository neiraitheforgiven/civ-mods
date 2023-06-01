--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
(Type, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, UnblockedByBelief, Help,
Description, Civilopedia, Strategy, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize,
ConquestProb, HurryCostModifier, IconAtlas, PortraitIndex)
SELECT
('BUILDING_NTF_TEMPLEOFTHEEEL', --Type
BuildingClass,
Cost,
GoldMaintenance,
PrereqTech,
FaithCost,
UnblockedByBelief,
'TXT_KEY_BUILDING_NTF_TEMPLEOFTHEEEL_HELP', --Help
'TXT_KEY_BUILDING_NTF_TEMPLEOFTHEEEL', --Description
'TXT_KEY_CIV5_BUILDINGS_NTF_TEMPLEOFTHEEEL_TEXT', --Civilopedia
'TXT_KEY_BUILDING_NTF_TEMPLEOFTHEEEL_STRATEGY', --Strategy
ArtDefineTag,
SpecialistType,
SpecialistCount,
MinAreaSize,
ConquestProb,
HurryCostModifier,
'NTF_POHNPEI_ATLAS', --IconAtlas
0
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';


INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield)
VALUES
('TXT_KEY_BUILDING_NTF_TEMPLEOFTHEEEL', -- BuildingType
'YIELD_FAITH', --YieldType
2); --Yield --Is going to need a lua script to supress the faith yield from pantheons.

INSERT INTO Building_ClassesNeededInCity
(BuildingType, BuildingClassType)
SELECT BuildingType, BuildingClassType
FROM Building_ClassesNeededInCity WHERE Type = 'BUILDING_SHRINE';

INSERT INTO Building_Flavors
(BuildingType, FlavorType, Flavor)
VALUES
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_FAITH', 5),
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_GOLD', 2),
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_PRODUCTION', 2);

