-------------------------------------------
--Unit (Quickstinger)
-------------------------------------------
UPDATE Units
SET ShowInPedia = 0
WHERE Type = 'UNIT_SHOSHONE_COMANCHE_RIDERS';

INSERT INTO Units
		(Type,						Description,						Civilopedia,								Strategy,									Help,									Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	UnitArtInfo,								ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_JWW_QUICKSTINGER',	'TXT_KEY_UNIT_JWW_QUICKSTINGER',	'TXT_KEY_CIV5_UNIT_JWW_QUICKSTINGER_TEXT',	'TXT_KEY_UNIT_JWW_QUICKSTINGER_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_QUICKSTINGER',	Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	'ART_DEF_UNIT_U_SHOSHONE_COMANCHE_RIDERS',	ShowInPedia,	MoveRate,	18,					18,				'EXPANSION2_UNIT_ATLAS',	'EXPANSION2_UNIT_FLAG_ATLAS'
FROM Units WHERE Type = 'UNIT_CAVALRY';

INSERT INTO UnitGameplay2DScripts
		(UnitType,					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_QUICKSTINGER',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_AITypes
		(UnitType,					UnitAIType)
SELECT	'UNIT_JWW_QUICKSTINGER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_Flavors
		(UnitType,					FlavorType,			Flavor)
SELECT	'UNIT_JWW_QUICKSTINGER',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_ClassUpgrades
		(UnitType,					UnitClassType)
SELECT	'UNIT_JWW_QUICKSTINGER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
SELECT	'UNIT_JWW_QUICKSTINGER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
VALUES	('UNIT_JWW_QUICKSTINGER',	'PROMOTION_JWW_COMANCHE_HORSE');

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType,					ResourceType,	Cost)
SELECT	'UNIT_JWW_QUICKSTINGER',	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';
-------------------------------------------
--Building (Half-Moon Church)
-------------------------------------------
INSERT INTO Buildings
		(Type,								Description,								Civilopedia,										Strategy,											Help,											GoldMaintenance,	MutuallyExclusiveGroup,	NeverCapture,	Cost,	HurryCostModifier,	MinAreaSize,	BuildingClass,	ArtDefineTag,	MaxStartEra,	PrereqTech,	DisplayPosition,	PortraitIndex,	WonderSplashAnchor,	IconAtlas)
SELECT	'BUILDING_JWW_HALF_MOON_CHURCH',	'TXT_KEY_BUILDING_JWW_HALF_MOON_CHURCH',	'TXT_KEY_CIV5_BUILDINGS_JWW_HALF_MOON_CHURCH_TEXT',	'TXT_KEY_BUILDING_JWW_HALF_MOON_CHURCH_STRATEGY',	'TXT_KEY_BUILDING_JWW_HALF_MOON_CHURCH_HELP',	GoldMaintenance,	MutuallyExclusiveGroup,	1,				Cost,	HurryCostModifier,	MinAreaSize,	BuildingClass,	ArtDefineTag,	MaxStartEra,	PrereqTech,	DisplayPosition,	2,				WonderSplashAnchor,	'JWW_COMANCHE_COLOR_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

INSERT INTO Building_ClassesNeededInCity
		(BuildingType,				BuildingClassType)
SELECT	'BUILDING_JWW_HALF_MOON_CHURCH',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO	Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_JWW_HALF_MOON_CHURCH',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO	Building_YieldChanges
		(BuildingType,						YieldType,	Yield)
SELECT	'BUILDING_JWW_HALF_MOON_CHURCH',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_JWW_COMANCHE_CHURCH_DUMMY', 	'BUILDING_JWW_COMANCHE_CHURCH_DUMMY', 	'TXT_KEY_BUILDING_JWW_COMANCHE_CHURCH_DUMMY');

INSERT INTO Buildings		
		(Type, 									BuildingClass,								Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	NukeImmune,		Description)
VALUES	('BUILDING_JWW_COMANCHE_CHURCH_DUMMY',	'BUILDINGCLASS_JWW_COMANCHE_CHURCH_DUMMY',	-1,		-1,			-1,				1,				1,				'TXT_KEY_BUILDING_JWW_COMANCHE_CHURCH_DUMMY');

INSERT INTO Building_DomainProductionModifiers
		(BuildingType,							DomainType,			Modifier)
VALUES	('BUILDING_JWW_COMANCHE_CHURCH_DUMMY',	'DOMAIN_LAND',		1),
		('BUILDING_JWW_COMANCHE_CHURCH_DUMMY',	'DOMAIN_SEA',		1),
		('BUILDING_JWW_COMANCHE_CHURCH_DUMMY',	'DOMAIN_AIR',		1);

INSERT INTO Units
		(Type,							Description,	Civilopedia,	Strategy,	Help,	Cost,	FaithCost,	Moves,	BaseSightRange,	Class,	Capture,	Domain,		CivilianAttackPriority,	DefaultUnitAI,		AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	SpreadReligion,	ReligionSpreads,	ReligiousStrength,	XPValueDefense, UnitArtInfo,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,	UnitFlagAtlas)
SELECT	'UNIT_JWW_COMANCHE_MISSIONARY',	Description,	Civilopedia,	Strategy,	Help,	-1,		-1,			Moves,	BaseSightRange,	Class,	Capture,	Domain,		CivilianAttackPriority,	DefaultUnitAI,		AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	SpreadReligion,	1,					750,				XPValueDefense,	UnitArtInfo,	0,				MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,	UnitFlagAtlas
FROM Units WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO UnitGameplay2DScripts
		(UnitType,					SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_COMANCHE_MISSIONARY',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_AITypes
		(UnitType,					UnitAIType)
SELECT	'UNIT_JWW_COMANCHE_MISSIONARY',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MISSIONARY';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
SELECT	'UNIT_JWW_COMANCHE_MISSIONARY',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MISSIONARY';
-------------------------------------------
--Building (Sweat Lodge)
-------------------------------------------
INSERT INTO Buildings
		(Type,						Description,						Civilopedia,									Strategy,										Help,										NeverCapture,	GoldMaintenance,	MutuallyExclusiveGroup,	FreshWater,	Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	ArtInfoEraVariation,	PrereqTech,		PortraitIndex,	WonderSplashAnchor,	IconAtlas)
SELECT	'BUILDING_JWW_SWEAT_LODGE',	'TXT_KEY_BUILDING_JWW_SWEAT_LODGE',	'TXT_KEY_CIV5_BUILDINGS_JWW_SWEAT_LODGE_TEXT',	'TXT_KEY_BUILDING_JWW_SWEAT_LODGE_STRATEGY',	'TXT_KEY_BUILDING_JWW_SWEAT_LODGE_HELP',	1,				GoldMaintenance,	MutuallyExclusiveGroup,	0,			Cost,	HurryCostModifier,	MinAreaSize,	2,			BuildingClass,	ArtDefineTag,	ArtInfoEraVariation,	PrereqTech,		4,				WonderSplashAnchor,	'JWW_COMANCHE_COLOR_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';

INSERT INTO	Building_Flavors
		(BuildingType,				FlavorType,		Flavor)
SELECT	'BUILDING_JWW_SWEAT_LODGE',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

INSERT INTO	Building_Flavors
		(BuildingType,					FlavorType,				Flavor)
VALUES	('BUILDING_JWW_SWEAT_LODGE',	'FLAVOR_GROWTH',		20),
		('BUILDING_JWW_SWEAT_LODGE',	'FLAVOR_HAPPINESS',		10);

INSERT INTO Unit_ProductionModifierBuildings
		(UnitType,				BuildingType, 					ProductionModifier)
VALUES	('UNIT_SETTLER',		'BUILDING_JWW_SWEAT_LODGE',		50);
-------------------------------------------
--Leader (Puhihwitsikwasu)
-------------------------------------------
INSERT INTO Leaders
		(Type,						Description,						Civilopedia,							CivilopediaTag,									ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_IRON_JACKET',	'TXT_KEY_LEADER_JWW_IRON_JACKET',	'TXT_KEY_LEADER_JWW_IRON_JACKET_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_IRON_JACKET',	'IronJacketScene.xml',		7,						3,						2,							7,			6,				5,				7,						3,						6,						3,				5,			4,			3,				5,			8,			0,				'JWW_COMANCHE_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,				MajorCivApproachType,			Bias)
VALUES	('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_WAR',		8),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_HOSTILE',	7),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_DECEPTIVE',	2),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_GUARDED',	7),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_AFRAID',	6),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_FRIENDLY',	2),
		('LEADER_JWW_IRON_JACKET',	'MAJOR_CIV_APPROACH_NEUTRAL',	3);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,				MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_IRON_JACKET',	'MINOR_CIV_APPROACH_IGNORE',		4),
		('LEADER_JWW_IRON_JACKET',	'MINOR_CIV_APPROACH_FRIENDLY',		5),
		('LEADER_JWW_IRON_JACKET',	'MINOR_CIV_APPROACH_PROTECTIVE',	4),
		('LEADER_JWW_IRON_JACKET',	'MINOR_CIV_APPROACH_CONQUEST',		6),
		('LEADER_JWW_IRON_JACKET',	'MINOR_CIV_APPROACH_BULLY',			5);

