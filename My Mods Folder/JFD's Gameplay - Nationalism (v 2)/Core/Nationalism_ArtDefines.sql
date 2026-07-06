--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 	
		(SoundID, 										Filename, 					 LoadType)
VALUES	('SND_SOUND_JFD_NATIONALISM_POLICY_ADOPTED', 	'NationalismPolicyAdopted',	 'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									 SoundType,   Looping,  DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_SOUND_JFD_NATIONALISM_POLICY_ADOPTED',	'SND_SOUND_JFD_NATIONALISM_POLICY_ADOPTED',	 'GAME_SFX',  0,		1,						1,					-1.0,					100, 		100);	
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 						Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_JFD_NATIONALISM', 	0.392,	0.270,	1,		1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_NATIONALISM',	'FontIcons_JFD_Nationalism_22');		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 					IconFontTexture,						IconMapping)
VALUES	('ICON_JFD_NATIONALISM',	'ICON_FONT_TEXTURE_JFD_NATIONALISM',	1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 												IconSize, 	Filename, 												IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_NATIONALISM_TECH_MISC_ATLAS', 					45, 		'JFD_Nationalism_TechMisc_IconAtlas_45.dds',			1, 				1),
		('POLICY_A_ATLAS_NATIONALISM', 							64, 		'JFD_Nationalism_SocialPolicies_IconAtlas_64.dds',		8, 				8),
		('POLICY_A_ATLAS_EXP2_NATIONALISM', 					64, 		'JFD_Nationalism_SocialPoliciesXP2_IconAtlas_64.dds',	4, 				3),
		('EXPANSIONPATCH_POLICY_ACHIEVED_ATLAS_NATIONALISM', 	64, 		'JFD_Nationalism_SocialPoliciesXP2_IconAtlas_64.dds',	1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
