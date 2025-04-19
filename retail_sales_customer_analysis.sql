

CREATE DATABASE RetailSalesDB;

use RetailSalesDB

create table Productss(Product_Id int primary Key , Product_name Varchar(100), Category Varchar(100), Price Decimal(10,2)) 

CREATE TABLE Saless (
Salesid int primary Key,
Productid int,
Customerid int,
SaleDate datetime,
Quantity int,
foreign key(productID)references productss(product_id))
 

create table customers (customerid int primary key , firstname char(10), lastname char(10))
INSERT INTO Productss(product_id , Product_name , Category , Price ) VALUES
(1, 'Laptop', 'Electronics', 1000),
(2, 'Smartphone', 'Electronics', 500),
(3, 'Headphones', 'Accessories', 150),
(4, 'Mouse', 'Accessories', 25);

INSERT INTO customers VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Bob', 'Johnson');

insert into Saless values
(1, 1, 1, '2023-08-01', 2),
(2, 2, 2, '2023-08-02', 1),
(3, 3, 1, '2023-08-03', 3),
(4, 4, 3, '2023-08-04', 4)

select * from Productss

select customerid , firstname,lastname from customers

select s. salesid,p.Product_name,c.firstname,c.lastname
from Saless as s inner join Productss as p on s.productid=p.product_Id
inner join customers as c on s.Customerid = c.customerid order by s.saledate

select p.product_name ,sum(s.quantity) as totalsales
from saless as s inner join Productss as p on s.productid=p.Product_Id
group by p.product_name
order by totalsales

select c.firstname, c.lastname, count(s.salesid) as numberofpurchaces
from Saless as s inner join customers as c on s.customerid=c.customerid
group by c.firstname,c.lastname
order by numberofpurchaces desc

select product_name from Productss where Product_Id in ( select Product_Id from Saless group by productid having sum (quantity)>1)

select s.salesid,p.Product_Id,p.Product_name,c.firstname,s.Quantity
from Saless as s inner join Productss as p on s.Productid=p.Product_Id
inner join customers as c on s.Customerid=c.customerid
order by s.saledate
offset 10 rows fetch next 10 rows only

select p.Category , count(distinct c.customerid) as total_customers 
from Saless as s inner join productss as p on s.productid=p.Product_Id
inner join customers as c on s.Customerid = c.customerid
group by p.Category






