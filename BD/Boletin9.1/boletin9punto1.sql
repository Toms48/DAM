--1. Nombre de los proveedores y n�mero de productos que nos vende cada uno
SELECT * FROM Suppliers
SELECT * FROM Products
/*SELECT COUNT (ProductID) AS [N�mero de productos que vende cada uno]
	FROM Products
	GROUP BY SupplierID*/

SELECT s.ContactName, COUNT (ProductID) AS [N�mero de productos que vende cada uno]
	FROM Suppliers AS s
	INNER JOIN Products AS p
	ON s.SupplierID = p.SupplierID
	GROUP BY ContactName



--2. Nombre completo y telefono de los vendedores que trabajen en New York, Seattle, Vermont, Columbia, Los Angeles, Redmond o Atlanta.
SELECT * FROM Employees
SELECT * FROM EmployeeTerritories
SELECT * FROM Territories
	WHERE TerritoryDescription IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')

SELECT e.FirstName, e.LastName, e.HomePhone, t.TerritoryDescription
	FROM Employees AS e
	INNER JOIN EmployeeTerritories AS et
	ON e.EmployeeID = et.EmployeeID
	INNER JOIN Territories AS t
	ON et.TerritoryID = t.TerritoryID
		WHERE TerritoryDescription IN ('New York', 'Seattle', 'Vermont', 'Columbia', 'Los Angeles', 'Redmond', 'Atlanta')


--3. N�mero de productos de cada categor�a y nombre de la categor�a.
SELECT * FROM Products

SELECT COUNT (p.CategoryID) AS [Cantidad por categor�a], c.CategoryName AS [Nombre de la categor�a]
	FROM Products AS p
	INNER JOIN Categories AS c
	ON p.CategoryID = c.CategoryID
		GROUP BY c.CategoryName


--4. Nombre de la compa��a de todos los clientes que hayan comprado queso de cabrales o tofu.
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products
--SELECT ProductName FROM Products WHERE ProductName IN ('Queso Cabrales', 'Tofu')

SELECT c.CompanyName--, p.ProductName
	FROM Customers AS c
	INNER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
	INNER JOIN [Order Details] AS od
	ON o.OrderID = od.OrderID
	INNER JOIN Products AS p
	ON od.ProductID = p.ProductID
		WHERE p.ProductName IN ('Queso Cabrales', 'Tofu')


--5. Empleados (ID, nombre, apellidos y tel�fono) que han vendido algo a Bon app' o Meter Franken.
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM Customers
--SELECT * FROM Customers WHERE CompanyName IN ('Bon app''')

SELECT e.EmployeeID, e.FirstName, e.LastName, e.HomePhone--, c.CompanyName
	FROM Employees AS e
	INNER JOIN Orders AS o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID
		WHERE c.CompanyName IN ('Bon app''')


--6. Empleados (ID, nombre, apellidos, mes y d�a de su cumplea�os) que no han vendido nunca nada a ning�n cliente de Francia. *
SELECT * FROM Employees
SELECT * FROM Orders
--SELECT DISTINCT ShipCountry FROM Orders WHERE ShipCountry NOT IN ('France')

SELECT e.EmployeeID, e.FirstName, e.LastName, MONTH(e.BirthDate) AS [Mes de nacimiento], DAY(e.BirthDate) AS [D�a de nacimiento], o.ShipCountry
	FROM Employees AS e
	INNER JOIN Orders AS o
	ON e.EmployeeID = o.EmployeeID
		WHERE ShipCountry NOT IN ('France')

--7. Total de ventas en US$ de productos de cada categor�a (nombre de la categor�a).
SELECT * FROM Products
SELECT * FROM [Order Details]

SELECT (UnitPrice*Quantity)-(UnitPrice*Quantity*Discount) AS [Total en US$] FROM [Order Details]
