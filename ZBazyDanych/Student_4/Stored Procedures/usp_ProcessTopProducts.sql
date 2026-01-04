
CREATE   PROCEDURE [Student_4].usp_ProcessTopProducts
@Summary dbo.SummaryTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;

SELECT ProductID, (ListPrice - (ListPrice * 0.04)) AS ModifiedPrice
FROM #TopProducts;

END;