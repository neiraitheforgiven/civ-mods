--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 					IconSize, 		Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES		('CLCOASTSALISH_ATLAS', 		256, 		'SalishAtlas256.dds',		2, 				2),
			('CLCOASTSALISH_ATLAS', 		128, 		'SalishAtlas128.dds',		2, 				2),
			('CLCOASTSALISH_ATLAS', 		80, 		'SalishAtlas80.dds',		2, 				2),
			('CLCOASTSALISH_ATLAS', 		64, 		'SalishAtlas64.dds',		2, 				2),
			('CLCOASTSALISH_ATLAS', 		45, 		'SalishAtlas45.dds',		2, 				2),
			('CLCOASTSALISH_ATLAS', 		32, 		'SalishAtlas32.dds',		2, 				2),
			('CLSTOMEX_FLAG',				32, 		'UnitAlpha32.dds',			1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	128, 		'SalishAlpha128.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	80, 		'SalishAlpha80.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	64, 		'SalishAlpha64.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	48, 		'SalishAlpha48.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	45, 		'SalishAlpha45.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	32, 		'SalishAlpha32.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	24, 		'SalishAlpha24.dds',		1, 				1),
			('CLCOASTSALISH_ALPHA_ATLAS',	16, 		'SalishAlpha16.dds',		1, 				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_CLSEATTLE_PEACE', 	'SalishPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_CLSEATTLE_WAR', 		'SalishWar', 		'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 							SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_CLSEATTLE_PEACE',	'SND_LEADER_MUSIC_CLSEATTLE_PEACE', 'GAME_MUSIC', 	50, 		50, 		1, 			0),
		('AS2D_LEADER_MUSIC_CLSEATTLE_WAR',		'SND_LEADER_MUSIC_CLSEATTLE_WAR',	'GAME_MUSIC', 	50, 		50, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================