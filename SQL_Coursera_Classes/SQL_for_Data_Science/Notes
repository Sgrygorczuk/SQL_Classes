/*
Notes for SQL for Data Science by by University of California, Davis
Everything done here is done in SQLite

Basics:

This is a typical way of retrieving data from a database
select the wanted columns and then the table you want to get it from
The ';' indicates the end of the query 
*/

SELECT
	product_id
	price
	size
FROM products;

/*
You can get all of the columns by using the *
*/

SELECT *
FROM products;

/*
You can limit the number of rows displayed here it will show the
first 5 rows 
*/

SELECT *
FROM products
LIMIT 5;

/*
You may want to create your table 
In it, you specify the columns, what type of data the column takes
And lastly, if it is the Primary Key, a NOT NULL which requires input or NULL which doesn't require input. 
*/

CREATE TABLE products
(
product_id  char(10)        PRIMARY KEY,
ducks       char(10)        NOT NULL
price       decimal(10,2)        NOT NULL,
size        int                NULL
);

/*
When inserting an item it's best to define the labels 
so that the data goes in how you like it to
Otherwise, it may not go in the order you wish it to*
*/

INSERT INTO products
(
price,
ducks, 
product_id,
size
)
VALUES
(
5.44,
brown,
1231232144411,
NULL
)

/*
You can also create temporary tables which go away after you terminate
the session
*/

CREATE TEMPORARY TABLE duckies AS 
(
    SELECT *
    FROM products
    WHERE ducks = "brown" 
)

/*
Filtering: 

We can use the WHERE function to find specific rows 
With '=' we can find rows that have a specific column that
are equivalent to our search value We can use '<' and '>' similarly to get prices that are less than or greater than.
Similary '<=' and '>=' 
*/

SELECT
product_id
price
size
FROM products
WHERE price = 4.99;

/*
You can also retrieve a table that specifically does not contain something you can do that with '<>' in this example everything
but rows with the price of 4.99 will be retrieved.  
*/

SELECT
product_id
price
size
FROM products
WHERE price <> 4.99;

/*
You can also get a range of values with the use of "BETWEEN" and "AND"
*/

SELECT
product_id
price
size
FROM products
WHERE price BETWEEN 4.99 AND 15.99;

/*
Lastly, you can search for NULL, looking for records that have empty
spaces 
*/

SELECT
product_id
price
size
FROM products
WHERE price IS NULL;

/*
You can create a conditional list of ids that you want to retrieve the rows for using IN 
*/

SELECT
product_id
price
size
FROM products
WHERE price IN(4.99,0.99,103.99);

/*
You can create an OR statement where it will first look for the First input and if that is not found it will search for the second one and so on. So in this case, if we find rows that contain 4.99 we will not display any 9.99 rows. However, if we don't find any 4.99 we will look for 9.99 rows. 
*/

SELECT
product_id
price
size
FROM products
WHERE price 4.99 OR 9.99;

/*
You can combine OR with AND get very specific results.
So here we will get a product that's either 4.99 or 9.99 
and the size of it has to be greater than 10. You have to put () 
Around you OR because the AND applies to the last thing next to it. 
Such that you may 4.99 items which are not above size 10. Meanwhile 
the second all rows found will have to be above size 10.
*/

SELECT
product_id
price
size
FROM products
WHERE price 4.99 OR 9.99 AND size > 10;

WHERE price (4.99 OR 9.99) AND size > 10;

/*
We can also use the NOT operator with conjunction to AND here you use other operators such as '=' and '<' 
*/

SELECT
product_id
price
size
FROM products
WHERE NOT price=4.99 AND NOT size > 10;

/*
Wildcards:

Help us find parts of the text, the wildcard is signified with the use of '%'
So if we use '%Pizza' it will look for any string that occurs before the word 'Pizza', if we 'Pizza%' we will get anything that occurs after the word 'Pizza' and if we do '%Pizza%' we'll get any string that surrounds the word 'Pizza'

'%Pizza' Before
'Pizza%' After 
'%Pizza%' Before and After 

We can also look for incomplete items by putting the wildcard in the middle of a string such as 'P%A' which will look for any word that starts with P and ends with A such as 'Pizza'

The way you would use this is 
*/

SELECT *
FROM products
WHERE size LIKE 'P%A';

