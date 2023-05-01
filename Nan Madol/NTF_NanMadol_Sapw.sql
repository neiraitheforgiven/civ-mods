--==========================================================================================================================
-- Leaders
--==========================================================================================================================
INSERT INTO Leaders
(Type, Description, Civilopedia, CivilopediaTag, ArtDefineTag, VictoryCompetitiveness,
WonderCompetitiveness, MinorCivCompetitiveness, Boldness, DiploBalance, WarmongerHate,
DenounceWillingness, DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness,
IconAtlas, PortraitIndex)
VALUES
('LEADER_NTF_SAPW', --Type
'TXT_KEY_LEADER_NTF_SAPW_DESC', --Description
'TXT_KEY_LEADER_NTF_SAPW', --Civilopedia
'TXT_KEY_LEADER_NTF_SAPW', --CivilopediaTag
'NTF_POHNPEI_Leaderscene.xml', --ArtDefineTag
6, --VictoryCompetitveness
8, --WoncerCompetitiveness
5, --MinorCivCompetitveness
8, --Boldness
3, --diplobalance
3, --warmongerhate
7, --denouncewillingness
5, --DOFWillingness
8, --loyalty
3, --neediness
8, --forgiveness
2, --chattiness
2, --meanness
'NTF_POHNPEI_ATLAS', --IconAtlas
1);

--==========================================================================================================================
-- Diplomacy_Responses
--==========================================================================================================================
INSERT INTO Diplomacy_Responses
        (LeaderType,                ResponseType,                                         Response,                                                                     Bias)
