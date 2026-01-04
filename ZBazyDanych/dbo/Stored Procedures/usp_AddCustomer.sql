
CREATE   PROCEDURE dbo.usp_AddCustomer
    @FirstName      NVARCHAR(50),
    @LastName       [K4_surname].[TypNazwiska],
    @CompanyName    NVARCHAR(128),
    @EmailAddress   NVARCHAR(50),
    @Phone          NVARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON; 
    SET XACT_ABORT ON;

    IF dbo.fn_CheckCustomerExists(@FirstName, @LastName, @EmailAddress) = 1
    BEGIN
        THROW 50001, 'Ten klient (email) już istnieje w bazie!', 1;
    END

    INSERT INTO [233664].Customer (FirstName, LastName, CompanyName, EmailAddress, Phone, PasswordHash, PasswordSalt, rowguid, ModifiedDate)
    VALUES (@FirstName, @LastName, @CompanyName, @EmailAddress, @Phone, 'Hash', 'Salt', NEWID(), GETDATE()
    );
END;