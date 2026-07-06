
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 					NearbyTerrainRequired,	BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize,  Description, 					Civilopedia, 					Help, 									Strategy,								ArtDefineTag, ConquestProb, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_MC_KOKH'), 	('TERRAIN_DESERT'),		BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, 	('TXT_KEY_BUILDING_MC_KOKH'), 	('TXT_KEY_CIV5_MC_KOKH_TEXT'),   ('TXT_KEY_BUILDING_MC_KOKH_HELP'), 	('TXT_KEY_BUILDING_MC_KOKH_STRATEGY'),	ArtDefineTag, ConquestProb, HurryCostModifier, 3, 				('MC_NABATEA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_MINT';

UPDATE Buildings
SET	
	TradeRouteLandGoldBonus 		= 	500,
	TradeRouteLandDistanceModifier	=	100
WHERE Type = 'BUILDING_MC_KOKH';
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, 			ResourceType, 	YieldType, 			Yield)
SELECT		('BUILDING_MC_KOKH'), 	ResourceType, 	YieldType, 			Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MINT';
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_MC_KOKH'),	FlavorType, (Flavor*1.2)
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MINT';
--==========================================================================================================================
--==========================================================================================================================