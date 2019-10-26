/*
SQLZOO - https://sqlzoo.net/wiki/SQL_Tutorial
Learn SQL using: SQL Server, Oracle, MySQL, DB2, and PostgreSQL.
*/

/*
LESSON #4:

name		continent	area 	population	gdp
Afghanistan	Asia		652230	25500100	20343000000
Albania		Europe		28748 	2831741 	12960000000
Algeria		Africa		2381741 37100000 	188681000000
Andorra		Europe		468	78115 		3712000000
Angola		Africa		1246700 20609294 	100990000000
...	

*/

/*
List each country name where the population is larger than that of 'Russia'.
*/

SELECT 
name
FROM world 
WHERE population > (
	SELECT			--Only can have one SELECT column in the SELECT IN SELCT 
	population 		
	FROM world
	WHERE name = 'Russia')	--Only can have one Clause for the WHERE 

/*
Show the names of countries in Europe with a per capita GDP greater than 'United Kingdom'.
Per Capita GDP
The per capita GDP is the gdp/populatio
*/

SELECT 
name
FROM world 
WHERE continent = 'Europe' AND  gdp/population > ( -- Can have muliple AND in the orignal WHERE clause 
	SELECT			
	gdp/population 		
	FROM world
	WHERE name = 'United Kingdom')

/*
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
*/

SELECT 
name,
continent
FROM world 
WHERE continent = ( --Copmare the continent 
	SELECT			
	continent   --To conentents  		
	FROM world
	WHERE name = 'Australia') -- That containa Australia 
OR continent = ( -- OR Copmare the continent 
	SELECT			
	continent  --To conentents		
	FROM world
	WHERE name = 'Argentina') - That containa Australia 
ORDER BY name ASC;

/*
Which country has a population that is more than Canada but less than Poland? Show the name and the population.
*/

SELECT 
name,
population
FROM world 
WHERE population > ( 
	SELECT			
	population  		
	FROM world
	WHERE name = 'Canada') 
AND population < ( 
	SELECT			
	population		
	FROM world
	WHERE name = 'Poland') 

/*
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

Decimal places
You can use the function ROUND to remove the decimal places.

Percent symbol %
You can use the function CONCAT to add the percentage symbol.
*/


/*
We create a column. That column performs 100*population/popluation.Germany
We specify popluation.Germany using 
(
SELECT
population
FROM world
WHERE name = 'Germany')
After that we perfom a ROUND which makes it a whole number rounded to 0th place 
Lastly we add a '%' using CONCAT
*/
SELECT 
name,
CONCAT(ROUND(100*population/(
	SELECT
	population
	FROM world
	WHERE name = 'Germany'),0),'%')
FROM world 
WHERE continent = 'Europe'

/*
Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) 
*/

/*
Compare the GDP of every nation agianst the MAX(Gdp.EUROPE)
We get GDP.Eurpe using 
SELECT
	MAX(gdp)
	FROM world
	WHERE continent = 'Europe')
*/

SELECT 
name
FROM world 
WHERE gdp > (
	SELECT
	MAX(gdp)
	FROM world
	WHERE continent = 'Europe')

/*
Find the largest country (by area) in each continent, show the continent, the name and the area: 
*/

SELECT
continent,
name,
area
FROM world 
WHERE area IN ( -- IN is important beacue we are getting multiple rows back don't use = 
	SELECT 
	MAX(area)
	FROM world
	GROUP BY continent)

/*
List each continent and the name of the country that comes first alphabetically.
*/

SELECT
continent,
name
FROM world 
WHERE name IN(
	SELECT 
	MIN(name)		-- You can use MIN to find out first alphabetical name 
	FROM world
	GROUP BY continent)


/*
Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population. 
*/

/*
Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
*/
