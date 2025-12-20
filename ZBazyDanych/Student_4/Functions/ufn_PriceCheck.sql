CREATE FUNCTION Student_4.ufn_PriceCheck()
RETURNS TABLE
AS
RETURN(SELECT p.ProductID, p.Name, p.ListPrice AS PriceInDatabase,

Student_4.ufn_IsPriceHigherThanCurrent((SELECT p.ProductID AS ProductID, (p.ListPrice * 1.1) AS ListPrice FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)) AS IsHigher
FROM SalesLT.Product AS p);