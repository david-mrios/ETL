USE [TecnoNic_DW]
GO
/****** Object:  StoredProcedure [dbo].[Load_DimProducto]    Script Date: 11/6/2024 23:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or alter PROCEDURE [dbo].[Load_DimProducto]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @EndOfTime datetime = '9999-12-31';
    DECLARE @LastDateLoaded datetime;

    BEGIN TRAN;

    DECLARE @LineageKey int = (SELECT TOP(1) [LineageKey]
                               FROM int.Lineage
                               WHERE [TableName] = N'dim_Producto'
                               AND [FinishLoad] IS NULL
                               ORDER BY [LineageKey] DESC);

    UPDATE initial
    SET initial.[Valid To] = modif.[Valid From]
    FROM 
        dim_Producto AS initial INNER JOIN 
        staging_Producto AS modif ON initial.[_Source Key] = modif.[_Source Key]
    WHERE initial.[Valid To] = @EndOfTime;

    IF NOT EXISTS (SELECT 1 FROM dim_Producto WHERE [Nombre] = '')
        INSERT dim_Producto
               ( [Nombre],[_Source Key], [Fecha Agregado], [Dimensiones], [Peso], 
                [Nombre Categoria], [Nombre Marca], [Valid From], [Valid To], [Lineage Key])
        VALUES ('Unknown','', '1753-01-01', 'Unknown', 0, 
                'Unknown', 'Unknown', '1753-01-01', '9999-12-31', -1);

    INSERT dim_Producto
           ( [Nombre],[_Source Key], [Fecha Agregado], [Dimensiones], [Peso], 
            [Nombre Categoria], [Nombre Marca], [Valid From], [Valid To], [Lineage Key])
    SELECT  [Nombre],[_Source Key], [Fecha Agregado], [Dimensiones], [Peso], 
            [Nombre Categoria], [Nombre Marca], [Valid From], [Valid To], @LineageKey
    FROM staging_Producto;

    UPDATE [int].Lineage
        SET 
            FinishLoad = SYSDATETIME(),
            Status = 'S',
            @LastDateLoaded = LastLoadedDate
    WHERE [LineageKey] = @LineageKey;

    UPDATE [int].[IncrementalLoads]
        SET [LoadDate] = @LastDateLoaded
    WHERE [TableName] = N'dim_Producto';

    COMMIT;

    RETURN 0;
END;
