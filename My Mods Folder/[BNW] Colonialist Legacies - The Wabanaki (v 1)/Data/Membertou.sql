--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_CLMEMBERTOU',		'TXT_KEY_LEADER_CLMEMBERTOU', 		'TXT_KEY_LEADER_CLMEMBERTOU_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU', 		'CLMembertou_Scene.xml',	4, 						3, 						4, 							6, 			8, 				8, 				4, 						9, 				9, 			4, 			9, 				5, 			3, 			'CLWABANAKI_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_CLMEMBERTOU', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_CLMEMBERTOU', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_CLMEMBERTOU', 		'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_CLMEMBERTOU', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_CLMEMBERTOU', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_CLMEMBERTOU', 		'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_CLMEMBERTOU', 		'FLAVOR_OFFENSE', 					5),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_RECON', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_RANGED', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_MOBILE', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_NAVAL', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_AIR', 						2),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_EXPANSION', 				7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_GROWTH', 					6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_INFRASTRUCTURE', 			2),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_GOLD', 						4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_SCIENCE', 					4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_CULTURE', 					8),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_HAPPINESS', 				9),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_WONDER', 					4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_RELIGION', 					7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_DIPLOMACY', 				9),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_SPACESHIP', 				5),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_NUKE', 						1),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_USE_NUKE', 					1),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_ESPIONAGE', 				4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_AIRLIFT', 					3),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_ARCHAEOLOGY', 				2),
			('LEADER_CLMEMBERTOU', 		'FLAVOR_AIR_CARRIER', 				6);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_CLMEMBERTOU', 	'TRAIT_CLWABANAKI');
--==========================================================================================================================				
--==========================================================================================================================		

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,													Text)
VALUES		('TXT_KEY_LEADER_CLMEMBERTOU',							'Henri Membertou'),
			('TXT_KEY_LEADER_CLMEMBERTOU_PEDIA',					'Henri Membertou'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_NAME',		'Henri Membertou'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_SUBTITLE',	'Grand Chief of the Wabanaki'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TITLES_1',	'Grand Chief of the Wabanaki'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TITLES_2',	'Chief of the Mi''kmaq'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_LIVED',		'c. 1500 - 1611 AD'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_1',	'Henri Membertou'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_1',		'Born at the dawn of the 16th century, the man who would become known as Henri Membertou rose to leadership of the Mi''kmaq First Nation, part of the Wabanaki Confederacy. Membertou was chief of one of six districts, but was appointed to be the Grand Chief of the Wabanaki by the other district chiefs. In addition to his political prowess, he was also considered to be a healer and a prophet, the spiritual leader of his people.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_2',	'Grand Chief of the Wabanaki'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_2',		'Unlike most of the Canadian First Nations, whose leaders were little more than voices of reason and experience who guided their tribes with advice and wisdom, among the Wabanaki the Grand Chief was a ruler; his word was law. As leader of his people, Membertou determined the course of all Wabanaki actions, and the very future of his people. And, of course, in the 16th century, the Wabanaki would find themselves at the crossroads of the new age of colonists.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_3',	'Friend of Strangers'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_3',		'When Samuel de Champlain founded a colony at Port Royale, Membertou was one of the first indigenous peoples to meet the Frenchmen. He was described as a tall, powerfully built man with a well-kept beard -- an oddity for the Mi''kmaq. History about Membertou is interlaced with legend: some writings claim that Membertou kept a European-style beard because he had seen the French in a dream. More likely, the Wabanaki had observed Europeans in the past, before the ‘‘official’’ first contact. In either case, Henri Membertou threw his lot in with the French, becoming a loyal friend of the strangers from Europe.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_4',	'A New Spirituality'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_4',		'Along with his acceptance of the French as friends, Henri Membertou eagerly adopted French religion. Membertou was the first indigenous Canadian to be baptized, taking a French name (Henri Membertou) and encouraging the Wabanaki to follow Christianity. Membertou saw Christianity as being the natural conclusion of his own religion, and as the head of the Wabanaki religion, most Wabanaki followed. Membertou encouraged the colonists to teach their priests the Abenaki and Algonquian languages so that they could send missionaries to the Wabanaki to teach them about Christianity. To this day, most Wabanaki are members of the Catholic Church.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_5',	'The Death of Membertou'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_5',		'During Membertou’s lifetime, life with the French was good, despite the threat of English interests and the drastic changes represented by the European encroachment on Canada. Membertou pursued Christianity with a passion and forged a strong bond with the Catholic church. Membertou even travelled to Rome and met the Pope, further cementing the relationship between the Wabanaki and the Catholic Church, known as the Mi’kmaw Concordat. Yet a dark omen occurred -- Membertou contracted an infectious disease brought to Canada by the French. The disease would kill him. To his very last day, Membertou supported the French and the Catholic church. His dying words were a change to his children to remain devout Christians. Membertou wanted to be buried unshriven so that his soul would go to Hell, where he planned to spread the joy of his conversion to his ancestors, so that they would have relief in knowing that their people had found the truth at last. He was 104 years old, having lived a full life.'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_HEADING_6',	'The Verdict of History'),
			('TXT_KEY_CIVILOPEDIA_LEADERS_CLMEMBERTOU_TEXT_6',		'By any means of reasoning, Membertou was one of the greatest leaders to ever stand foot on the Earth. He guided his people through the greatest upheaval in world history -- the colonial era, and while it may be argued that he surrendered his people’s culture to the Europeans and that he was indirectly responsible for the loss of the Wabanaki lands, Membertou’s people are among the most resilient of First Nations. As a man faced with an unparalleled crisis, Membertou stands tall among world leaders for his reasonable and responsible actions in navigating the hostile waters of time; his visionary leadership brought salvation, religious or otherwise, to a people in the hostile grip of impending chaos.');
