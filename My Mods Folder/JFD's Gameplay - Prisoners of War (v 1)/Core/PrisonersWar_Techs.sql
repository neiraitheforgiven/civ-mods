--==========================================================================================================================
-- TECHS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
UPDATE Technologies
SET PrisonerWarChance = 10
WHERE Type IN (SELECT PrereqTech FROM Units WHERE Type IN ('UNIT_SPEARMAN', 'UNIT_SWORDSMAN', 'UNIT_LONGSWORDSMAN', 'UNIT_MUSKETMAN', 'UNIT_EE_LINE_INFANTRY', 'UNIT_RIFLEMAN', 'UNIT_GREAT_WAR_INFANTRY', 'UNIT_INFANTRY', 'UNIT_MECHANIZED_INFANTRY'));
--------------------------------------------------------------------------------------------------------------------------
-- Technologies_JFD_MiscEffects
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Technologies_JFD_MiscEffects
		(TechType,	EffectToolTip,							IconAtlas,				PortraitIndex)
SELECT	Type,		'TXT_KEY_JFD_10_PRISONER_WAR_CHANCE',	'GENERIC_FUNC_ATLAS',	0
FROM Technologies WHERE PrisonerWarChance = 10;
--==========================================================================================================================
--==========================================================================================================================