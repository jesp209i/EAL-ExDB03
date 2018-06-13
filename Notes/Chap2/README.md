# Noter til Database Concepts
## Kapitel 2
Den relationelle model og database normalisering

side 78 til 105 - summary side 121-122

kommer senere

## Relationer


### Repræsentation af relationelle strukturer (side 81)
Tabellens navn skrevet med kapitaler, kolonnenavnene skrevet i camelcase
```SQL
TABELNAVN(Kolonne01, Kolonne02,...,SidsteKolonne)
```
### Terminologi (side 81)

| Table | Row | Column |
|:---|:---|:---|
| File | Record | Field |
| Relation | Tuple | Attribute |

## Typer af nøgler (side 82)
En nøgle er en eller flere kolonner i en tabel som kan bruges til at identificere rækker. En nøgle kan både være unik og ikke-unik.
- Unikke nøgler kan bruges til at identificere en bestemt række.
- ikke-unikke nøgler kan bruges til at identificere flere rækker.

### Composite key
to eller flere kolonner som sammen kan identificere en række

### Candidate og primary key (side 82pp)
Candidate key er nøgler der uniks kan identificere en række, de kan både være enkelt-kollonne nøgler eller composite. Primary key er den Candidate key som er valgt som nøgle til unikt at kunne identificere hver række i tabellen. De andre Candidate keys som ikke bruges som primary key kan kaldes alternate keys.

Den primære nøgle er ikke kun vigtig fordi den kan identificere unikke rækker i en tabel, men også fordi den kan bruges til at repræsentere rækker i relationer

En ideel primær nøgle er kort, nummerisk og vil aldrig ændres. Nogle gange vil en kollonne i en tabel opfylde disse krav eller blot komme tæt på dem. Men i andre tabeller vil primær nøglen ikke komme tæt på at være ideel.

### Surrogate keys (86)
En surrogat nøgle er en kollonne med en unik, DBMS-tildelt identitet (værdi), som er blevet tilføjet til tabellen til at være primær nøgle. Værdierne som surrogatnøglerne får tildelt af DBMS'et er unikke hver gang en rækker bliver oprettet, og disse værdier vil aldrig blive ændret.

### Foreign keys og referensiel integritet (CONSTRAINTS) (87pp)
En fremmed nøgle er en henvisning fra en tabel, til en primær nøgle i en anden tabel. Herved opstår relationen. Det er ikke nødvendigt at fremmed og primær nøglerne har samme kollonnenavn, det eneste krav er at de deler samme værdi-sæt.

```SQL
EMPLOYEE(_EmployeeNumber_, FirstName, LastName, *Department*, Email, Phone)
DEPARTMENT(_DepartmentName_, BudgetCode, OfficeNumber, DepartmentPhone)

_ = primær nøgle
* = fremmed nøgle
```

I de flere tilfælde, er det vigtigt at sikre at enhver værdi en fremmed nøgle har, matcher en værdi i primær nøglen. I ovenstående eksempel skal værdien af Department i alle rækker af tabellen EMPLOYEE matche værdien DepartmentName i tabellen Department. Sådan en regel kaldes en "referential integrity constraint".

## Problemet med NULL værdier (side 90)
Null-værdier er ambivalente. Det er uklart hvorfor en værdi ikke eksisterer. 

## Funktionelle afhængigheder og normalisering (side 92pp)
eksemplet fra side 92:

```
CookieCost = NumberOfBoxes x $5
NumberOfBoxes --> CookieCost
```
CookieCost er funktionelt afhængig af NumberOfBoxes, eller NumberOfBoxes determinerer CookieCost.

eksemplet fra side 93:
```
CUSTOMER(_CustomerNumber_, CustomerLastName. CustomerFirstName, Phone)
CustomerNumber --> (CustomerLastName. CustomerFirstName, Phone)
```
CustomerNumber determinerer CustomerLastName. CustomerFirstName og Phone.

En primær nøgle kan defineres som: "en eller flere attributter som funktionelt determinerer alle de andre attributter i en tabel".

