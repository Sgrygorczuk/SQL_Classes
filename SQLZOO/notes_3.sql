/*
SQLZOO - https://sqlzoo.net/wiki/SQL_Tutorial
Learn SQL using: SQL Server, Oracle, MySQL, DB2, and PostgreSQL.
*/

/*
Lesson #3:

Tabel = Noble
nobel yr 	subject 	winner
1960 	Chemistry 	Willard F. Libby
1960 	Literature 	Saint-John Perse
1960 	Medicine 	Sir Frank Macfarlane Burnet
1960 	Medicine 	Peter Madawar
...
*/

/*
Change the query shown so that it displays Nobel prizes for 1950. 
*/

SELECT 
yr, 
subject, 
winner
FROM nobel
WHERE yr = 1950  -- (Original WHERE yr = 1960)


/*
Show who won the 1962 prize for Literature
*/

SELECT 
winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature' -- (Original WHERE yr = 1960 AND subject = 'Physics')

/*
Show the year and subject that won 'Albert Einstein' his prize. 
*/

SELECT 
yr,
subject
FROM nobel
WHERE winner = 'Albert Einstein';

/*
Give the name of the 'Peace' winners since the year 2000, including 2000. 
*/

SELECT 
winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

/*
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. 
*/

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

/*
Show all details of the presidential winners:
    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama
*/

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama'); 

/*
Show the winners with first name John 
*/

SELECT 
winner
FROM nobel
WHERE winner LIKE 'John%'; 

/*
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
*/

SELECT *
FROM nobel
WHERE (yr = 1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry'); -- Use OR between the two conditons 

/*
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
*/

SELECT *
FROM nobel
WHERE yr = 1980 AND subject <> 'Chemistry'AND subject <> 'Medicine';

/*
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
*/

SELECT *
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine') OR subject <> (yr >= 2004 AND subject = 'Literature');

/*
Find all details of the prize won by PETER GRÜNBERG 

The u in his name has an umlaut. You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding
*/

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

/*
Find all details of the prize won by EUGENE O'NEILL
Escaping single quotes

You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.
*/

SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

/*
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
*/

SELECT
winner,
yr,
subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, SUBSTRING(winner, 4, 10) ASC -- Order by yr decding meaning 2000 then 1999 and so on. After that order by the names we use substring where it gets rid of the 'Sir ' and look at the first names

/*
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
*/

SELECT 
winner, 
subject
FROM nobel
WHERE yr=1984
ORDER BY subject In ('Physics','Chemistry') ASC, subject ASC, winner ASC

/*
subject In ('Physics','Chemistry') creates a list of ones and 0 1 so when we set it to ASC all the things that are 1 in this case Physics and Chemistry get put on the bottom. 
*/
*/
