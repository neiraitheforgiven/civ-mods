--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type,								Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 								Civilopedia, 										Help, 											Strategy,											AdvancedStartCost,	UnitArtInfo, 							  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),	Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_PEDIA'), 	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_HELP'), 	('TXT_KEY_UNIT_MC_NTF_SENECA_SWIFT_STRIKE_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_MC_NTF_SENECA_SWIFT_STRIKE'),  0,					('MC_NTF_SENECA_SWIFT_STRIKE_FLAG'),	2, 				('MC_NTF_SENECA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 							UnitAIType)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 							UnitClassType)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,							FlavorType, Flavor)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');

--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE',	'PROMOTION_AMPHIBIOUS');

--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 										SelectionSound, FirstSelectionSound)
SELECT		('UNIT_MC_NTF_SENECA_SWIFT_STRIKE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
--==========================================================================================================================


--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================    
INSERT INTO UnitPromotions (
Type,                                     Description,                                    Help,                                   
Sound,                                    CannotBeChosen,   AttackMod,  AdjacentMod,  PortraitIndex, IconAtlas,      
PediaType,                                PediaEntry,                               DefenseMod, HasPostCombatPromotions, MovesChange, CanMoveAfterAttack) VALUES 
('PROMOTION_MC_NTF_SENECAKEEPER1',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1_HELP',
'AS2D_IF_LEVELUP',                        1,                5,          5,            59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECAKEEPER2',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2_HELP',
'AS2D_IF_LEVELUP',                        1,                10,         10,           59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECAKEEPER3',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3_HELP',
'AS2D_IF_LEVELUP',                        1,                15,         15,           59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECAKEEPER4',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4_HELP',
'AS2D_IF_LEVELUP',                        1,                20,         20,           59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECAKEEPER5',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5_HELP',
'AS2D_IF_LEVELUP',                        1,                25,         25,           59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECAKEEPER6',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6',       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6_HELP',
'AS2D_IF_LEVELUP',                        1,                30,         30,           59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECA_GUNNER',        'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT',   'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT',
'AS2D_IF_LEVELUP',                        1,                null,       null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECA_GUNNER',        'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER',       'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER',
'AS2D_IF_LEVELUP',                        1,                null,       null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECA_GUNNER_MOVES',  'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES', 'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES',
'AS2D_IF_LEVELUP',                        1,                null,       null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES', null, 0, 1, 1),

('PROMOTION_MC_NTF_SENECA_BEFORERANDOM',  'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM', 'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM',
'AS2D_IF_LEVELUP',                        1,                null,       null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM', null, 1, 0, 0),

('PROMOTION_MC_NTF_SENECA_AFTERRANDOM',   'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM',  'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM',
'AS2D_IF_LEVELUP',                        1,                null,       null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM', null, 0, 0, 0),

('PROMOTION_MC_NTF_SENECA_NERFBAT',       'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT',      'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT',
'AS2D_IF_LEVELUP',                        1,                -10,        null,         59,             'ABILITY_ATLAS',
'PEDIA_ATTRIBUTES',                       'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT', -10, 0, 0, 0);


INSERT INTO UnitPromotions_PostCombatRandomPromotion
            (PromotionType,                 NewPromotion)
VALUES      ('PROMOTION_MC_NTF_SENECA_BEFORERANDOM',      'PROMOTION_MC_NTF_SENECA_AFTERRANDOM');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================    
INSERT INTO Unit_FreePromotions 
            (UnitType,              PromotionType)
VALUES      
('UNIT_MC_NTF_SENECA_SWIFT_STRIKE',    'PROMOTION_MC_NTF_SENECA_GUNNER'),
('UNIT_MC_NTF_SENECA_SWIFT_STRIKE',    'PROMOTION_MC_NTF_SENECA_BEFORERANDOM');


--==========================================================================================================================    
--==========================================================================================================================    
-- Language_en_US
--==========================================================================================================================        
INSERT INTO Language_en_US
            (Tag,                                           Text)
VALUES
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1', 'Battle Keepers 1'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1_HELP', 'Deal an addition 5% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2', 'Battle Keepers 2'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2_HELP', 'Deal an addition 10% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3', 'Battle Keepers 3'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3_HELP', 'Deal an addition 15% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4', 'Battle Keepers 4'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4_HELP', 'Deal an addition 20% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5', 'Battle Keepers 5'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5_HELP', 'Deal an addition 25% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6', 'Battle Keepers 6'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6_HELP', 'Deal an addition 30% damage when attacking, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT', 'Keepers of the Western Door'),
('TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT_HELP', 'Each other player that joins you in a war against a common foe increases unit damage by 5% (max 30%) until that war ends, doubled when adjacent to a friendly unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER', 'Swift Striker'),
('TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_HELP', 'Gains +1 Movement and the ability to move after attacking when starting adjacent to an enemy unit.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES', 'Snake-like Swiftness'),
('TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES_HELP', '+1 Movement. Can move after attacking.'), 
('TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM', 'Demoralizing Attacks'),
('TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM_HELP', ''), 
('TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM', 'Enemy Demoralized!'),
('TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM_HELP', ''), 
('TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT', 'Tortured Losses'),
('TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT_HELP', '');