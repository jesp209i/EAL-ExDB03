# Review Questions page 341
- **5.1** Explain how entities are transformed into tables

Trinene til at transformere en datamodel om til et databasedesign. Se side 305:
1. Skab en tabel for hver entitet
    - angiv primær nøgle (overvej det er nødvendigt med en surrogatnøgle)
    - angiv hver kolonnes egenskaber:
      - datatyper
      - NULL-status
      - Default værdier, hvis der er nogle
      - Data constraints, hvis der er nogle
2. Opret relationer ved at placere foreign keys:
    - stærke entity relationer (1:1, 1:N, N:M)
    - ID-afhængige og ikke ID-afhængige svage entity relationer
    - subtypes
    - rekursive (1:1, 1:N, N:M)
      
- **5.2** When is denormalization justified?
  - side 309. Hvis man bibeholder data i tabellen som man normalt normaliserer ud. Især hvis de ikke vil give modifikationsproblemer
  
- **5.3** Why is it necessary to apply the normalization process to the tables created according to your answer to question 5.1?
  - for at finde funktionelle afhængigheder
  
- **5.4** What is denormalization?
  - attributter som man egentlig havde lagt over i en normaliseret tabel, placeres tilbage i den oprindelige tabel
  
- **5.5** Explain how attributes are transformed into columns. What column properties do you take into account when making the transformations?
  - Attributterne laves om til kolonner
  - Datatyper, NULL-status, Default værdier og data constraints
  
- **5.6** Explain how supertypes and subtypes are transformed into tables?
  - subtypens primærnøgle er samtidig fremmednøglen der viser relationen til sypertypen. (side 322)
  - Der kan være en distriminator imellem typerne (eksklusive subtyper), eller der er ikke en diskriminator imellem typerne (inklusive subtyper) (side 276)

- **5.7** Explain how the representation of weak entities differs from the representation of strong entities.
  - svage entiteter er afhængige af Primær nøgler fra andre tabeller, og kan derfor ikke eksistere som "selvstændige logiske entiteter"
  - stærke entiteter kan sagtens fungere logisk på egen hånd.

- **5.8** Explain the problems that unnormalized tables have for insert, update and delete actions.
  - indsat række: manglende date
  - opdateret række: inkonsistente data
  - slettet række: for meget data går tabt

- **5.9** List the three types of binary relationships and give an example of each. Do not use the examples given in this text.
  - (1:1) en til en
    - en person har et personligt buskort
  - (1:N) en til mange
    - en person har mange venner?
  - (N:M) mange til mange
    - mange studerende går til mange forelæsninger.

- **5.10** Define the term *foreign key* and give an example.
  - fremmednøgle - en nøgle i en tabel der viser tabellen relation til en anden tabel der indeholder en kolonne med samme værdi


