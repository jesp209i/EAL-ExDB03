use DB2017_C13;
/* Data til tabel PET_OWNER */
INSERT INTO PET_OWNER VALUES(1, 'Downs', 'Marscha', '555 537 8765', 'marscha.downs@somewhere.com');
INSERT INTO PET_OWNER VALUES(2, 'James', 'Richard', '555 537 7654', 'richard.james@somewhere.com');
INSERT INTO PET_OWNER VALUES(3, 'Frier', 'Liz', '555 537 6543', 'liz.frier@somewhere.com');
INSERT INTO PET_OWNER(OwnerID, OwnerLastName, OwnerFirstName, OwnerEmail) 
	VALUES(4, 'Trent', 'Miles', 'miles.trent@somewhere.com');

/* Data til tabel PET */
INSERT INTO PET VALUES(1,'King','Dog','Std. Poodle','21.02.2011',25.5,1);
INSERT INTO PET VALUES(2, 'Teddy', 'Cat', 'Cashmere', '01.02.2012', 10.5, 2);
INSERT INTO PET VALUES(3, 'Fido', 'Dog', 'Std. Poodle', '17.07.2010', 28.5, 1);
INSERT INTO PET VALUES(4, 'AJ', 'Dog', 'Collie Mix', '05.05.2011', 20.0, 3);
INSERT INTO PET VALUES(5, 'Cedro', 'Cat', 'Unknown', '06.06.2009', 9.5, 2);
INSERT INTO PET(PetID, PetName, PetType, PetBreed, PetWeight, OwnerID) 
	VALUES (6,'Wooley','Cat','Unknown', 9.5,2);
INSERT INTO PET VALUES(7, 'Buster', 'Dog', 'Border Collie', '11.12.2008', 25.0, 4);
	
