-- Oprettet uden standard værdier
CREATE PROCEDURE spInsertPet
(
@PetName AS NVARCHAR(50),
@PetType as NVARCHAR(50),
@PetBreed as NVARCHAR(50),
@PetDOB as NVARCHAR(50),
@PetWeight as float,
@OwnerID as INT
)
AS

BEGIN

	INSERT INTO 
		PET (PetName, PetType, PetBreed, PetDOB,PetWeight,OwnerID)
	VALUES
	(@PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID)
END


-- Rettet til at indeholde standard værdier
ALTER PROCEDURE spInsertPet
(
@PetName AS NVARCHAR(50),
@PetType as NVARCHAR(50) = 'Unknown',
@PetBreed as NVARCHAR(50) = 'UnKnown',
@PetDOB as NVARCHAR(50) = NULL,
@PetWeight as float = NULL,
@OwnerID as INT
)
AS

BEGIN

	INSERT INTO 
		PET (PetName, PetType, PetBreed, PetDOB,PetWeight,OwnerID)
	VALUES
	(@PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID)
END

-- Oprettet uden standard værdier
CREATE PROCEDURE spInsertOwner
(
@OwnerFirstName AS NVARCHAR(50), 
@OwnerLastName AS NVARCHAR(50), 
@OwnerPhone AS NVARCHAR(50), 
@OwnerEmail AS NVARCHAR(80)
)
AS

BEGIN

	INSERT INTO 
		PET_OWNER(OwnerFirstName, OwnerLastName, OwnerPhone, OwnerEmail)
	VALUES
	(@OwnerFirstName, @OwnerLastName, @OwnerPhone, @OwnerEmail)
END


CREATE PROCEDURE spInsertBreed
(
@BreedName AS NVARCHAR(50), 
@MixWeight AS FLOAT = NULL, 
@MaxWeight AS FLOAT = NULL, 
@AverageLifeExpectancy AS FLOAT = NULL
)
AS

BEGIN

	INSERT INTO 
		BREED(BreedName, MinWeight, MaxWeight, AverageLifeExpectancy)
	VALUES
	(@BreedName, @MixWeight, @MaxWeight, @AverageLifeExpectancy)
END

-- opgave 2
-- SP alle rækker i PET_OWNER
CREATE PROCEDURE spGetOwners
AS
BEGIN
	SELECT * FROM PET_OWNER
END

-- SP alle rækker i PET
CREATE PROCEDURE spGetPets
AS
BEGIN
	SELECT * FROM PET
END

-- SP alle rækker i BREED
CREATE PROCEDURE spGetBreed
AS
BEGIN
	SELECT * FROM BREED
END

-- Opgave 3
-- SP alle rækker i PET_OWNERS med et bestemt efternavn
CREATE PROCEDURE spGetOwnersByLastName
(
	@OwnerLastName AS NVARCHAR(50)
)
AS
BEGIN
	SELECT * FROM PET_OWNER WHERE @OwnerLastName = @OwnerLastName
END

-- SP alle rækker i PET_OWNERS med et bestemt fornavn og email
CREATE PROCEDURE spGetOwnersByEmail
(
	@OwnerFirstNane AS NVARCHAR(50),
	@OwnerEmail AS NVARCHAR(80)
)
AS
BEGIN
	SELECT * FROM PET_OWNER 
	WHERE 
		OwnerFirstName = @OwnerFirstNane AND
		OwnerEmail = @OwnerEmail
END

-- SP alle pets i PET, PET_OWNER og BREED hvor der er et bestemt OwnerId i PET-tabellen
CREATE PROCEDURE spGetPetsAndInfoByOwnerID
(
	@OwnerID AS INT
)
AS
BEGIN
	SELECT 
			(OwnerFirstName + ' ' + OwnerLastName) AS OwnerName,
			PetName,
			PetType, 
			PetBreed,
			AverageLifeExpectancy
	FROM
		PET_OWNER, PET, BREED
	WHERE 
		PET.OwnerID = @OwnerID AND
		PET_OWNER.OwnerID = PET.OwnerID AND
		PET.PetBreed = BREED.BreedName	
END