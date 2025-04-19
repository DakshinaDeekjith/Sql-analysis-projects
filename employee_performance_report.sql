
use AdventureWorks2022

SELECT
p.firstname,p.lastname,p.title,soh.SalesPersonID,count(soh.salesorderid) as total_orders, sum(soh.totaldue) as total_sales
from person.Person as p join sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate
join Sales.SalesOrderHeader as soh on soh.ModifiedDate=sp.ModifiedDate
where YEAR(soh.OrderDate) = 2013
group by p.firstname,soh.SalesPersonID,p.lastname,p.title
order by total_sales Desc

select * from Sales.SalesOrderHeader


select  p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh where soh.ModifiedDate=sp.modifiedDate
and YEAR(soh.OrderDate)=2011) as totalsales
from Person.Person as p join Sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate



select Top 5 p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh where soh.ModifiedDate=sp.modifiedDate
and YEAR(soh.OrderDate)=2011) as totalsales
from Person.Person as p join Sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate


select  p.firstname,p.lastname,p.title,(select sum(soh.totaldue) from sales.SalesOrderHeader as soh where soh.ModifiedDate=sp.modifiedDate
and YEAR(soh.OrderDate)=2011) as totalsales
from Person.Person as p join Sales.SalesPerson as sp on p.ModifiedDate=sp.ModifiedDate
order by p.FirstName desc
offset 3 rows
fetch next 10 rows only