--1.1
SELECT c.CustomerID, c.CompanyName, 
    --Address Fields
    CONCAT(c.Address, ', ', c.City, ', ', c.PostalCode, ', ', c.Country) AS "Company Address" 
FROM Customers c
WHERE c.City In('Paris','London');

--1.2
SELECT p.ProductName
FROM Products p
--Any product stored in bottles
WHERE p.QuantityPerUnit LIKE '%bottle%';

--1.3
SELECT p.ProductName, s.CompanyName AS "Supplier Name" , s.Country
FROM Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
WHERE p.QuantityPerUnit LIKE '%bottle%';

--1.4
SELECT c.CategoryName,
    COUNT(p.CategoryID) AS "Num Products"
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY c.CategoryName DESC;

--1.5
SELECT CONCAT(e.TitleOfCourtesy, e.FirstName, ' ', e.LastName) AS "Employee Name", e.City
FROM Employees e
WHERE e.Country = 'UK'

--1.6
SELECT r.RegionDescription AS "Region", 
    --Format a comma after every 3 0's for readability
    FORMAT(SUM(od.UnitPrice * od.Quantity * (1-Discount)), 'N') AS "Sales Totals by Region"
FROM Region r
INNER JOIN Territories t
ON r.RegionID = t.RegionID
INNER JOIN EmployeeTerritories et
ON t.TerritoryID = et.TerritoryID
INNER JOIN Orders o
ON o.EmployeeID = et.EmployeeID
INNER JOIN [Order Details] od
on od.OrderID = o.OrderID
--Filter for regions with sales totals only > 1,000,000
GROUP BY r.RegionDescription HAVING SUM(od.UnitPrice * od.Quantity * (1-Discount)) > 1000000;

SELECT * FROM Orders


--1.7
SELECT COUNT(o.OrderID) AS "Orders > 100 & in UK/USA"
FROM Orders o
WHERE o.Freight > 100
AND o.ShipCountry IN('USA', 'UK');


--1.8
SELECT TOP 1 od.OrderID, SUM(od.UnitPrice * od.Quantity * od.Discount) AS "Discounted Value"
FROM [Order Details] od
GROUP BY od.OrderID
ORDER BY "Discounted Value" DESC

-------------------------------------------------------------------

--2.1
CREATE DATABASE connor_db;
USE connor_db;

DROP TABLE IF EXISTS Spartans
CREATE TABLE Spartans
(
    title VARCHAR(40),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    university_attended VARCHAR(30),
    course_taken VARCHAR(30),
    --Where 1.00 = %100. Allows up to 2 decimal places
    mark_achieved DECIMAL(3,2)
);
SP_HELP Spartans;

--2.2
INSERT INTO Spartans
VALUES
(
    'DummyTitle1', 'DummyFirstName1', 'DummyLastName1', 'DummyUniversity1', 'JAVA SDET', '20'
),(
    'Junior Java Dev Consultant', 'Thomas', 'Andrews', 'Birmingham University', 'Java Development', '92'
),(
    'Junior C# SDET Consultant', 'Alice', 'Bobbington', 'Surry University', 'C# SDET', '82'
)
SELECT * FROM Spartans;

----------------------------------------------------------------------------------------------------------

--3.1
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS "Employee Name",
    CONCAT(e2.FirstName, ' ', e2.LastName) AS "Reports To"
FROM Employees e
LEFT JOIN Employees e2
ON e.ReportsTo = e2.EmployeeID;

--3.2
SELECT s.CompanyName AS "Supplier Name", 
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS "Total Sales" 
FROM Suppliers s
INNER JOIN Products p
ON s.SupplierID = p.SupplierID
INNER JOIN [Order Details] od
ON p.ProductID = od.ProductID
GROUP BY s.CompanyName HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) > 10000
ORDER BY "Total Sales";

--3.3
                                           --Get exact value of each order - including applied discounts
SELECT TOP 10 c.CompanyName AS "Customers YTD", SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) AS "Total Value of Orders Shipped"
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
--Latest year is 1998, want all orders within that year
WHERE DATEDIFF(YEAR, o.OrderDate, '01/01/1998') < 1
GROUP BY c.CompanyName
--Order by most to least value to get the 10 most valuable customers
ORDER BY "Total Value of Orders Shipped" DESC

--3.4
SELECT CONCAT(MONTH(o.OrderDate), ', ', YEAR(o.OrderDate)) AS "Order Date",
    AVG(DATEDIFF(DAY, o.OrderDate, o.ShippedDate)) AS "Avg Ship Time"
FROM Orders o
WHERE o.ShippedDate IS NOT NULL
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate) 
ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate)