--
INSERT INTO Civilizations (
Type,                                        Description,                        ShortDescription,                            Adjective,
Civilopedia,                                 CivilopediaTag,                     DefaultPlayerColor,                          ArtDefineTag,
ArtStyleType,                                ArtStyleSuffix,                     ArtStylePrefix,                              IconAtlas,
PortraitIndex,                               AlphaIconAtlas,                     SoundtrackTag,                               MapImage,
DawnOfManQuote,                              DawnOfManImage,                      DawnOfManAudio)
SELECT      
'CIVILIZATION_NTF_SENECA',                   'TXT_KEY_CIV_NTF_SENECA_DESC',      'TXT_KEY_CIV_NTF_SENECA_SHORT_DESC',         'TXT_KEY_CIV_NTF_SENECA_ADJECTIVE',
'TXT_KEY_NTF_SENECA_TEXT_1',                 'TXT_KEY_NTF_SENECA',               'PLAYERCOLOR_NTF_SENECA',                    ArtDefineTag,
ArtStyleType,                                ArtStyleSuffix,                     ArtStylePrefix,                              'NTF_SENECA_ATLAS',
0,                                           'NTF_SENECA_ALPHA_ATLAS',           'Iroquois',                                  'Senecamap.dds',
'TXT_KEY_CIV5_DOM_NTF_CORNPLANTER_TEXT',     'Seneca_DOM.dds',                   'AS2D_DOM_SPEECH_NTF_SENECA'
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');

-------------------------------- 
-- Ethnic Units Support
-------------------------------- 
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS' )
   THEN '_IROQUOIS'
   ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_NTF_SENECA';

--==========================================================================================================================  
-- Civilization_CityNames
--==========================================================================================================================  
INSERT INTO Civilization_CityNames 
(CivilizationType,                  CityName)
VALUES
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_01'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_02'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_03'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_04'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_05'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_06'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_07'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_08'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_09'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_10'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_11'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_12'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_13'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_14'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_15'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_16'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_17'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_18'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_19'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_20'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_21'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_22'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_23'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_24'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_25'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_26'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_27'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_28'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_29'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_CITY_NAME_NTF_SENECA_30');
--==========================================================================================================================  
-- Civilization_FreeBuildingClasses
--==========================================================================================================================        
INSERT INTO Civilization_FreeBuildingClasses 
         (CivilizationType,            BuildingClassType)
VALUES      ('CIVILIZATION_NTF_SENECA',      'BUILDINGCLASS_PALACE');
--==========================================================================================================================  
-- Civilization_FreeTechs
--==========================================================================================================================     
INSERT INTO Civilization_FreeTechs 
(CivilizationType,                  TechType)
VALUES
('CIVILIZATION_NTF_SENECA',         'TECH_AGRICULTURE');
--==========================================================================================================================  
-- Civilization_FreeUnits
--==========================================================================================================================     
INSERT INTO Civilization_FreeUnits 
(CivilizationType,         UnitClassType, Count, UnitAIType)
SELECT 
'CIVILIZATION_NTF_SENECA', UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================  
-- Civilization_Leaders
--==========================================================================================================================     
INSERT INTO Civilization_Leaders 
(CivilizationType,         LeaderheadType)
VALUES 
('CIVILIZATION_NTF_SENECA',   'LEADER_NTF_CORNPLANTER');
--==========================================================================================================================  
-- Civilization_UnitClassOverrides 
--==========================================================================================================================     
INSERT INTO Civilization_UnitClassOverrides 
(CivilizationType,                  UnitClassType,             UnitType)
VALUES 
('CIVILIZATION_NTF_SENECA',         'UNITCLASS_MUSKETMAN',     'UNIT_NTF_SHOCK_WARBAND');
--==========================================================================================================================  
-- Civilization_Religions
--==========================================================================================================================     
INSERT INTO Civilization_Religions 
(CivilizationType,                  ReligionType)
VALUES
('CIVILIZATION_NTF_SENECA',         'RELIGION_CHRISTIANITY');
--==========================================================================================================================  
-- Colors
--==========================================================================================================================     
INSERT INTO PlayerColors 
(Type,                     PrimaryColor,                       SecondaryColor,                              TextColor)
VALUES
('PLAYERCOLOR_NTF_SENECA', 'COLOR_PLAYER_NTF_SENECA_ICON',     'COLOR_PLAYER_NTF_SENECA_BACKGROUND',        'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
(Type,                                       Red,                       Green,                     Blue,                      Alpha)
VALUES
('COLOR_PLAYER_NTF_SENECA_ICON',             1,                         0.792156862745098,         0.5450980392156862,        1.0),
('COLOR_PLAYER_NTF_SENECA_BACKGROUND',       0.21176470588235294,       0.09019607843137255,       0.36470588235294116,       1.0);

--==========================================================================================================================  
-- Civilization_SpyNames
--==========================================================================================================================  
INSERT INTO Civilization_SpyNames 
(CivilizationType,                  SpyName)
VALUES
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_0'),   
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_1'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_2'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_3'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_4'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_5'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_6'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_7'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_8'),
('CIVILIZATION_NTF_SENECA',         'TXT_KEY_SPY_NAME_NTF_SENECA_9');
--==========================================================================================================================     
--==========================================================================================================================                 

