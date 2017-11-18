# Kapitel 3 Om DDL
#### Mest almindelige datatyper i DBMS'er
- Side 145 -> 146 SQl Server 2014
- Side 147 -> 148 Oracle Database Express Edition 11g Release 2
- Side 148 -> 149 Mysql 5.6

#### Oprette tabeller
Side 143

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
Under OptionalConstraint kan man bruge følgende keywords:
- PRIMARY KEY
- FOREIGN KEY
- NULL
- NOT NULL
- UNIQUE

Desuden kan keyword *DEFAULT* også bruges, men det anses ikke som et constraint

Se brug herunder, eksemlet er fra side 144:
```SQL
CREATE TABLE EMPLOYEE(
  EmployeeNumber    Int           PRIMARY KEY,
  FirstName         Char(25)      NOT NULL,
  LastName          Char(25)      NOT NULL,
  Department        Char(35)      NOT NULL DEFAULT 'Human resources',
  Phone             Char(12)      NULL,
  Email             VarChar(100)  NOT NULL UNIQUE,
);
```
Bemærk at det kun er muligt at definere en tabel til at være primær nøgle.
#### Oprette tabeller med Table Constraints
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
