use DB2017_C13;
/*3.24
... display the PetBreed column of PET. Do not show duplicates*/
SELECT DISTINCT(PetBreed) FROM PET;

/*3.26
... display the name and breed of all pets sorted by PetName*/
SELECT PetName, PetBreed FROM PET ORDER BY PetName DESC;

/*3.29
... to count the number of distinct breeds. The following SCHEMA for PET_3 table is another alternate version of the PET table*/
/* Den tabel vi allerede har oprettet og populeret */

/*3.31
... display the minimun, maximun and average weight of pets*/
SELECT	MIN(PetWeight) as MinimumPetWeight,
		MAX(PetWeight) as MaxPetWeight, 
		AVG(PetWeight) as AvgPetWeight 
	FROM PET; 

/* 3.32 
... to group the data by PetBreed and display the average weight per breed */
SELECT	PetBreed,
		AVG(PetWeight) as AvgPetWeight
	FROM PET GROUP BY PetBreed;

/* 3.33 
Answer question 3.32 but consider only breeds for which two or more pets are included */
SELECT	PetBreed,
		AVG(PetWeight) as AvgPetWeight
	FROM PET 
	GROUP BY PetBreed
	HAVING COUNT(*) >1
	

/*3.34
Answers question 3.33 but do not consider any pets having the breed of Unknown */
SELECT	PetBreed,
		AVG(PetWeight) as AvgPetWeight
	FROM PET
	WHERE PetBreed NOT IN ('Unknown')
	GROUP BY PetBreed
	HAVING COUNT(*) >1