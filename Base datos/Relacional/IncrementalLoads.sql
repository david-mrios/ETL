CREATE TABLE [int].[IncrementalLoads] (
    [LoadDateKey] INT            IDENTITY (1, 1) NOT NULL,
    [TableName]   NVARCHAR (100) NOT NULL,
    [LoadDate]    DATETIME       NOT NULL,
    CONSTRAINT [PK_LoadDates] PRIMARY KEY CLUSTERED ([LoadDateKey] ASC)
);



