--==========================================================================================================================    
-- Civilizations
--==========================================================================================================================                
INSERT INTO Civilizations   
(Type, Description, ShortDescription, Adjective, CivilopediaTag, DefaultPlayerColor, ArtDefineTag,
ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, PortraitIndex, AlphaIconAtlas, 
SoundtrackTag, MapImage, DawnOfManQuote, DawnOfManImage, DawnOfManAudio)
SELECT 
('CIVILIZATION_NTF_NEZPERCE'), --Type
('TXT_KEY_NTF_NEZPERCE_DESC'), --Description
('TXT_KEY_NTF_NEZPERCE'), --ShortDescriptiong
('TXT_KEY_NTF_NEZPERCE_ADJECTIVE'), --Adjective
('TXT_KEY_CIVLOPEDIA_NTF_NEZPERCE'), --CivilopediaTag
('PLAYERCOLOR_NTF_NEZPERCE'), --DefaultPlayerColor
ArtDefineTag,
ArtStyleType,
ArtStyleSuffix,
ArtStylePrefix,
('NTF_NEZPERCE_ATLAS'), --IconAtlas
0,
('NTF_NEZPERCE_ALPHA_ATLAS'),
('Iroquois'), --SoundtrackTag
('NTF_NEZPERCE_Map.dds'), --MapImage
('TXT_KEY_DAWN_OF_MAN_NTF_NEZPERCE_TEXT'), --DawnOfManImage
('NTF_NEZPERCE_DoM.dds'), --DawnOfManImage
('AS2D_DOM_SPEECH_NTF_NEZPERCE') --DawnOfManAudio
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');

--==========================================================================================================================    
-- Civilization_Leaders
--==========================================================================================================================        
INSERT INTO Civilization_Leaders 
            (CivilizationType,              LeaderheadType)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'LEADER_NTF_CHIEFJOSEF');

--==========================================================================================================================    
-- Civilization_FreeBuildingClasses
--==========================================================================================================================        
INSERT INTO Civilization_FreeBuildingClasses 
            (CivilizationType,              BuildingClassType)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'BUILDINGCLASS_PALACE');
            
--==========================================================================================================================    
-- Civilization_FreeTechs
--==========================================================================================================================        
INSERT INTO Civilization_FreeTechs 
            (CivilizationType,              TechType)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'TECH_AGRICULTURE');
            
--==========================================================================================================================    
-- Civilization_FreeUnits
--==========================================================================================================================        
INSERT INTO Civilization_FreeUnits 
            (CivilizationType,              UnitClassType,          Count,      UnitAIType)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'UNITCLASS_SETTLER',    1,          'UNITAI_SETTLE');
    
--==========================================================================================================================    
-- Civilization_UnitClassOverrides
--==========================================================================================================================        
INSERT INTO Civilization_UnitClassOverrides 
            (CivilizationType,              UnitClassType,          UnitType)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'UNITCLASS_LANCER',     'UNIT_NTF_NEZPERCE_APPALOOSA');
            
--==========================================================================================================================    
-- Civilization_Religions
--==========================================================================================================================        
INSERT INTO Civilization_Religions 
            (CivilizationType,             ReligionType)
SELECT      'CIVILIZATION_NTF_NEZPERCE',   ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_IROQUOIS');

--==========================================================================================================================    
-- Colors
--==========================================================================================================================            
INSERT INTO Colors 
            (Type,                                      Red,        Green,      Blue,       Alpha)
VALUES      ('COLOR_PLAYER_NTF_NEZPERCE_ICON',         0.678,      0.407,      0.353,      1),
            ('COLOR_PLAYER_NTF_NEZPERCE_BACKGROUND',   0.157,      0.169,      0.235,      1);
--==========================================================================================================================    
-- PlayerColors
--==========================================================================================================================                
INSERT INTO PlayerColors 
            (Type,                          PrimaryColor,                       SecondaryColor,                         TextColor)
VALUES      ('PLAYERCOLOR_NTF_NEZPERCE',   'COLOR_PLAYER_NTF_NEZPERCE_ICON', 'COLOR_PLAYER_NTF_NEZPERCE_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================    
-- Civilization_CityNames
--==========================================================================================================================            
INSERT INTO Civilization_CityNames                      
        (CivilizationType,              CityName)
VALUES  ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_KAMIAH'),Kamiah
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_ALLPAWAWAII'),Al''pawawaii 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_WALLOWA'), Wallowa
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_SAHATP'),Sáhatp
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_TUCANNON'),Tucannon
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_WILLIWEWIX'),Williwewix 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_NACOXKUUS'),Naco''x Kuus
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_WAWAWIH'),Wawáwih
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_SILAYLOO'),Silayloo
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_WEYIKESPE'),Weyikespe
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_XUYELP'),Xuyelp
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_PINAWAWI'),Pinăwăwi
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_SHIMINEKEM'), Shimínĕkĕm
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_AHSAHKA'),. Ahsahka
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_KAMIAHP'),Kămiăhp
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_LAMTAMA'),Lamtáma
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_LEEPWEY'), Léepwey 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_SAKAN'),Sakán 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_IWASNIMA'),Iyăsnimă 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_YAKTOIN'),Yaktōin 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_IWATOIN'),Iwatōin 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_TUNEHE'),Tunĕhĕ 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_PALOT'),Palót 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_HASUTIN'),Hasutin 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_HASEIWAWIH'),Hăsweiwăwih 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_ANATOIN'),Ánatōin 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_HINSEPU'),Hinsepu 
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_PIPUINIMU');  Pipu''inimu           
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_KUSEYNEISEKIT'),Kuseyneisekit
        ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_CITY_NAME_NTF_NEZPERCE_UMATILLA'),Umatilla

--==========================================================================================================================    
-- Civilization_SpyNames
--==========================================================================================================================        
INSERT INTO Civilization_SpyNames 
            (CivilizationType,              SpyName)
VALUES      ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_0'),  
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_1'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_2'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_3'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_4'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_5'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_6'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_7'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_8'),
            ('CIVILIZATION_NTF_NEZPERCE',  'TXT_KEY_SPY_NAME_NTF_NEZPERCE_9');
--==========================================================================================================================    
--==========================================================================================================================    
