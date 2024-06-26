USE [TecnoNic_DW]
GO
/****** Object:  StoredProcedure [dbo].[Load_DimAreaEnvio]    Script Date: 11/6/2024 23:11:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[Load_DimAreaEnvio]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @EndOfTime datetime = '9999-12-31';
    DECLARE @LastDateLoaded datetime;

    BEGIN TRAN;

    DECLARE @LineageKey int = (SELECT TOP(1) [LineageKey]
                               FROM int.Lineage
                               WHERE [TableName] = N'dim_AreaEnvio'
                               AND [FinishLoad] IS NULL
                               ORDER BY [LineageKey] DESC);

    UPDATE initial
    SET initial.[Valid To] = modif.[Valid From]
    FROM 
        dim_AreaEnvio AS initial INNER JOIN 
        Staging_AreaEnvio AS modif ON initial.[_Source Key] = modif.[_Source Key]
    WHERE initial.[Valid To] = @EndOfTime;

    IF NOT EXISTS (SELECT 1 FROM dim_AreaEnvio WHERE [_Source Key] = '')
        INSERT dim_AreaEnvio
               ([_Source Key], [Area], [Costo Envio], 
                [Valid From], [Valid To], [Lineage Key])
        VALUES ('', 'Unknown', 0, 
                '1753-01-01', '9999-12-31', -1);

    INSERT dim_AreaEnvio
           ([_Source Key], [Area], [Costo Envio], 
            [Valid From], [Valid To], [Lineage Key])
    SELECT  [_Source Key], [Area], [Costo Envio], 
            [Valid From], [Valid To], @LineageKey
    FROM staging_AreaEnvio;

    UPDATE [int].Lineage
        SET 
            FinishLoad = SYSDATETIME(),
            Status = 'S',
            @LastDateLoaded = LastLoadedDate
    WHERE [LineageKey] = @LineageKey;

    UPDATE [int].[IncrementalLoads]
        SET [LoadDate] = @LastDateLoaded
    WHERE [TableName] = N'dim_AreaEnvio';

    COMMIT;

    RETURN 0;
END;
