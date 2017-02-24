--1. N�mero de clientes de cada pa�s.
SELECT * FROM Employees

SELECT COUNT(EmployeeID) AS [N�mero de clientes], Country 
	FROM Employees
	GROUP BY Country


--2. N�mero de clientes diferentes que compran cada producto.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT DISTINCT ProductName, COUNT(CustomerID) AS [N�mero de clientes]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	GROUP BY ProductName


--3. N�mero de pa�ses diferentes en los que se vende cada producto.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT DISTINCT ProductName, COUNT(ShipCountry) AS [N�mero de paises]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	GROUP BY ProductName


--4. Empleados que han vendido alguna vez �Gudbrandsdalsost�, �Lakkalik��ri�, �Tourti�re� o �Boston Crab Meat�.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT ProductName, Count(e.EmployeeID) AS [N�mero de empleados]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	INNER JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	WHERE ProductName IN ('Gudbrandsdalsost','Lakkalik��ri','Tourti�re','Boston Crab Meat')
	GROUP BY ProductName

--5. Empleados que no han vendido nunca �Chartreuse verte� ni �Ravioli Angelo�.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT ProductName, Count(e.EmployeeID) AS [N�mero de empleados]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	INNER JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	GROUP BY ProductName

EXCEPT

SELECT ProductName, Count(e.EmployeeID) AS [N�mero de empleados]
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	INNER JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	WHERE ProductName IN ('Chartreuse verte','Ravioli Angelo')
	GROUP BY ProductName

--6. N�mero de unidades de cada categor�a de producto que ha vendido cada empleado.
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products
SELECT * FROM Categories

SELECT SUM(Quantity)AS [N�mero de Unidades], CategoryName
	FROM Categories AS ca
	INNER JOIN Products AS p
	ON ca.CategoryID = p.CategoryID
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	GROUP BY CategoryName

SELECT SUM(Quantity)AS [N�mero de Unidades], CategoryName, e.FirstName, e.LastName
	FROM Categories AS ca
	INNER JOIN Products AS p
	ON ca.CategoryID = p.CategoryID
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	INNER JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	GROUP BY e.EmployeeID, CategoryName, e.FirstName, e.LastName
	ORDER BY e.EmployeeID

--7. Total de ventas (US$) de cada categor�a en el a�o 97.


--8. Productos que han comprado m�s de un cliente del mismo pa�s, indicando el nombre del producto, el pa�s y el n�mero de clientes distintos de ese pa�s que lo han comprado.
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products

SELECT distinct ProductName, Country, COUNT(DISTINCT cu.CustomerID)  --Preguntar
	FROM  Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	INNER JOIN Customers AS cu
	ON o.CustomerID = cu.CustomerID
	GROUP BY ProductName, Country
	HAVING (COUNT(DISTINCT cu.CustomerID))>1
	ORDER BY COUNT(DISTINCT cu.CustomerID), Country
	

--9. Total de ventas (US$) en cada pa�s cada a�o.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT ROUND(SUM((od.UnitPrice*Quantity)-(od.UnitPrice*Quantity*Discount)),2) AS [Total en US$], ShipCountry, YEAR(OrderDate)
	FROM Products AS p
		INNER JOIN [Order Details] AS od
		ON p.ProductID = od.ProductID
		INNER JOIN Orders AS o
		ON od.OrderID = o.OrderID
		GROUP BY YEAR(OrderDate), ShipCountry 
		ORDER BY ShipCountry


--10. Producto superventas de cada a�o, indicando a�o, nombre del producto, categor�a y cifra total de ventas.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

/*SELECT ProductName, SUM(Quantity) AS [Cantidad m�xima], YEAR(OrderDate) as [A�o], CategoryID
				FROM Products AS p
				INNER JOIN [Order Details] AS od
				ON p.ProductID = OD.ProductID
				INNER JOIN Orders AS o
				ON od.OrderID = o.OrderID
				GROUP BY YEAR(OrderDate), ProductName, categoryID

SELECT total.[A�o], MAX(total.[Cantidad m�xima]) AS [Cifra total de ventas]
	FROM (SELECT ProductName, SUM(Quantity) AS [Cantidad m�xima], YEAR(OrderDate) as [A�o], CategoryID
				FROM Products AS p
				INNER JOIN [Order Details] AS od
				ON p.ProductID = OD.ProductID
				INNER JOIN Orders AS o
				ON od.OrderID = o.OrderID
				GROUP BY YEAR(OrderDate), ProductName, categoryID) AS total
	GROUP BY total.[A�o]*/

SELECT nomegustanlassubconsultas.A�o, paraporfavor.ProductName, paraporfavor.CategoryID, paraporfavor.[Cantidad m�xima]
	FROM (SELECT ProductName, SUM(Quantity) AS [Cantidad m�xima], YEAR(OrderDate) as [A�o], CategoryID
				FROM Products AS p
				INNER JOIN [Order Details] AS od
				ON p.ProductID = OD.ProductID
				INNER JOIN Orders AS o
				ON od.OrderID = o.OrderID
				GROUP BY YEAR(OrderDate), ProductName, categoryID) AS paraporfavor

	INNER JOIN (SELECT total.[A�o], MAX(total.[Cantidad m�xima]) AS [Cifra total de ventas]
					FROM (SELECT ProductName, SUM(Quantity) AS [Cantidad m�xima], YEAR(OrderDate) as [A�o], CategoryID
								FROM Products AS p
								INNER JOIN [Order Details] AS od
								ON p.ProductID = OD.ProductID
								INNER JOIN Orders AS o
								ON od.OrderID = o.OrderID
								GROUP BY YEAR(OrderDate), ProductName, categoryID) AS total
					GROUP BY total.[A�o]) AS nomegustanlassubconsultas

	ON paraporfavor.[Cantidad m�xima] = nomegustanlassubconsultas.[Cifra total de ventas]



--11. Cifra de ventas de cada producto en el a�o 97 y su aumento o disminuci�n respecto al a�o anterior en US $ y en %.
SELECT * FROM Products
SELECT * FROM [Order Details]
SELECT * FROM Orders

SELECT ROUND(SUM((od.UnitPrice*Quantity)-(od.UnitPrice*Quantity*Discount)),2) AS [Total en US$], YEAR(OrderDate) AS [A�o], ProductName 
	FROM Products AS p
	INNER JOIN [Order Details] AS od
	ON p.ProductID = od.ProductID
	INNER JOIN Orders AS o
	ON od.OrderID = o.OrderID
	GROUP BY YEAR(OrderDate), ProductName


--12. Mejor cliente (el que m�s nos compra) de cada pa�s.
--13. N�mero de productos diferentes que nos compra cada cliente.
--14. Clientes que nos compran m�s de cinco productos diferentes.
--15. Vendedores que han vendido una mayor cantidad que la media en US $ en el a�o 97.
--16. Empleados que hayan aumentado su cifra de ventas m�s de un 10% entre dos a�os consecutivos, indicando el a�o en que se produjo el aumento.