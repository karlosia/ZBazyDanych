CREATE TABLE [dbo].[DatabaseAuditLog] (
    [LogID]     INT            IDENTITY (1, 1) NOT NULL,
    [EventTime] DATETIME       DEFAULT (getdate()) NULL,
    [UserName]  NVARCHAR (100) NULL,
    [EventType] NVARCHAR (100) NULL,
    [Notes]     NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

