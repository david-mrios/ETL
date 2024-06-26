USE [TecnoNic]
GO
/****** Object:  StoredProcedure [dbo].[Load_StagingEnvio]    Script Date: 11/6/2024 23:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create or modify the procedure for loading data into the staging table
CREATE or alter PROCEDURE [dbo].[Load_StagingEnvio]
    @LastLoadDate DATETIME,
    @NewLoadDate DATETIME
AS	
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT 
        E.Id AS [_Source Envio Key], 
        P.Id AS [_Source Pedido Key], 
        D.Id AS [_Source Oferta Key] , 
        A.Id AS [_Source Area Envio Key],
        C.Id AS [_Source Cliente Key], 
        PR.Id AS [_Source Producto Key], 
		C.Id AS [_Source Ubicacion Key],
        E.Empresa_Envio AS [Empresa Envio],
        E.Metodo_Envio AS [Metodo Envio], 
        cast(E.Fecha_Envio as datetime) AS [Fecha Envio],
        cast(E.Fecha_Entrega as datetime) AS [Fecha Entrega],
        cast(E.ModifiedDate as datetime) AS [Modified Date]
    FROM 
        Pedidos AS P
    INNER JOIN 
        Envios AS E ON E.[Pedidos Id] = P.Id
    INNER JOIN 
        Descuento_Cupones AS D ON D.Id = P.Descuento_CuponesId
    INNER JOIN 
        Area_Envios AS A ON A.Id = E.Area_EnvioId
    INNER JOIN 
        Clientes AS C ON C.Id = P.ClienteId
    INNER JOIN 
        Detalle_Pedidos AS DP ON DP.PedidoId = P.Id
    INNER JOIN 
        Productos AS PR ON PR.Id = DP.ProductoId
    WHERE 
        (E.ModifiedDate > @LastLoadDate AND E.ModifiedDate <= @NewLoadDate) OR
        (P.ModifiedDate > @LastLoadDate AND P.ModifiedDate <= @NewLoadDate);

    RETURN 0;
END;
