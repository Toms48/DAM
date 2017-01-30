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

--5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.
SELECT * FROM [Order Details]

SELECT DISTINCT ProductID, MAX (UnitPrice) [m�XIMO PRECIO UNITARIO], (Quantity * UnitPrice) AS [Total facturado]
	FROM [Order Details]
	ORDER BY (Quantity * UnitPrice) DESC