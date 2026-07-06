--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 				PrereqTech,	Range,	RangedCombat,	Combat,	FaithCost,
			RequiresFaithPurchaseEnabled,	Cost,	Moves, 	CombatClass,	Domain,
			DefaultUnitAI,	Description,				Civilopedia,
			Strategy, 							Help, 							MilitarySupport, 
			MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost,
			GoodyHutUpgradeUnitClass,	CombatLimit,	XPValueAttack, XPValueDefense,
			Conscription,	UnitArtInfo, 				UnitFlagAtlas,		UnitFlagIconOffset,
			PortraitIndex,	IconAtlas,			WorkRate)
SELECT		Class,	'UNIT_CLSTOMEX', 	PrereqTech,	Range,	RangedCombat,	Combat,	FaithCost,
			RequiresFaithPurchaseEnabled,	Cost,	Moves, 	CombatClass,	Domain, 
			DefaultUnitAI,	'TXT_KEY_UNIT_CLSTOMEX', 	'TXT_KEY_CIV5_CLSTOMEX_TEXT',
			'TXT_KEY_UNIT_CLSTOMEX_STRATEGY',	'TXT_KEY_UNIT_CLSTOMEX_HELP',	MilitarySupport, 
			MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, 
			'UNITCLASS_LONGSWORDSMAN',		CombatLimit,	XPValueAttack, XPValueDefense, 
			Conscription,	'ART_DEF_UNIT_CLSTOMEX', 	'CLSTOMEX_FLAG',	0,
			3, 				'CLCOASTSALISH_ATLAS',	WorkRate
FROM Units WHERE (Type = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		'UNIT_CLSTOMEX', 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		'UNIT_CLSTOMEX', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_Flavors (UnitType, FlavorType, Flavor) 
VALUES ('UNIT_CLSTOMEX', 'FLAVOR_GOLD', 5);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 					Description, 						Help,
			Sound, 					CannotBeChosen,						PortraitIndex,  
			IconAtlas, 				PediaType, 							PediaEntry)
VALUES		('PROMOTION_CLSTOMEX',	'TXT_KEY_PROMOTION_CLSTOMEX',		'TXT_KEY_PROMOTION_CLSTOMEX_HELP',
			'AS2D_IF_LEVELUP', 		1, 									18, 			
			'PROMOTION_ATLAS', 		'PEDIA_ATTRIBUTES',					'TXT_KEY_PROMOTION_CLSTOMEX');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 			PromotionType)
VALUES		('UNIT_CLSTOMEX', 	'PROMOTION_CLSTOMEX');

insert into Unit_FreePromotions (UnitType, PromotionType)
select
  'UNIT_CLSTOMEX',
  PromotionType
from Unit_FreePromotions where (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
VALUES		('UNIT_CLSTOMEX',	'UNITCLASS_LONGSWORDSMAN');
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,								Text)
VALUES		('TXT_KEY_UNIT_CLSTOMEX',			'Sto:mex'),
			('TXT_KEY_CIV5_CLSTOMEX_TEXT',		'The Sto:mex were strong young noble warriors of the Coast Salish society. They were entitled to own slaves and to be generous to others.'),
			('TXT_KEY_UNIT_CLSTOMEX_STRATEGY',	'The Sto:mex generates a lot of gold at high levels, so construct them in cities with many training buildings, and put them to war. Also, they upgrade into Swordsmen, so try to get sources of Iron to keep them going. A Sto:mex that survives is a great source of Gold.'),
			('TXT_KEY_UNIT_CLSTOMEX_HELP',		'After level 3, produces 1 [ICON_GOLD] Gold per level and upgrades into a Longswordsman, unlike the Pikeman that it replaces.'),
			('TXT_KEY_PROMOTION_CLSTOMEX',		'Coast Salish Noble'),
			('TXT_KEY_PROMOTION_CLSTOMEX_HELP',	'Produce 1 [ICON_GOLD] per level, starting at level 3.');