--==========================================================================================================================  
-- Language_en_US
--==========================================================================================================================     
INSERT INTO Language_en_US
(Tag,                                        Text)
VALUES 
('TXT_KEY_CIV_NTF_SENECA_DESC',              'The Seneca'),
('TXT_KEY_CIV_NTF_SENECA_SHORT_DESC',        'The Seneca'),
('TXT_KEY_CIV_NTF_SENECA_ADJECTIVE',         'Seneca'),
('TXT_KEY_CIV5_NTF_SENECA',                  'The Seneca'),
('TXT_KEY_CIV5_DOM_NTF_CORNPLANTER_TEXT',    'In the days before American history was first put to the pen, your people, the Seneca were a mighty people who campaigned upon the Eastern lands of what would later be called the United States. Brave Cornplanter, the Seneca''s influence was felt in the agricultural practices of peoples from the Mississippi to the Great Lakes and south to what is now Florida.[NEWLINE][NEWLINE]Shrewd Cornplanter! Your people were known for their military might, feared their ability to strike faster than a rattlesnake. Yet, to your kin and your allies, you were known for your protection and commitment to peace. Now is a new age, where strangers both peaceful and wicked will seek your hand in battle. Will you keep a watchful eye for threats to peace as you build a nation that will stand the test of time?'),
('TXT_KEY_CITY_NAME_NTF_SENECA_01',          'Nundawao'),
('TXT_KEY_CITY_NAME_NTF_SENECA_02',          'Genundowa'),
('TXT_KEY_CITY_NAME_NTF_SENECA_03',          'Kanawagas'),
('TXT_KEY_CITY_NAME_NTF_SENECA_04',          'Chenussio'),
('TXT_KEY_CITY_NAME_NTF_SENECA_05',          'Kayahsuto''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_06',          'Ohio'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_07',          'Kaoto'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_08',          'Thanonokeo'),
('TXT_KEY_CITY_NAME_NTF_SENECA_09',          'Onota''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_10',          'Ka''taeaekeskeo'),
('TXT_KEY_CITY_NAME_NTF_SENECA_11',          'Tosyowe'),
('TXT_KEY_CITY_NAME_NTF_SENECA_12',          'Thanowote'),
('TXT_KEY_CITY_NAME_NTF_SENECA_13',          'Tketsoa'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_14',          'Tyoetse''syo'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_15',          'Ganondagan'),
('TXT_KEY_CITY_NAME_NTF_SENECA_16',          'Skanehtati'),
('TXT_KEY_CITY_NAME_NTF_SENECA_17',          'Wasto''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_18',          'Kasteeko'),
('TXT_KEY_CITY_NAME_NTF_SENECA_19',          'Kanye''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_20',          'Kanowoko'),
('TXT_KEY_CITY_NAME_NTF_SENECA_21',          'Tsyokowoti'),
('TXT_KEY_CITY_NAME_NTF_SENECA_22',          'Sweke'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_23',          'Kayaha''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_24',          'Tsyoneshiyo'),
('TXT_KEY_CITY_NAME_NTF_SENECA_25',          'Tyos''skwaeaetase'),
('TXT_KEY_CITY_NAME_NTF_SENECA_26',          'Kanoktiyo''ke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_27',          'Heyooke'),
('TXT_KEY_CITY_NAME_NTF_SENECA_28',          'Twasko'''),
('TXT_KEY_CITY_NAME_NTF_SENECA_29',          'Ha''teyoyaya''kto'),
('TXT_KEY_CITY_NAME_NTF_SENECA_30',          'Tyonohsateke'),
('TXT_KEY_SPY_NAME_NTF_SENECA_0',            'Handsome Lake'),
('TXT_KEY_SPY_NAME_NTF_SENECA_1',            'Ah-wen-Eyu'),
('TXT_KEY_SPY_NAME_NTF_SENECA_2',            'Governor Blacksnake'),
('TXT_KEY_SPY_NAME_NTF_SENECA_3',            'Red Jacket'),
('TXT_KEY_SPY_NAME_NTF_SENECA_4',            'Half-King'),
('TXT_KEY_SPY_NAME_NTF_SENECA_5',            'George'),
('TXT_KEY_SPY_NAME_NTF_SENECA_6',            'Chief Halftown'),
('TXT_KEY_SPY_NAME_NTF_SENECA_7',            'Destroy Town'),
('TXT_KEY_SPY_NAME_NTF_SENECA_8',            'Deerfoot'),
('TXT_KEY_SPY_NAME_NTF_SENECA_9',            'Chief John Big Tree');     