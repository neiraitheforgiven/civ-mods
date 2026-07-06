--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_SPAIN_PHILIP_II_ATLAS', 				256, 		'JFD_PhilipIISpainAtlas_256.dds',			2, 				2),
		('JFD_SPAIN_PHILIP_II_ATLAS', 				128, 		'JFD_PhilipIISpainAtlas_128.dds',			2, 				2),
		('JFD_SPAIN_PHILIP_II_ATLAS', 				80, 		'JFD_PhilipIISpainAtlas_80.dds',			2, 				2),
		('JFD_SPAIN_PHILIP_II_ATLAS', 				64, 		'JFD_PhilipIISpainAtlas_64.dds',			2, 				2),
		('JFD_SPAIN_PHILIP_II_ATLAS', 				45, 		'JFD_PhilipIISpainAtlas_45.dds',			2, 				2),
		('JFD_SPAIN_PHILIP_II_ATLAS', 				32, 		'JFD_PhilipIISpainAtlas_32.dds',			2, 				2);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_PHILIP_II_PEACE', 	'PhilipII_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_PHILIP_II_WAR',		'PhilipII_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_PHILIP_II_PEACE', 	'SND_LEADER_MUSIC_JFD_PHILIP_II_PEACE', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_PHILIP_II_WAR', 	'SND_LEADER_MUSIC_JFD_PHILIP_II_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	
