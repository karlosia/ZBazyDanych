CREATE TABLE [233664].[Customer] (
    [CustomerID]   INT                                         IDENTITY (1, 1) NOT NULL,
    [NameStyle]    [dbo].[NameStyle]                           CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)) NOT NULL,
    [Title]        NVARCHAR (8)                                NULL,
    [FirstName]    [dbo].[Name]                                NOT NULL,
    [MiddleName]   [dbo].[Name]                                NULL,
    [LastName]     [K4_surname].[TypNazwiska]                  NOT NULL,
    [Suffix]       NVARCHAR (10)                               NULL,
    [CompanyName]  NVARCHAR (128)                              NULL,
    [SalesPerson]  NVARCHAR (256)                              NULL,
    [EmailAddress] NVARCHAR (50)                               NULL,
    [Phone]        [dbo].[Phone]                               NULL,
    [PasswordHash] VARCHAR (128)                               NOT NULL,
    [PasswordSalt] VARCHAR (10)                                NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER                            CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate] DATETIME                                    CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    [SysStartTime] DATETIME2 (7) GENERATED ALWAYS AS ROW START DEFAULT (getutcdate()) NOT NULL,
    [SysEndTime]   DATETIME2 (7) GENERATED ALWAYS AS ROW END   DEFAULT ('9999-12-31 23:59:59.9999999') NOT NULL,
    CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC),
    PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[233664].[CustomerHistory], DATA_CONSISTENCY_CHECK=ON));








GO
CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
    ON [233664].[Customer]([EmailAddress] ASC);


GO
CREATE   TRIGGER [233664].trg_Customer_SimpleLog
ON [233664].Customer
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SalesLT.DeletedCustomersLog (CustomerID, CompanyName)
    SELECT d.CustomerID, d.CompanyName
    FROM deleted d;
END;