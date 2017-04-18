use Northwind
go
/*
Nombre de los proveedores y n�mero de productos que nos vende cada uno
*/
select s.CompanyName, count (p.ProductID) as NumeroDeProductos
from Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
Group by s.CompanyName
/*
Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.
*/
select distinct e.FirstName,e.LastName, HomePhone, te.TerritoryDescription
from Employees as e 
inner join EmployeeTerritories as ete
on e.EmployeeID=ete.EmployeeID
inner join Territories as te
on ete.TerritoryID=te.TerritoryID
where te.TerritoryDescription in ('New York','Seattle', 'Vermont','Columbia','Los Angeles','Redmond', 'Atlanta')
/*
N�mero de productos de cada categor�a y nombre de la categor�a.
*/
select CategoryName as NombreCategoria, count(p.ProductID) as NumerodeProductos
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID
group by c.CategoryName
/*
Nombre de la compa��a de todos los clientes que hayan comprado queso de cabrales o tofu.
*/

select c.CompanyName as NombreCompa�ia

from Products as p
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
inner join Customers as c
on o.CustomerID=c.CustomerID

where p.ProductID = 11 or p.ProductID = 14
/*
Empleados (ID, nombre, apellidos y tel�fono) que han vendido algo a Bon app' o Meter Franken.
*/

select distinct em.EmployeeID as IDEmpleado, em.FirstName, em.LastName, em.HomePhone as Telefono
from Employees as em
inner join Orders as o
on em.EmployeeID=o.EmployeeID
inner join Customers as c
on o.CustomerID=c.CustomerID

where o.CustomerID in ('FRANK', 'Bon app')

/*
Empleados (ID, nombre, apellidos, mes y d�a de su cumplea�os) que no han vendido nunca nada a ning�n cliente de Francia. 
*/
select distinct em.EmployeeID as IDEmpleado, em.FirstName, em.LastName, DATENAME(MONTH,em.BirthDate) as MesCumple,DATEPART(day,em.BirthDate) as diaCumple
from Employees as em
inner join Orders as o
on em.EmployeeID=o.EmployeeID
inner join Customers as c
on o.CustomerID=c.CustomerID

where o.ShipCountry not in ('France')
/*
Total de ventas en US de productos de cada categor�a (nombre de la categor�a).
*/
select c.CategoryID as NombreCategoria, count(od.OrderID) as TotalVentas
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where o.ShipCountry like ('USA')
group by c.CategoryID
order by c.CategoryID
/*
Total de ventas en USA de cada empleado cada a�o (nombre, apellidos, direcci�n).
*/
select e.FirstName,e.LastName,e.Address,count (od.OrderID) as TotalVentas
from Products as p
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
inner join Employees as e
on o.EmployeeID=e.EmployeeID
where o.ShipCountry like ('USA')
group by e.FirstName, e.LastName, e.Address

/*
Ventas de cada producto en el a�o 97. Nombre del producto y unidades.
*/
select p.ProductName, sum(Quantity) as Unidades
from Products as p
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where DATEPART(YEAR,o.OrderDate) = 1997
group by p.ProductName

/*
Cu�l es el producto del que hemos vendido m�s unidades en cada pa�s. 
*/
/*select o.ShipCountry, p.ProductName
from Products as p
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
group by p.ProductName
HAVING sum(od.Quantity)*/

/*
Empleados (nombre y apellidos) que trabajan a las �rdenes de Andrew Fuller.
*/

select empl.FirstName, empl.LastName
from Employees as boss
inner join Employees as empl
on boss.EmployeeID=empl.ReportsTo
where boss.FirstName = 'Andrew' and boss.LastName='Fuller'
/*
N�mero de subordinados que tiene cada empleado, incluyendo los que no tienen ninguno. Nombre, apellidos, ID.
*/
select boss.FirstName, boss.LastName,boss.EmployeeID,count(empl.ReportsTo) as NumerodeEmpleados
from Employees as boss
left join Employees as empl
on boss.EmployeeID=empl.ReportsTo


group by boss.FirstName, boss.LastName,boss.EmployeeID


/*
* Se necesitan subconsultas
*/