--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 	
		(SoundID, 									Filename, 					LoadType)
VALUES	('SND_GREAT_WORK_JFD_RELIC', 				'gwr00',					'DynamicResident'),
		('SND_UNIT_GREAT_PROPHET_ACTIVATE', 		'GreatProphetActivate',		'DynamicResident'),
		('SND_WONDER_SPEECH_JFD_SOLOMONS_TEMPLE',	'Wonder_SolomonsTemple',	'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 				Looping,	DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_GREAT_WORK_JFD_RELIC', 				'SND_GREAT_WORK_JFD_RELIC',					'GAME_MUSIC_STINGS', 	0,			1,						1,					0,						100, 		100),
		('AS2D_UNIT_GREAT_PROPHET_ACTIVATE', 		'SND_UNIT_GREAT_PROPHET_ACTIVATE', 			'GAME_SFX', 			0,			1,						1,					-1.0,					100, 		100),			
		('AS2D_WONDER_SPEECH_JFD_SOLOMONS_TEMPLE',	'SND_WONDER_SPEECH_JFD_SOLOMONS_TEMPLE',	'GAME_SFX', 			0,			1,						1,					-1.0,					75, 		75);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================	
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_GREAT_RELICS',   'FontIcons_JFD_GreatRelics_22');
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 			 IconFontTexture,						IconMapping)
VALUES	('ICON_JFD_RELIC',	 'ICON_FONT_TEXTURE_JFD_GREAT_RELICS',	1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_GREAT_RELICS_ICON_ATLAS', 	256, 		'JFD_GreatRelics_IconAtlas_256.dds',	2, 				2),
		('JFD_GREAT_RELICS_ICON_ATLAS', 	128, 		'JFD_GreatRelics_IconAtlas_128.dds',	2, 				2),
		('JFD_GREAT_RELICS_ICON_ATLAS', 	80, 		'JFD_GreatRelics_IconAtlas_80.dds',		2, 				2),
		('JFD_GREAT_RELICS_ICON_ATLAS', 	64, 		'JFD_GreatRelics_IconAtlas_64.dds',		2, 				2),
		('JFD_GREAT_RELICS_ICON_ATLAS', 	45, 		'JFD_GreatRelics_IconAtlas_45.dds',		2, 				2),
		('JFD_GREAT_RELICS_ICON_ATLAS', 	32, 		'JFD_GreatRelics_IconAtlas_32.dds',		2, 				2);
--==========================================================================================================================
--==========================================================================================================================