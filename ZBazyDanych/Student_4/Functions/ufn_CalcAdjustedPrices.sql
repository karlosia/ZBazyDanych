
CREATE   FUNCTION Student_4.ufn_CalcAdjustedPrices
(@InputTable Student_4.TopProductsType READONLY)
RETURNS @Summary TABLE (ProductID INT, ProductName NVARCHAR(50), OriginalPrice MONEY, AdjustedPrice MONEY)
AS
BEGIN
INSERT INTO @Summary (ProductID, ProductName, OriginalPrice, AdjustedPrice)
SELECT ProductID, Name, ListPrice, (ListPrice - (ListPrice * 0.04))
FROM @InputTable;

RETURN;
END