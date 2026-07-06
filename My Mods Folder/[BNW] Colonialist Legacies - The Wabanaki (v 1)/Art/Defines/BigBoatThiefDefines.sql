--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_CLSHIPHUNTER', 	'Unit', 	'sv_Wab_Getanget.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_CLSHIPHUNTER'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_CANNON');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
VALUES		('ART_DEF_UNIT_CLSHIPHUNTER', 	'ART_DEF_UNIT_MEMBER_CARGO_SHIP',	1),
			('ART_DEF_UNIT_CLSHIPHUNTER', 	'ART_DEF_UNIT_MEMBER_CL_WAB_CANOE',	3);
