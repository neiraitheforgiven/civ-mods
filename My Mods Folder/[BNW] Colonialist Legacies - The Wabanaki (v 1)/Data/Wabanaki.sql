INSERT INTO Civilizations 		
			(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia,						CivilopediaTag,					DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					DawnOfManImage)
SELECT		'CIVILIZATION_CLWABANAKI', 		'TXT_KEY_CIV_CLWABANAKI_DESC', 		'TXT_KEY_CIV_CLWABANAKI_SHORT_DESC',	'TXT_KEY_CIV_CLWABANAKI_ADJECTIVE',		'TXT_KEY_CIV5_CLWABANAKI_TEXT_1',	'TXT_KEY_CIV5_CLWABANAKI', 		'PLAYERCOLOR_CLWABANAKI',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'CLWABANAKI_ATLAS', 	0, 				'CLWABANAKI_ALPHA_ATLAS',	SoundtrackTag, 	'DawnlandsMap.dds',		'TXT_KEY_CIV5_DOM_CLHENRI_TEXT',	'DawnlandsDoM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');

--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS' )
	THEN '_IROQUOIS'
	ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_CLWABANAKI';

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_01'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_02'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_03'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_04'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_05'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_06'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_07'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_08'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_09'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_10'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_11'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_12'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_13'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_14'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_15'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_16'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_17'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_18'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_19'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_20'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_21'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_22'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_23'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_24'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_25'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_26'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_27'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_28'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_29'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_CITY_NAME_CLWABANAKI_30');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_CLWABANAKI',		'BUILDINGCLASS_PALACE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		'CIVILIZATION_CLWABANAKI', 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		'CIVILIZATION_CLWABANAKI',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 				StartAlongOcean)
VALUES		('CIVILIZATION_CLWABANAKI',		1);
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_CLWABANAKI', 	'LEADER_CLMEMBERTOU');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
--INSERT INTO Civilization_BuildingClassOverrides 
--			(CivilizationType, 			BuildingClassType, 		BuildingType)
--VALUES		('CIVILIZATION_CLWABANAKI', 	'BUILDINGCLASS_',	'BUILDING_');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_CLWABANAKI', 'UNITCLASS_TRIREME',	'UNIT_CLSHIPHUNTER');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_CLWABANAKI', 'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================		
INSERT INTO PlayerColors 
			(Type,			 			PrimaryColor,					SecondaryColor,							TextColor)
VALUES		('PLAYERCOLOR_CLWABANAKI', 	'COLOR_PLAYER_CLWABANAKI_ICON',	'COLOR_PLAYER_CLWABANAKI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
			(Type,									Red,	Green,	Blue,	Alpha)
VALUES		('COLOR_PLAYER_CLWABANAKI_ICON',		0.012,	0.071,	0.388,	1.0),
			('COLOR_PLAYER_CLWABANAKI_BACKGROUND',	1.000,	0.659,	0.078,	1.0);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_0'),	
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_1'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_2'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_3'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_4'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_5'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_6'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_7'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_8'),
			('CIVILIZATION_CLWABANAKI', 	'TXT_KEY_SPY_NAME_CLWABANAKI_9');
