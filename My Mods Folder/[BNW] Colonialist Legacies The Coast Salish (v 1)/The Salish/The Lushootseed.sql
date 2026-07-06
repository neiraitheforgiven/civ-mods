---The Salish
INSERT INTO Civilizations 		
			(Type, 								Description,							ShortDescription, 						Adjective, 								Civilopedia,							CivilopediaTag,					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 			DawnOfManQuote, 					DawnOfManImage)
SELECT		'CIVILIZATION_CLCOASTSALISH', 		'TXT_KEY_CIV_CLCOASTSALISH_DESC', 		'TXT_KEY_CIV_CLCOASTSALISH_SHORT_DESC',	'TXT_KEY_CIV_CLCOASTSALISH_ADJECTIVE',	'TXT_KEY_CIV5_CLCOASTSALISH_TEXT_1',	'TXT_KEY_CIV5_CLCOASTSALISH', 	'PLAYERCOLOR_CLCOASTSALISH',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'CLCOASTSALISH_ATLAS', 	0, 				'CLCOASTSALISH_ALPHA_ATLAS',	'Iroquois', 	'SalishMap.dds',	'TXT_KEY_CIV5_DOM_CLSEATTLE_TEXT',	'SalishDoM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_IROQUOIS');

--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_IROQUOIS' )
	THEN '_IROQUOIS'
	ELSE '_AMER' END) 
