--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations
(Type, Description, ShortDescription, Adjective, CivilopediaTag, DefaultPlayerColor, ArtDefineTag,
ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, PortraitIndex, AlphaIconAtlas,
SoundtrackTag, MapImage, DawnOfManQuote, DawnOfManImage, DawnOfManAudio)
SELECT
('CIVILIZATION_NTF_POHNPEI'), --Type
('TXT_KEY_NTF_POHNPEI_DESC'), --Description
('TXT_KEY_NTF_POHNPEI'), --ShortDescriptiong
('TXT_KEY_NTF_POHNPEI_ADJECTIVE'), --Adjective
('TXT_KEY_CIVLOPEDIA_NTF_POHNPEI'), --CivilopediaTag
('PLAYERCOLOR_NTF_POHNPEI'), --DefaultPlayerColor
ArtDefineTag,
ArtStyleType,
ArtStyleSuffix,
ArtStylePrefix,
('NTF_POHNPEI_ATLAS'), --IconAtlas
0,
('NTF_POHNPEI_ALPHA_ATLAS'),
('DLC_01_POLYNESIA'), --SoundtrackTag
('NTF_POHNPEI_Map.dds'), --MapImage
('TXT_KEY_DAWN_OF_MAN_NTF_POHNPEI_TEXT'), --DawnOfManImage
('NTF_POHNPEI_DoM.dds'), --DawnOfManImage
('AS2D_DOM_SPEECH_NTF_POHNPEI') --DawnOfManAudio
FROM Civilizations WHERE (Type = 'CIVILIZATION_POLYNESIA');

--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================
INSERT INTO Civilization_Leaders
            (CivilizationType,              LeaderheadType)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'LEADER_NTF_SAPW');

--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================
INSERT INTO Civilization_FreeBuildingClasses
            (CivilizationType,              BuildingClassType)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'BUILDINGCLASS_PALACE');

--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================
INSERT INTO Civilization_FreeTechs
            (CivilizationType,              TechType)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'TECH_AGRICULTURE');

--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================
INSERT INTO Civilization_FreeUnits
            (CivilizationType,              UnitClassType,          Count,      UnitAIType)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'UNITCLASS_SETTLER',    1,          'UNITAI_SETTLE');

--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides
            (CivilizationType,              UnitClassType,          UnitType)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'UNITCLASS_HORSEMAN',     'UNIT_NTF_POHNPEI_SOUNPEI');

--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================
INSERT INTO Civilization_Religions
            (CivilizationType,             ReligionType)
SELECT      'CIVILIZATION_NTF_POHNPEI',   ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');

--==========================================================================================================================
-- Colors
--==========================================================================================================================
INSERT INTO Colors
            (Type,                                      Red,        Green,      Blue,       Alpha)
VALUES      ('COLOR_PLAYER_NTF_POHNPEI_ICON',         0.427,      0.298,      0.255,      1),
            ('COLOR_PLAYER_NTF_POHNPEI_BACKGROUND',   0.000,      0.475,      0.420,      1);
--==========================================================================================================================
-- PlayerColors
--==========================================================================================================================
INSERT INTO PlayerColors
            (Type,                          PrimaryColor,                       SecondaryColor,                         TextColor)
VALUES      ('PLAYERCOLOR_NTF_POHNPEI',   'COLOR_PLAYER_NTF_POHNPEI_ICON', 'COLOR_PLAYER_NTF_POHNPEI_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================
INSERT INTO Civilization_CityNames
        (CivilizationType,              CityName)
VALUES  ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_KOLONIA'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_PALIKIR'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_WALLOWA'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_SAHATP'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_TUCANNON'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_WILLIWEWIX'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_NACOXKUUS'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_WAWAWIH'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_SILAYLOO'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_WEYIKESPE'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_XUYELP'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_PINAWAWI'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_SHIMINEKEM'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_AHSAHKA'),.
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_KAMIAHP'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_LAMTAMA'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_LEEPWEY'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_SAKAN'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_IWASNIMA'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_YAKTOIN'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_IWATOIN'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_TUNEHE'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_PALOT'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_HASUTIN'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_HASEIWAWIH'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_ANATOIN'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_HINSEPU'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_PIPUINIMU'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_KUSEYNEISEKIT'),
        ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_CITY_NAME_NTF_POHNPEI_UMATILLA');

--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================
INSERT INTO Civilization_SpyNames
            (CivilizationType,              SpyName)
VALUES      ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_0'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_1'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_2'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_3'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_4'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_5'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_6'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_7'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_8'),
            ('CIVILIZATION_NTF_POHNPEI',  'TXT_KEY_SPY_NAME_NTF_POHNPEI_9');
--==========================================================================================================================
--==========================================================================================================================
