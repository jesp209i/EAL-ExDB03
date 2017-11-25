# SELECT fra flere tabeller
Indhold
- [Subqueries](#subqueries)
- [Flere tabeller med joins](#flere-tabeller-med-joins)
- [JOIN ON](#join-on)

## Subqueries
```SQL
/* Forespørgsel med to ekstra niveauer */
SELECT		FirstName, LastName
FROM		EMPLOYEE
WHERE		EmployeeNumber IN
			(SELECT		DISTINCT EmployeeNumber
             FROM		ASSIGNMENT
             WHERE		HoursWorked > 40
             	AND		ProjectID IN
                	(SELECT ProjectID
                     FROM	PROJECT
                     WHERE	Department = 'Accounting'));
/* Fra side 179 */
```
##Flere tabeller med joins
```SQL
SELECT		FirstName, LastName, HoursWorked
FROM		EMPLOYEE, ASSIGNMENT
WHERE		EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
ORDER BY EMPLOYEE.EmployeeNumber, ProjectID
/* Side 181 */
```
Der kan også bruges ```GROUP BY``` eller der kan tilføjes flere betingelser til din ```WHERE``` klausul med ```AND```.
Ved tabellerne du vælger fra kan du bruge syntaksen ``` EMPLOYEE AS E ``` så du senere kan henvise til ```E.EmployeeNumber``` i stedet for ```EMPLOYEE.EmployeeNumber```.

## JOIN ON
```SQL
/* Side 185 */
SELECT		ProjectName, FirstName, LastName, HoursWorked
FROM			EMPLOYEE AS E JOIN ASSIGNMENT AS A
					ON		E.EmployeeNumber = A.EmployeeNumber
          		JOIN 	PROJECT AS P
              			ON A.ProjectID = P.ProjectID
ORDER BY	P.ProjectID, A.EmployeeNumber
```
Side 188 viser forskellige typer af JOINS, her kort:
- INNER JOIN
	-	Viser de resultater hvor der er sammenfald i begge tabeller. De steder hvor *TabelEtFK*=*AndenTabelPK*
- LEFT OUTER JOIN
	- Viser alle resultater fra første tabel, også selvom der på nogle rækker ikke er sammenfald.
- RIGHT OUTER JOIN
	- Viser alle resultater fra anden tabel, også selvom der på nogle rækker ikke er sammenfald.
