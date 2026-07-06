-- Big Boat Thief -- Wabanaki UU.

insert into Units (Class, Type, PrereqTech, Combat, Cost, Moves, CombatClass, Domain, DefaultUnitAI, Description,
                   Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, Mechanized,
				   ObsoleteTech, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, UnitArtInfo, UnitFlagAtlas,
				   UnitFlagIconOffset, IconAtlas, PortraitIndex, MoveRate)
		   values ('UNITCLASS_TRIREME',
				   'UNIT_CLSHIPHUNTER',
				   'TECH_SAILING',
				   10,
				   40,
				   3,
				   'UNITCOMBAT_NAVALMELEE',
				   'DOMAIN_SEA',
				   'UNITAI_PIRATE_SEA',
				   'TXT_KEY_UNIT_CLSHIPHUNTER',
				   'TXT_KEY_CIV5_ANTIQUITY_CLSHIPHUNTER_TEXT',
				   'TXT_KEY_UNIT_CLSHIPHUNTER_STRATEGY',
				   'TXT_KEY_UNIT_HELP_CLSHIPHUNTER',
				   1,
				   1,
				   1,
				   1,
				   'TECH_ASTRONOMY',
				   30,
				   10,
				   3,
				   3,
				   'ART_DEF_UNIT_CLSHIPHUNTER',
				   'CLSHIPHUNTER_FLAG',
				   0,
				   'CLWABANAKI_ATLAS',
				   2,
				   'WOODEN_BOAT');

insert into Unit_AITypes (UnitType, UnitAIType)
                  values ('UNIT_CLSHIPHUNTER', 'UNITAI_ATTACK_SEA'),
						 ('UNIT_CLSHIPHUNTER', 'UNITAI_RESERVE_SEA'),
						 ('UNIT_CLSHIPHUNTER', 'UNITAI_ESCORT_SEA'),
						 ('UNIT_CLSHIPHUNTER', 'UNITAI_EXPLORE_SEA'),
						 ('UNIT_CLSHIPHUNTER', 'UNITAI_PIRATE_SEA');

insert into Unit_ClassUpgrades (UnitType,              UnitClassType)
                        values ('UNIT_CLSHIPHUNTER', 'UNITCLASS_PRIVATEER');

insert into Unit_Flavors (UnitType,              FlavorType,           Flavor)
                  values ('UNIT_CLSHIPHUNTER', 'FLAVOR_NAVAL',       7),
				         ('UNIT_CLSHIPHUNTER', 'FLAVOR_NAVAL_RECON', 4);

--Promotions to make this work.
insert into UnitPromotions (Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, IconAtlas, PediaType, PediaEntry, HasPostCombatPromotions, AttackMod, DefenseMod, ExtraNavalMovement)
                    values ('PROMOTION_CLBBT', 'TXT_KEY_PROMOTION_CLBBT', 'TXT_KEY_PROMOTION_CLBBT_HELP',
							'AS2D_IF_LEVELUP', 1, 59, 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES', 
							'TXT_KEY_PROMOTION_CLBBT_HELP',	1, 0, 0, 0),
						   ('PROMOTION_CLBBTF',	'TXT_KEY_PROMOTION_CLBBTF',	'TXT_KEY_PROMOTION_CLBBTF_HELP',
							'AS2D_IF_LEVELUP', 1, 59, 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',
							'TXT_KEY_PROMOTION_CLBBTF_HELP', 0, 0, 0, 0),
						   ('PROMOTION_WABCAP', 'TXT_KEY_PROMOTION_WABCAP', 'TXT_KEY_PROMOTION_WABCAP_HELP',
						    'AS2D_IF_LEVELUP', 1, 57, 'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',
							'TXT_KEY_PROMOTION_WABCAP_HELP', 0, -30, -30, 0);

insert into UnitPromotions_PostCombatRandomPromotion (PromotionType,          NewPromotion)
											  values ('PROMOTION_CLBBT', 'PROMOTION_CLBBTF');

insert into Unit_FreePromotions (UnitType,              PromotionType)
                         values ('UNIT_CLSHIPHUNTER', 'PROMOTION_OCEAN_IMPASSABLE'),
								('UNIT_CLSHIPHUNTER', 'PROMOTION_CLBBT');

--Language
insert into Language_en_US (Tag,			                            Text)
				    values ('TXT_KEY_UNIT_CLSHIPHUNTER',			    'Getanget'),
                           ('TXT_KEY_CIV5_ANTIQUITY_CLSHIPHUNTER_TEXT', 'In the early days before colonialism, and even into the time of the French and Indian Wars, there are reports of Wabanaki commandeering European boats for their own use. The Wabanaki would use these ships to interact, both for trade and for war, with other European vessels. Often, the Europeans would be caught off-guard by a seemingly friendly vessel teaming with Wabanaki traders - or warriors. European histories branded these sailors with the generic “Pirates” name, partly because that is exactly what they were, and partly to bury the knowledge that the so-called “Indian savages” were fully capable of manning a ship of the line.'),
						   ('TXT_KEY_UNIT_CLSHIPHUNTER_STRATEGY',       'The Getanget will take heavy damage when it captures an enemy ship, but will not attempt a capture if it results in self-destruction. Bring captured ships home to your cities in order to dismantle them for parts.'),
						   ('TXT_KEY_UNIT_HELP_CLSHIPHUNTER',           'Slower than and slightly cheaper than the Trireme it replaces, the Getanget captures the first enemy vessel that it attacks, at the cost of its own health. The enemy vessel will be crippled. The Getanget also upgrades into the Privateer once Navigation has been researched.'),
						   ('TXT_KEY_PROMOTION_CLBBT',                  'Boarders Ready'),
						   ('TXT_KEY_PROMOTION_CLBBT_HELP',             'Will capture an enemy vessel at the cost of 40 health if possible.'),
						   ('TXT_KEY_PROMOTION_CLBBTF',                 ' '),
						   ('TXT_KEY_PROMOTION_CLBBTF_HELP',            'Will attempt to capture the enemy vessel if at all possible.'),
						   ('TXT_KEY_PROMOTION_WABCAP',                 'Captured by the Wabanaki'),
						   ('TXT_KEY_PROMOTION_WABCAP_HELP',            '-30% Combat. Will be salvaged for [ICON_PRODUCTION] Production if placed in a Wabanaki city.');