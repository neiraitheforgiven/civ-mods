--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('MC_NABATEA_ATLAS', 					256, 		'MC_Nabatea_256.dds',						5, 				1),
			('MC_NABATEA_ATLAS', 					128, 		'MC_Nabatea_128.dds',						5, 				1),
			('MC_NABATEA_ATLAS', 					80, 		'MC_Nabatea_80.dds',						5, 				1),
			('MC_NABATEA_ATLAS', 					64, 		'MC_Nabatea_64.dds',						5, 				1),
			('MC_NABATEA_ATLAS', 					45, 		'MC_Nabatea_45.dds',						5, 				1),
			('MC_NABATEA_ATLAS', 					32, 		'MC_Nabatea_32.dds',						5, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				128, 		'MC_Nabatea_Alpha_128.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				80, 		'MC_Nabatea_Alpha_80.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				64, 		'MC_Nabatea_Alpha_64.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				48, 		'MC_Nabatea_Alpha_48.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				45, 		'MC_Nabatea_Alpha_45.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				32, 		'MC_Nabatea_Alpha_32.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				24, 		'MC_Nabatea_Alpha_24.dds',					1, 				1),
			('MC_NABATEA_ALPHA_ATLAS', 				16, 		'MC_Nabatea_Alpha_16.dds',					1, 				1),
			('MC_ZABONAH_FLAG', 					32, 		'MC_Zabonah_32.dds',						1, 				1);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
SELECT	'ART_DEF_UNIT_MC_ZABONAH', 				TileType, 	'sv_Zabonah.dds'
FROM ArtDefine_StrategicView WHERE	StrategicViewType = 'ART_DEF_UNIT_CARAVAN';
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_MC_ZABONAH', 				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	Type = 'ART_DEF_UNIT_CARAVAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
VALUES		('ART_DEF_UNIT_MC_ZABONAH',		'ART_DEF_UNIT_MEMBER_CARAVAN',			1),
			('ART_DEF_UNIT_MC_ZABONAH',		'ART_DEF_UNIT_MEMBER_EURODONKEY',		2);
--==========================================================================================================================	
-- Audio_Sounds 
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 							LoadType)
VALUES		('SND_LEADER_MUSIC_MC_ARETAS_PEACE',	 	'Nabatea_Peace',					'DynamicResident'),
			('SND_LEADER_MUSIC_MC_ARETAS_WAR', 			'Nabatea_War', 						'DynamicResident'),
			('SND_TRAIT_MC_NABATEA', 					'Nabatea_UA',						'DynamicResident');	
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_MC_ARETAS_PEACE', 			'SND_LEADER_MUSIC_MC_ARETAS_PEACE', 		'GAME_MUSIC', 		80, 		80, 		1, 		 0),
			('AS2D_LEADER_MUSIC_MC_ARETAS_WAR', 			'SND_LEADER_MUSIC_MC_ARETAS_WAR', 			'GAME_MUSIC', 		80, 		80, 		1,		 0);

INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 						SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_SOUND_TRAIT_MC_NABATEA', 			'SND_TRAIT_MC_NABATEA', 		'GAME_SFX', 	0.0,					100, 		100, 		0, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		