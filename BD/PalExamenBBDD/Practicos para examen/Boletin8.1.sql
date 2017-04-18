use Northwind
go
/*
1. Nombre del pa�s y n�mero de clientes de cada pa�s, ordenados alfab�ticamente por el nombre del pa�s.
*/
select Country,count (*) as Numero_Clientes
from Customers
group by Country
order by Country
/*
2. ID de producto y n�mero de unidades vendidas de cada producto. 
*/
select ProductID, SUM(Quantity) as Unidades_Vendidas
from [Order Details]
group by ProductID
order by ProductID


/*
3. ID del cliente y n�mero de pedidos que nos ha hecho.
*/

select CustomerID, count(Orderid) as Numero_de_Pedidos
from Orders
group by CustomerID
order by CustomerID
/*
4. ID del cliente, a�o y n�mero de pedidos que nos ha hecho cada a�o.
*/
select CustomerID, YEAR(OrderDate) as a�o,  count(Orderid) as Numero_de_Pedidos
from Orders
group by YEAR(OrderDate), CustomerID
order by CustomerID
/*
5. ID del producto, precio unitario y total facturado de ese producto, 
ordenado por cantidad facturada de mayor a menor.
 Si hay varios precios unitarios para el mismo producto tomaremos el mayor.
*/
select ProductID, max(UnitPrice)as precio_unitario, sum(quantity*UnitPrice) as TotalFacturado
from [Order Details] 
Group by ProductID
order by TotalFacturado DESC 

/*
6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.
*/
select SupplierID, SUM( UnitPrice* UnitsInStock) as Importe_total
from Products
group by SupplierID

/*
7. N�mero de pedidos registrados mes a mes de cada a�o.
*/
select YEAR (OrderDate) as a�o,MONTH(OrderDate) as Mes,COUNT(*) as PedidosRegistrados
from Orders
group by YEAR (OrderDate), MONTH(OrderDate)
order by YEAR (OrderDate), MONTH(OrderDate)
/*
8. A�o y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha 
en la que lo hemos enviado (ShipDate), en d�as para cada a�o.
*/
select Year (OrderDate) as a�o, AVG(DATEDIFF (DAY, OrderDate, ShippedDate)) as Tiempo_medio_transcurrido
from Orders
Group by Year (OrderDate)
order by Year (OrderDate)

/*
9. ID del distribuidor y n�mero de pedidos enviados a trav�s de ese distribuidor.
*/
select ShipVia, COUNT (OrderID) as Numero_Pedidos
from Orders
Group by ShipVia

/*
10. ID de cada proveedor y n�mero de productos distintos que nos suministra.
*/
select SupplierID as Proveedor, count(ProductID) as numero_de_productos
from Products
Group by SupplierID

