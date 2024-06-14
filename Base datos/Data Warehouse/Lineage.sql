CREATE TABLE [int].[Lineage] (
    [LineageKey]     INT            IDENTITY (1, 1) NOT NULL,
    [TableName]      NVARCHAR (200) NOT NULL,
    [StartLoad]      DATETIME       NOT NULL,
    [FinishLoad]     DATETIME       NULL,
    [LastLoadedDate] DATETIME       NOT NULL,
    [Status]         NVARCHAR (1)   CONSTRAINT [DF_Lineage_Status] DEFAULT (N'P') NOT NULL,
    [Type]           NVARCHAR (1)   CONSTRAINT [DF_Lineage_Type] DEFAULT (N'F') NOT NULL,
    CONSTRAINT [PK_Integration_Lineage] PRIMARY KEY CLUSTERED ([LineageKey] ASC)
);









