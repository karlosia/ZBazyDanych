
CREATE FUNCTION Student_4.ufn_ProductsJson (@CategoryName NVARCHAR(50))
RETURNS NVARCHAR(MAX) AS
BEGIN
DECLARE @JsonResult NVARCHAR(MAX);
SET @JsonResult = (SELECT p.ProductID, p.Name AS ProductName, p.ListPrice, p.Color, pc.Name AS CategoryName
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = @CategoryName
FOR JSON PATH);

RETURN @JsonResult;

END