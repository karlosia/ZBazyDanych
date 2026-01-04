CREATE   FUNCTION dbo.fn_CheckCustomerExists
(@FirstName NVARCHAR(50),@LastName [K4_surname].[TypNazwiska], @Email NVARCHAR(50)
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;
    IF EXISTS (SELECT 1 FROM [233664].Customer WHERE EmailAddress = @Email)
        SET @Result = 1;
    ELSE
        SET @Result = 0;
    RETURN @Result;
END;