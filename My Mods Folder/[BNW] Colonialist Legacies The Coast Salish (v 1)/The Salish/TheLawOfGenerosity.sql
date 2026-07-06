--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 				Description, 				ShortDescription)
VALUES		('TRAIT_CLCOASTSALISH', 	'TXT_KEY_TRAIT_CLCOASTSALISH', 	'TXT_KEY_TRAIT_CLCOASTSALISH_SHORT');	
--==========================================================================================================================	
-- Language_en_US
--==========================================================================================================================		
INSERT INTO Language_en_US
			(Tag,						Text)
VALUES		('TXT_KEY_TRAIT_CLCOASTSALISH',	'Spending [ICON_GOLD] Gold generates [ICON_GOLDEN_AGE]' ||
                                        ' Golden Age Points. At the beginning of a Golden Age,' ||
									    ' City-States you are trading with gift you [ICON_INFLUENCE] Influence.'),
			('TXT_KEY_TRAIT_CLCOASTSALISH_SHORT', 'The Law of Generosity');