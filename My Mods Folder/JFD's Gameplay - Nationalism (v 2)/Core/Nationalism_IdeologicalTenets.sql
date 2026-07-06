--==========================================================================================================================
-- IDEOLOGICAL TENETS
--==========================================================================================================================	
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies
		(Type,								Description,								Help,											Civilopedia,									PolicyBranchType,			CultureCost,	Level,	PortraitIndex,	IconAtlas,				IconAtlasAchieved)
VALUES	('POLICY_JFD_CIVIC_NATIONALISM',	'TXT_KEY_POLICY_JFD_CIVIC_NATIONALISM',		'TXT_KEY_POLICY_JFD_CIVIC_NATIONALISM_HELP',	'TXT_KEY_POLICY_JFD_CIVIC_NATIONALISM_TEXT',	'POLICY_BRANCH_FREEDOM',	10,				2,		25,				'POLICY_ATLAS',			'POLICY_A_ATLAS_EXP2'),
		('POLICY_JFD_ECONOMIC_NATIONALISM',	'TXT_KEY_POLICY_JFD_ECONOMIC_NATIONALISM',	'TXT_KEY_POLICY_JFD_ECONOMIC_NATIONALISM_HELP',	'TXT_KEY_POLICY_JFD_ECONOMIC_NATIONALISM_TEXT',	'POLICY_BRANCH_ORDER',		10,				2,		11,				'POLICY_ATLAS_EXP2',	'POLICY_A_ATLAS_EXP2'),
		('POLICY_JFD_ETHNIC_NATIONALISM',	'TXT_KEY_POLICY_JFD_ETHNIC_NATIONALISM',	'TXT_KEY_POLICY_JFD_ETHNIC_NATIONALISM_HELP',	'TXT_KEY_POLICY_JFD_ETHNIC_NATIONALISM_TEXT',	'POLICY_BRANCH_AUTOCRACY',	10,				2,		10,				'POLICY_ATLAS_EXP2',	'POLICY_A_ATLAS_EXP2');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_NationalismMods
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_JFD_NationalismMods
		(PolicyType,						FreeCultureToNationalismModifier,	MaxNationalismPercent,	NationalismCostModifier)
VALUES	('POLICY_JFD_CIVIC_NATIONALISM',    10,									0,						0),
		('POLICY_JFD_ECONOMIC_NATIONALISM', 0,									0,						-20),
		('POLICY_JFD_ETHNIC_NATIONALISM',   0,									100,					0);
--==========================================================================================================================
--==========================================================================================================================