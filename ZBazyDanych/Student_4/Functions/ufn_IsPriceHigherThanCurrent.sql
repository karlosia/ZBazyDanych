CREATE FUNCTION Student_4.ufn_IsPriceHigherThanCurrent (@ProductJson NVARCHAR(MAX))
RETURNS NVARCHAR(5)
AS 
BEGIN
DECLARE @JsonPrice MONEY;
DECLARE @ProductId INT;
DECLARE @CurrentPrice MONEY;
DECLARE @Result NVARCHAR(5);

SET @ProductId = CAST(JSON_VALUE(@ProductJson, '$.ProductID') AS INT);
SET @JsonPrice = CAST(JSON_VALUE(@ProductJson, '$.ListPrice') AS MONEY);

SELECT @CurrentPrice = ListPrice 
FROM SalesLT.Product 
WHERE ProductID = @ProductId;

IF @JsonPrice > @CurrentPrice SET @Result = 'true'; 
ELSE
SET @Result = 'false'; 

RETURN @Result;
END