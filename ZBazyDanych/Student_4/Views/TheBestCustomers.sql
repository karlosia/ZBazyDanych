
CREATE VIEW Student_4.TheBestCustomers AS
SELECT TOP 15 c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, c.CompanyName,
SUM(soh.TotalDue) AS LifetimeValue
FROM [233664].Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName,c.LastName,c.CompanyName
ORDER BY LifetimeValue DESC;