I tabellen: 
```
EMPLOYEE(EmployeeNumber, FirstName, LastName, Department, Email, Phone)
```
kan man blandt andet se at:
```
EmployeeNumber --> (FirstName, LastName, Department, Email, Phone)
Email --> (EmployeeNumber, FirstName, LastName, Department, Phone)
(FirstName, LastName, Department) --> (EmployeeNumber, Email, Phone)

```
Disse tre funktionelle afhængigheder udtrykker grunden til at alle tre kandidat nøgler netop ER kandidat nøgler. Når vi skal vælge en primær nøgle, vælger vi hvilken funktionel afhængighed det giver mest mening eller er vigtigst for os.
Der er tre mulig candidate keys

### Normalisering (side 94)

### Relationelle designprincipper (side 95)
1. For a relation to be considered well formed, every determinant must be a candidate key.
2. Any relation that is not well formed should be broken into two or more relations that are well formed.

### Normaliseringsprocessen (side 95)
1. Identificer alle kandidat nøgler i tabellen.
2. Identificer alle funktionelle afhængigheder i tabellen
3. Undersøg determinanterne af de funktionelle afhængigheder. Hvis der er determinenter der ikke er kandidat nøgler, så er tabellen ikke "well formed". I Så fald:
  * A. Placer kollonnerne af dem funktionelle afhængighed i sin egen nye tabel.
  * B. Gør determinanten i den funkionelle afhængighed til primær nøglen af den nye tabel.
  * C. Efterlad en kopi af determinanten (brugt som fremmed nøgle) i den oprindelige tabel.
  * D. Opret en referential integrity constraint mellem den oprindelige og nye tabel.
4. Gentag punk 3  indtil alle determinanter i alle tabeller kan fungere som kandidat nøgler.


## Eliminer anomalier fra multivalued dependencies (side 102)
Eksemplet fra side 103. Se på tabellen EMPLOYEE_DEGREE:

| | EmployeeName | EmployeeDegree |
|---|---|---|
| 1 | Chau | BS |
| 2 | Green | BS |
| 3 | Green | MS |
| 4 | Green | PhD |
| 5 | Jones | AA |
| 6 | Jones | BA |

```
EmployeeName -->-->EmployeeDegree
```
Employeename multideterminerer EmployeeDegree, fordi eksempelvis navnet Green giver 3 svar.

Hvis ovenstående optræder i en tabel med flere data vil der opstå anomalier. Men hvis de data som kan skrives på denne måde A-->-->B flyttes over i sin egen tabel bliver alt fint. Resultatet er en tabel med to kollonner hvis primær nøgle er en composite af de to kollonner. Når multivalued dependencies er blevet isoleret på denne måde siges tabellen at være i 4NF.

Det sværeste ved multivalued dependencies er at finde dem. Når først du ved at de eksisterer i en tabel, skal de blot flyttes over i sin egen tabel. Når man støder på tabeller med sære anomalier, især anomalier der kræver at du indsætter, retter eller slettet et vilkårligt antal rækker for at opretholde den referensielle integritet, skal du undersøge om der er multivalued dependencies.

# 1NF
fra side 79:
1. Rows contain data about an entity
2. Columns contain data about attributes of the entity
3. cells of the table hold a single value
4. All entries in a column are of the same kind
5. each column has a unique name
5. the order of the columns are unimportant
7. the order of the rows are unimportant
8. no two sets of rows may hold identical sets of data values

man har opnået første normalform hvis man kan svare ja til at ens tabel overholder ovenstående.

# 2NF
1. er 1NF opfyldt?
2. alle "non-key" attributter kun kan determineres af hele primær nøglen?

Hvis du svarer ja til begge spørgsmål er 2NF opfyldt.

Bemærk:
Hvis ens tabel IKKE har en Composite primær nøgle så er 2NF opfyldt ved 1NF. 
Problemer opstår altså først hvis Primærnøglen er composite.

# 3NF
1. er 2NF opfyldt?
2. er der nogen "non-key" attributter som determineres af andre "non-key" attributter?
Hvis du kan svare ja til første spørgsmål og nej til andet er din tabel i 3NF.

# BCNF eller 3.5NF
1. er 3NF opfyldt?
2. er alle determinanter også candidate keys?
Hvis du kan svare ja til begge spørgsmål har du opnået BCNF

# 4NF
se afsnittet: "Eliminer anomalier fra multivalued dependencies" længere oppe
