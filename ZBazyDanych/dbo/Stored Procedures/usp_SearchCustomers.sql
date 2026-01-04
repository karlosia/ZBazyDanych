CREATE   PROCEDURE dbo.usp_SearchCustomers
    @FirstName    NVARCHAR(50) = NULL,               
    @LastName     [K4_surname].[TypNazwiska] = NULL, 
    @CustomerId   INT = NULL,                        
    @EmailAddress NVARCHAR(50) = NULL                --
AS
BEGIN
    SET NOCOUNT ON; 
    SELECT * FROM [233664].Customer
    WHERE 
        (@FirstName IS NULL OR FirstName = @FirstName) AND
        (@LastName IS NULL OR LastName = @LastName) AND
        (@CustomerId IS NULL OR CustomerID = @CustomerId) AND
        (@EmailAddress IS NULL OR EmailAddress = @EmailAddress);
END;