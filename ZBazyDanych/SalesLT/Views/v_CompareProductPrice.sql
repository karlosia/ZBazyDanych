CREATE VIEW SalesLT.v_CompareProductPrice AS
SELECT p.ProductID, p.Name, p.ListPrice AS CurrentPrice
FROM SalesLT.Product AS p;