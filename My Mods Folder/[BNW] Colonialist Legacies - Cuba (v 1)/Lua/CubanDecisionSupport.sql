-- Insert SQL Rules Here 
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('CubanDecisions.lua');
--==========================================================================================================================

insert into Policies (Type, Description, Civilopedia, Help)
values ('POLICY_CL_UC_TOBACCO', 'TXT_KEY_DECISIONS_CL_UC_TOBACCOFARMS_NAME', 'TXT_KEY_CIV5_POLICY_CL_UC_CUBA_DISCLAIMER', 'TXT_KEY_CIV5_POLICY_CL_UC_CUBA_DISCLAIMER');

insert into Policy_SpecialistExtraYields (PolicyType, YieldType, Yield)
values('POLICY_CL_UC_TOBACCO', 'YIELD_GOLD', 2);

insert into Policy_ImprovementYieldChanges (PolicyType, ImprovementType, YieldType, Yield)
values ('POLICY_CL_UC_TOBACCO', 'IMPROVEMENT_FARM', 'YIELD_GOLD', 1);

--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT INTO BuildingClasses 
			(DefaultBuilding, 					Type, 									Description)
VALUES		('BUILDING_TOBACCOFARMS', 			'BUILDINGCLASS_TOBACCOFARMS', 			'TXT_KEY_BUILDING_TOBACCOFARMS'),
			('BUILDING_HAPPYFARMS', 			'BUILDINGCLASS_HAPPYFARMS', 			'TXT_KEY_BUILDING_HAPPYFARMS');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 
			(Type, 								BuildingClass, 						GreatWorkCount,	Cost, 	FaithCost,	GoldMaintenance, PrereqTech,	Happiness,		NeverCapture,	Description, 							Help)
VALUES		('BUILDING_TOBACCOFARMS', 			'BUILDINGCLASS_TOBACCOFARMS',		-1,				-1, 	-1,			0,				 NULL,			0,      		1,				'TXT_KEY_BUILDING_TOBACCOFARMS',		'TXT_KEY_CIV5_POLICY_CL_UC_CUBA_DISCLAIMER'),
			('BUILDING_HAPPYFARMS', 			'BUILDINGCLASS_HAPPYFARMS',		    -1,				-1, 	-1,			0,				 NULL,			4,      		1,				'TXT_KEY_BUILDING_HAPPYFARMS',		    'TXT_KEY_CIV5_POLICY_CL_UC_CUBA_DISCLAIMER');

insert into Building_ResourceQuantity (BuildingType, ResourceType, Quantity)
VALUES      ('BUILDING_TOBACCOFARMS', 'RESOURCE_TOBACCO', 1);


insert into Language_en_US (Tag, Text)
values	('TXT_KEY_DECISIONS_CL_UC_TOBACCOFARMS_DESC', 			'The climate of our nation is perfect for growing tobacco, and the world demands its medicinal properties. We must encourage every landowner to place a tobacco mound in the center of their farm and to work it themselves, since the plant is to delicate for slaves. A little toil for the freemen will not hurt, and they will prosper.[NEWLINE]Requires:[NEWLINE][ICON_BULLET]Player must be Cuba[NEWLINE][ICON_BULLET]At least 3 cities and a total of at least 15 Farms [NEWLINE] Costs: [NEWLINE][ICON_BULLET] 500 [ICON_GOLD] Gold [NEWLINE][ICON_BULLET] 2 Magistrates [NEWLINE] Rewards: [NEWLINE][ICON_BULLET] 2 [ICON_GOLD] Gold for each Specialist [NEWLINE][ICON_BULLET] 1 [ICON_GOLD] Gold for each Farm[NEWLINE][ICON_BULLET]Gain a source of Tobacco (More Luxuries mod required) or 4 Happiness.'),
		('TXT_KEY_DECISIONS_CL_UC_TOBACCOFARMS_NAME', 			'Teach our Freemen the Tobacco Trade'),
		('TXT_KEY_DECISIONS_CL_UC_TOBACCOFARMS_ENACTED', 		'The climate of our nation is perfect for growing tobacco, and the world demands its medicinal properties. We must encourage every landowner to place a tobacco mound in the center of their farm and to work it themselves, since the plant is to delicate for slave''s hands. A little toil for the freemen won''t hurt, and the gold will be worth it.[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]2 [ICON_GOLD] Gold for each Specialist[NEWLINE][ICON_BULLET]1 [ICON_GOLD] Gold for each Farm[NEWLINE][ICON_BULLET]Gain a source of Tobacco (More Luxuries mod required) or +4 [ICON_HAPPINESS_1] Happiness.'),
		('TXT_KEY_DECISIONS_CL_UC_LITERARYCAMPAIGN_DESC', 		'Illiteracy is the scourge of our people, a whip held by those that would oppress the guarijros! We must declare this year to be the year of education and send out military literacy brigades to build schools, train teachers, and teach our people to read and write.[NEWLINE]Requirements:[NEWLINE][ICON_BULLET]Player must be Cuba[NEWLINE][ICON_BULLET]At least 5 Guerrilleros[NEWLINE]Costs:[NEWLINE][ICON_BULLET]1000 [ICON_GOLD] Gold[NEWLINE][ICON_BULLET]2 Magistrates[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]A National College in every City![NEWLINE][ICON_BULLET]Increased [ICON_HAPPINESS_4] Unhappiness if a City produces more [ICON_RESEARCH] Science than twice its level of [ICON_PRODUCTION] Production.'),
		('TXT_KEY_DECISIONS_CL_UC_LITERARYCAMPAIGN_NAME', 		'National Literacy Campaign'),
		('TXT_KEY_DECISIONS_CL_UC_LITERARYCAMPAIGN_ENACTED', 	'Illiteracy is the scourge of our people, a whip held by those that would oppress the guarijros! We must declare this year to be the year of education and send out military literacy brigades to build schools, train teachers, and teach our people to read and write.[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]A National College in every City![NEWLINE][ICON_BULLET]Increased [ICON_HAPPINESS_4] Unhappiness if a City produces more [ICON_RESEARCH] Science than twice its level of [ICON_PRODUCTION] Production.'),
		('TXT_KEY_CIV5_POLICY_CL_UC_CUBA_DISCLAIMER', 			'Communist Party Secrets. You don''t see this.'),
		('TXT_KEY_BUILDING_TOBACCOFARMS', 						'More Luxuries Tobacco enhancement'),
		('TXT_KEY_BUILDING_HAPPYFARMS', 						'Tobacco enhancement');