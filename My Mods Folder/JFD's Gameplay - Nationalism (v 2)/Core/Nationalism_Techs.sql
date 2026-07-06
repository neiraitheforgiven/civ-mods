--==========================================================================================================================
-- TECHS
--==========================================================================================================================	
-- Technologies
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_PHILOSOPHY');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_THEOLOGY');
	
UPDATE Technologies
SET MaxNationalismPercent = 30
WHERE Type IN ('TECH_PRINTING_PRESS');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_ECONOMICS');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_INDUSTRIALIZATION');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_RADAR');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_RADIO');
	
UPDATE Technologies
SET MaxNationalismPercent = 10
WHERE Type IN ('TECH_GLOBALIZATION');
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,					EffectToolTip,								 IconAtlas,							 PortraitIndex)
VALUES	('TECH_PHILOSOPHY',			'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_THEOLOGY',			'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_PRINTING_PRESS',		'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_30',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_ECONOMICS',			'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_INDUSTRIALIZATION',	'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_RADIO',				'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_RADAR',				'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0),
		('TECH_GLOBALIZATION',		'TXT_KEY_JFD_TECH_NATIONALISM_INCREASE_10',	 'JFD_NATIONALISM_TECH_MISC_ATLAS',  0);
--==========================================================================================================================
--==========================================================================================================================