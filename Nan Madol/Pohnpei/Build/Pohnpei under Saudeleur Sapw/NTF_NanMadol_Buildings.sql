--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
(Type, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, Help,
Description, Civilopedia, Strategy, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize,
ConquestProb, HurryCostModifier, IconAtlas, PortraitIndex, WonderProductionModifier)
SELECT
'BUILDING_NTF_TEMPLEOFTHEEEL', --Type
BuildingClass,
Cost,
GoldMaintenance,
PrereqTech,
FaithCost,
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
0, --PortraitIndex
-10 --WonderProductionModifier
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';


INSERT INTO Building_YieldChanges
(BuildingType, YieldType, Yield)
VALUES
('BUILDING_NTF_TEMPLEOFTHEEEL', -- BuildingType
'YIELD_FAITH', --YieldType
2); --Yield

INSERT INTO Building_YieldModifiers
(BuildingType, YieldType, Yield)
VALUES
('BUILDING_NTF_TEMPLEOFTHEEEL', -- BuildingType
'YIELD_FOOD', --YieldType
-10);

INSERT INTO Building_ClassesNeededInCity
(BuildingType, BuildingClassType)
SELECT BuildingType, BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_SHRINE';

INSERT INTO Building_Flavors
(BuildingType, FlavorType, Flavor)
VALUES
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_FAITH', 5),
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_GOLD', 2),
('BUILDING_NTF_TEMPLEOFTHEEEL', 'FLAVOR_PRODUCTION', 2);

-- Fake a palance for Nan Madol
INSERT INTO Buildings
  (Type, BuildingClass, Cost, GoldMaintenance, PrereqTech, FaithCost, Help,
  Description, Civilopedia, Strategy, ArtDefineTag, SpecialistType, SpecialistCount, MinAreaSize,
  ConquestProb, HurryCostModifier, IconAtlas, PortraitIndex)
SELECT
  'BUILDING_NTF_NANMADOL_PALACE', --Type
  BuildingClass,
  Cost,
  GoldMaintenance,
  PrereqTech,
  FaithCost,
  'TXT_KEY_BUILDING_PALACE_HELP', --Help
  'TXT_KEY_BUILDING_PALACE', --Description
  'TXT_KEY_CIV5_BUILDINGS_PALACE_TEXT', --Civilopedia
  'TXT_KEY_BUILDING_PALACE_STRATEGY', --Strategy
  ArtDefineTag,
  SpecialistType,
  SpecialistCount,
  MinAreaSize,
  ConquestProb,
  HurryCostModifier,
  IconAtlas,
  PortraitIndex
FROM Buildings WHERE Type = 'BUILDING_PALACE';

INSERT INTO Building_YieldChanges
  (BuildingType, YieldType, Yield)
SELECT 'BUILDING_NTF_NANMADOL_PALACE', -- BuildingType
  YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_PALACE';

-- Hidden Building for Eel
INSERT INTO BuildingClasses
  (DefaultBuilding, Type, Description)
VALUES
  ('BUILDING_NTF_EELPOWER', 'BUILDINGCLASS_NTF_EELPOWER', 'TXT_KEY_BUILDING_NTF_EELPOWER');

INSERT INTO Buildings
(Type, BuildingClass, Cost, PrereqTech, Help, Description, Civilopedia, Strategy, ArtDefineTag,
MinAreaSize, HurryCostModifier, IconAtlas,
PortraitIndex)
VALUES (
'BUILDING_NTF_EELPOWER', --Type
'BUILDINGCLASS_NTF_EELPOWER', --BuildingCLass
-1, --Cost
NULL, --PrereqTech
'TXT_KEY_BUILDING_EELPOWER', --Help
'TXT_KEY_BUILDING_EELPOWER', --Description
'TXT_KEY_BUILDING_EELPOWER', --Civilopedia
'TXT_KEY_BUILDING_EELPOWER', --Strategy
'ART_DEF_BUILDING_CASTLE', --ArtDefineTag
-1, --MinAreaSize
25, --HurryCostModifier
'NTF_POHNPEI_ATLAS', --IconAtlas
0); --PortraitIndex

INSERT INTO Building_YieldModifiers
  (BuildingType, YieldType, Yield)
VALUES
  ('BUILDING_NTF_EELPOWER', -- BuildingType
  'YIELD_GOLD', --YieldType
  2),
  --Yield
  ('BUILDING_NTF_EELPOWER', -- BuildingType
  'YIELD_PRODUCTION', --YieldType
  2);