WHERE Type = 'CIVILIZATION_CLCOASTSALISH';

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_01'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_02'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_03'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_04'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_05'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_06'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_07'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_08'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_09'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_10'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_11'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_12'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_13'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_14'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_15'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_16'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_17'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_18'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_19'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_20'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_21'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_22'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_23'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_24'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_25'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_26'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_27'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_28'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_29'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_30'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_31'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_CITY_NAME_CLCOASTSALISH_32');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_CLCOASTSALISH',		'BUILDINGCLASS_PALACE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		'CIVILIZATION_CLCOASTSALISH', 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		'CIVILIZATION_CLCOASTSALISH',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_CLCOASTSALISH', 	'LEADER_CLSEATTLE');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_CLCOASTSALISH', 	'BUILDINGCLASS_BANK',	'BUILDING_CLPOTLATCH');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
(CivilizationType, UnitClassType, UnitType) Values
('CIVILIZATION_CLCOASTSALISH', 'UNITCLASS_PIKEMAN', 'UNIT_CLSTOMEX');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
(CivilizationType, ReligionType) VALUES
('CIVILIZATION_CLCOASTSALISH', 'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================		
INSERT INTO PlayerColors 
			(Type,			 			PrimaryColor,					SecondaryColor,							TextColor)
VALUES		('PLAYERCOLOR_CLCOASTSALISH', 	'COLOR_PLAYER_CLCOASTSALISH_ICON',	'COLOR_PLAYER_CLCOASTSALISH_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
			(Type,									Red,	Green,	Blue,	Alpha)
VALUES		('COLOR_PLAYER_CLCOASTSALISH_BACKGROUND',   0.129,	0.129,	0.129,	1.0),
			('COLOR_PLAYER_CLCOASTSALISH_ICON',			0.239,	0.643,	0.800,	1.0);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_0'),	
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_1'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_2'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_3'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_4'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_5'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_6'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_7'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_8'),
			('CIVILIZATION_CLCOASTSALISH', 	'TXT_KEY_SPY_NAME_CLCOASTSALISH_9');
--==========================================================================================================================		
--==========================================================================================================================						

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,									Text)
VALUES		('TXT_KEY_CIV_CLCOASTSALISH_DESC',			'The Coast Salish'),
			('TXT_KEY_CIV_CLCOASTSALISH_SHORT_DESC',		'The Coast Salish'),
			('TXT_KEY_CIV_CLCOASTSALISH_ADJECTIVE',		'Coast Salish'),
			('TXT_KEY_CIV5_CLCOASTSALISH',				'The Coast Salish'),
			('TXT_KEY_CIV5_CLCOASTSALISH_HEADING_1',	'Early History'),
			('TXT_KEY_CIV5_CLCOASTSALISH_TEXT_1',		'The term Salish has had a number of meanings over years of linguistic scholarship.  Originally, Salish referred to the Bitterroot Salish of today’s Montana.  Nowadays, Salish refers to two broad groups of Native American or First Nations peoples living in near-northwest North America.  The Coast and Interior Salish are loose groups, each consisting of many different cultures and languages.'),
			('TXT_KEY_CIV5_CLCOASTSALISH_HEADING_2',	'Geography & Climate'),
			('TXT_KEY_CIV5_CLCOASTSALISH_TEXT_2',		'The Coast Salish occupied much of the American Pacific Northwest and Canadian British Columbia.  Their territory included the modern metropolitan areas of Seattle, Vancouver and Victoria.  The Interior Salish, as the name suggests, occupied areas interior of those coastal regions, such as the Bitteroot of Montana and the Flathead group, the first Salish encountered by colonial American explorers.'),
			('TXT_KEY_CIV5_CLCOASTSALISH_HEADING_3',	'Linguistic Origins'),
			('TXT_KEY_CIV5_CLCOASTSALISH_TEXT_3',		'The Lushootseed language is spoken in the Puget Sound region and is a member of the Southern Coastal Salish language subgroup. Subdividing even further, dozens of subdialects have been discovered by linguists. Today, there are very few Lushootseed speakers left in the world. However, recent efforts have been made to revitalize the language, such as online and formal education in the language.[NEWLINE][NEWLINE]Tribes that are believed to have spoken Lushootseed include the Duwamish, the Steilacoom, the Suquamish, the Muckleshoot, the Snoqualmie, the Nisqually, and the Puyallup. Members of these tribes have occupied the Puget Sound area, what is now Seattle, for ten thousand years. While the society of each tribes varies based on their exact area of settlement, fishing was commonly relied upon by these peoples, as they benefitted from the salmon population in the Puget Sound watershed.'),
			('TXT_KEY_CIV5_CLCOASTSALISH_HEADING_4',	'The Puget Sound War'),
			('TXT_KEY_CIV5_CLCOASTSALISH_TEXT_4',		'There is not a strong record of historical events prior to contact with American settlers in the 1800s. However, the story of the Lushootseed-speaking Salish mirrors that of many other Native American groups during that time period. In 1854, the Treaty of Medicine Creek was signed, forcing the relocation of many native Americans in exchange for their continuing fishing rights. Nisqually Chief Leschi was outraged by the unfair deal and decided to fight for his people’s survival.[NEWLINE][NEWLINE]Like many conflicts between America and natives, the Puget Sound War was brief and small in scale, but had devastating consequences for the losers. Relatively few people died during the conflict, which included battles in modern Tacoma. In 1856, Chief Leschi was captured and put on trial for murder. He was not convicted the first time (the jury was unable to reach a decision) because of concerns that he could not rightly be charged with murder due to the wartime nature of the killing, and the combatant status of both victim and perpetrator. However, he was tried again in 1857. Despite poor and unclear evidence, he was hung in February of 1858.'),
			('TXT_KEY_CIV5_CLCOASTSALISH_HEADING_5',	'The Legacy of Salish'),
			('TXT_KEY_CIV5_CLCOASTSALISH_TEXT_5',		'Chief Leschi was formally exonerated, on the basis that he could not have been held accountable for murder of a legal combatant, in 2004, 146 years after his execution.[NEWLINE][NEWLINE]After that time and continuing into today, Salish peoples live in reservations scattered throughout Washington state.'),
			('TXT_KEY_CIV5_DOM_CLSEATTLE_TEXT',			'Oh wise and generous Seattle, you who saw the signs of the coming age and so equipped your people for the future, blessed are you among men. Your people, the Coast Salish, thrived upon the choicest lands, near Puget Sound in what is now Washington State in America, and on Vancouver Island in Canada. Situated between jealous enemies, your people nontheless managed to thrive and create an advanced society based on distinctive art and architecture and the law of generosity.[NEWLINE][NEWLINE]When the Americans began to settle in your lands, you held your people back from war and generously offered your lands to the colonists, claiming that the age of the Coast Salish was at its end and the time of the colonist had come. But your era was not at its end. Because of your actions, your people have been resilient to the rigors and suffering of life without their land, and even now, are one of the most powerful and influential First Nations.[NEWLINE][NEWLINE]Seattle! We look to your decisive and benevolent leadership to set the path for our future. Gaze upon the world and read it like a sign in the heavens. Speak the truth, and with these words open the door to a civilization that will stand forever and never fade despite the rigors of time!'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_01',		'Old-Man House'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_02',		'Spahbahdeed'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_03',		'Stahlahl'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_04',		'Sahtsahkahl'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_05',		'Pahpahdeel'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_06',		'Pahsahweh'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_07',		'Shoobahltoo'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_08',		'Twhahbkoh'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_09',		'Skahtehlbsh'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_10',		'Spahdehlgwelh'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_11',		'Suhteecheeb'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_12',		'Hahchoo'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_13',		'Swahtsoogweel'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_14',		'Hehskweekweel'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_15',		'Tlehls'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_16',		'Toohoobeed'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_17',		'Sahtsootseed'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_18',		'Shillshohl'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_19',		'Tohlahltoo'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_20',		'Hahahpoos'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_21',		'Yeelehkhood'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_22',		'Tookwhehlteed'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_23',		'Skohahlkoh'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_24',		'Tahwedeets'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_25',		'Spahbahdeed'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_26',		'Toohoodeedoo'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_27',		'Sawhwahwhwehwad'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_28',		'Doowehkwoolts'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_29',		'Stook'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_30',		'Chootuhbahltw'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_31',		'Tuhbtuhbyookw'),
			('TXT_KEY_CITY_NAME_CLCOASTSALISH_32',		'Tooohbehdahbsh'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_0',		'Dan George'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_1',		'Cheethlum'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_2',		'Capilano'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_3',		'Thumquas'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_4',		'Otter'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_5',		'Tjolzhitsay'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_6',		'Slem-cry-cre'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_7',		'Charlo'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_8',		'Vi Taqwseblu Hilbert'),
			('TXT_KEY_SPY_NAME_CLCOASTSALISH_9',		'Charles Elliott');