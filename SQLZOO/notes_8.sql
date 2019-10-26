/*
SQLZOO - https://sqlzoo.net/wiki/SQL_Tutorial
Learn SQL using: SQL Server, Oracle, MySQL, DB2, and PostgreSQL.
*/

/*
LESSON #8:

teacher 
id 	dept 	name 	phone 	mobile
101 	1 	Shrivell 	2753 	07986 555 1234
102 	1 	Throd 	2754 	07122 555 1920
103 	1 	Splint 	2293 	
104 		Spiregrain 	3287 	
105 	2 	Cutflower 	3212 	07996 555 6574
106 		Deadyawn 	3345 	
...

dept 
id 	name
1 	Computing
2 	Design
3 	Engineering
...
*/

/*
The school includes many departments. Most teachers work exclusively for a single department. Some teachers have no department.

Selecting NULL [Sub-Study] values. 

Entering [Sub-Study]

The SELECT statement returns results from a table. With a WHERE clause only some rows are returned. This example shows the year that Athens hosted the Olympic games. 
*/

SELECT 
code, 
name 
FROM party
WHERE leader IS NULL -- When comapring to NULL have to use IS 

/*
Exiting [Sub-Study]

List the teachers who have NULL for their department.
Why we cannot use =

You might think that the phrase dept=NULL would work here but it doesn't - you can use the phrase dept IS NULL 
*/

SELECT 
name 
FROM teacher
WHERE dept IS NULL

/*
Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 
*/

SELECT 
teacher.name, 
dept.name
FROM teacher INNER JOIN dept ON (teacher.dept=dept.id) --Inner join ignores all rows with NULL in them

/*
Use a different JOIN so that all teachers are listed. 
*/

SELECT 
teacher.name, 
dept.name
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id) --LEFT join takes all the info from the teacher even the NULL

/*
Use a different JOIN so that all departments are listed. 
*/

SELECT 
teacher.name, 
dept.name
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id) --RIGHT join takes all the info from the dept even the NULL

/*
Using the COALESCE [Sub-Study] function

Entering [Sub-Study]

COALESCE takes any number of arguments and returns the first value that is not null.

  COALESCE(x,y,z) = x if x is not NULL
  COALESCE(x,y,z) = y if x is NULL and y is not NULL
  COALESCE(x,y,z) = z if x and y are NULL but z is not NULL
  COALESCE(x,y,z) = NULL if x and y and z are all NULL
*/

SELECT 
name, 
party,
COALESCE(party,'None') AS aff  --Works as in if statment that checks if the input is NULL 
FROM msp 
WHERE name LIKE 'C%'

/*
CASE allows you to return different values under different conditions.

If there no conditions match (and there is not ELSE) then NULL is returned. Basic IF THEN statment 
*/

SELECT name, population
      ,CASE WHEN population<1000000 
            THEN 'small'
            WHEN population<10000000 
            THEN 'medium'
            ELSE 'large'
       END
  FROM bbc

/*
NULLIF can be used to replace a specific value with NULL. In this example the party Lab is replaced with NULL. 
*/

SELECT 
name, 
party,
NULLIF(party,'Lab') AS aff --Reverse of COALESCE
FROM msp 
WHERE name LIKE 'C%'

/*
NVL can be useful when you want to replace a NULL value with some other value. In this example you show the name of the party for each MSP that has a party. For the MSP with no party (such as Canavan, Dennis) you show the string None. 
*/

SELECT name, party
      ,COALESCE(party,'None') AS aff --Same as  COALESCE except it has max of two inptus 
  FROM msp WHERE name LIKE 'C%'

/*
Exiting [Sub-Study]

Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
*/

SELECT 
name, 
COALESCE(mobile,'07986 444 2266')
FROM teacher 

/*
Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. 
*/

SELECT 
teacher.name, 
COALESCE(dept.name,'None')
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

/*
Use COUNT to show the number of teachers and the number of mobile phones. 
*/

SELECT 
COUNT(name), --Dosen't include NULL 
COUNT(mobile)
FROM teacher

/*
Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. 
*/

SELECT 
dept.name,
COUNT(dept)
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
GROUP BY dept.name

/*
Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. 
*/

SELECT
teacher.name,
CASE 
	WHEN dept = 1 
        THEN 'Sci'
        WHEN dept = 2
        THEN 'Art'
END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

/*
Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. 
*/

SELECT
teacher.name,
CASE 
	WHEN dept = 1 
        THEN 'Sci'
        WHEN dept = 2
        THEN 'Art'
	ELSE 'None'
END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
