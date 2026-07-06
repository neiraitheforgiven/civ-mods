--==========================================================================================================================
-- BELIEFS
--==========================================================================================================================
-- Beliefs
--------------------------------------------------------------------------------------------------------------------------
UPDATE Beliefs
SET Type = 'BELIEF_JFD_ICONOGRAPHY', Description = 'TXT_KEY_BELIEF_JFD_ICONOGRAPHY', ShortDescription = 'TXT_KEY_BELIEF_JFD_ICONOGRAPHY_SHORT'
WHERE Type = 'BELIEF_MONASTERIES'
AND EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);

UPDATE Beliefs
SET Follower = 0
WHERE Type = 'BELIEF_MONASTERIES'
AND NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_GreatWorkYieldChanges
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Belief_GreatWorkYieldChanges(BeliefType, YieldType, Yield);
INSERT INTO Belief_GreatWorkYieldChanges 
		(BeliefType, 				YieldType, 		Yield)
SELECT	'BELIEF_JFD_ICONOGRAPHY', 	'YIELD_FAITH',	1
AND EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Belief_BuildingClassFaithPurchase
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Belief_BuildingClassFaithPurchase WHERE BeliefType = 'BELIEF_MONASTERIES'
AND EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================