VALUES  ('LEADER_NTF_SAPW',   'RESPONSE_MINOR_CIV_COMPETITION',                     'TXT_KEY_LEADER_NTF_SAPW_MINOR_CIV_COMPETITION%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_FIRST_GREETING',                            'TXT_KEY_LEADER_NTF_SAPW_FIRSTGREETING%',                           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DEFEATED',                                  'TXT_KEY_LEADER_NTF_SAPW_DEFEATED%',                                2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_REPEAT_TOO_MUCH',                  'TXT_KEY_LEADER_NTF_SAPW_REPEAT_TOO_MUCH%',                         2),
        ('LEADER_NTF_SAPW',   'RESPONSE_REPEAT_TRADE_TOO_MUCH',                     'TXT_KEY_LEADER_NTF_SAPW_REPEAT_TRADE_TOO_MUCH%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_REPEAT',                   'TXT_KEY_LEADER_NTF_SAPW_REPEAT_TOO_MUCH%',                         2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_HELLO',                    'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_HELLO%',                  2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_POLITE_HELLO',                     'TXT_KEY_LEADER_NTF_SAPW_GREETING_POLITE_HELLO%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_HUMAN_AT_WAR',             'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_HUMAN_AT_WAR%',           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HUMAN_AT_WAR',                     'TXT_KEY_LEADER_NTF_SAPW_GREETING_HUMAN_AT_WAR%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',       'TXT_KEY_LEADER_NTF_SAPW_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_AGGRESSIVE_MILITARY',              'TXT_KEY_LEADER_NTF_SAPW_AGGRESSIVE_MILITARY_WARNING%',             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING',   'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING%', 2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_AGGRESSIVE_PLOT_BUYING',           'TXT_KEY_LEADER_NTF_SAPW_GREETING_AGGRESSIVE_PLOT_BUYING%',         2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_EXPANSION',     'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_AGGRESSIVE_EXPANSION%',   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_AGGRESSIVE_EXPANSION',             'TXT_KEY_LEADER_NTF_SAPW_GREETING_AGGRESSIVE_EXPANSION%',           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY',         'TXT_KEY_LEADER_NTF_SAPW_GREETING_FRIENDLY_STRONG_MILITARY%',       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_FRIENDLY_STRONG_ECONOMY',          'TXT_KEY_LEADER_NTF_SAPW_GREETING_FRIENDLY_STRONG_ECONOMY%',        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_HUMAN_FEW_CITIES',         'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_HUMAN_FEW_CITIES%',       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY',         'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_HUMAN_SMALL_ARMY%',       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER',       'TXT_KEY_LEADER_NTF_SAPW_GREETING_HOSTILE_HUMAN_IS_WARMONGER%',     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_TOO_SOON_FOR_DOF',                          'TXT_KEY_LEADER_NTF_SAPW_TOO_SOON_FOR_DOF%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',               'TXT_KEY_LEADER_NTF_SAPW_RESPONSE_TO_BEING_DENOUNCED%',             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_WORK_AGAINST_SOMEONE',                      'TXT_KEY_LEADER_NTF_SAPW_DENOUNCE%',                                2),
        ('LEADER_NTF_SAPW',   'RESPONSE_AI_DOF_BACKSTAB',                           'TXT_KEY_LEADER_NTF_SAPW_DENOUNCE%',                                2),
        ('LEADER_NTF_SAPW',   'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',               'TXT_KEY_LEADER_NTF_SAPW_RESPONSE_TO_BEING_DENOUNCED%',             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DOFED_FRIEND',                        'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DOFED_FRIEND%',                      2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DOFED_ENEMY',                         'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DOFED_ENEMY%',                       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DENOUNCED_ENEMY',                     'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DENOUNCED_ENEMY%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DENOUNCED_FRIEND',                    'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DENOUNCED_FRIEND%',                  2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DOF_SO_AI_DOF',                       'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DOF_SO_AI_DOF%',                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE',             'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DENOUNCE_SO_AI_DENOUNCE%',           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_DOF_SO_AI_DENOUNCE',                  'TXT_KEY_LEADER_NTF_SAPW_HUMAN_DOF_SO_AI_DENOUNCE%',                2),
        ('LEADER_NTF_SAPW',   'RESPONSE_COOP_WAR_REQUEST',                          'TXT_KEY_LEADER_NTF_SAPW_COOP_WAR_REQUEST%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_COOP_WAR_TIME',                             'TXT_KEY_LEADER_NTF_SAPW_COOP_WAR_TIME%',                           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_WORK_WITH_US',                              'TXT_KEY_LEADER_NTF_SAPW_DEC_FRIENDSHIP%',                          2),
        ('LEADER_NTF_SAPW',   'RESPONSE_PLOT_BUYING_WARNING',                       'TXT_KEY_LEADER_NTF_SAPW_PLOT_BUYING_WARNING%',                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_PLOT_BUYING_SERIOUS_WARNING',               'TXT_KEY_LEADER_NTF_SAPW_PLOT_BUYING_SERIOUS_WARNING%',             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_EXPANSION_SERIOUS_WARNING',                 'TXT_KEY_LEADER_NTF_SAPW_EXPANSION_SERIOUS_WARNING%',               2),
        ('LEADER_NTF_SAPW',   'RESPONSE_EXPANSION_WARNING',                         'TXT_KEY_LEADER_NTF_SAPW_EXPANSION_WARNING%',                       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING',               'TXT_KEY_LEADER_NTF_SAPW_AGGRESSIVE_MILITARY_WARNING%',             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_RETURNED_CIVILIAN',                         'TXT_KEY_LEADER_NTF_SAPW_RETURNED_CIVILIAN%',                       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DECLARATION_PROTECT_CITY_STATE',            'TXT_KEY_LEADER_NTF_SAPW_DECLARATION_PROTECT_CITY_STATE%',          2),
        ('LEADER_NTF_SAPW',   'RESPONSE_BULLIED_PROTECTED_CITY_STATE',              'TXT_KEY_LEADER_NTF_SAPW_BULLIED_PROTECTED_CITY_STATE%',            2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_PROTECTED_CITY_STATE',             'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_PROTECTED_CITY_STATEE%',          2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DECLARATION_ABANDON_CITY_STATE',            'TXT_KEY_LEADER_NTF_SAPW_DECLARATION_ABANDON_CITY_STATE%',          2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DONT_SETTLE_YES',                           'TXT_KEY_LEADER_NTF_SAPW_DONT_SETTLE_YES%',                         2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DONT_SETTLE_NO',                            'TXT_KEY_LEADER_NTF_SAPW_DONT_SETTLE_NO%',                          2),
        ('LEADER_NTF_SAPW',   'RESPONSE_LUXURY_TRADE',                              'TXT_KEY_LEADER_NTF_SAPW_LUXURY_TRADE%',                            2),
        ('LEADER_NTF_SAPW',   'RESPONSE_OPEN_BORDERS_EXCHANGE',                     'TXT_KEY_LEADER_NTF_SAPW_OPEN_BORDERS_EXCHANGE%',                   2),
        ('LEADER_NTF_SAPW',   'RESPONSE_REQUEST',                                   'TXT_KEY_LEADER_NTF_SAPW_RESPONSE_REQUEST%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_HOSTILE',                          'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_WEAK_HOSTILE',                     'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_STRONG_HOSTILE',                   'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_EXCITED',                          'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_WEAK_EXCITED',                     'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_STRONG_EXCITED',                   'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_SAD',                              'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_SAD%',                            2),
        ('LEADER_NTF_SAPW',   'RESPONSE_ATTACKED_BETRAYED',                         'TXT_KEY_LEADER_NTF_SAPW_ATTACKED_BETRAYED%',                       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_GENERIC',                               'TXT_KEY_LEADER_NTF_SAPW_DOW_GENERIC%',                             2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_LAND',                                  'TXT_KEY_LEADER_NTF_SAPW_DOW_LAND%',                                2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_WORLD_CONQUEST',                        'TXT_KEY_LEADER_NTF_SAPW_DOW_WORLD_CONQUEST%',                      2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_OPPORTUNITY',                           'TXT_KEY_LEADER_NTF_SAPW_DOW_OPPORTUNITY%',                         2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_DESPERATE',                             'TXT_KEY_LEADER_NTF_SAPW_DOW_DESPERATE%',                           2),
        ('LEADER_NTF_SAPW',   'RESPONSE_DOW_REGRET',                                'TXT_KEY_LEADER_NTF_SAPW_DOW_REGRET%',                              2),
        ('LEADER_NTF_SAPW',   'RESPONSE_TOO_SOON_NO_PEACE',                         'TXT_KEY_LEADER_NTF_SAPW_TOO_SOON_NO_PEACE%',                       2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_GOOD',  'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING_BAD',           'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_BAD',             'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_WE_ATTACKED_MINOR_BAD',                     'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_BAD',   'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_ATTACKED_MINOR_BAD',                  'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_BAD',       'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_BAD',     'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_PLOT_BUYING_WARNING_BAD',             'TXT_KEY_LEADER_NTF_SAPW_BAD%',                                     2),
        ('LEADER_NTF_SAPW',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING_GOOD',          'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_GOOD',            'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_WE_ATTACKED_MINOR_GOOD',                    'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_ATTACKED_MINOR_GOOD',                 'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_GOOD',      'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_GOOD',    'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2),
        ('LEADER_NTF_SAPW',   'RESPONSE_HUMAN_PLOT_BUYING_WARNING_GOOD',            'TXT_KEY_LEADER_NTF_SAPW_GOOD%',                                    2);

--==========================================================================================================================
-- Traits
--==========================================================================================================================
INSERT INTO Traits
            (Type,                                    Description,                                  ShortDescription)
VALUES      ('TRAIT_NTF_SORCERERS_CITY',    'TXT_KEY_TRAIT_NTF_SORCERERS_CITY', 'TXT_KEY_TRAIT_NTF_SORCERERS_CITY_SHORT');

--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================
INSERT INTO Leader_Traits
            (LeaderType,              TraitType)
VALUES      ('LEADER_NTF_SAPW', 'TRAIT_NTF_SORCERERS_CITY');

--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================
INSERT INTO Leader_MajorCivApproachBiases
            (LeaderType,                    MajorCivApproachType,               Bias)
VALUES      ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_WAR',           2),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_HOSTILE',       7),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_DECEPTIVE',     4),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_GUARDED',       7),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_AFRAID',        2),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_FRIENDLY',      4),
            ('LEADER_NTF_SAPW',   'MAJOR_CIV_APPROACH_NEUTRAL',       4);

--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================
INSERT INTO Leader_MinorCivApproachBiases
            (LeaderType,                    MinorCivApproachType,               Bias)
VALUES      ('LEADER_NTF_SAPW',   'MINOR_CIV_APPROACH_IGNORE',        4),
            ('LEADER_NTF_SAPW',   'MINOR_CIV_APPROACH_FRIENDLY',      2),
            ('LEADER_NTF_SAPW',   'MINOR_CIV_APPROACH_PROTECTIVE',    6),
            ('LEADER_NTF_SAPW',   'MINOR_CIV_APPROACH_CONQUEST',      6),
            ('LEADER_NTF_SAPW',   'MINOR_CIV_APPROACH_BULLY',         8);

--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================
INSERT INTO Leader_Flavors
            (LeaderType,                    FlavorType,                         Flavor)
VALUES      ('LEADER_NTF_SAPW',   'FLAVOR_OFFENSE',                   5),
            ('LEADER_NTF_SAPW',   'FLAVOR_DEFENSE',                   7),
            ('LEADER_NTF_SAPW',   'FLAVOR_CITY_DEFENSE',              8),
            ('LEADER_NTF_SAPW',   'FLAVOR_MILITARY_TRAINING',         3),
            ('LEADER_NTF_SAPW',   'FLAVOR_RECON',                     3),
            ('LEADER_NTF_SAPW',   'FLAVOR_RANGED',                    6),
            ('LEADER_NTF_SAPW',   'FLAVOR_MOBILE',                    5),
            ('LEADER_NTF_SAPW',   'FLAVOR_NAVAL',                     8),
            ('LEADER_NTF_SAPW',   'FLAVOR_NAVAL_RECON',               4),
            ('LEADER_NTF_SAPW',   'FLAVOR_NAVAL_GROWTH',              6),
            ('LEADER_NTF_SAPW',   'FLAVOR_NAVAL_TILE_IMPROVEMENT',    7),
            ('LEADER_NTF_SAPW',   'FLAVOR_AIR',                       7),
            ('LEADER_NTF_SAPW',   'FLAVOR_EXPANSION',                 4),
            ('LEADER_NTF_SAPW',   'FLAVOR_GROWTH',                    8),
            ('LEADER_NTF_SAPW',   'FLAVOR_TILE_IMPROVEMENT',          4),
            ('LEADER_NTF_SAPW',   'FLAVOR_INFRASTRUCTURE',            4),
            ('LEADER_NTF_SAPW',   'FLAVOR_PRODUCTION',                7),
            ('LEADER_NTF_SAPW',   'FLAVOR_GOLD',                      6),
            ('LEADER_NTF_SAPW',   'FLAVOR_SCIENCE',                   4),
            ('LEADER_NTF_SAPW',   'FLAVOR_CULTURE',                   7),
            ('LEADER_NTF_SAPW',   'FLAVOR_HAPPINESS',                 2),
            ('LEADER_NTF_SAPW',   'FLAVOR_GREAT_PEOPLE',              3),
            ('LEADER_NTF_SAPW',   'FLAVOR_WONDER',                    9),
            ('LEADER_NTF_SAPW',   'FLAVOR_RELIGION',                  4),
            ('LEADER_NTF_SAPW',   'FLAVOR_DIPLOMACY',                 3),
            ('LEADER_NTF_SAPW',   'FLAVOR_SPACESHIP',                 8),
            ('LEADER_NTF_SAPW',   'FLAVOR_WATER_CONNECTION',          5),
            ('LEADER_NTF_SAPW',   'FLAVOR_NUKE',                      8),
            ('LEADER_NTF_SAPW',   'FLAVOR_USE_NUKE',                  7),
            ('LEADER_NTF_SAPW',   'FLAVOR_ESPIONAGE',                 3),
            ('LEADER_NTF_SAPW',   'FLAVOR_AIRLIFT',                   3),
            ('LEADER_NTF_SAPW',   'FLAVOR_I_TRADE_DESTINATION',       4),
            ('LEADER_NTF_SAPW',   'FLAVOR_I_TRADE_ORIGIN',            5),
            ('LEADER_NTF_SAPW',   'FLAVOR_I_SEA_TRADE_ROUTE',         8),
            ('LEADER_NTF_SAPW',   'FLAVOR_I_LAND_TRADE_ROUTE',        4),
            ('LEADER_NTF_SAPW',   'FLAVOR_ARCHAEOLOGY',               3),
            ('LEADER_NTF_SAPW',   'FLAVOR_AIR_CARRIER',               4);
--==========================================================================================================================