--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_TRAIT_MC_NABATEA', 		'BUILDING_TRAIT_MC_NABATEA', 			'TXT_KEY_TRAIT_MC_NABATEA_SHORT');
--------------------------------	
-- Buildings: Invisible
--------------------------------
INSERT INTO Buildings
			(Type, 								BuildingClass, 							Description,							GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_TRAIT_MC_NABATEA', 		'BUILDINGCLASS_TRAIT_MC_NABATEA',		'TXT_KEY_TRAIT_MC_NABATEA_SHORT',		-1, 			-1,   		-1,		null,			1);
--------------------------------	
-- Building_YieldChanges
--------------------------------	
INSERT INTO Building_YieldChanges
			(BuildingType, 					YieldType, 		Yield)
VALUES		('BUILDING_TRAIT_MC_NABATEA',	'YIELD_FOOD', 	2);
--==========================================================================================================================
-- Traits
--==========================================================================================================================		
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_MC_NABATEA', 	'TXT_KEY_TRAIT_MC_NABATEA', 	'TXT_KEY_TRAIT_MC_NABATEA_SHORT');
--==========================================================================================================================	
--==========================================================================================================================				

