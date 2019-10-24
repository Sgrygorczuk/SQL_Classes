/*
SQLZOO - https://sqlzoo.net/wiki/SQL_Tutorial
Learn SQL using: SQL Server, Oracle, MySQL, DB2, and PostgreSQL.
*/

/*
LESSON #2:

name		continent	area 	population	gdp
Afghanistan	Asia		652230	25500100	20343000000
Albania		Europe		28748 	2831741 	12960000000
Algeria		Africa		2381741 37100000 	188681000000
Andorra		Europe		468	78115 		3712000000
Angola		Africa		1246700 20609294 	100990000000
...	

*/

/*
Read the notes about this table [Sub-Study]. 

Enter [Sub-Study]:
The population of 'France'. Strings should be in 'single quotes';
*/

SELECT 
population 
FROM bbc
WHERE name = 'France';

/*
The names and population densities for the very large countries. We can use mathematical and string expressions as well as field names and constants.
*/

SELECT 
name, 
population/area 
FROM bbc
WHERE area > 5000000;

/*
Which of Ceylon, Iran, Persia and Sri Lanka is the name of a country? The word IN allows us to check if an item is in a list.
*/

SELECT 
name 
FROM bbc
WHERE name IN ('Sri Lanka', 'Ceylon', 'Persia', 'Iran');

/*
What are the countries beginning with D? The word LIKE permits pattern matching - % is the wildcard.
*/

SELECT 
name 
FROM bbc
WHERE name LIKE 'D%';

/*
Which countries are not too small and not too big? BETWEEN allows range checking - note that it is inclusive. 
*/

SELECT 
name, 
area 
FROM bbc
WHERE area BETWEEN 207600 AND 244820

/*
Exit [Sub-Study]:

Observe the result of running this SQL command to show the name, continent and population of all countries. 
*/

SELECT 
name 
FROM world
WHERE population >= 200000000; -- (Oringal WHERE population = 64105700)

/*
Give the name and the per capita GDP for those countries with a population of at least 200 million. 
*/

SELECT 
name, 
gdp/population -- (per capita GDP = gdp/population) 
FROM world
WHERE population >= 200000000;

/*
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 
*/

SELECT 
name, 
population/1000000
FROM world
WHERE continent = 'South America';

/*
Show the name and population for France, Germany, Italy 
*/

SELECT 
name, 
population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/*
Show the countries which have a name that includes the word 'United' 
*/

SELECT 
name
FROM world
WHERE name LIKE '%United%';

/*
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.
*/

SELECT 
name,
population,
area
FROM world
WHERE area > 3000000 OR population > 250000000;

/*
Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.

    Australia has a big area but a small population, it should be included.
    Indonesia has a big population but a small area, it should be included.
    China has a big population and big area, it should be excluded.
    United Kingdom has a small population and a small area, it should be excluded.
*/

SELECT 
name,
population,
area
FROM world
WHERE area > 3000000 XOR population > 250000000;

/*
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places. [Sub-Study]
*/

/*
ROUND(f,p) returns f rounded to p decimal places.

The number of decimal places may be negative, this will round to the nearest 10 (when p is -1) or 100 (when p is -2) or 1000 (when p is -3) etc.. 

In this example we calculate the population in millions to one decimial place. 
*/

SELECT 
name,
ROUND(population/1000000,1)
FROM bbc

/*
FLOOR(f) returns the integer value of f

FLOOR(f) give the integer that is equal to, or just less than f. FLOOR always rounds down. 

In this example we calculate the population in millions. 
*/

SELECT 
name,
FLOOR(population/1000000)
FROM bbc

/*
CEIL(f) is ceiling, it returns the integer that is equal to or just more than f

CEIL(f) give the integer that is equal to, or just higher than f. CEIL always rounds up.

In this example we calculate the population in millions. 
*/

SELECT 
population/1000000 AS a,
CEIL(population/1000000) AS b
FROM bbc

/*
MOD(a,b) returns the remainder when a is divied by b

If you use MOD(a, 2) you get 0 for even numbers and 1 for odd numbers.

If you use MOD(a, 10) you get the last digit of the number a.
*/

SELECT 
MOD(yr,10),
yr, 
city
FROM games

/*
Exit [Sub-Study]:

For South America show population in millions and GDP in billions both to 2 decimal places.
Millions and billions
Divide by 1000000 (6 zeros) for millions. Divide by 1000000000 (9 zeros) for billions.
*/

SELECT 
name,
ROUND(population/1000000,2) AS population, 
ROUND(gdp/1000000000,2) AS GDP
FROM world
WHERE continent = 'South America';

/*
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

Show per-capita GDP for the trillion dollar countries to the nearest $1000.
*/

SELECT 
name, 
ROUND(gdp/population,-3) AS 'Per-Capita GDP'
FROM world
WHERE gdp >= 1000000000000;

/*
Greece has capital Athens.

Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

    You can use the LENGTH [Sub-Study]function to find the number of characters in a string

Entry [Sub-Study]
*/

/*
LENGTH(s) returns the number of characters in string s. 
*/

SELECT 
LENGTH(name), 
name
FROM bbc

/*
SUBSTRING allows you to extract part of a string. 

In this example you get the 2nd to 5th character from each country's name. 
*/

SELECT 
name,
SUBSTRING(name, 2, 5)
FROM bbc

/*
CONCAT allows you to stick two or more strings together.

This operation is concatenation.

In this example you put the region and the name together for each country. 
*/

SELECT 
CONCAT(region,' ', name) -- You can add as many items to the list they will all be integrated in a region + ' ' + name format
FROM bbc

/*
TRIM(s) returns the string with leading and trailing spaces removed. 

This function is particularly useful when working with CHAR fields. Typically a CHAR field is paddded with spaces. In contrast a VARCHAR field does not require padding. 
*/

SELECT 
name,
TRIM(name)
FROM bbc

/*
LEFT(s,n) allows you to extract n characters from the start of the string s.
*/

SELECT 
name,
LEFT(name, 3)
FROM bbc

/*
RIGHT(s,n) allows you to extract n characters from the end of the string s.
*/

SELECT 
name,
RIGHT(name, 3)
FROM bbc

/*
POSITION(s1 IN s2) returns the character position of the substring s1 within the larger string s2. The first character is in position 1. If s1 does not occur in s2 it returns 0. 
*/

SELECT 
name,
POSITION('an' IN name) -- If found gives back postion if not found returns 0
FROM bbc

/*
Exit [Sub-Study]:

Show the name and capital where the name and the capital have the same number of characters.

    You can use the LENGTH function to find the number of characters in a string
*/

SELECT 
name,
capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

/*
The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

    You can use the function LEFT to isolate the first character.
    You can use <> as the NOT EQUALS operator.
*/

SELECT 
name,
capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

/*
Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

    You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
    The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
*/

SELECT 
TRIM(name)
FROM world
WHERE name LIKE'%a%'AND name LIKE'%e%'AND name LIKE'%i%'AND name LIKE'%o%' AND name LIKE'%u%' AND name NOT LIKE'% %';


