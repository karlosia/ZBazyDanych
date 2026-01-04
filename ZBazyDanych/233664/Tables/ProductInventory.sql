CREATE TABLE [233664].[ProductInventory] (
    [ProductID]    INT      NOT NULL,
    [Quantity]     INT      NOT NULL,
    [ModifiedDate] DATETIME DEFAULT (getdate()) NULL
);

