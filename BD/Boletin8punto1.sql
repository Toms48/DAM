--1. Nombre del pa�s y n�mero de clientes de cada pa�s, ordenados alfab�ticamente por el nombre del pa�s.
SELECT * FROM Customers

SELECT Country, COUNT (CustomerID) AS NumeroClientes
	FROM Customers
	GROUP BY Country
	ORDER BY Country


--2. ID de producto y n�mero de unidades vendidas de cada producto. 
SELECT * FROM [Order Details]

SELECT ProductID, SUM (Quantity) AS UnidadesVendidas 
	FROM [Order Details]
	GROUP BY ProductID

--3. ID del cliente y n�mero de pedidos que nos ha hecho.
SELECT * FROM Orders

SELECT CustomerID, COUNT(OrderID) AS NumeroPedidos
	FROM Orders
	GROUP BY CustomerID

--4. ID del cliente, a�o y n�mero de pedidos que nos ha hecho cada a�o.
SELECT * FROM Orders

SELECT CustomerID, COUNT (CustomerID) AS [N�mero de pedidos], YEAR(OrderDate) AS [A�o de pedido]
	FROM Orders
	GROUP BY CustomerID, YEAR(OrderDate)
	ORDER BY CustomerID

--*******PREGUNTAR*******--
--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.
SELECT * FROM [Order Details]

SELECT DISTINCT ProductID, MAX (UnitPrice) [m�XIMO PRECIO UNITARIO], (Quantity * UnitPrice) AS [Total facturado]
	FROM [Order Details]
	GROUP BY ProductID, Quantity, UnitPrice
	ORDER BY (Quantity * UnitPrice) DESC

--6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.
SELECT (SupplierID), UnitPrice, UnitsInStock FROM Products

SELECT (SupplierID), SUM (UnitPrice*UnitsInStock) AS [Importe total del stock acumulado]
	FROM Products
	GROUP BY SupplierID

--7. N�mero de pedidos registrados mes a mes de cada a�o.
SELECT * FROM Orders

SELECT YEAR(OrderDate) AS [A�o del pedido], MONTH(OrderDate) AS [Mes del pedido], COUNT (OrderID) AS [N�mero de pedidos]
	FROM Orders
	GROUP BY MONTH(OrderDate), YEAR(OrderDate)
	ORDER BY YEAR(OrderDate) ASC

--8. A�o y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShippedDate), en d�as para cada a�o.
SELECT * FROM Orders

SELECT YEAR(OrderDate) AS [A�o del pedido], AVG(DAY(OrderDate - ShippedDate)) AS [Tiempo medio transcurrido (en d�as)]
	FROM Orders
	GROUP BY YEAR(OrderDate)
	ORDER BY YEAR(OrderDate) ASC

--9. ID del distribuidor y n�mero de pedidos enviados a trav�s de ese distribuidor.
SELECT * FROM Products

SELECT SupplierID, SUM (UnitsOnOrder) AS [N�mero de pedidos]
	FROM Products
	GROUP BY SupplierID

--10. ID de cada proveedor y n�mero de productos distintos que nos suministra.
SELECT * FROM Products
	ORDER BY SupplierID

SELECT SupplierID, COUNT (ProductID) AS [N�mero de productos distintos]
	FROM Products
	GROUP BY SupplierID