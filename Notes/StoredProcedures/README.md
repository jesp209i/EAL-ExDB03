# Stored Procedures
- [Stored Procedure Basics](#stored-procedures-basics)
- [Stored Procedures Parameters](#stored-procedures-parameters)
- [Stored Procedure Tutorial](#stored-procedure-tutorial)

## Stored Procedure Basics
- kilde: https://www.youtube.com/watch?v=fjNsRV4zLdc
### Opret en Stored Procedure
Bemærk at man både kan skrive `PROC` og `PROCEDURE`.
```SQL 
CREATE PROC spFilmList
AS
BEGIN
    SELECT
      FilmName
      ,FilmReleaseDate
      ,FilmRunTimeMinues
    FROM
      tblFilm
    ORDER BY
      FilmName ASC
END;
```
Ovenstående skaber en Stored Procedure der hedder `spFilmList`.

### Udføre en forespørgsel med en Stored Procedure
For at bruge den skal man i en ny forespørgsel skrive:
```SQL
EXEC spFilmList
```
Bemærk at man både kan skrive `EXEC` og `EXECUTE`.

### Rette/ændre en Stored Procedure
Ovenstående sp rettes så `ORDER BY` ændres fra `ASCC` til `DESC`.

```SQL 
ALTER PROC spFilmList
AS
BEGIN
    SELECT
      FilmName
      ,FilmReleaseDate
      ,FilmRunTimeMinues
    FROM
      tblFilm
    ORDER BY
      FilmName DESC
END;
```
Øverst bør man også have hvilken database man vil tilknytte sine Stored Procedures på:
```SQL
Use AdventureWorks
Go
```
Hvis du ikke længere har SQL'en fra tidligere kan du i `SSMS` i Object Explorer højreklikke på din Stored Procedure og vælge "Modify".
Det ligger under: Database, tabel, programmability, System stored procedures.

### Fjerne en Stored Procedure
I `SSMS` kan du slette ved hjælp af interface'et. Højreklik på din procedure, og vælg delete.
Ved hjælp af en forespørgsel skal du gøre følgende:
```SQL
DROP PROC spFilmList;
```

## Stored Procedures Parameters
- kilde: https://www.youtube.com/watch?v=Vs-atxMs4mw
### Oprette parametre
```SQL
CREATE PROC spFilmCriteria (@MinLength AS INT)
AS
BEGIN
    SELECT
      FilmName
      ,FilmRunTimeMinutes
    FROM
      tblFilm
    WHERE
      FilmRunTimeMinutes > @MinLength
    ORDER BY
      FilmRunTimeMinutes ASC
END
```
- Parentesen efter `spFilmCriteria` indeholder parametre (i dette tilfælde, kun et).
- `WHERE`-klausulen benytter parametret, nemlig `@MinLength`.

#### Ændre til at der kan være flere parametre
```SQL
ALTER PROC spFilmCriteria
    (
        @MinLength AS INT
        ,@MaxLength AS INT
    )
AS
BEGIN
    SELECT
      FilmName
      ,FilmRunTimeMinutes
    FROM
      tblFilm
    WHERE
      FilmRunTimeMinutes >= @MinLength AND
      FilmRunTimeMinutes <= @MaxLength
    ORDER BY
      FilmRunTimeMinutes ASC
END
```
#### Opret en tekstparameter
```SQL
ALTER PROC spFilmCriteria
    (
        @MinLength AS INT
        ,@MaxLength AS INT
        ,@Title AS VARCHAR(MAX)
    )
AS
BEGIN
    SELECT
      FilmName
      ,FilmRunTimeMinutes
    FROM
      tblFilm
    WHERE
      FilmRunTimeMinutes >= @MinLength AND
      FilmRunTimeMinutes <= @MaxLength AND
      FilmName LIKE '%' + @Title + '%'
    ORDER BY
      FilmRunTimeMinutes ASC
END
```
- vær opmærksom på hvordan `... WHERE ... FilmName LIKE '%' + @Title + '%' ...` er bygget op.


### Udføre procedurer med parametre
```SQL
/* Virker kun med den første stored procedures ovenfor. */
EXEC spFilmCriteria 180
```
- I dette tilfælde bliver værdien 180 sendt videre til forespørgselen vi har gemt som `spFilmCriteria`. 
- Værdien bliver sat ind på `@MinLength`'s plads.

```SQL
/* Virker kun med den anden stored procedures ovenfor. */
EXEC spFilmCriteria 150,180
```
- parametrene står på listeform, adskildt af et komma mellem hver.
- Hvis man kender parameternavne, kan man også angive dem, se nedenfor `@ParameterNavn`.
  - Det gør naturligvis udtrykkene længere, men det hjælper på forståelsen når man kommer tilbage til udtrykkene i kode eller lignende.
  - Desuden kan udtrykkene så skrives i tilfældig rækkefølge, når man har parameternavnene med.
```SQL
EXEC spFilmCriteria @MinLength=150, @MaxLength=180
```
- Eksemplet der indeholder tekst
```SQL
EXEC spFilmCriteria @MinLength=120, @MaxLength=180, @Title='star'
```
### Valgfrie parametre og default-værdier
```SQL
ALTER PROC spFilmCriteria
    (
        @MinLength AS INT = 0
        ,@MaxLength AS INT = NULL
        ,@Title AS VARCHAR(MAX)
    )
AS
BEGIN
    SELECT
      FilmName
      ,FilmRunTimeMinutes
    FROM
      tblFilm
    WHERE
      FilmRunTimeMinutes >= @MinLength AND
      (@MaxLength IS NULL OR FilmRunTimeMinutes <= @MaxLength) AND
      FilmName LIKE '%' + @Title + '%'
    ORDER BY
      FilmRunTimeMinutes ASC
END
```
- `@MinLength AS INT = 0` tildeler `@MinLength` værdien 0 som default værdi, hvis du ikke angiver en værdi når du bruger denne stored procedure.
- `@MaxLength AS INT = NULL` tildeler `@MaxLength` værdien NULL som default værdi, hvis du ikke angiver en værdi når du bruger denne stored procedure.
  - Bemærk at NULL kræver at du laver mere arbejde nede i `WHERE`-klausulen: ` ... WHERE ... AND (@MaxLength IS NULL OR FilmRunTimeMinues <= @MaxLength) AND ...`
  - ( ... OR ... ) gør at de to udtryk inde i parentesen bliver evalueret "samlet"

# Stored Procedure Tutorial
  - kilde: https://www.mssqltips.com/sqlservertutorial/160/sql-server-stored-procedure-tutorial/
## Output
```SQL
CREATE PROC spGetAdressCount 
  (
    @City AS NVARCHAR(30)
    ,@AddressCount INT OUTPUT
  )
AS
BEGIN
  SELECT 
    @AddressCount = COUNT(*)
  FROM 
    tblPersonAddress
  WHERE
    City = @City
END
```
For at kalde denne stored procedure, skal man først lave en variabel, kalde SP'en og select den returnerede værdi
```SQL
DECLARE @AddressCount INT
EXEC spGetAdressCount @City = 'Calgary', @AddressCount = @AddressCount OUTPUT
SELECT @AddressCount
```

### Try/Catch
- https://www.mssqltips.com/sqlservertutorial/164/using-try-catch-in-sql-server-stored-procedures/
```SQL
CREATE PROCEDURE dbo.uspTryCatchTest
AS
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
```

### Kommentarer i SQL
- flere linjer:
```SQL
/*  
  Dette
    er en 
        kommentar der
          fylder flere linjer tekst

*/
```
- en linje:
```SQL
-- Denne kommentar fylder kun en linje tekst
```
- de kan desuden kombineres uden besvær.
