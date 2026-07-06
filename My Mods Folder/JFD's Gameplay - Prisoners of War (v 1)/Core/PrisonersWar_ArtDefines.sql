--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 	
		(SoundID, 										Filename, 						LoadType)
VALUES	('SND_SOUND_JFD_GENERIC_CHOICE', 				'GenericChoice',				'DynamicResident'),
		('SND_SOUND_JFD_PRISONERS_WAR_NOTIFICATION', 	'PrisonersWar_Notification',	'DynamicResident'),
		('SND_SOUND_JFD_PRISONERS_WAR_POPUP',			'PrisonersWar_Popup',			'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 										SoundType, 		Looping, DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_SOUND_JFD_GENERIC_CHOICE', 				'SND_SOUND_JFD_GENERIC_CHOICE', 				'GAME_SFX', 	0,		 1,						1,					-1.0,					100, 		100),
		('AS2D_SOUND_JFD_PRISONERS_WAR_NOTIFICATION', 	'SND_SOUND_JFD_PRISONERS_WAR_NOTIFICATION', 	'GAME_SFX', 	0,		 1,						1,					-1.0,					100, 		100),
		('AS2D_SOUND_JFD_PRISONERS_WAR_POPUP', 			'SND_SOUND_JFD_PRISONERS_WAR_POPUP', 			'GAME_SFX', 	0,		 1,						1,					-1.0,					100, 		100);	
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,			  IconMapping)
VALUES	('ICON_JFD_PRISONERS_WAR',	'ICON_FONT_TEXTURE_DEFAULT',  61);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_PRISONERS_WAR_NOTIFICATION_ATLAS', 	80, 		'JFD_PrisonersWar_NotificationAtlas_80.dds',	1, 				1);
--==========================================================================================================================
--==========================================================================================================================