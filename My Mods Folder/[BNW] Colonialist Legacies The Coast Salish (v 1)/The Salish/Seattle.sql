--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_CLSEATTLE',		'TXT_KEY_LEADER_CLSEATTLE', 		'TXT_KEY_LEADER_CLSEATTLE_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE', 		'CLSeattle.xml',		5, 						5, 						3, 							6, 			7, 				3, 				5, 						7, 				7, 			4, 			6, 				6, 			3, 			'CLCOASTSALISH_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_WAR', 				2),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_HOSTILE', 			4),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 		3),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_GUARDED', 			6),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_AFRAID', 			5),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 			4),
			('LEADER_CLSEATTLE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 			4);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_CLSEATTLE', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_CLSEATTLE', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_CLSEATTLE', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_CLSEATTLE', 		'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_CLSEATTLE', 		'MINOR_CIV_APPROACH_BULLY', 		6);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_CLSEATTLE', 		'FLAVOR_OFFENSE', 					4),
			('LEADER_CLSEATTLE', 		'FLAVOR_DEFENSE', 					7),
			('LEADER_CLSEATTLE', 		'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_CLSEATTLE', 		'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_CLSEATTLE', 		'FLAVOR_RECON', 					4),
			('LEADER_CLSEATTLE', 		'FLAVOR_RANGED', 					6),
			('LEADER_CLSEATTLE', 		'FLAVOR_MOBILE', 					6),
			('LEADER_CLSEATTLE', 		'FLAVOR_NAVAL', 					7),
			('LEADER_CLSEATTLE', 		'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_CLSEATTLE', 		'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_CLSEATTLE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_CLSEATTLE', 		'FLAVOR_AIR', 						5),
			('LEADER_CLSEATTLE', 		'FLAVOR_EXPANSION', 				3),
			('LEADER_CLSEATTLE', 		'FLAVOR_GROWTH', 					5),
			('LEADER_CLSEATTLE', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_CLSEATTLE', 		'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_CLSEATTLE', 		'FLAVOR_PRODUCTION', 				5),
			('LEADER_CLSEATTLE', 		'FLAVOR_GOLD', 						4),
			('LEADER_CLSEATTLE', 		'FLAVOR_SCIENCE', 					4),
			('LEADER_CLSEATTLE', 		'FLAVOR_CULTURE', 					9),
			('LEADER_CLSEATTLE', 		'FLAVOR_HAPPINESS', 				9),
			('LEADER_CLSEATTLE', 		'FLAVOR_GREAT_PEOPLE', 				9),
			('LEADER_CLSEATTLE', 		'FLAVOR_WONDER', 					9),
			('LEADER_CLSEATTLE', 		'FLAVOR_RELIGION', 					7),
			('LEADER_CLSEATTLE', 		'FLAVOR_DIPLOMACY', 				6),
			('LEADER_CLSEATTLE', 		'FLAVOR_SPACESHIP', 				5),
			('LEADER_CLSEATTLE', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_CLSEATTLE', 		'FLAVOR_NUKE', 						2),
			('LEADER_CLSEATTLE', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_CLSEATTLE', 		'FLAVOR_ESPIONAGE', 				4),
			('LEADER_CLSEATTLE', 		'FLAVOR_AIRLIFT', 					4),
			('LEADER_CLSEATTLE', 		'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_CLSEATTLE', 		'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_CLSEATTLE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_CLSEATTLE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_CLSEATTLE', 		'FLAVOR_ARCHAEOLOGY', 				3),
			('LEADER_CLSEATTLE', 		'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_CLSEATTLE', 		'TRAIT_CLCOASTSALISH');
--==========================================================================================================================				
--==========================================================================================================================		

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,											Text)
VALUES		('TXT_KEY_LEADER_CLSEATTLE',					'Seattle'),
			('TXT_KEY_LEADER_CLSEATTLE_PEDIA',				'Seattle'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE',		'Seattle'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_LIVED',	'c. 1786 - 1866 AD'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_NAME', 'Si''ahl, called Seattle'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_SUBTITLE', ''),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_1', 'Seattle c.1786-1866'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_1', 'Si''ahl, or Seattle, was perhaps the most important player in American - Coast Salish relations in the 19th century. He was a chief, but not the principal chief, of the Salish peoples living in what is now the Vancouver and Seattle areas of Canada and the U.S. state of Washington. While Seattle was in no ways a direct authority among his people, he wielded no small degree of influence, and is remembered for causing an end to American-Salish conflict with a famous speech bearing his name. While the events surrounding Seattle''s life have been romanticized and distorted for various modern purposes, his legacy has lasted long into the current age.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_2', 'Life Before Colonialism'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_2', 'Si''ahl was an optimal chief, the son of parents from two Salish peoples, the Suqwamish and Duwamish. This blended parentage gave him an understanding of difference in cultures, which helped him to rise as a leader of all. Si''ahl was a powerful warrior and Salish noble. As a noble, he was eligible to own slaves, and Si''ahl had many; although the Salish were not typically aggressive raiders - normally the target of other raiders such as the Haida or Snohomish - Si''ahl excelled at stopping raids on his lands and typically captured the raiders and pressed them into slavery. But, despite his own personal strength - Si''ahl was a giant of a man - in the middle of his life, Si''ahl found himself losing battles and land against the powerful Snohomish tactician, Patkanim. Patkanim waged a successful campaign against Si''ahl''s people, eventually pushing them out of their traditional clamming lands and denying them from continuing their way of life. This forced Si''ahl to seek a different lifestyle further inland, where a small group of puritan Americans lived.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_3', 'Doc Maynard'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_3', 'Contact with the Americans was difficult at first. The American puritans viewed the Salish with suspicion and possibly disgust. But Si''ahl found a fast friend in the person of Doc Maynard. Doc Maynard was the odd man out of the puritans. Not a puritan himself, we was an entrepreneur whose methods (including but not limited to attempting to set up brothels) offended his puritanical compatriots. Doc Maynard also sought ways to make friends with the Salish, including Si''ahl. Si''ahl would become fast friends with Maynard, and through this relationship, the Salish became allies of the Americans. Ironically, despite Doc Maynard''s historical representation as a worldly, carnal secularist (in fact, the puritans would attempt to write him out of the history of Washington State,) Doc Maynard would convert Si''ahl, and his family, to the Catholic faith. Si''ahl took the name "Noah Seattle" upon baptism.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_4', 'The Puget Sound War'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_4', 'The circumstances surrounding the Coast Salish losing their traditional clamming grounds were far-reaching, however. America was claiming their Great West, signing treaties that moved Native Americans onto reserved lands and settling the rest. In many cases, the process was peaceful enough, with most Native American leaders understanding that they were trading their lands for peace with an overwhelmingly powerful (and dangerous) ally. But peace was not always the result. In the mid 1850s, an American trader raped a woman from the Yakima people of what is now southern Washington. This ignoble act - an act of war as well as barbarism - inflamed Native suspicions of the Americans'' motivations. War broke out among the nations of Washington, starting with a few murders and then escalating to armed conflict with entire armies of enraged Natives. While the Coast Salish tended to stay out of this combat, in January of 1856, Noah Seattle caught wind of an army of more than 3,000 Native warriors marching on the little puritan settlement where Doc Maynard lived.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_5', 'The Battle of Seattle'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_5', 'As soon as Noah Seattle realized the danger that Doc Maynard and the puritans were in, he went to Maynard and warned him of the coming army. As a result, the Americans were ready when the army came in; in addition to a small militia, the Americans sent for and received reinforcements in the form of a naval warship and her crew. The resulting battle, known in modern time as "the Battle of Seattle" was cut rather short, with little to no American losses. In the aftermath, the Americans were quick to push for treaty -- and subsequent reservation -- for both the conquered enemy and for the Salish. Although Seattle initially resisted reservation (especially as his people were slated to be interred on the same reserve as their old enemy, the Snohomish,) Seattle became famous for his documented speech, in which he urged the Salish to accept reservation. Following the Battle, the town was named after Seattle.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_HEADING_6', 'Verdict of history'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLSEATTLE_TEXT_6', 'The legacy of Seattle lives on in two major ways. The first is in the great port city of Western America, Seattle, which grew from the small town of puritans that Seattle protected from certain destruction. The other is in his speech, which is often quoted although it has been thoroughly corrupted, first by the American lieutenant who first inscribed in to text. This first writer "improved" on the speech by adding romantic figures of speech and language. After this, the speech was changed again and again by playwrights and Hollywood screenwriters until the original intention has been lost. Yet there is another, more telling legacy for Noah Seattle: his people. Although Seattle may seem like a traitor to some, a Native chief who sold out the Native nations around him to the white man, his people, the Coast Salish, are among the most influential and wealthy of the Native Americans. This is due in no small part to the friendship of Seattle and Maynard, and the wise judgement and direction of the chief.');