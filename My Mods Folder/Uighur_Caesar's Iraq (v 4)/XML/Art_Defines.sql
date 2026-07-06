							INSERT INTO ArtDefine_UnitInfos (Type,												DamageStates,	Formation) VALUES
								('ART_DEF_UNIT_UC_ASSYRIAN_LEVY',				1,				'UnFormed');						
INSERT INTO ArtDefine_UnitMemberInfos (Type,												Scale,					Model,									MaterialTypeTag,	MaterialTypeSoundOverrideTag) VALUES
									  ('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			0.14000000059604645,	'u_slovakian_dobrovolnik.fxsxml',			'CLOTH',			'FLESH');									
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,									UnitMemberInfoType,									NumMembers) VALUES
										  ('ART_DEF_UNIT_UC_ASSYRIAN_LEVY',				'ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			14);									  
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,									EnableActions,																								ShortMoveRadius,	ShortMoveRate,		TargetHeight,	HasShortRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat) VALUES
										('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge',	12,					0.3499999940395355,	8,				1,						1,						1);									
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType,								"Index",	SubIndex,	WeaponTypeTag,	WeaponTypeSoundOverrideTag) VALUES
											  ('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',	0,			0,			'BULLET',		'BULLET');
INSERT INTO ArtDefine_StrategicView (StrategicViewType,									TileType,	Asset) VALUES
									('ART_DEF_UNIT_MEMBER_UC_ASSYRIAN_LEVY',			'Unit',		'u_slovakian_dobrovolnik.dds');
									