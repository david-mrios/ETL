CREATE PROCEDURE [int].[Get_LastLoadedDate]
@TableName nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	-- If the procedure is executed with a wrong table name, throw an error.
	IF NOT EXISTS(SELECT 1 FROM sys.tables WHERE name = @TableName AND type = N'U')
	BEGIN
        PRINT N'The table does not exist in the data warehouse.';
        THROW 51000, N'The table does not exist in the data warehouse.', 1;
        RETURN -1;
	END
	
    -- If the table exists, but was never loaded before, there won't be a record for it in the table
	-- A record is created for the @TableName, with the minimum possible date in the LoadDate column
	IF NOT EXISTS (SELECT 1 FROM [int].[IncrementalLoads] WHERE TableName = @TableName)
		INSERT INTO [int].[IncrementalLoads]
		SELECT @TableName, '1753-01-01'

    -- Select the LoadDate for the @TableName
	SELECT 
		[LoadDate] AS [LoadDate]
    FROM [int].[IncrementalLoads]
    WHERE 
		[TableName] = @TableName;



    RETURN 0;
END;