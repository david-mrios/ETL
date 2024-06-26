USE [TecnoNic]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingPedido]    Script Date: 11/6/2024 23:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear o modificar el procedimiento para cargar datos
CREATE or alter PROCEDURE [dbo].[Load_StagingPedido]
    @LastLoadDate DATETIME,
    @NewLoadDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT	
        'XML|' + CONVERT(NVARCHAR, P.Id) AS [_Source Key],
        CONVERT(NVARCHAR(100), ISNULL(M.NombreMetodo, 'N/A')) AS [Metodo Pago],
        CONVERT(NVARCHAR(100), ISNULL(P.Direccion_Pago, 'N/A')) AS [Direccion Pago],
        CONVERT(DECIMAL(10, 2), ISNULL(D.Precio_Unitario, 0)) AS [Precio Unitario],
        CONVERT(INT, ISNULL(D.Cantidad, 0)) AS [Cantidad],
        CONVERT(NVARCHAR(100), ISNULL(E.NombreEstado, 'N/A')) AS [Estado],
		CONVERT(DATETIME, ISNULL(P.Fecha_pedido, GETDATE())) AS [Fecha Pedido],
        CONVERT(DATETIME, ISNULL(P.ModifiedDate, '1753-01-01')) AS [Valid From],
        CONVERT(DATETIME, '9999-12-31') AS [Valid To]
    FROM
        Detalle_Pedidos AS D
    LEFT JOIN 
        Pedidos AS P ON P.Id = D.PedidoId
    INNER JOIN 
        Metodos_Pago AS M ON M.Id = P.Metodos_PagoId
    INNER JOIN 
        Estado_pedidos AS E ON E.Id = P.Estado_pedidoId
    WHERE 
        (P.ModifiedDate > @LastLoadDate AND P.ModifiedDate <= @NewLoadDate) OR
        (D.Precio_Unitario IS NOT NULL) OR
        (D.Cantidad IS NOT NULL);

    RETURN 0;
END;
