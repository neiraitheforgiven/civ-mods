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
('UNIT_NTF_SOUNPEI') --Type
hm.Class,
hm.Cost,
sm.Range, --Range
hm.PrereqTech,
hm.Combat,
hm.RangedCombat,
sm.Moves,
hm.FaithCost,
hm.RequiresFaithPurchaseEnabled,
sm.CombatClass, --CombatClass
hm.MilitarySupport,
hm.MilitaryProduction,
hm.Domain,
hm.Pillage,
hm.IgnoreBuildingDefense,
hm.ObsoleteTech,
hm.GoodyHutUpgradeUnitClass,
hm.XPValueAttack,
hm.XPValueDefense,
hm.Conscription,
sm.DefaultUnitAI,--DefaultUnitAI
('TXT_KEY_UNIT_NTF_SOUNPEI'),--Description
('TXT_KEY_UNIT_NTF_SOUNPEI_PEDIA'),--Civilopedia
('TXT_KEY_UNIT_NTF_SOUNPEI_HELP'),--Help
('TXT_KEY_UNIT_NTF_SOUNPEI_STRATEGY'),--Strategy
hm.AdvancedStartCost,
('ART_DEF_UNIT_NTF_SOUNPEI'),--UnitArtInfo
0,
('NTF_SOUNPEI_FLAG'),--UnitFlagAtlas
2,
('NTF_POHNPEI_ATLAS'),--IconAtlas
sm.MoveRate
FROM Units hm join Units sm on 1=1 WHERE (hm.Type = 'UNIT_HORSEMAN') and (sm.Type = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
            (UnitType,                          UnitAIType)
SELECT      ('UNIT_NTF_SOUNPEI'),    UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
            (UnitType,                          UnitClassType)
SELECT      ('UNIT_NTF_SOUNPEI'),    UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_HORSEMAN');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
            (UnitType,                              FlavorType, Flavor)
SELECT      ('UNIT_NTF_SOUNPEI'),    FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
            (UnitType,                          PromotionType)
VALUES      ('UNIT_NTF_SOUNPEI', 'PROMOTION_AMPHIBIOUS'),
            ('UNIT_NTF_SOUNPEI', 'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
            ('UNIT_NTF_SOUNPEI', 'PROMOTION_WITHDRAW'); -- will add lua to rmove this promotion when it is used, and replace it with PROMOTION_HEAVY_ATTACK

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType,                                      SelectionSound, FirstSelectionSound)
SELECT      ('UNIT_NTF_SOUNPEI'),    SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================
--==========================================================================================================================