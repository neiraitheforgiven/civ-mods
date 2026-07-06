--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 								Description, 									Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_NTF_JOSEF',		'TXT_KEY_LEADER_NTF_JOSEF_DESC',		'TXT_KEY_LEADER_NTF_JOSEF',	'TXT_KEY_LEADER_NTF_JOSEF',	'NTF_NEZ_PERCE_Leaderscene.xml',	6,						2,						6,							7,			7,				6,				7,						7,				4,			4,			8,				4,			3,			'NTF_NEZ_PERCE_ATLAS',		1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,                                         Response,																		Bias)
VALUES  ('LEADER_NTF_JOSEF',   'RESPONSE_MINOR_CIV_COMPETITION',                     'TXT_KEY_LEADER_NTF_JOSEF_MINOR_CIV_COMPETITION%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_FIRST_GREETING',                            'TXT_KEY_LEADER_NTF_JOSEF_FIRSTGREETING%',                           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DEFEATED',                                  'TXT_KEY_LEADER_NTF_JOSEF_DEFEATED%',                                2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_REPEAT_TOO_MUCH',                  'TXT_KEY_LEADER_NTF_JOSEF_REPEAT_TOO_MUCH%',                         2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_REPEAT_TRADE_TOO_MUCH',                     'TXT_KEY_LEADER_NTF_JOSEF_REPEAT_TRADE_TOO_MUCH%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_REPEAT',                   'TXT_KEY_LEADER_NTF_JOSEF_REPEAT_TOO_MUCH%',                         2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_HELLO',                    'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_HELLO%',                  2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_POLITE_HELLO',                     'TXT_KEY_LEADER_NTF_JOSEF_GREETING_POLITE_HELLO%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_HUMAN_AT_WAR',             'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_HUMAN_AT_WAR%',           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HUMAN_AT_WAR',                     'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HUMAN_AT_WAR%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',       'TXT_KEY_LEADER_NTF_JOSEF_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_AGGRESSIVE_MILITARY',              'TXT_KEY_LEADER_NTF_JOSEF_AGGRESSIVE_MILITARY_WARNING%',             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING',   'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_AGGRESSIVE_PLOT_BUYING%', 2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_AGGRESSIVE_PLOT_BUYING',           'TXT_KEY_LEADER_NTF_JOSEF_GREETING_AGGRESSIVE_PLOT_BUYING%',         2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_AGGRESSIVE_EXPANSION',     'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_AGGRESSIVE_EXPANSION%',   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_AGGRESSIVE_EXPANSION',             'TXT_KEY_LEADER_NTF_JOSEF_GREETING_AGGRESSIVE_EXPANSION%',           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY',         'TXT_KEY_LEADER_NTF_JOSEF_GREETING_FRIENDLY_STRONG_MILITARY%',       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_FRIENDLY_STRONG_ECONOMY',          'TXT_KEY_LEADER_NTF_JOSEF_GREETING_FRIENDLY_STRONG_ECONOMY%',        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_HUMAN_FEW_CITIES',         'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_HUMAN_FEW_CITIES%',       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY',         'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_HUMAN_SMALL_ARMY%',       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER',       'TXT_KEY_LEADER_NTF_JOSEF_GREETING_HOSTILE_HUMAN_IS_WARMONGER%',     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_TOO_SOON_FOR_DOF',                          'TXT_KEY_LEADER_NTF_JOSEF_TOO_SOON_FOR_DOF%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',               'TXT_KEY_LEADER_NTF_JOSEF_RESPONSE_TO_BEING_DENOUNCED%',             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_WORK_AGAINST_SOMEONE',                      'TXT_KEY_LEADER_NTF_JOSEF_DENOUNCE%',                                2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_AI_DOF_BACKSTAB',                           'TXT_KEY_LEADER_NTF_JOSEF_DENOUNCE%',                                2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',               'TXT_KEY_LEADER_NTF_JOSEF_RESPONSE_TO_BEING_DENOUNCED%',             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DOFED_FRIEND',                        'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DOFED_FRIEND%',                      2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DOFED_ENEMY',                         'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DOFED_ENEMY%',                       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DENOUNCED_ENEMY',                     'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DENOUNCED_ENEMY%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DENOUNCED_FRIEND',                    'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DENOUNCED_FRIEND%',                  2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DOF_SO_AI_DOF',                       'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DOF_SO_AI_DOF%',                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE',             'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DENOUNCE_SO_AI_DENOUNCE%',           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_DOF_SO_AI_DENOUNCE',                  'TXT_KEY_LEADER_NTF_JOSEF_HUMAN_DOF_SO_AI_DENOUNCE%',                2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_COOP_WAR_REQUEST',                          'TXT_KEY_LEADER_NTF_JOSEF_COOP_WAR_REQUEST%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_COOP_WAR_TIME',                             'TXT_KEY_LEADER_NTF_JOSEF_COOP_WAR_TIME%',                           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_WORK_WITH_US',                              'TXT_KEY_LEADER_NTF_JOSEF_DEC_FRIENDSHIP%',                          2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_PLOT_BUYING_WARNING',                       'TXT_KEY_LEADER_NTF_JOSEF_PLOT_BUYING_WARNING%',                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_PLOT_BUYING_SERIOUS_WARNING',               'TXT_KEY_LEADER_NTF_JOSEF_PLOT_BUYING_SERIOUS_WARNING%',             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_EXPANSION_SERIOUS_WARNING',                 'TXT_KEY_LEADER_NTF_JOSEF_EXPANSION_SERIOUS_WARNING%',               2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_EXPANSION_WARNING',                         'TXT_KEY_LEADER_NTF_JOSEF_EXPANSION_WARNING%',                       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING',               'TXT_KEY_LEADER_NTF_JOSEF_AGGRESSIVE_MILITARY_WARNING%',             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_RETURNED_CIVILIAN',                         'TXT_KEY_LEADER_NTF_JOSEF_RETURNED_CIVILIAN%',                       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DECLARATION_PROTECT_CITY_STATE',            'TXT_KEY_LEADER_NTF_JOSEF_DECLARATION_PROTECT_CITY_STATE%',          2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_BULLIED_PROTECTED_CITY_STATE',              'TXT_KEY_LEADER_NTF_JOSEF_BULLIED_PROTECTED_CITY_STATE%',            2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_PROTECTED_CITY_STATE',             'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_PROTECTED_CITY_STATEE%',          2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DECLARATION_ABANDON_CITY_STATE',            'TXT_KEY_LEADER_NTF_JOSEF_DECLARATION_ABANDON_CITY_STATE%',          2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DONT_SETTLE_YES',                           'TXT_KEY_LEADER_NTF_JOSEF_DONT_SETTLE_YES%',                         2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DONT_SETTLE_NO',                            'TXT_KEY_LEADER_NTF_JOSEF_DONT_SETTLE_NO%',                          2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_LUXURY_TRADE',                              'TXT_KEY_LEADER_NTF_JOSEF_LUXURY_TRADE%',                            2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_OPEN_BORDERS_EXCHANGE',                     'TXT_KEY_LEADER_NTF_JOSEF_OPEN_BORDERS_EXCHANGE%',                   2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_REQUEST',                                   'TXT_KEY_LEADER_NTF_JOSEF_RESPONSE_REQUEST%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_HOSTILE',                          'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_WEAK_HOSTILE',                     'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_STRONG_HOSTILE',                   'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_HOSTILE%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_EXCITED',                          'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_WEAK_EXCITED',                     'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_STRONG_EXCITED',                   'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_EXCITED%',                        2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_SAD',                              'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_SAD%',                            2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_ATTACKED_BETRAYED',                         'TXT_KEY_LEADER_NTF_JOSEF_ATTACKED_BETRAYED%',                       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_GENERIC',                               'TXT_KEY_LEADER_NTF_JOSEF_DOW_GENERIC%',                             2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_LAND',                                  'TXT_KEY_LEADER_NTF_JOSEF_DOW_LAND%',                                2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_WORLD_CONQUEST',                        'TXT_KEY_LEADER_NTF_JOSEF_DOW_WORLD_CONQUEST%',                      2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_OPPORTUNITY',                           'TXT_KEY_LEADER_NTF_JOSEF_DOW_OPPORTUNITY%',                         2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_DESPERATE',                             'TXT_KEY_LEADER_NTF_JOSEF_DOW_DESPERATE%',                           2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_DOW_REGRET',                                'TXT_KEY_LEADER_NTF_JOSEF_DOW_REGRET%',                              2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_TOO_SOON_NO_PEACE',                         'TXT_KEY_LEADER_NTF_JOSEF_TOO_SOON_NO_PEACE%',                       2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_GOOD',  'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING_BAD',           'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_BAD',             'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_WE_ATTACKED_MINOR_BAD',                     'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING_BAD',   'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_ATTACKED_MINOR_BAD',                  'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_BAD',       'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_BAD',     'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_PLOT_BUYING_WARNING_BAD',             'TXT_KEY_LEADER_NTF_JOSEF_BAD%',                                     2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_AGGRESSIVE_MILITARY_WARNING_GOOD',          'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HOSTILE_WE_ATTACKED_MINOR_GOOD',            'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_WE_ATTACKED_MINOR_GOOD',                    'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_ATTACKED_MINOR_GOOD',                 'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_SERIOUS_EXPANSION_WARNING_GOOD',      'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_SERIOUS_PLOT_BUYING_WARNING_GOOD',    'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2),
        ('LEADER_NTF_JOSEF',   'RESPONSE_HUMAN_PLOT_BUYING_WARNING_GOOD',            'TXT_KEY_LEADER_NTF_JOSEF_GOOD%',                                    2);
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,									Description,									ShortDescription)
VALUES		('TRAIT_NTF_THUNDER_TO_GREAT_HEIGHTS',	'TXT_KEY_TRAIT_NTF_THUNDER_TO_GREAT_HEIGHTS',	'TXT_KEY_TRAIT_NTF_THUNDER_TO_GREAT_HEIGHTS_SHORT');

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,				TraitType)
VALUES		('LEADER_NTF_JOSEF',		'TRAIT_NTF_THUNDER_TO_GREAT_HEIGHTS');

