--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_KNIGHT_AVIZ',	'Unit', 	'sv_OrderAviz.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_KNIGHT_AVIZ',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					    NumMembers)
SELECT	'ART_DEF_UNIT_JFD_KNIGHT_AVIZ',	 	'ART_DEF_UNIT_MEMBER_JFD_KNIGHT_AVIZ',  NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius,  ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KNIGHT_AVIZ',	EnableActions, DisableActions, MoveRadius,  ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin,  VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KNIGHT_AVIZ',	"Index", SubIndex, ID, VisKillStrengthMin,  VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_KNIGHT_AVIZ',	Scale,	ZOffset, Domain, 'orderaviz.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_PEACE', 	'JFD_PortugalAfonsoI_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_WAR',		'JFD_PortugalAfonsoI_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										 SoundType, 	TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_PEACE', 	'SND_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_PEACE',  'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_WAR', 	'SND_LEADER_MUSIC_JFD_PORTUGAL_AFONSO_I_WAR', 	 'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_PORTUGAL_AFONSO_I_ICON', 		0,		0.145,	0.301,	1),
		('COLOR_PLAYER_JFD_PORTUGAL_AFONSO_I_BACKGROUND',	0.666,	0.772,	0.701,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								  TextColor)
VALUES	('PLAYERCOLOR_JFD_PORTUGAL_AFONSO_I',	'COLOR_PLAYER_JFD_PORTUGAL_AFONSO_I_ICON',  'COLOR_PLAYER_JFD_PORTUGAL_AFONSO_I_BACKGROUND',  'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLAS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		128, 		'JFD_PortugalAfonsoI_AlphaAtlas_128.dds',		1,				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		80, 		'JFD_PortugalAfonsoI_AlphaAtlas_80.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		64, 		'JFD_PortugalAfonsoI_AlphaAtlas_64.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		48, 		'JFD_PortugalAfonsoI_AlphaAtlas_48.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		45, 		'JFD_PortugalAfonsoI_AlphaAtlas_45.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		32, 		'JFD_PortugalAfonsoI_AlphaAtlas_32.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		24, 		'JFD_PortugalAfonsoI_AlphaAtlas_24.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ALPHA_ATLAS', 		16, 		'JFD_PortugalAfonsoI_AlphaAtlas_16.dds',		1, 				1),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		256, 		'JFD_PortugalAfonsoI_IconAtlas_256.dds',		2, 				2),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		128, 		'JFD_PortugalAfonsoI_IconAtlas_128.dds',		2, 				2),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		80, 		'JFD_PortugalAfonsoI_IconAtlas_80.dds',			2, 				2),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		64, 		'JFD_PortugalAfonsoI_IconAtlas_64.dds',			2, 				2),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		45, 		'JFD_PortugalAfonsoI_IconAtlas_45.dds',			2, 				2),
		('JFD_PORTUGAL_AFONSO_I_ICON_ATLAS', 		32, 		'JFD_PortugalAfonsoI_IconAtlas_32.dds',			2, 				2),
		('JFD_PORTUGAL_AFONSO_I_UNIT_FLAG_ATLAS', 	32, 		'JFD_PortugalAfonsoI_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	


