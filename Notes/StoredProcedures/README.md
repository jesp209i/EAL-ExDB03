# Stored Procedures
- kilde: https://www.mssqltips.com/sqlservertutorial/160/sql-server-stored-procedure-tutorial/

# Videoer
- [Stored Procedure Basics](#stored-procedures-basics)
  - kilde: https://www.youtube.com/watch?v=fjNsRV4zLdc
- [Stored Procedures Parameters](#stored-procedures-parameters)
  - kilde: https://www.youtube.com/watch?v=Vs-atxMs4mw

## Stored Procedure Basics
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
