USE [TecnoNic]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingUbicacion]    Script Date: 11/6/2024 23:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear o modificar el procedimiento para cargar datos
CREATE or alter	 PROCEDURE [dbo].[Load_StagingUbicacion]
    @LastLoadDate DATETIME,
    @NewLoadDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
        'XML|' + CONVERT(NVARCHAR, E.Id) AS [_Source Key],
        CONVERT(NVARCHAR(100), ISNULL(E.Direccion_Envio, 'N/A')) AS [Direccion Envio],
        CONVERT(NVARCHAR(100), ISNULL(E.Estado_Envio, 'N/A')) AS [Estado Envio],
        CONVERT(NVARCHAR(100), ISNULL(E.Pais_Envio, 'N/A')) AS [Pais Envio],
        CONVERT(NVARCHAR(100), ISNULL(E.Ciudad_Envio, 'N/A')) AS [Ciudad Envio],
        CONVERT(DATETIME, ISNULL(E.ModifiedDate, '1753-01-01')) AS [Valid From],
        CONVERT(DATETIME, '9999-12-31') AS [Valid To]
    FROM
        Envios AS E
    WHERE 
        E.ModifiedDate > @LastLoadDate AND E.ModifiedDate <= @NewLoadDate;

    RETURN 0;
END;