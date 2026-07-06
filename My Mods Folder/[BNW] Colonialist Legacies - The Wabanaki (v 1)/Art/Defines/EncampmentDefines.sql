
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_CLWABHUNTING',	'Improvement', 	'CLWABHUNTING');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_CLWABHUNTING',		'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CLWABHUNTING',		'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 B.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_CLWABHUNTING',		'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'North American Encampment 1 PL.fxsxml', 1);

INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,						TileType,		Asset)
VALUES	('ART_DEF_IMPROVEMENT_CLWABHUNTING',	'Improvement',	'sv_CLHuntingGrounds.dds');