--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_CLWABANAKI', 	'TXT_KEY_TRAIT_CLWABANAKI', 	'TXT_KEY_TRAIT_CLWABANAKI_SHORT');	

insert into UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, HasPostCombatPromotions)
                    values ('PROMOTION_CLWABSHIP', 'TXT_KEY_PROMOTION_CLWABSHIP', 'TXT_KEY_PROMOTION_CLWABSHIP_HELP',
							'AS2D_IF_LEVELUP',	1,	59,	'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES', 
							'TXT_KEY_PROMOTION_CLWABSHIP_HELP',	1),
						   ('PROMOTION_CLWABSHIPF',	'TXT_KEY_PROMOTION_CLWABSHIPF',	'TXT_KEY_PROMOTION_CLWABSHIPF_HELP',
							'AS2D_IF_LEVELUP',	1,	59,	'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',
							'TXT_KEY_PROMOTION_CLWABSHIPF_HELP', 0);

insert into UnitPromotions_Domains (PromotionType,         DomainType,   Modifier)
                            values ('PROMOTION_CLWABSHIP', 'DOMAIN_SEA', 10);

insert into UnitPromotions_PostCombatRandomPromotion (PromotionType,          NewPromotion)
											  values ('PROMOTION_CLWABSHIP', 'PROMOTION_CLWABSHIPF');

--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,									Text)
VALUES		('TXT_KEY_TRAIT_CLWABANAKI',			'Naval Units gain the ''Defenders of the Sea'' promotion, allowing them to be stronger within 4 tiles of Wabanaki waters and gain [ICON_PEACE] Faith upon attacking. Upon entering a City, captured ships are dismantled for [ICON_PRODUCTION] Production.'),
			('TXT_KEY_TRAIT_CLWABANAKI_SHORT',		'Children of the Dawn'),
			('TXT_KEY_PROMOTION_CLWABSHIP', 		'Defenders of the Sea'),
			('TXT_KEY_PROMOTION_CLWABSHIPF', 		' '),			
			('TXT_KEY_PROMOTION_CLWABSHIP_HELP',	'10% extra damage and gain [ICON_FAITH] Faith whenever you attack when in or near friendly waters. The amount of [ICON_FAITH] generated increases when you are low on health.'),
			('TXT_KEY_PROMOTION_CLWABSHIPF_HELP',	'Gain faith equal to 3% of your damage.');