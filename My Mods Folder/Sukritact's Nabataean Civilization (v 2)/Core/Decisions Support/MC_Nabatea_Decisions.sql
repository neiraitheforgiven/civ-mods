--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Nabatea_Decisions.lua');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 					DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISIONS_NABATEANARCHITECTURE', 		'BUILDING_DECISIONS_NABATEANARCHITECTURE', 	'TXT_KEY_DECISIONS_NABATEANARCHITECTURE',    	-1,					-1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 							BuildingClass, 									Description,								GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_NABATEANARCHITECTURE', 			'BUILDINGCLASS_DECISIONS_NABATEANARCHITECTURE',	'TXT_KEY_DECISIONS_NABATEANARCHITECTURE',	-1, 			-1,   -1, 		 null,			1);

UPDATE Buildings
	SET WonderProductionModifier = 5
	WHERE Type = 'BUILDING_DECISIONS_NABATEANARCHITECTURE';
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 												Description) 
VALUES		('POLICY_DECISIONS_NABATEANGARDENS',	 	    	'TXT_KEY_DECISIONS_NABATEANGARDENS');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_DECISIONS_NABATEANARCHITECTURE',
		'Syncretise Foreign Architecture'
	),
	(
		'TXT_KEY_DECISIONS_NABATEANARCHITECTURE_DESC',
		'While today we are builders, our ancestors were nomads. Thus, while our architects are skilled, they have no traditions to draw from. So instead, let us send them with our caravans, that they might see the world and bring back those architectural elements they find most pleasing.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Nabatea
		[NEWLINE][ICON_BULLET]Must have at least 1 [ICON_TURNS_REMAINING] International Land Trade Route
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]{1_Gold} [ICON_GOLD] Gold
		[NEWLINE][ICON_BULLET]2 {2_Resource}
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Departing International Land Trade Routes each provide +5% [ICON_PRODUCTION] towards Wonders'
	),
	(
		'TXT_KEY_DECISIONS_NABATEANARCHITECTURE_ENACTED_DESC',
		'While today we are builders, our ancestors were nomads. Thus, while our architects are skilled, they have no traditions to draw from. So instead, let us send them with our caravans, that they might see the world and bring back those architectural elements they find most pleasing.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Departing International Land Trade Routes each provide +5% [ICON_PRODUCTION] towards Wonders'
	),
	(
		'TXT_KEY_DECISIONS_NABATEANGARDENS',
		'Sponsor Pleasure Gardens'
	),
	(
		'TXT_KEY_DECISIONS_NABATEANGARDENS_DESC',
		'Our people sweat and toil under the burning heat of the desert. But we are an advanced and civilised society. With our knowledge of hydraulics, we can construct lush gardens for their benefit even in such conditions. It will cost us to perfect the technique, but the results will be worth it.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Nabatea
		[NEWLINE][ICON_BULLET]May not be enacted before the Classical Era
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]{1_Gold} [ICON_GOLD] Gold
		[NEWLINE][ICON_BULLET]2 [ICON_MAGISTRATES] Magistrates
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]-33% [ICON_GOLD] Gold needed to increase [ICON_FOOD] Food yields in Desert cities
		[NEWLINE][ICON_BULLET]Recieve [ICON_CULTURE] Culture when increasing [ICON_FOOD] Food yields'
	),
	(
		'TXT_KEY_DECISIONS_NABATEANGARDENS_ENACTED_DESC',
		'Our people sweat and toil under the burning heat of the desert. But we are an advanced and civilised society. With our knowledge of hydraulics, we can construct lush gardens for their benefit even in such conditions. It will cost us to perfect the technique, but the results will be worth it.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]-33% [ICON_GOLD] Gold needed to increase [ICON_FOOD] Food yields in Desert cities
		[NEWLINE][ICON_BULLET]Recieve [ICON_CULTURE] Culture when increasing [ICON_FOOD] Food yields'
	);
--==========================================================================================================================
--==========================================================================================================================