INSERT INTO	Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_JWW_IRON_JACKET',	'FLAVOR_OFFENSE',					6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_DEFENSE',					3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_CITY_DEFENSE',				3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_MILITARY_TRAINING',			6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_RECON',						5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_RANGED',					6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_MOBILE',					8),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_NAVAL',						2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_NAVAL_RECON',				2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_NAVAL_GROWTH',				1),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_AIR',						4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_EXPANSION',					4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_GROWTH',					8),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_TILE_IMPROVEMENT',			6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_INFRASTRUCTURE',			7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_PRODUCTION',				7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_GOLD',						4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_SCIENCE',					5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_CULTURE',					8),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_HAPPINESS',					7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_GREAT_PEOPLE',				4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_WONDER',					3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_RELIGION',					12),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_DIPLOMACY',					5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_SPACESHIP',					5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_WATER_CONNECTION',			2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_NUKE',						3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_USE_NUKE',					6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_ESPIONAGE',					5),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_ANTIAIR',					7),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_AIR_CARRIER',				2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_ARCHAEOLOGY',				6),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_I_LAND_TRADE_ROUTE',		4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_I_SEA_TRADE_ROUTE',			2),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_I_TRADE_ORIGIN',			4),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_I_TRADE_DESTINATION',		3),
		('LEADER_JWW_IRON_JACKET',	'FLAVOR_AIRLIFT',					6);

