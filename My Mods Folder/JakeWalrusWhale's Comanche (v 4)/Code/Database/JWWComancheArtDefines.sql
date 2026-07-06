--================================================================
-- Art Defines
--================================================================
--================================================================
-- Audio
--================================================================

INSERT INTO Audio_Sounds
		(SoundID,									Filename,				LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_IRON_JACKET_PEACE',	'JWWComanche_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_IRON_JACKET_WAR',	'JWWComanche_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,											SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_IRON_JACKET_PEACE',			'SND_LEADER_MUSIC_JWW_IRON_JACKET_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_IRON_JACKET_WAR',			'SND_LEADER_MUSIC_JWW_IRON_JACKET_WAR',		'GAME_MUSIC',	-1.0,					30,			30,			1,			0);

--================================================================
-- Colors
--================================================================

INSERT INTO PlayerColors
		(Type,							PrimaryColor,							SecondaryColor,								TextColor)
VALUES	('PLAYERCOLOR_JWW_COMANCHE',	'COLOR_PLAYER_JWW_COMANCHE_ICON',		'COLOR_PLAYER_JWW_COMANCHE_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,										Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_COMANCHE_ICON',			0.914,		0.612,		0.463,		1.0),
		('COLOR_PLAYER_JWW_COMANCHE_BACKGROUND',	0.533,		0.149,		0.224,		1.0);

--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,									IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_COMANCHE_COLOR_ATLAS',			'256',			'JWWComancheIconAtlas256.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'128',			'JWWComancheIconAtlas128.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'80',			'JWWComancheIconAtlas80.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'64',			'JWWComancheIconAtlas64.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'48',			'JWWComancheIconAtlas48.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'45',			'JWWComancheIconAtlas45.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'32',			'JWWComancheIconAtlas32.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'24',			'JWWComancheIconAtlas24.dds',		3,				2),
		('JWW_COMANCHE_COLOR_ATLAS',			'16',			'JWWComancheIconAtlas16.dds',		3,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'256',			'JWWComancheIconAtlas256.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'128',			'JWWComancheIconAtlas128.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'80',			'JWWComancheIconAtlas80.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'64',			'JWWComancheIconAtlas64.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'48',			'JWWComancheIconAtlas48.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'45',			'JWWComancheIconAtlas45.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'32',			'JWWComancheIconAtlas32.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'24',			'JWWComancheIconAtlas24.dds',		1,				2),
		('JWW_COMANCHE_ALPHA_ATLAS',			'16',			'JWWComancheIconAtlas16.dds',		1,				2),
		('JWW_COMANCHE_RELIGION_ATLAS',			'128',			'JWWPeyotismAlpha128.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'80',			'JWWPeyotismAlpha80.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'64',			'JWWPeyotismAlpha64.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'48',			'JWWPeyotismAlpha48.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'32',			'JWWPeyotismAlpha32.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'24',			'JWWPeyotismAlpha24.dds',			1,				1),
		('JWW_COMANCHE_RELIGION_ATLAS',			'16',			'JWWPeyotismAlpha16.dds',			1,				1),
		('JWW_COMANCHE_PILLAGE_ATLAS',			'64',			'JWWComanchePillageAtlas64.dds',	1,				1),
		('JWW_COMANCHE_PILLAGE_ATLAS',			'45',			'JWWComanchePillageAtlas45.dds',	1,				1);
--================================================================
-- Font Icon
--================================================================
INSERT INTO IconFontTextures 
		(IconFontTexture, 						IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JWW_PEYOTISM', 		'JWWPeyotismFontIcon22');

INSERT INTO IconFontMapping 
		(IconName, 								IconFontTexture,					IconMapping)
VALUES	('ICON_RELIGION_JWW_PEYOTISM',			'ICON_FONT_TEXTURE_JWW_PEYOTISM',	1);
--================================================================
--================================================================