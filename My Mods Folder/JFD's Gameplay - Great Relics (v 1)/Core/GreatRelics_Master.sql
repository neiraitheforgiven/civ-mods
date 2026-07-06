--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CUSTOM_MISSIONS', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GREAT_PEOPLE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_DATA', 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Unit_UniqueNames	ADD RequiresReligionEnhanced	boolean  										default 0;
ALTER TABLE Unit_UniqueNames	ADD RequiresReligionFounded		boolean  										default 0;
ALTER TABLE Unit_UniqueNames	ADD RequiresReligionFounding	boolean  										default 0;
--==========================================================================================================================
--==========================================================================================================================