/*
SQLZOO - https://sqlzoo.net/wiki/SQL_Tutorial
Learn SQL using: SQL Server, Oracle, MySQL, DB2, and PostgreSQL.
*/

/*
LESSON #5:

name		continent	area 	population	gdp
Afghanistan	Asia		652230	25500100	20343000000
Albania		Europe		28748 	2831741 	12960000000
Algeria		Africa		2381741 37100000 	188681000000
Andorra		Europe		468	78115 		3712000000
Angola		Africa		1246700 20609294 	100990000000
...	

*/

/*

Show the total population of the world.

world(name, continent, area, population, gdp)
*/

SELECT 
SUM(population)
FROM world

/*
List all the continents - just once each. 
*/

SELECT 
DISTINCT continent
FROM world

/*
Give the total GDP of Africa 
*/

SELECT 
SUM(gdp)
FROM world
WHERE continent = 'Africa'

/*
How many countries have an area of at least 1000000
*/

SELECT 
COUNT(name)
FROM world
WHERE area >= 1000000

/*
What is the total population of ('Estonia', 'Latvia', 'Lithuania') 
*/

SELECT 
SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

/*
You may want to look at these examples: Using GROUP BY and HAVING. [Sub-Study]

Enter [Sub-Study]

For each continent show the number of countries:

world(name, continent, area, population, gdp
*/

SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent

/*
For each continent show the total population:

world(name, continent, area, population, gdp)
*/

SELECT continent, SUM(population)
  FROM world
 GROUP BY continent

/*
WHERE and GROUP BY. The WHERE filter takes place before the aggregating function. For each relevant continent show the number of countries that has a population of at least 200000000.
*/

SELECT continent, COUNT(name)
  FROM world
 WHERE population>200000000
 GROUP BY continent

/*
GROUP BY and HAVING. The HAVING clause is tested after the GROUP BY. You can test the aggregated values with a HAVING clause. Show the total population of those continents with a total population of at least half a billion. 
*/

SELECT continent, SUM(population)
  FROM world
 GROUP BY continent
HAVING SUM(population)>500000000

/*
Exit [Sub-Study]

For each continent show the continent and number of countries. 
*/

SELECT 
continent,
COUNT(name)
FROM world 
GROUP BY continent

/*
For each continent show the continent and number of countries with populations of at least 10 million. 
*/

SELECT 
continent,
COUNT(name)
FROM world 
WHERE population >= 10000000
GROUP BY continent

/*
List the continents that have a total population of at least 100 million. 
*/

SELECT 
continent
FROM world 
GROUP BY continent
HAVING SUM(population) >= 100000000