/*
Sorting: 

You can sort but columns you did not retrieve, the Ordering has to be the last thing that you write. 

You can order by column position, you can use the indexes or names 
*/

SELECT *
FROM products
ORDER BY 2,3;   -- <====> ORDER BY price, size 

/*
You can apply by DESC descending order or ASC ascending order, it only applies to the last column you wrote so if you want each column to be ASC you need to put that after each name 
*/

SELECT *
FROM products
ORDER BY price ASC, size ASC, ducks DESC;

/*
Math: 

We can perform row to row arithmetic with the use of '+' '-' '*' and '/'

We do this by performing the arithmetic during the selected which allows us to create a new column with the use of AS 
*/

SELECT
product_id
price
product_units
product_units * price AS total_cost
FROM products;

This can be done as a list of operations such as 
SELECT
product_id
price
product_units
((product_units + product_units) * price)/product_units AS total_cost
FROM products;

/*
Aggregate Functions: 

SQL has several built-in functions that allow you to quickly find information about your databases such as AVG, COUNT, MIN, MAX, and SUM
AVG gives you average of all the numbers, count tells you how many times such value occurs, you can use COUNT(*) to count total amount of rows, min tells you the smallest number in the column, max tells you the maximum number in the column and sum adds up all the values in the column.
*/

SELECT
product_id,
AVG(price) AS avg_price,
COUNT(*) AS total,
COUNT(price) AS amount_price
MIN(price) AS min_price,
MAX(price) AS max_price,
SUM(product_units) AS sum_of_product_units
FROM products;

/*
Sometimes the data will have repeats if you want to make sure you get only new entries you can use the DISTINCT operator such as 
*/

SELECT
product_id,
COUNT(price) AS unqiue_prices,
FROM products;

/*
Grouping Data:

Allows you to create a table of counts where we count how many units of a product we have grouped by what region they're located in 
*/

SELECT
region,
COUNT(units) AS total_units,
FROM products;
GROUP BY region;

/*
WHERE does not work on groups only rows. So we will have to use HAVING such that here we will only get those counts in regions where the value of units excited 100 
*/

SELECT
region,
COUNT(units) AS total_units,
FROM products;
GROUP BY region
HAVING COUNT (*) > 100;

/*
Subqueries: 
It allows us to look through a second table using the information found in the first one. Here we are using the customerID to search the order of freights which were oversize of 100.

Subqueries can only select one column 
*/

SELECT
customerID,
companyName,
region
FROM customers
WHERE customerID In (
    SELECT customerID
    FROM orders
    WHERE freight > 100);

/*
We can also pull a column as a column we want to display
*/

SELECT
customerID,
companyName,
SELECT 
coustumer_name,
coustumer_state,
    (SELECT (*) AS order
    FROM orders 
    WHERE orders.customer_id = customers.coustumer_id) as orders 
FROM customers;
ORDER BY customer_names

/*
Joining:
Joins are not persistent they only occur for query execution allows us to get multiple columns from different tables. There are many times of joins.

Cartesian (Cross) Join:
Match each row from the first table with all rows of another table. It is very inefficient. The example of that would be below where we select a column from two tables which are joined the FROM 
*/

SELECT
name,
price,
company_name;
FROM suppliers CROSS JOIN products

/*
Inner Joins:
Inner Join only returns the records that are matching in both tables
so we specify what columns we want and then when performing the INNER JOIN we specify what columns should be matching from both tables. Also since we are dealing with two tables and both share a column, you will have to specify where it is coming from as in the case of "suppliers.CompanyName"
*/

SELECT 
suppliers.CompanyName,
ProductName,
UnitPrice
FROM Suppliers INNER JOIN Proudcts ON Suppliers.supplierid = Proudcts.supplierID;

/*
Self Joins:
Joins the table to itself treat it as if it were two tables A and B
*/

SELECT 
A.CustomerName AS CustomerName1,
B.CustomerName AS CustomerName2,
A.City
FROM Coustomers A, Customers Bno such column: tracks.name
WHERE A.CustomerID = B.CustomerID 
AND A.City = B.City
ORDER BY A.City;

/*
Left Join:
Returns all of the information stored in the first table and whatever overlaps of the second table, anything not overlapped in the second table is NULL
*/

