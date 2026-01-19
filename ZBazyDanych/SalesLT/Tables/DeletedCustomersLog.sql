CREATE TABLE [SalesLT].[DeletedCustomersLog] (
    [LogID]       INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT            NULL,
    [CompanyName] NVARCHAR (128) NULL,
    [LogDate]     DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

