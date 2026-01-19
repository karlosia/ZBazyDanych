
CREATE TRIGGER trg_Database_SchemaAudit
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.DatabaseAuditLog (UserName, EventType, Notes)
    VALUES (USER_NAME(), 'DDL_EVENT', 'Wykryto zmiane struktury tabeli (CREATE/ALTER/DROP)');
    PRINT 'Zmiana struktury bazy została odnotowana w logu.';
END;