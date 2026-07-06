
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_BULG_ROSE',	'Improvement', 	'BULG_ROSE');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_BULG_ROSE',		'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'hb_plantation_mid_perfume.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_BULG_ROSE',		'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'plantation_mid_perfume.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_BULG_ROSE',		'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'pl_plantation_mid_perfume.fxsxml', 1);