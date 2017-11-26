## UPDATE
fra side 192 til 194

Ret en værdi i en bestemt række (rækken hvor ```EmployeeNumber``` er 11)
```SQL
UPDATE EMPLOYEE
SET 	Phone = '360-287-8810'
WHERE	EmployeeNumber = 11
/* Side 192 */
```

Ret flere værdier i en bestemt række (rækken hvor ```EmployeeNumber``` er 11)
```SQL
UPDATE EMPLOYEE
SET 	Deplatmen = 'Finance', Phone = '360-287-8810'
WHERE	EmployeeNumber = 11
/* Side 194 */
```


Bemærk at ```WHERE``` klausulen er utrolig vigtig ved ```UPDATE```! 
Hvis du ikke har en ```WHERE``` når du bruger ```UPDATE``` opdaterer du alle værdierne i den kolonne i den pågældende tabel.
