use AdventureWorks2012
go
/*
1.Nombre del producto, c�digo y precio, ordenado de mayor a menor precio
*/
select Name as Nombre, ProductID as Codigo, ListPrice as Precio 
from Production.Product
order by ListPrice desc
/*
2.N�mero de direcciones de cada Estado/Provincia
*/
select StateProvinceID as EstadoProvincia,count (*) as NumerodeDirecciones
from Person.Address
group by StateProvinceID
/*
3.Nombre del producto, c�digo, n�mero, tama�o y peso de los productos que estaban a 
la venta durante todo el mes de septiembre de 2002. No queremos que aparezcan aquellos cuyo peso sea superior a 
2000 ni los que su tama�o sea superior a 500.
*/
select name as Nombre, ProductID as Codigo, ProductNumber as Numero, Size as tama�o, Weight as Peso
from Production.Product
where (Weight < 2000) and SellStartDate < DATEFROMPARTS(2002,09,01) and (SellEndDate > DATEFROMPARTS(2002,10,1) or SellEndDate is NULL)
/*
4.Margen de beneficio de cada producto (Precio de venta menos el coste), y porcentaje que supone respecto del precio de venta.
*/
select (ListPrice-StandardCost) as Beneficio,((ListPrice-StandardCost)*ListPrice)/100 as Porcentaje
from Production.Product
where ListPrice <> 0

/*
5.N�mero de productos de cada categor�a
*/
select ProductSubcategoryID as categoria, count(ProductID) as Numerodeproductos
from Production.Product
where ProductSubcategoryID IS NOT NULL
group by ProductSubcategoryID
/*
6.Igual a la anterior, pero considerando las categor�as generales (categor�as de categor�as).
*/
/*
7.N�mero de unidades vendidas de cada producto cada a�o.
*/
select DATEPART (YEAR,ModifiedDate) as a�o, ProductID, Sum(OrderQty) as unidadesvendidas
from Sales.SalesOrderDetail
group by ProductID, DATEPART (YEAR,ModifiedDate)
order by ProductID
/*
8.Nombre completo, compa��a y total facturado a cada cliente
*/
select v.FirstName as nombre, v.LastName, v.MiddleName
from Person.Person as v
inner join sales.customer as cus
on CustomerID=BusinessEntityID
/*
9.N�mero de producto, nombre y precio de todos aquellos en cuya descripci�n aparezcan las palabras "race�, "competition� o "performance�
*/