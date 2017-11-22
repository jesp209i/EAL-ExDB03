use DB2017_C21;
/* Øvelse 8 
Skriv et SQL udtryk som tilføjer en CHECK constraint til din PET tabel så 
værdierne i PetWeight kolonnen skal være mindre end 250*/

ALTER TABLE PET ADD CONSTRAINT PET_Check_PetWeight
	CHECK(PetWeight < 250); 