INSERT INTO Leader_Traits
		(LeaderType,				TraitType)
VALUES	('LEADER_JWW_IRON_JACKET',	'TRAIT_JWW_COMANCHE_MOON');
-------------------------------------------
--Trait (Comanche Moon)
-------------------------------------------
INSERT INTO Traits
		(Type,						Description,						ShortDescription)
VALUES	('TRAIT_JWW_COMANCHE_MOON',	'TXT_KEY_TRAIT_JWW_COMANCHE_MOON',	'TXT_KEY_TRAIT_JWW_COMANCHE_MOON_SHORT');

INSERT INTO UnitPromotions
		(Type,								Description,							Help,											RivalTerritory,			Sound,				CannotBeChosen,	PortraitIndex,	IconAtlas,						PediaType,			PediaEntry)
VALUES	('PROMOTION_JWW_COMANCHE_HORSE',	'TXT_KEY_PROMOTION_JWW_COMANCHE_HORSE',	'TXT_KEY_PROMOTION_JWW_COMANCHE_HORSE_HELP',	1,						'AS2D_IF_LEVELUP',	1,				6,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_JWW_COMANCHE_HORSE');
-------------------------------------------
--Religion (Peyotism)
-------------------------------------------
INSERT INTO Religions
		(Type,						Description,						Civilopedia,							IconAtlas,						PortraitIndex,	IconString)
VALUES	('RELIGION_JWW_PEYOTISM',	'TXT_KEY_RELIGION_JWW_PEYOTISM',	'TXT_KEY_RELIGION_JWW_PEYOTISM_PEDIA',	'JWW_COMANCHE_RELIGION_ATLAS',	0,				'[ICON_RELIGION_JWW_PEYOTISM]');
-------------------------------------------
--Diplomacy Responses
-------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,				   ResponseType,									Response,																Bias)
VALUES	('LEADER_JWW_IRON_JACKET',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_JWW_IRON_JACKET_ATTACKED_GENERIC%',						500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_JWW_IRON_JACKET_DEFEATED%',								500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_DOW_GENERIC',                          'TXT_KEY_LEADER_JWW_IRON_JACKET_DOW_GENERIC%',							500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_EXPANSION_SERIOUS_WARNING',            'TXT_KEY_LEADER_JWW_IRON_JACKET_EXPANSION_SERIOUS_WARNING%',			500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_JWW_IRON_JACKET_FIRSTGREETING%',						500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			    'TXT_KEY_LEADER_JWW_IRON_JACKET_GREETING_AT_WAR_HOSTILE%',				500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_GREETING_POLITE_HELLO',                'TXT_KEY_LEADER_JWW_IRON_JACKET_GREETING_POLITE_HELLO%',				500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_GREETING_NEUTRAL_HELLO',               'TXT_KEY_LEADER_JWW_IRON_JACKET_GREETING_NEUTRAL_HELLO%',				500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_GREETING_HOSTILE_HELLO',               'TXT_KEY_LEADER_JWW_IRON_JACKET_GREETING_HOSTILE_HELLO%',				500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  'TXT_KEY_LEADER_JWW_IRON_JACKET_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_INFLUENTIAL_ON_AI',                    'TXT_KEY_LEADER_JWW_IRON_JACKET_INFLUENTIAL_ON_AI%',					500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_JWW_IRON_JACKET_INFLUENTIAL_ON_HUMAN%',					500),	
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_JWW_IRON_JACKET_LETS_HEAR_IT%',							500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_JWW_IRON_JACKET_LUXURY_TRADE%',							500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_JWW_IRON_JACKET_NO_PEACE%',								500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_JWW_IRON_JACKET_OPEN_BORDERS_EXCHANGE%',				500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_JWW_IRON_JACKET_LOSEWAR%',								500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_JWW_IRON_JACKET_REPEAT_NO%',							500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_JWW_IRON_JACKET_RESPONSE_REQUEST%',						500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		    'TXT_KEY_LEADER_JWW_IRON_JACKET_RESPONSE_TO_BEING_DENOUNCED%',			500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_JWW_IRON_JACKET_TOO_SOON_NO_PEACE_1%',					500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_JWW_IRON_JACKET_WINWAR%',								500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_JWW_IRON_JACKET_DENOUNCE%',								500),
		('LEADER_JWW_IRON_JACKET',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_JWW_IRON_JACKET_DEC_FRIENDSHIP%',						500);
-------------------------------------------
--Civilization (Comanche)
-------------------------------------------
INSERT INTO Civilizations
		(Type,							Description,						Civilopedia,						CivilopediaTag,					Playable,	AIPlayable,		ShortDescription,							Adjective,								DefaultPlayerColor,				ArtDefineTag,						ArtStyleType,					ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,	IconAtlas,					AlphaIconAtlas,				MapImage,				DawnOfManQuote,								DawnOfManImage,			SoundtrackTag)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CIV_JWW_COMANCHE_DESC',	'TXT_KEY_CIV_JWW_COMANCHE_PEDIA',	'TXT_KEY_CIV5_JWW_COMANCHE',	1,			1,				'TXT_KEY_CIV_JWW_COMANCHE_SHORT_DESC',		'TXT_KEY_CIV_JWW_COMANCHE_ADJECTIVE',	'PLAYERCOLOR_JWW_COMANCHE',		'ART_DEF_CIVILIZATION_SHOSHONE',	'ARTSTYLE_SOUTH_AMERICA',		'_AMER',			'AMERICAN',			1,				'JWW_COMANCHE_COLOR_ATLAS',	'JWW_COMANCHE_ALPHA_ATLAS',	'JWWComancheMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_COMANCHE_TEXT',		'IronJacketDOM.dds',	'Shoshone');

INSERT INTO Civilization_Leaders
		(CivilizationType,				LeaderheadType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'LEADER_JWW_IRON_JACKET');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'BUILDINGCLASS_TEMPLE',	'BUILDING_JWW_HALF_MOON_CHURCH'),
		('CIVILIZATION_SHOSHONE',		'BUILDINGCLASS_GARDEN',	'BUILDING_JWW_SWEAT_LODGE');

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,			UnitType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'UNITCLASS_CAVALRY',	'UNIT_JWW_QUICKSTINGER'),
		('CIVILIZATION_SHOSHONE',		'UNITCLASS_SCOUT',		'UNIT_SHOSHONE_PATHFINDER');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,				BuildingClassType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,				TechType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,				UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Religions
		(CivilizationType,				ReligionType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'RELIGION_JWW_PEYOTISM');

INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType,				RegionType)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'REGION_TUNDRA'),
		('CIVILIZATION_JWW_COMANCHE',	'REGION_JUNGLE');

INSERT INTO	Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_0'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_1'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_2'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_3'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_4'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_5'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_6'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_7'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_8'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_9'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_10'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_11'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_12'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_13'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_14'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_15'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_16'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_17'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_18'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_19'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_20'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_21'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_22'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_23'),
		('CIVILIZATION_JWW_COMANCHE',	'TXT_KEY_CITY_NAME_JWW_COMANCHE_24');
		
INSERT INTO Civilization_SpyNames
		(CivilizationType,					SpyName)
VALUES	('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_0'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_1'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_2'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_3'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_4'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_5'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_6'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_7'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_8'),
		('CIVILIZATION_JWW_COMANCHE',		'TXT_KEY_SPY_NAME_JWW_COMANCHE_9');
--============================================	
--============================================
