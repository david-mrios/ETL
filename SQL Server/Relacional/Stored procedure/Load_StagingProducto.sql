USE [TecnoNic]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingProducto]    Script Date: 11/6/2024 23:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear o modificar el procedimiento para cargar datos en staging_Producto
CREATE or alter PROCEDURE [dbo].[Load_StagingProducto]
    @LastLoadDate DATETIME,
    @NewLoadDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
        'XML|' + CONVERT(NVARCHAR(50), P.Id) AS [_Source Key],
        CONVERT(NVARCHAR(100), ISNULL(P.Nombre, 'N/A')) AS [Nombre],
        CONVERT(DATETIME, ISNULL(P.[Fecha agregado], '1753-01-01')) AS [Fecha Agregado],
        CONVERT(NVARCHAR(100), ISNULL(P.Dimensiones, 'N/A')) AS [Dimensiones],
        CONVERT(DECIMAL(10, 2), ISNULL(P.Peso, 0)) AS [Peso],
        CONVERT(NVARCHAR(100), ISNULL(C.Nombre, 'N/A')) AS [Nombre Categoria],
        CONVERT(NVARCHAR(100), ISNULL(M.NombreMarca, 'N/A')) AS [Nombre Marca],
        CONVERT(DATETIME, ISNULL(P.ModifiedDate, '1753-01-01')) AS [Valid From],
        CONVERT(DATETIME, '9999-12-31') AS [Valid To]
    FROM 
        Productos AS P
    INNER JOIN
        Categorias AS C ON C.Id = P.CategoriaId
    INNER JOIN 
        Marcas AS M ON M.Id = P.MarcaId
    WHERE 
        P.ModifiedDate > @LastLoadDate AND P.ModifiedDate <= @NewLoadDate;

    RETURN 0;
END;