--==========================================================================================================================    
-- Leader_MajorCivApproachBiases
--==========================================================================================================================                
INSERT INTO Leader_MajorCivApproachBiases 
            (LeaderType,           MajorCivApproachType,               Bias)
VALUES      ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_WAR',           3),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_HOSTILE',       3),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_DECEPTIVE',     3),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_GUARDED',       7),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_AFRAID',        3),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_FRIENDLY',      5),
            ('LEADER_NTF_JOSEF',   'MAJOR_CIV_APPROACH_NEUTRAL',       7);

--==========================================================================================================================    
-- Leader_MajorCivApproachBiases
--==========================================================================================================================                            
INSERT INTO Leader_MinorCivApproachBiases 
            (LeaderType,           MinorCivApproachType,               Bias)
VALUES      ('LEADER_NTF_JOSEF',   'MINOR_CIV_APPROACH_IGNORE',        6),
            ('LEADER_NTF_JOSEF',   'MINOR_CIV_APPROACH_FRIENDLY',      7),
            ('LEADER_NTF_JOSEF',   'MINOR_CIV_APPROACH_PROTECTIVE',    5),
            ('LEADER_NTF_JOSEF',   'MINOR_CIV_APPROACH_CONQUEST',      4),
            ('LEADER_NTF_JOSEF',   'MINOR_CIV_APPROACH_BULLY',         4);

