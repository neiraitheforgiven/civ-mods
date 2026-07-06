--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_MC_ARETAS', 	'TXT_KEY_LEADER_MC_ARETAS', 	'TXT_KEY_LEADER_MC_ARETAS', 		'TXT_KEY_CIVILOPEDIA_LEADER_MC_ARETAS', 	'Aretas_Scene.xml',		6, 						8, 						4, 							5, 			5, 				2, 				3, 						6, 				6, 			3, 			5, 				2, 			4, 			'MC_NABATEA_ATLAS',			1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_ARETAS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_ARETAS', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_MC_ARETAS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_ARETAS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_MC_ARETAS', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_MC_ARETAS', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_MC_ARETAS', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_MC_ARETAS', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_MC_ARETAS', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_MC_ARETAS', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_MC_ARETAS', 	'FLAVOR_RECON', 					7),
			('LEADER_MC_ARETAS', 	'FLAVOR_RANGED', 					7),
			('LEADER_MC_ARETAS', 	'FLAVOR_MOBILE', 					6),
			('LEADER_MC_ARETAS', 	'FLAVOR_NAVAL', 					4),
			('LEADER_MC_ARETAS', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_MC_ARETAS', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_MC_ARETAS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_MC_ARETAS', 	'FLAVOR_AIR', 						2),
			('LEADER_MC_ARETAS', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_MC_ARETAS', 	'FLAVOR_GROWTH', 					5),
			('LEADER_MC_ARETAS', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_MC_ARETAS', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_MC_ARETAS', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_MC_ARETAS', 	'FLAVOR_GOLD', 						9),
			('LEADER_MC_ARETAS', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_MC_ARETAS', 	'FLAVOR_CULTURE', 					6),
			('LEADER_MC_ARETAS', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_MC_ARETAS', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_MC_ARETAS', 	'FLAVOR_WONDER', 					8),
			('LEADER_MC_ARETAS', 	'FLAVOR_RELIGION', 					6),
			('LEADER_MC_ARETAS', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_MC_ARETAS', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_ARETAS', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_MC_ARETAS', 	'FLAVOR_NUKE', 						5),
			('LEADER_MC_ARETAS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_MC_ARETAS', 	'FLAVOR_ESPIONAGE', 				3),
			('LEADER_MC_ARETAS', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_MC_ARETAS', 	'FLAVOR_I_TRADE_DESTINATION', 		8),
			('LEADER_MC_ARETAS', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
			('LEADER_MC_ARETAS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_MC_ARETAS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		9),
			('LEADER_MC_ARETAS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_MC_ARETAS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_MC_ARETAS', 	'TRAIT_MC_NABATEA');
--==========================================================================================================================			
--==========================================================================================================================	