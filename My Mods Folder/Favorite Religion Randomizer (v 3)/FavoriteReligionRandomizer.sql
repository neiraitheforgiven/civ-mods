CREATE TABLE ReligionList ( ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO ReligionList(Type) SELECT Type FROM Religions WHERE ID > 0 ORDER By Random() LIMIT 500;

--Make sure we have a very huge list
INSERT INTO ReligionList(Type) SELECT Type FROM ReligionList ORDER BY ID;
INSERT INTO ReligionList(Type) SELECT Type FROM ReligionList ORDER BY ID;
INSERT INTO ReligionList(Type) SELECT Type FROM ReligionList ORDER BY ID;
INSERT INTO ReligionList(Type) SELECT Type FROM ReligionList ORDER BY ID;

CREATE TABLE Temp_Civilization_Religions ( 
          ID INTEGER PRIMARY KEY AUTOINCREMENT, 
          CivilizationType TEXT, 
          ReligionType TEXT,
          FOREIGN KEY (CivilizationType) REFERENCES Civilizations (Type),
          FOREIGN KEY (ReligionType) REFERENCES Religions (Type) );

INSERT INTO Temp_Civilization_Religions(CivilizationType) SELECT Type FROM Civilizations WHERE Type <> 'CIVILIZATION_BARBARIAN' AND Type <> 'CIVILIZATION_MINOR' ORDER BY ID;

UPDATE Temp_Civilization_Religions 
	SET ReligionType = (SELECT Type FROM ReligionList WHERE Temp_Civilization_Religions.ID = ReligionList.ID) 
	WHERE ID = (SELECT ID FROM ReligionList WHERE Temp_Civilization_Religions.ID = ReligionList.ID); 

DROP TABLE Civilization_Religions;

ALTER TABLE Temp_Civilization_Religions
  RENAME TO Civilization_Religions;