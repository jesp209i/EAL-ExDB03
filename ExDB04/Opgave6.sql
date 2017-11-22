/*3.35
Display the last name, first name, and email of any owners of cats. Use subquery.*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER WHERE OwnerID IN 
	(SELECT OwnerID FROM PET WHERE PetType = 'Cat');
	

/*3.36
Display the last name, first name, and email of any owners if cats with the name Teddy. Use subquery.*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER WHERE OwnerID IN
	(SELECT OwnerID FROM PET WHERE PetType = 'Cat' AND PetName = 'Teddy');

/*3.37
Write an SQL statement to (1) create the BREED table, (2) insert the data in figure 3-21 into the BREED table, 
(3) alter the PET_3 table so that PetBreed is a foreign key referencing BreedName in BREED, and 
(4) With the BREED table added to the pet database, write an SQL statement to display the last name, first name,
and email of any owner of a pet that has an AverageLifeExpectancy value greater than 15. Use subquery.*/
CREATE TABLE BREED(
BreedName nvarchar(100) primary key NOT NULL,
MinWeight float NULL,
MaxWeight float NULL,
AverageLifeExpectancy int NULL
);
INSERT INTO BREED( BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) VALUES
('Border Collie', 15.0, 22.5, 20), ('Cashmere', 10.0, 15.0, 12),
('Collie Mix', 17.5, 25.0, 18), ('Std. Poodle', 22.5, 30.0, 18),
('Unknown', NULL, NULL, NULL);


ALTER TABLE PET ADD CONSTRAINT PET_BREED_FK foreign key (PetBreed)
	references BREED (BreedName);

/* part 4 */
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER WHERE OwnerID IN
	(SELECT OwnerID FROM PET WHERE PetBreed IN 
	(SELECT BreedName FROM BREED WHERE AverageLifeExpectancy >15));
/*  3.38
Answer question 3.35, but ue a joins using JOIN ON syntax*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerID
	WHERE PetType = 'Cat';

/*3.39
Answer question 3.36, but use a joins using JOIN ON syntax*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail 
FROM PET_OWNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerID
WHERE PetName = 'Teddy' AND PetType = 'Cat';

/*3.40
Answer part (4) ofquestion 3.37, but use joins using JOIN ON syntax*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail FROM PET_OWNER 
JOIN PET ON PET_OWNER.OwnerID = PET.OwnerID
JOIN BREED on PET.PetBreed = BREED.BreedName
WHERE BREED.AverageLifeExpectancy > 15;
/*3.41
Display the OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, and AverageLifeExpectancy for pets with
a known PetBreed*/
SELECT OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, AverageLifeExpectancy 
FROM PET_OWNER AS PO, PET AS P, BREED AS B WHERE PO.OwnerID = P.OwnerID AND P.PetBreed = B.BreedName
AND PetBreed != 'Unknown';
