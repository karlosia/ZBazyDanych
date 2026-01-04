
CREATE   PROCEDURE dbo.usp_AddNewProduct
@Name NVARCHAR(50),
@Category NVARCHAR(50),
@ListPrice MONEY,
@StockQuantity INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @ListPrice <= 0
    BEGIN
        THROW 50003, 'Cena musi byc dodatnia', 1;
    END

    IF @StockQuantity < 0
    BEGIN
        THROW 50004, 'Ilosc nie moze byc ujemna', 1;
    END

    BEGIN TRANSACTION;

    INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate, rowguid, ModifiedDate)
    VALUES (@Name, LEFT(CAST(NEWID() AS NVARCHAR(36)), 10), @ListPrice, @ListPrice, 1, GETDATE(), NEWID(), GETDATE());


    DECLARE @NewID INT;
    SELECT @NewID = ProductID FROM SalesLT.Product WHERE Name = @Name;

    INSERT INTO [233664].ProductInventory (ProductID, Quantity, ModifiedDate)
    VALUES (@NewID,@StockQuantity, GETDATE());

    COMMIT TRANSACTION;
    PRINT 'Produkt dodany pomyślnie';
END;