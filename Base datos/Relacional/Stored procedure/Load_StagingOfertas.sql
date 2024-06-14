USE [TecnoNic]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingOfertas]    Script Date: 11/6/2024 23:10:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear o modificar el procedimiento para cargar datos
CREATE or alter PROCEDURE [dbo].[Load_StagingOfertas]
    @LastLoadDate DATETIME,
    @NewLoadDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
    
    SELECT 
        'XML|' + CONVERT(NVARCHAR(50), D.Id) AS [_Source Key],
        CONVERT(nvarchar(100),P.Nombre) as [Nombre],
        CONVERT(nvarchar(100),P.Descripcion) as [Descripcion],
        CONVERT(decimal(10,2),D.Valor) AS [Descuento],
        CONVERT(INT,D.Codigo) AS [Cod Descuento],
        CONVERT(datetime,D.Fecha_Inicio) AS [Fecha Lanzamiento],
        CONVERT(DATETIME,D.Fecha_Fin)AS [Fecha Caducidad],
        CONVERT(DATETIME, ISNULL(P.ModifiedDate, '1753-01-01')) AS [Valid From],
        CONVERT(DATETIME, '9999-12-31') AS [Valid To]
    FROM 
        Descuento_Cupones AS D
    INNER JOIN 
        Promociones AS P ON P.Id = D.PromocionId
    WHERE 
        (P.ModifiedDate > @LastLoadDate AND P.ModifiedDate <= @NewLoadDate);

    RETURN 0;
END;