--==========================================================================================================================		
--==========================================================================================================================						

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,									Text)
VALUES		('TXT_KEY_CIV_CLWABANAKI_DESC',			'The Wabanaki'),
			('TXT_KEY_CIV_CLWABANAKI_SHORT_DESC',	'The Wabanaki'),
			('TXT_KEY_CIV_CLWABANAKI_ADJECTIVE',	'Wabanaki'),
			('TXT_KEY_CIV5_CLWABANAKI',				'The Wabanaki'),
			('TXT_KEY_CIV5_DOM_CLHENRI_TEXT',		'Prophet. Warrior. Healer. Chief. Henri Membertou, history remembers you as all these things and more. As Grand Chief of the Mi''kmaw, founding members of the Wabanaki, you forsaw the arrival of the French in what is now Canada, and led your people to eager acceptance of these strange new allies. You were the first among your people to be baptized, and became an ever loyal ally to the French, even as the Colonial era crashed in upon your world.[NEWLINE][NEWLINE]Our people, the Wabanaki, have always been lovers of the land that we have found ourselves in, the eastern shores of maritime America. Our lands have been ripped from us by foreign hands and grasping kings. We look to you, Henri Membertou. You will be a beacon for us. Come and guide us to a true path, one of healing. Defeat our enemies, and forge of us a civilization that will stand the test of time!'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_01',		'Kespukwitk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_02',		'Pannaqambskek'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_03',		'Potlotek'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_04',		'Meductic'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_05',		'Sebayik'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_06',		'Wolinak'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_07',		'Qaliqu'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_08',		'Odanak'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_09',		'Negootkuk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_10',		'Pilick'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_11',		'Sitansisk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_12',		'Mehtaqtek'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_13',		'Mataqaskiye'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_14',		'Welamuktok'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_15',		'Wekistoqnik'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_16',		'Listikujk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_17',		'Lsipuktuk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_18',		'Miawpukwek'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_19',		'Sipeknikatik'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_20',		'Eskinuopitijk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_21',		'Wekopekwitk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_22',		'Keskapekiaq'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_23',		'Maupeltuk'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_24',		'Kespek'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_25',		'Nanrantsouak'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_26',		'Nulhegan'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_27',		'Aukpaque'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_28',		'Pemaquid'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_29',		'Missisquoi'),
			('TXT_KEY_CITY_NAME_CLWABANAKI_30',		'Amaseconti'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_0',		'Gluskabi'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_1',		'Grandmother Woodchuck'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_2',		'Raccoon'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_3',		'Rabbit'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_4',		'Otter'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_5',		'Ableegumooch'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_6',		'Keeoony'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_7',		'Azban'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_8',		'Odzihozo'),
			('TXT_KEY_SPY_NAME_CLWABANAKI_9',		'Joseph Bruchac'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_1',	'The Wabanaki Confederacy'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_1',		'The Wabanaki Confederacy was a loose affiliation of five indigenous nations situated in the area now known as Maritime Canada and the U.S. state of Maine. These five nations, the Mi''kmaq, Maliseet, Passamaquoddy, Abenaki and Penobscot, bound themselves together under one Grand Chief in order to protect their common goals and interests -- mainly, fishing and hunting waters. While the Wabanaki Confederacy was, as mentioned above, a loose affiliation, the member nations of the Confederacy were nothing if not fiercely loyal to each other. The Confederacy worked to protect the member nations from outside threats, such as the Iroquois, and followed the guidance of their Grand Chief.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_2',	'Wabanaki Life and Culture before Colonization'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_2',		'The Wabanaki are a semi-nomadic culture. During the summer months, the Wabanaki would form farms alongside rivers, and would live a settled life based around fishing and agriculture. During the winter months, when the hostile Canadian climate, exasperated by the proximity to the oceans, made such a lifestyle untenable, if not fatal, the Wabanaki turned to a nomadic lifestyle, hunting moose and Caribou whenever possible. Politically, the Wabanaki had a uniquely hierarchical system, with a single Grand Chief who was elected by the collected chiefs of the Wabanaki. The Wabanaki were also a spiritual people with a highly developed religion, although some histories imply that the Wabanaki believed that their religion was incomplete and looked forward to some new revelation to appear -- a revelation that presented itself in European Christianity. Of course, there is some debate as to whether the incomplete nature of Wabanaki spirituality is a fabrication of history, penned by missionaries with a loaded agenda.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_3',	'Masters of River and Ocean'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_3',		'The Wabanaki way of life, whether settled or nomadic, has always been connected to the waters. In the time before colonization, the Wabanaki lived as supreme seamen, fashioning canoes that were worthy both on the mighty St. Lawrence River and in the Atlantic ocean itself. The Wabanaki were trained in seamanship by the firmest of natural teachers; the power of the St. Lawrence River, the wicked waves of the Atlantic, and by the unparalleled tides of the Bay of Fundy. These natural forces trained -- or killed -- the Wabanaki to be unparalleled on the waves.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_4',	'First Contact with the Europeans'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_4',		'History is unclear as to when the Wabanaki first made contact with the Europeans. Or, rather, history is very clear: the Wabanaki first met Europeans when Samuel de Champlain founded Port Royale, just as history is very clear that Christopher Columbus was the first sailor to discover America. But, as we now know, fishermen made their way to America for decades before Columbus’s official sanctioned discovery. Likewise, the Wabanaki appear to have had prior knowledge of the French and of other European nations before the official first contact with Samuel de Champlain.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_5',	'Wabanaki Piracy'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_5',		'According to some historians, the pre-colonial contact between the Wabanaki and Europeans was not peaceful. Rather, the Wabanaki viewed the foreign fishing expeditions as a threat to their waters, and responded with hostility, capturing the fishermen’s vessels and using them to defend the fishing waters. The Wabanaki had little trouble taking and using the Europeans’ ships; several of the failed colonies may have in fact been cut off or even destroyed for encroaching upon the Wabanaki waters and the waters or even lands of other tribes. The Wabanaki would then scuttle the European vessels, because the massive ships of the line were not useful for the river-bound life of the Wabanaki.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_6',	'Friends of France'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_6',		'As time passed in the late 15th to early 16th century, the annual influx of fishermen became a real threat to the Wabanaki waters. Each year brought more and more fishers in bigger and bigger boats, with no end in sight. The Wabanaki leaders knew that if things continued the way they were, the Europeans would soon wrest control of the waters and lands from the Wabanaki by the force of sheer numbers. The Wabanaki leaders observed the foreign vessels and their ways and interactions with each other and determined that the French were the most trustworthy. The Wabanaki joined forces with the French and helped the French colonies to survive the brutal maritime climate. Sadly, while this allegiance would keep the Wabanaki people safe in the coming upheaval, it would do little to conserve the Wabanaki waters and lands.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_7',	'Conversion to Catholicism'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_7',		'One of the first changes brought to the Wabanaki by their outside neighbors was Christianity. Whether as a gesture of good faith or a means of protecting themselves, or by, as the European histories record, a genuine desire to learn of Christianity, the vast majority of Wabanaki converted to Christianity. They had a thirst for the Christian religion, working to aid the missionaries in learning the language and penetrating the interior. The Wabanaki leaders even travelled to Europe to beseech the Pope to send more missionaries to Canada.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_8',	'Cessation of the Wabanaki Land'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_8',		'As the European powers vied for control of the New World, the Wabanaki proved firm allies of the French, warring against the English on land and water to protect their allies. During the six English-French wars for control of Canada, the Wabanaki were a loyal and effective ally to the French; along with the Anishinaabe, the Wabanaki were the so-called Indians in the French and Indian war. When the English defeated the French, however, the French not only surrendered their own lands to the British crown, they also ceded the Wabanaki lands and waters, even though they had no right to these lands. When the Wabanaki leaders -- who were all Christians at this point -- protested this takeover, they were told that in the eyes of the Europeans, no non-Christian prince could have right to lands -- a flagrant indicator of the truly temporal nature of the Colonial era. The Wabanaki lands were traded away like a slave on a market. Soon after, the British forcibly dissolved the Wabanaki Confederacy. This move was largely political, though; the dissolution had little to no effect on the Wabanaki people themselves, who have remained fiercely loyal and friendly to each other.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_9',	'Aftermath and… Hockey!'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_9',		'Despite the loss of their lands and Confederacy, the Wabanaki have proved to be a resilient people who have worked to keep their culture intact and to prosper in the new world. The Wabanaki have kept their open culture and have, throughout history, benefitted by embracing other peoples into their culture. In the dark years of American slave trade, the Wabanaki would help free and hide black slaves, and in the years following the American civil war, many Wabanaki formed close friendships and intermarried with African-American communities. Also, one of the contributions of the Wabanaki to world culture was the creation of Hockey. The Wabanaki enjoyed many winter sports, including but not limited to the sport of Oochamadyk. This sport, played with curved wooden sticks, merged with the English sport of shinny to create Hockey. The Wabanaki found a good industry in the new sport, and made a thriving economy handcrafting superior Mi''kmaq hockey sticks that were considered the ideal hockey stick for many decades.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_10',	'Colonialist Legacy'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_10',		'The colonial era has left its mark on the Wabanaki, for better or worse. The Wabanaki still have strong ties of loyalty to one another and an inclusive culture that protects and the environment. The quality of Wabanaki loyalty was shown in the World Wars, when more than half of Wabanaki males signed up to fight to protect their countrymen. The Wabanaki also seek to safeguards the lands and waters that were taken from them, in the hopes that one day they will be returned to them. The method of this action has ranged from peaceful politics to violent activism. In the 80s and 90s, some of the Wabanaki turned to ecoterrorism in an attempt to preserve their lands. In addition, while there has been a recent resurgence of interest in pre-colonial Wabanaki spirituality, most Wabanaki still are strong Catholics.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_11',	'A New Confederacy'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_11',		'After decades of having their needs ignored by the British, and after them the Canadian, government, the Wabanaki have slowly gained ground in the political climate of Canada. The first major victory for the Wabanaki was treaty status. Because the Wabanaki land was ceded to Britain unfairly, as part of a treaty with France instead of with the Wabanaki themselves, the Wabanaki were left with no official treaty status. The Wabanaki Grand Chief Gabriel Sylliboy worked tirelessly to promote the notion that the Wabanaki deserved First Nation status, and on October 1, 1986, the Wabanaki were given treaty status -- a day celebrated in Nova Scotia as Treaty Day. Additionally, in 1993, the Wabanaki founded a new Wabanaki Confederacy, reinstating as an organization the old nation that had been forcibly disbanded. Under these new auspices, the Wabanaki have proven to be a powerful force for change in Canada’s relations with its First Nation peoples.'),
			('TXT_KEY_CIV5_CLWABANAKI_HEADING_12',	'The Modern State of the Wabanaki'),
			('TXT_KEY_CIV5_CLWABANAKI_TEXT_12',		'The story of the Wabanaki is unfolding in increasing clarity and vision in the current age. In 2005, the Wabanaki Confederacy launched the largest class-action lawsuit in Canadian history in response to the injustices of the horrific Canadian Indian residential school system, a repressive system designed to annihilate the First Nations’ culture. This lawsuit catapulted the plight of the Wabanaki onto the front pages of the nation’s news and the forefront of the minds of Canadians. Since then, the story of the Wabanaki has accelerated, with new changes every day and new achievements for the Wabanaki. In 2008, then-Prime Minister Stephen Harper apologized to the Wabanaki for both the school system and the theft of their lands and waters. In 2015, the Canadian government acknowledged that the cessation of Wabanaki lands was invalid and, while the current state of the land would not be returned to the Wabanaki, the Wabanaki and Canadian government shared a responsibility to steward the land for all people.');