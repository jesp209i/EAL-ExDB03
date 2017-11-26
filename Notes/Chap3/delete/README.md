## DELETE
fra side 194 til 195

Vær meget varsom med ```DELETE```.

Pas på hvis der er ```CONSTRAINT```'s på tabellen!
Så skal du være opmærksom på ```CASCADE``` ved ```ON DELETE``` og ```ON UPDATE```.
```SQL
/* *** EXAMPLE CODE - DO NOT RUN *** */
/* *** SQL-DELETE-CH03-01 *** */
DELETE
FROM	PROJECT
WHERE	Department = 'Marketing';
/* Side 195 */
```

På samme måde som ved ```UPDATE``` er det vigtigt at have en ```WHERE``` klausul.
