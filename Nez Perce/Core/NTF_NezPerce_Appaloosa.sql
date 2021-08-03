--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,
RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage,
IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense,
Conscription, DefaultUnitAI, Description, Civilopedia, Help, Strategy, AdvancedStartCost,
UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas, PortraitIndex, IconAtlas, MoveRate)
SELECT
('UNIT_NTF_APPALOOSA') --Type
Class,
Cost,
2, --Range
PrereqTech,
Combat,
32 --RangedCombat
Moves,
FaithCost,
RequiresFaithPurchaseEnabled,
'UNITCOMBAT_ARCHER', --CombatClass
MilitarySupport,
MilitaryProduction,
Domain,
Pillage,
IgnoreBuildingDefense,
ObsoleteTech,
GoodyHutUpgradeUnitClass,
XPValueAttack,
XPValueDefense,
Conscription,
'UNITAI_RANGED',--DefaultUnitAI
('TXT_KEY_UNIT_NTF_APPALOOSA'),--Description
('TXT_KEY_UNIT_NTF_APPALOOSA_PEDIA'),--Civilopedia
('TXT_KEY_UNIT_NTF_APPALOOSA_HELP'),--Help
('TXT_KEY_UNIT_NTF_APPALOOSA_STRATEGY'),--Strategy
AdvancedStartCost,
('ART_DEF_UNIT_NTF_APPALOOSA'),--UnitArtInfo
0,
('NTF_APPALOOSA_FLAG'),--UnitFlagAtlas
2,
('NTF_NEZPERCE_ATLAS'),--IconAtlas
MoveRate
FROM Units WHERE (Type = 'UNIT_LANCER');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
            (UnitType,                          UnitAIType)
SELECT      ('UNIT_NTF_APPALOOSA'),    UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_HUN_HORSE_ARCHER');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
            (UnitType,                          UnitClassType)
SELECT      ('UNIT_NTF_APPALOOSA'),    UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
            (UnitType,                              FlavorType, Flavor)
SELECT      ('UNIT_NTF_APPALOOSA'),    FlavorType, Flavor * 2
FROM Unit_Flavors WHERE (UnitType = 'UNIT_HUN_HORSE_ARCHER');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
            (UnitType,                          PromotionType)
VALUES      ('UNIT_NTF_APPALOOSA', 'PROMOTION_NO_DEFENSIVE_BONUSES'),
            ('UNIT_NTF_APPALOOSA', 'PROMOTION_ONLY_DEFENSIVE'),
            ('UNIT_NTF_APPALOOSA', 'PROMOTION_ACCURACY_1'),
            ('UNIT_NTF_APPALOOSA', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
            ('UNIT_NTF_APPALOOSA', 'PROMOTION_CITY_PENALTY');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType,                                      SelectionSound, FirstSelectionSound)
SELECT      ('UNIT_NTF_APPALOOSA'),    SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
--==========================================================================================================================