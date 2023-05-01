--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================    
INSERT INTO UnitPromotions 
			(Type,										Description,									Help,													Sound,					CannotBeChosen,   AttackMod,  AdjacentMod,  PortraitIndex, IconAtlas,			PediaType,              PediaEntry,										DefenseMod,		HasPostCombatPromotions,	MovesChange,	CanMoveAfterAttacking) 
VALUES		('PROMOTION_MC_NTF_SENECAKEEPER1',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1_HELP',			'AS2D_IF_LEVELUP',		1,                5,          5,            59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER1',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER2',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2_HELP',			'AS2D_IF_LEVELUP',		1,                10,         10,           59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER2',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER3',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3_HELP',			'AS2D_IF_LEVELUP',		1,                15,         15,           59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER3',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER4',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4_HELP',			'AS2D_IF_LEVELUP',		1,                20,         20,           59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER4',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER5',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5_HELP',			'AS2D_IF_LEVELUP',		1,                25,         25,           59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER5',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER6',			'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6_HELP',			'AS2D_IF_LEVELUP',		1,                30,         30,           59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER6',		null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECAKEEPER_HINT',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT',   'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT_HELP',		'AS2D_IF_LEVELUP',		1,                null,       null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECAKEEPER_HINT',	null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECA_GUNNER',			'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER',       'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER',				'AS2D_IF_LEVELUP',		1,                null,       null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER',		null,			0,							0,				1),
			('PROMOTION_MC_NTF_SENECA_GUNNER_MOVES',	'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES', 'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES_HELP',	'AS2D_IF_LEVELUP',		1,                null,       null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_GUNNER_MOVES', null,			0,							1,				1),
			('PROMOTION_MC_NTF_SENECA_BEFORERANDOM',	'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM', 'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM',			'AS2D_IF_LEVELUP',		1,                null,       null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_BEFORERANDOM', null,			1,							0,				0),
			('PROMOTION_MC_NTF_SENECA_AFTERRANDOM',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM',  'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM',			'AS2D_IF_LEVELUP',		1,                null,       null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_AFTERRANDOM',	null,			0,							0,				0),
			('PROMOTION_MC_NTF_SENECA_NERFBAT',			'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT',      'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT',				'AS2D_IF_LEVELUP',		1,                -10,        null,         59,             'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',		'TXT_KEY_PROMOTION_MC_NTF_SENECA_NERFBAT',		-10,			0,							0,				0);

--==========================================================================================================================
-- UnitPromotions_PostCombatRandomPromotion
--==========================================================================================================================    
INSERT INTO UnitPromotions_PostCombatRandomPromotion
            (PromotionType,								NewPromotion)
VALUES      ('PROMOTION_MC_NTF_SENECA_BEFORERANDOM',    'PROMOTION_MC_NTF_SENECA_AFTERRANDOM');

--==========================================================================================================================
--==========================================================================================================================
