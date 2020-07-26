--==========================================================================================================================  
-- Leaders
--==========================================================================================================================        
INSERT INTO Leaders (
Type,                      Description,                        CivilopediaTag,                                       ArtDefineTag,
VictoryCompetitiveness,    WonderCompetitiveness,              MinorCivCompetitiveness,                              Boldness,
DiploBalance,              WarmongerHate,                      DenounceWillingness,                                  DoFWillingness,
Loyalty,                   Neediness,                          Forgiveness,                                          Chattiness,
Meanness,                  IconAtlas,                          PortraitIndex)
VALUES   (
'LEADER_NTF_CORNPLANTER',  'TXT_KEY_LEADER_NTF_CORNPLANTER',   'TXT_KEY_CIVILOPEDIA_LEADERS_NTF_CORNPLANTER',        'NTFCORNPLANTER_Scene.xml',
6,                         2,                                  6,                                                    7,
7,                         6,                                  7,                                                    7,
4,                         4,                                  8,                                                    4,
3,                         'CLBEOTHUK_ATLAS',                  1);
--==========================================================================================================================  
-- Leader_MajorCivApproachBiases
--==========================================================================================================================                 
INSERT INTO Leader_MajorCivApproachBiases (
LeaderType,                MajorCivApproachType,               Bias)
VALUES 
('LEADER_NTF_CORNPLANTER',  'MAJOR_CIV_APPROACH_WAR',           3),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_HOSTILE',       4),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_DECEPTIVE',     3),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_GUARDED',       7),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_AFRAID',        4),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_FRIENDLY',      4),
('LEADER_NTF_CORNPLANTER', 'MAJOR_CIV_APPROACH_NEUTRAL',       7);
--==========================================================================================================================  
-- Leader_MinorCivApproachBiases
--==========================================================================================================================                 
INSERT INTO Leader_MinorCivApproachBiases (
LeaderType,                MinorCivApproachType,               Bias)
VALUES
('LEADER_NTF_CORNPLANTER', 'MINOR_CIV_APPROACH_IGNORE',        4),
('LEADER_NTF_CORNPLANTER', 'MINOR_CIV_APPROACH_FRIENDLY',      5),
('LEADER_NTF_CORNPLANTER', 'MINOR_CIV_APPROACH_PROTECTIVE',    8),
('LEADER_NTF_CORNPLANTER', 'MINOR_CIV_APPROACH_CONQUEST',      8),
('LEADER_NTF_CORNPLANTER', 'MINOR_CIV_APPROACH_BULLY',         3);
--==========================================================================================================================  
-- Leader_Flavors
--==========================================================================================================================                 
INSERT INTO Leader_Flavors (
LeaderType,                FlavorType,                         Flavor)
VALUES      
('LEADER_NTF_CORNPLANTER', 'FLAVOR_OFFENSE',                   3),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_DEFENSE',                   8),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_CITY_DEFENSE',              6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_MILITARY_TRAINING',         5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_RECON',                     7),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_RANGED',                    6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_MOBILE',                    4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_NAVAL',                     4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_NAVAL_RECON',               6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_NAVAL_GROWTH',              6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_AIR',                       6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_EXPANSION',                 8),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_GROWTH',                    4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_TILE_IMPROVEMENT',          8),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_INFRASTRUCTURE',            8),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_PRODUCTION',                6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_GOLD',                      4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_SCIENCE',                   5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_CULTURE',                   6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_HAPPINESS',                 4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_GREAT_PEOPLE',              6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_WONDER',                    2),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_RELIGION',                  5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_DIPLOMACY',                 8),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_SPACESHIP',                 4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_WATER_CONNECTION',          5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_NUKE',                      4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_USE_NUKE',                  6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_ESPIONAGE',                 5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_AIRLIFT',                   5),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_I_TRADE_DESTINATION',       6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_I_TRADE_ORIGIN',            6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_I_SEA_TRADE_ROUTE',         4),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_I_LAND_TRADE_ROUTE',        6),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_ARCHAEOLOGY',               3),
('LEADER_NTF_CORNPLANTER', 'FLAVOR_AIR_CARRIER',               4);
--==========================================================================================================================  
-- Leader_Traits
--==========================================================================================================================  
INSERT INTO Leader_Traits (
LeaderType,                TraitType)
VALUES 
('LEADER_NTF_CORNPLANTER', 'TRAIT_NTF_SENECA');
--==========================================================================================================================           
--==========================================================================================================================     

--==========================================================================================================================  
-- Language_en_US
--==========================================================================================================================     
INSERT INTO Language_en_US (
Tag,                                     Text)
VALUES
('TXT_KEY_LEADER_NTF_CORNPLANTER',                             'Cornplanter'),
('TXT_KEY_LEADER_NTF_CORNPLANTER_PEDIA',                       'Cornplanter'),
('TXT_KEY_CIVILOPEDIA_LEADERS_NTF_CORNPLANTER_NAME',           'Cornplanter'),
('TXT_KEY_CIVILOPEDIA_LEADERS_NTF_CORNPLANTER_SUBTITLE',       'War Chief and Diplomat'),
('TXT_KEY_CIVILOPEDIA_LEADERS_NTF_CORNPLANTER_LIVED',          'c.1740 - 1836');