--==========================================================================================================================    
-- Leader_Flavors
--==========================================================================================================================    
INSERT INTO Leader_Flavors 
            (LeaderType,           FlavorType,                         Flavor)
VALUES      ('LEADER_NTF_JOSEF',   'FLAVOR_OFFENSE',                   4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_DEFENSE',                   7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_CITY_DEFENSE',              8),
            ('LEADER_NTF_JOSEF',   'FLAVOR_MILITARY_TRAINING',         4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_RECON',                     5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_RANGED',                    8),
            ('LEADER_NTF_JOSEF',   'FLAVOR_MOBILE',                    6),
            ('LEADER_NTF_JOSEF',   'FLAVOR_NAVAL',                     3),
            ('LEADER_NTF_JOSEF',   'FLAVOR_NAVAL_RECON',               4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_NAVAL_GROWTH',              4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_AIR',                       5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_EXPANSION',                 5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_GROWTH',                    6),
            ('LEADER_NTF_JOSEF',   'FLAVOR_TILE_IMPROVEMENT',          7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_INFRASTRUCTURE',            7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_PRODUCTION',                5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_GOLD',                      5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_SCIENCE',                   4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_CULTURE',                   8),
            ('LEADER_NTF_JOSEF',   'FLAVOR_HAPPINESS',                 7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_GREAT_PEOPLE',              7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_WONDER',                    2),
            ('LEADER_NTF_JOSEF',   'FLAVOR_RELIGION',                  4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_DIPLOMACY',                 7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_SPACESHIP',                 5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_WATER_CONNECTION',          4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_NUKE',                      3),
            ('LEADER_NTF_JOSEF',   'FLAVOR_USE_NUKE',                  3),
            ('LEADER_NTF_JOSEF',   'FLAVOR_ESPIONAGE',                 4),
            ('LEADER_NTF_JOSEF',   'FLAVOR_AIRLIFT',                   5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_I_TRADE_DESTINATION',       6),
            ('LEADER_NTF_JOSEF',   'FLAVOR_I_TRADE_ORIGIN',            6),
            ('LEADER_NTF_JOSEF',   'FLAVOR_I_SEA_TRADE_ROUTE',         5),
            ('LEADER_NTF_JOSEF',   'FLAVOR_I_LAND_TRADE_ROUTE',        7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_ARCHAEOLOGY',               7),
            ('LEADER_NTF_JOSEF',   'FLAVOR_AIR_CARRIER',               5);
--==========================================================================================================================