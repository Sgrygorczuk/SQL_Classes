/*
/*
Week 3: Practice Test for SQL for Data Science by by University of California, Davis

Using the ER diagram in the folder

Q1 How many albums does the artist Led Zeppelin have? 
*/

SELECT 
	COUNT(albumID)  --Counts Number of Albums
FROM 
	artists INNER JOIN albums ON artists.ArtistId = albums.ArtistId --Joins the albums and aritst table 
WHERE artists.name = 'Led Zeppelin' --limits the search to Led Zepplin entires

/*
Q2 Create a list of album (I think it's asking for track titles) titles and the unit prices for the artist "Audioslave".
*/

SELECT
    tracks.name AS track_Name,
    tracks.unitprice AS price
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid
    INNER JOIN artists ON artists.artistid = albums.artistid
WHERE artists.name = 'Audioslave'
GROUP BY track_Name;

/*
Q3 Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query? 
*/

SELECT
    customers.Firstname,
    customers.lastname
FROM invoices
INNER JOIN customers ON customers.customerid = invoices.customerid
WHERE invoiceid = NULL; -- (Searches for any occurace of NULL invoice)

/*
Q4 Find the total price for each album. What is the total price for the album “Big Ones”? 
*/

SELECT
    albums.title AS album,
    SUM(tracks.unitprice) AS price -- (SUM you want to add up all the prices not COUNT how many entires there are) 
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid
    INNER JOIN artists ON artists.artistid = albums.artistid
WHERE album = 'Big Ones'	--(Specify the album)
GROUP BY album;

/*
Q5 How many records are created when you apply a Cartesian join to the invoice and invoice items table?
*/

SELECT
COUNT(*) AS total
FROM invoices CROSS JOIN invoice_items;


