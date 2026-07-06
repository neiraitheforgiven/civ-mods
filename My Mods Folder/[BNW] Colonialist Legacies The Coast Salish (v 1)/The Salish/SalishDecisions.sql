-- Insert SQL Rules Here 
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('SalishDecisions.lua');
--==========================================================================================================================

insert into UnitPromotions (Type, 						Description, 						Help, 									Sound,				CannotBeChosen, 	PortraitIndex,	IconAtlas, 			PediaType,			PediaEntry, 							HasPostCombatPromotions, 	AttackMod, 	DefenseMod)
					values  ('PROMOTION_CLPOISONCAN', 	'TXT_KEY_PROMOTION_CLPOISONCAN',	'TXT_KEY_PROMOTION_CLPOISONCAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISONCAN_HELP', 	1, 							0, 			0),
							('PROMOTION_CLPOISONFOUND', 'TXT_KEY_PROMOTION_CLPOISONFOUND',	'TXT_KEY_PROMOTION_CLPOISONCAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISONCAN_HELP',	0,		 					0, 			0),
							('PROMOTION_CLPOISON1', 	'TXT_KEY_PROMOTION_CLPOISON',		'TXT_KEY_PROMOTION_CLPOISON1_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISON1_HELP',		0, 							-4, 		-4),
							('PROMOTION_CLPOISON2',		'TXT_KEY_PROMOTION_CLPOISON',		'TXT_KEY_PROMOTION_CLPOISON2_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISON2_HELP', 	0, 							-8, 		-8),
							('PROMOTION_CLPOISON3', 	'TXT_KEY_PROMOTION_CLPOISON',		'TXT_KEY_PROMOTION_CLPOISON3_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISON3_HELP',		0, 							-12, 		-12),
							('PROMOTION_CLPOISON4', 	'TXT_KEY_PROMOTION_CLPOISON',		'TXT_KEY_PROMOTION_CLPOISON4_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISON4_HELP', 	0, 							-16, 		-16),
							('PROMOTION_CLPOISON5',		'TXT_KEY_PROMOTION_CLPOISON',		'TXT_KEY_PROMOTION_CLPOISON5_HELP', 	'AS2D_IF_LEVELUP', 	1, 					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_CLPOISON5_HELP', 	0, 							-20, 		-20);
		
insert into UnitPromotions_PostCombatRandomPromotion (PromotionType,           NewPromotion)
    									      values ('PROMOTION_CLPOISONCAN', 'PROMOTION_CLPOISONFOUND');

--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT INTO BuildingClasses (DefaultBuilding, Type, Description)
				VALUES		('BUILDING_CLCSHEALTH', 'BUILDINGCLASS_CLCSHEALTH', 
							'TXT_KEY_BUILDING_CLCSHEALTH');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings (Type, BuildingClass, GreatWorkCount,	Cost, FaithCost, GoldMaintenance, PrereqTech,
            		  NeverCapture, Description, Help, ExtraCityHitPoints)
               VALUES ('BUILDING_CLCSHEALTH', 'BUILDINGCLASS_CLCSHEALTH', -1, -1, -1, 0, null,
               	      1, 'TXT_KEY_BUILDING_CLCSHEALTH', 'TXT_KEY_BUILDING_CLCSHEALTH_HELP', 3);

--Language
Insert into Language_en_US 	(Tag, 									Text)
Values 						('TXT_KEY_PROMOTION_CLPOISONCAN', 		'Poisoned Tips');
Insert into Language_en_US 	(Tag, 									Text)
Values 						('TXT_KEY_PROMOTION_CLPOISONCAN_HELP',	'Attacks stack -4% combat power on targets, up to a maximum of -20%.');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISONFOUND', 	'');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON', 			'Poisoned');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON1_HELP', 	'-4% Combat Power. Will reduce by one rank if this unit is healed (Modern Era: healing removes all stacks.)');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON2_HELP', 	'-8% Combat Power. Will reduce by one rank if this unit is healed (Modern Era: healing removes all stacks.)');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON3_HELP', 	'-12% Combat Power. Will reduce by one rank if this unit is healed (Modern Era: healing removes all stacks.)');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON4_HELP', 	'-16% Combat Power. Will reduce by one rank if this unit is healed (Modern Era: healing removes all stacks.)');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_PROMOTION_CLPOISON5_HELP', 	'-20% Combat Power. Will reduce by one rank if this unit is healed (Modern Era: healing removes all stacks.)');
Insert into Language_en_US (Tag, Text)
Values 						('TXT_KEY_BUILDING_CLCSHEALTH', 		'Secret Salish Health Bonus');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_BUILDING_CLCSHEALTH_HELP', 'At one point, this was banned by the government.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSUNDERGROUND_NAME', 'Constuct Underground Dwellings.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSUNDERGROUND_DESC', 'Slave Hunters have been sighted nearby, threatening our people! We should contruct dwellings hidden below the ground to protect ourselves.[NEWLINE]Requirement/Restrictions:[NEWLINE][ICON_BULLET]Player must be the Coast Salish[NEWLINE][ICON_BULLET]Must have researched Engineering.[NEWLINE][ICON_BULLET]May only be enacted once per game.[NEWLINE]Costs:[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrate[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]Cities gain +3 Hit Points for each [ICON_CITIZEN] Citizen it has.[NEWLINE]Note: This bonus is not removed if Population decreases.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSUNDERGROUND_ENACTED', 'Slave Hunters have been sighted nearby, threatening our people! We should contruct dwellings hidden below the ground to protect ourselves.[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]Cities gain +3 Hit Points for each [ICON_CITIZEN] Citizen it has.[NEWLINE]Note: This bonus is not removed if Population decreases.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSPOISON_NAME', 'Concoct a recipe for Poison-tipped projectiles.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSPOISON_DESC', 'Our hunters report that their prey -- both animal and human -- are particularly cunning and resilient. We should call upon our nobles to concoct a deadly toxin from a mixture of berries, toxic petals, and rotten deer livers.[NEWLINE]Requirement/Restrictions:[NEWLINE][ICON_BULLET]Player must be the Coast Salish[NEWLINE][ICON_BULLET]Must have researched Trapping.[NEWLINE][ICON_BULLET]Must have researched Archery.[NEWLINE][ICON_BULLET]May only be enacted once per game.[NEWLINE]Costs:[NEWLINE][ICON_BULLET]40 [ICON_RESEARCH] Science[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]Archery and Gun Units will apply a -4% debuff to the [ICON_STRENGTH] Combat Strength of their targets whenever performing an attack. The debuff will persist until the targeted Unit heals. For each time the targeted Unit heals, it regains +4% of its [ICON_STRENGTH] Combat Strength.[NEWLINE]Note: The applied Combat Strength debuff is capped at -20%.');
Insert into Language_en_US (Tag, Text)
Values ('TXT_KEY_DECISIONS_CLCSPOISON_ENACTED', 'Our hunters report that their prey -- both animal and human -- are particularly cunning and resilient. We should call upon our nobles to concoct a deadly toxin from a mixture of berries, toxic petals, and rotten deer livers.[NEWLINE]Rewards:[NEWLINE][ICON_BULLET]Archery and Gun Units will apply a -4% debuff to the [ICON_STRENGTH] Combat Strength of their targets whenever performing an attack. The debuff will persist until the targeted Unit heals. For each time the targeted Unit heals, it regains +4% of its [ICON_STRENGTH] Combat Strength.[NEWLINE]Note: The applied Combat Strength debuff is capped at -20%.');