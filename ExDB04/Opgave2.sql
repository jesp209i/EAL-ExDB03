use DB2017_C13
/* DB_Chap03PartD side 230

3.15 
Write an SQL statement to display the PetBreed column of PET */
SELECT PetBreed FROM PET;

/*3.16
Write an SQL statement to count number of pets*/
SELECT COUNT(*) FROM PET;

/*3.17
Write an SQL statement to display the last name, first name and email 
of any owner who has a null value for OwnerPhone*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER WHERE OwnerPhone IS NULL;

/*3.18
Display the breed, type and DOB of all pets having the type dog*/
SELECT PetBreed, PetType, PetDOB FROM PET WHERE PetType = 'dog';

/*3.19
...display all columns of all rows of Pet. Do not use the asterisk(*) notation */
SELECT PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID FROM PET;

/*3.20
...display the last name, first name, and email of all owners who have an email address ending with somewhere.com. 
Assume that email account names can be any number of characters*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER WHERE OwnerEmail LIKE '%somewhere.com%';

/*3.21
...display the breed, type, and DOB for all pets having the type dog and the breed std. Poodle'*/
SELECT PetBreed, PetType, PetDOB FROM PET WHERE PetType = 'dog' AND PetBreed = 'std. Poodle';

/*3.22
...display the name, breed, type for all pets that are not of type Cat, Dog, Fish*/
SELECT PetName, PetBreed, PetType FROM PET WHERE PetType NOT IN ('Cat', 'Dog', 'Fish');