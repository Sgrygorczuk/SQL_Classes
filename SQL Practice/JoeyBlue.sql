--Click F5 to execut
--https://www.youtube.com/watch?v=9Pzj7Aj25lw&list=LLy55t2rmSwx2uRk7aWzqycw&index=4&t=314s
/*
Creates the database called Customer
create database Customer
*/

/*
Switches to Customer database in SQL Server Managment Studio
use Customer 
*/

/*
Creates table 
create table Customer(
	FirstName varchar(50),
	LastName varchar(50),
	Age int
)
*/

/*
Inserts data into table 

Need to update IntelliSense go to Edit-> IntelliSense->Refrese Local Cashe

insert into dbo.Customer (FirstName, LastName, Age) 
	values('Joey', 'Adams', 12);
insert into dbo.Customer (FirstName, LastName, Age) 
	values('Harry', 'Bet', 42);
insert into dbo.Customer (FirstName, LastName, Age) 
	values('Karren', 'Tedy', 34);
insert into dbo.Customer (FirstName, LastName, Age) 
	values('Lassy', 'Sams', 74);
insert into dbo.Customer (FirstName, LastName, Age) 
	values('Kis', 'Dams', 31);
*/

/*
Selecting all

select * from Customer
*/

/*
select column 

select FirstName from Customer
*/

/*
select two column 

select FirstName, LastName from Customer
*/

/*
select with condtion

select FirstName, LastName from Customer
where FirstName ='Lassy'

select FirstName, Age from Customer
where age > 20
*/

/*
And, Or Statments Combine, Like Statments look for subStrings

select FirstName, Age from Customer
where age > 20  and FirstName like '%arr%'

will look for people with arr anywhere in their first name
*/

/*
Chages the age 

update Customer 
set Age = 20
where FirstName = 'Joey' and LastName = 'Adams'
select * from Customer
*/


/*
Deletes 

Delete customer - Deletes all data in table 
*/

/*
Delets specifci entries 

delete Customer 
where age < 21
select * from Customer
*/

/*
Add coulmn to table 

alter table Customer 
add City varchar(50)
select * from Customer 

update Customer
set City = 'New York'
select * from Customer
*/

/*
Deletes table
drop table Customer 
*/

/*
Adds primary key with self updating identity starting at 1 increasing by 1 

create table Customer(
	CustomerId int Primary Key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	Age int,
	City varchar(50)
)
*/


/*New table 
create table Products(
	ProductId int primary key identity(1,1),
	ProductName varchar(50)

alter table Products add Price float; 

insert into Products (ProductName, Price) values ('Ball', 5.63)
insert into Products (ProductName, Price) values ('Hat', 10.99)
insert into Products (ProductName, Price) values ('Shirt', 23.53)

select * from Products
)
*/

/*
Another table 

create table Orders(
	OrderId int primary key identity(1,1),
	OrderDate Datetime,
	CustomerID int,
	ProductID int
)
*/


/*
Inserting based on other tables 
insert into Orders (OrderDate, CustomerID, ProductID) values (GetDate(), 2,3)
insert into Orders (OrderDate, CustomerID, ProductID) values (GetDate(), 3,1)
insert into Orders (OrderDate, CustomerID, ProductID) values (GetDate(), 1,2)

select * from Customer
select * from Products
select * from Orders
*/

/*
Foreing Keys 
alter table orders 
add foreign key (CustomerId) references Customer(CustomerId)
add foreign key (ProductId) references Products(ProductId)
*/

/*
Joins

select * from Orders inner join Products on Orders.ProductId = Products.ProductId
*/

/*
Alias names

select o.*, p.*, c.*
from Orders o 
	inner join Products p on o.ProductID = p.ProductId
	inner join Customer c on o.ProductID = c.CustomerId
*/

/*
Getting specific columns

select o.OrderDate, p.ProductName, c.FirstName, c.LastName
from Orders o 
	inner join Products p on o.ProductID = p.ProductId
	inner join Customer c on o.ProductID = c.CustomerId
where age > 20
*/

/*
Group By - sum lets you sum up the int and name next to in will name the column

select o.OrderDate, p.ProductName, c.FirstName, c.LastName, p.ProductId, sum(p.Price) Total 
from Orders o 
	inner join Products p on o.ProductID = p.ProductId
	inner join Customer c on o.ProductID = c.CustomerId
where age > 20
*/



