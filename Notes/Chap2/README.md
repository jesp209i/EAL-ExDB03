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

## Typer af nøgler (side 82pp)
En nøgle er en eller flere kolonner i en tabel som kan bruges til at identificere rækker. En nøgle kan både være unik og ikke-unik.
- Unikke nøgler kan bruges til at identificere en bestemt række.
- ikke-unikke nøgler kan bruges til at identificere flere rækker.

### Composite key
to eller flere kolonner som sammen kan identificere en række

### Candidate og primary key
Candidate key er nøgler der uniks kan identificere en række, de kan både være enkelt-kollonne nøgler eller composite. Primary key er den Candidate key som er valgt som nøgle til unikt at kunne identificere hver række i tabellen. De andre Candidate keys som ikke bruges som primary key kan kaldes alternate keys.
Den primære nøgle er ikke kun vigtig fordi den kan identificere unikke rækker i en tabel, men også fordi den kan bruges til at repræsentere rækker i relationer

### Surrogate keys
En surrogat nøgle er en kollonne med en unik, DBMS-tildelt identitet (værdi), som er blevet tilføjet til tabellen til at være primær nøgle. Værdierne som surrogatnøglerne får tildelt af DBMS'et er unikke hver gang en rækker bliver oprettet, og disse værdier vil aldrig blive ændret.

### Foreign keys og referensiel integritet


## Problemet med NULL værdier

## Funktionelle afhængigheder og normalisering

### Normalisering

### Relationelle designprincipper

### Normaliseringsprocessen

## Eliminer anomalier fra multivalued dependencies
