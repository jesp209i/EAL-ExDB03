# Kapitel 3 Om DDL
Indhold:
- [Mest almindelige datatyper i DBMS'er](#mest-almindelige-datatyper-i-DBMSer)
- [Oprette tabeller](#oprette-tabeller)
- [Oprette tabeller med Table Constraints](#oprette-tabeller-med-table-constraints)
- [Table Constraints og Foreign Key(s)](#table-constraints-og-foreign-keys)
- [Tabelmodifikation](#tabelmodifikation)

## Mest almindelige datatyper i DBMS'er
- Side 145 -> 146 SQl Server 2014
- Side 147 -> 148 Oracle Database Express Edition 11g Release 2
- Side 148 -> 149 Mysql 5.6

### Oprette tabeller
Side 142 - 143

SQL eksempelkode:
```SQL
CREATE TABLE NEWTABLENAME (
  ColumnName DatType OptionalConstraint,
  ColumnName DatType OptionalConstraint,
  ColumnName DatType OptionalConstraint,
  optional table constraints
  ...
);
```
Under *OptionalConstraint* kan man bruge følgende keywords:
- PRIMARY KEY
- FOREIGN KEY
- NULL
	- værdierne i denne kolonne må gerne være NULL
- NOT NULL
	- værdierne i denne kolonne må IKKE være NULL
- UNIQUE
	- værdierne i denne kolonne skal være unikke
- IDENTITY(M,N)
	- Se under [næste afsnit](#oprette-tabeller-med-table-constraints)

Desuden kan keyword *DEFAULT* også bruges, men det anses ikke som et constraint

Se brug herunder:
```SQL
CREATE TABLE EMPLOYEE(
  EmployeeNumber    Int           PRIMARY KEY,
  FirstName         Char(25)      NOT NULL,
  LastName          Char(25)      NOT NULL,
  Department        Char(35)      NOT NULL DEFAULT 'Human resources',
  Phone             Char(12)      NULL,
  Email             VarChar(100)  NOT NULL UNIQUE,
);
/* Side 144 */
```
Bemærk at det kun er muligt at definere en kolonne til at være primær nøgle.

### Oprette tabeller med Table Constraints
fra side 150

Bemærk følgende notation:
```SQL
CREATE TABLE NEWTABLENAME(
...
CONSTRAINT TABLENAME_PK PRIMARY KEY(PrimaryKeyColumns)
);
```
- Den største forskel er at man nu kan bruge flere kolonner til at definere en primær nøgle.
- Du kan også styre navngivningen af din constraint

```SQL
CREATE TABLE NEWTABLE(
  TableID         INT         NOT NULL IDENTITY (1, 1),
  ...flere kolonner defineres...
  CONSTRAINT NEWTABLE_PK PRIMARY KEY(TableID)
);
```
Bemærk nyt keyword **IDENTITY (M,N)**. Ifølge bogen side 151 er det på denne måde at MS SQL Server definerer surrogat nøgler. Keyword viser at nøglen starter ved **M** og stiger **N** hver gang der tilføjes en række.

### Table Constraints og Foreign Key(s)
```SQL
CREATE TABLE NEWTABLE(
  TableID         INT         NOT NULL IDENTITY (1, 1),
  OtherTableID    INT         NOT NULL,
  ...flere kolonner defineres...
  CONSTRAINT NEWTABLE_PK PRIMARY KEY(TableID),
  CONSTRAINT NEWTABLE_OTHERTABLE_FK FOREIGN KEY (OtherTableID)
    REFERENCES OTHERTABLE(OtherTableID)
      ON UPDATE CASCADE
      ON DELETE NO ACTION,
);
/* Side 151 */
```
De fire nedereste linjer er de vigtigste. Her bliver relationen til tabellen **OTHERTABLE** oprettet med henvisning til kolonnen *OtherTableID*.

Vær desuden opmærksom på følgende struktur:
`ON UPDATE` eller `ON DELETE` fortæller noget om hvad der skal ske hvis der udføres en update eller delete på den `CONSTRAINT` på tabellen.
- CASCADE
  - Betyder at det samme ændring skal udføres på den relatede tabel.
- NO ACTION
	- Der udføres ingen ændringer i den/de relaterede tabeller. Denne er default, og kan undlades.

Læs eventuelt op på de beskrevne 'business rules' side 140
  
## Tabelmodifikation

- DROP TABLE side 195
  - Fjerner data og tabel helt
  - ```SQL
  DROP TABLE ASSIGNMENT;
  /* Side 195 */```
- ALTER TABLE side 196
  - Kan ændre på strukturen på en kolonne i en tabel
  	- Tilføj, ændr eller fjern kolonner eller ```CONSTRAINT```'s
  - ```SQL
  ALTER TABLE ASSIGNMENT DROP CONSTRAINT ASSIGN_EMP_FK;
  /* Side 196 */```
- TRUNCATE TABLE side 196
  - Fjerner data, men bibeholder tabelstruktur
  - ```SQL
  TRUNCATE TABLE PROJECT;
  /* Side 196 */```
- CHECK constraint side 196-197
	- Laver nogle regler ved hjælp af ```CONSTRAINT```, som DBMS'et kan håndhæve for dig.
	- Der kan bruges ```IN```, ```NOT IN``` og ```LIKE```
	- ```SQL
  ALTER TABLE PROJECT
  	ADD CONSTRAINT PROJECT_Check_Dates
    	CHECK (StartDate < EndDate);
  /* Side 197 */```