SELECT 
C.Customer, 
O.OrderID
FROM Customer C
LEFT JOIN Order O ON C.CustomerID + O.CusotmerID
ORDER BY C.CustomerName;

/*
Unions:
Combines two SELECTS, has to be same datatype and same column
*/

SELECT 
City,
Country
FROM Customer
WHERE Country = 'Germany'
UNION
SELECT
City,
Country
FROM Supplier
WHERE Country = 'Germany'
ORDER BY City;

/*
Text String Manipluation:

Concation is the combination of two strings such that if you have Alber and Blizzard contination will combine them as Alber Blizzard depending on what kind of string you write. Using '||' as a '+'.
In this case it's ComanpyName + ' (' + ContactName + ')' 
*/

SELECT
ComapnyName,
ContactName,
ComanpyName || ' (' || ContactName || ')'  AS Company_Contact
FROM customers

/*
Trimming:
There are three types of trims, TRIM, RTRIM and LTRIM. It gets rid of empty spaces. Only dealing with the outer edges of the string and not spaces between letters 
*/

SELECT 
TRIM ("     You the best.    ") AS TrimmedString; -- (Will amke it 'You the best')

/*
Substrings:
Used to takes chunks of the given string and manipluate ot as you wish.
SQL starts counting at 1 not 0.
SUBSTR (string_name, string postion, number of characters to be returned)
*/

SELECT 
firstname,
SUBSTR(firstname,2,3) -- (Will look at the strings it he firstname column, starting at point 2 and will give back the next three chars stored from point 2)
FROM employees
WHERE department_id = 16;

/*
Letter Cases, to stnadarize the data its best to make it all uppercase or lower case so you can have a simple process for reading it all the same way. To do that you can use UPPER (Column_Name) <==?  UCASE (Column_Name), LOWER (Column_Name)
*/

SELECT 
UPPER(firstname)
FROM employees;

/*
Date and Time:
Each dbms (database managment system) uses diffrent date format.
Few keywords we can use for predesined formats are. These are all the avlaibel ones for SQLite
DATE      = YYYY-MM-DD
DATETIME  = YYYY-MM-DD HH:MI:SS
TIMESTAMP = YYYY-MM-DD HH:MI:SS
JULIANDAY =
STRFTIME  = (String format time function) 

In this example we break down the birthdate into year, month and day using the wildcard with y,m, and d to determin which value we want to extract from the string
*/

SELECT 
Birthdate,
STRFTIME('%y', Birthdate) AS Year,
STRFTIME('%m', Birthdate) AS Month,
STRFTIME('%d', Birthdate) AS Day
FROM employees

/*
You can compute the current date by using
*/

SELECT 
DATE('now') -- (You can specify what info you want DATE('%y %m %d','now') and you can go even further by getting the Hour, Miniute, second and milisecond by using DATE('%y %m %d %H %M %S %s','now') Captilization matters) 

/*
You can perform arithmetic on the time strings 
*/

SELECT 
Birthdate,
Date(('now') - Birthdate) AS Age
FROM employees

/*
Case Statments: 
Works like a If-Else statment insted of if you say WHEN.
In this case we are creating a column called City_Type, it;s specficed at the END of the case. The case is looking at the enties in the city column if it maches 'calgary' it outputs 1 if it matches 'boston' it outputs 2 and anything esle it will output 0
*/


SELECT 
employeID,
firstname,
secondname,
city,
CASE city
	WHEN 'Calgary' THEN '1'
	WHEN 'Boston' THEN '2'
	ELSE '0'
END City_Type
FROM employees

/*
You can also do this as a comparison operation, you dont have to specify which column your using in case, that way each if statment can use a diffrent one
*/

SELECT 
trackid,
name,
byte,
CASE
	WHEN bytes < 3000000 THEN 'small'
	WHEN bytes >= 3000001 AND  bytes < 5000000 THEN 'medium'
	WHEN bytes >= 3000001 THEN 'big'
	ELSE 'other'
END bytesizes
FROM tracks;

/*
Views:

*/

/*
Data Governance and Profiling:
Data Profiling - examping data for completenees and accuracy 
	Findin out rows 
	Table size
	When was it last updated 
Finding out data types for columns 
	Number of distinc values
	Number of rows with NULL
	Finding out max, avg, standard deviation 
Governace - read and write capabilites

*/

