# Kapitel 3 Om DML
## INSERT
Side 156 - 157

Hvis alle data som tabellen kræver er tilgængelige kan man indsætte på denne måde:
```SQL
INSERT INTO NEWTABLE VALUES('Value01', 'Value2', 'Value3', 4, ...);
```
Bemærk:
- Hvis DBMS'et står for at skabe en surrogat nøgle er det ikke nødvendigt at angive den værdi i insert-sætningen
- talværdier skal ikke sættes i enkelt anførselstegn (se den fjerde værdi)
 ```SQL
 INSERT INTO OTHERTABLE 
  (FirstColumn, SecoundColumn, DateColumn, FloatColumn) 
    VALUES('Some text', 'more text', '05-OCT-14', 132.45);
 ```
 Bemærk:
 - Du skal indsætte værdier i alle de kolonner hvor du har defineret at værdien må være **"NOT NULL"**
 - Hvis tabellen indeholder flere kolonner end du angiver, bliver værdien NULL sat ind på de pladser
   - Det kræver at kolonnen vil modtage en NULL-værdi, ellers får du en fejl!
 
 ```SQL
 INSERT INTO OTHERTABLE 
  (SecoundColumn, FirstColumn, FloatColumn, DateColumn) 
    VALUES('more text', 'Some text', 132.45, '05-OCT-14');
 ```
Bemærk:
- Denne SQL Insert er den samme som forrige, men rækkefølgen på kolonner og værdier er byttet rundt. Dette er lovlig opførsel!
