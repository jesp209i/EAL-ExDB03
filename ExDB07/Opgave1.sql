-- question 5.13
/* side 314 */ 
SELECT *
FROM TABLE1, TABLE2
WHERE TABLE1.table2primarykey = TABLE2.PrimaryKey;

-- question 5.14
se side 323
Parent er den supertype som childtypen er en del af.

-- question 5.16 og 17
SELECT *
FROM CHILD, PARENT
WHERE 
	CHILD.ForeignKey = PARENT.PrimaryKey
	AND
	PARENT.ID = 'Hej Jesper';

SELECT *
FROM PARENT, CHILD
WHERE 
	CHILD.ForeignKey = Parent.PrimaryKey
	AND
	CHILD.ChildID = 'Hej Mikkel';

-- question 5.18
Fordi en child kan kun have en parent, men en parent kan godt have flere childs - så det bliver childs ansvar at pege på sin parent. 
Hvis det var Parents ansvar, var der kun mulighed for at have en child registreret.

-- question 5.19
-- question 5.20
-- question 5.21
En mellemliggende tabel som håndterer mange til mange relationen. se eksempel side 319.
en mange til mange relation omdannes til to en til mange relationer vha intersection table.
-- question 5.22
en til mange... parent er en og childs er mange
a og b er ulogiske, der bør vel være en parent, så en parent er mandatory
-- question 5.23 og 5.24
se side 319
SELECT *
FROM STUDENT, CLASS, STUDENT_CLASS
WHERE 
	STUDENT.SID = STUDENT_CLASS.SID
	AND
	STUDENT_CLASS.ClassNumber = CLASS.ClassNumber;
-- question 5.24

