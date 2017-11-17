/*** PET_OWNER(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) ***/
CREATE TABLE PET_OWNER (
	OwnerID Int NOT NULL, 
	OwnerLastName NVARChar(100) NOT NULL,
	OwnerFirstName NVARChar(100) NOT NULL,
	OwnerPhone NVARChar(12) NULL,
	OwnerEmail NVarChar(100) NOT NULL
	CONSTRAINT PET_OWNER_PK PRIMARY KEY (OwnerID)
);
/* 
OwnerID er en int så surrogatnøglen har en relativ simpel type
OwnerLastName, NVarChar
OwnerFirstName, NVarChar
OwnerPhone, NVarChar længde 12
OwnerEmail NVarChar

CONSTRAINT... opretter OwnerID som Primær nøgle

*/


/*** PET(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) ***/
CREATE TABLE PET (
	PetID Int NOT NULL, 
	PetName NVARChar(100) NOT NULL,
	PetType NVARChar(100) NOT NULL,
	PetBreed NVARChar(100) NOT NULL DEFAULT 'Unknown',
	PetDOB DateTIME2 NULL,
	PetWeight Float NOT NULL,
	OwnerID INT NOT NULL,
	CONSTRAINT PET_PK PRIMARY KEY (PetID),
	CONSTRAINT PET_OWNER_FK FOREIGN KEY (OwnerID)
		REFERENCES PET_OWNER (OwnerID)
			ON UPDATE NO ACTION
			ON DELETE NO ACTION
);
/*
Database vs Visual Studio
=========================
Datetime2 = date
Int = int
Float = double 
Nvarchar = string

*/