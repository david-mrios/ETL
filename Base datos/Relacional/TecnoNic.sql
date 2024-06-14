
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/20/2024 23:38:13
-- Generated from EDMX file: C:\Users\madij\Documents\CMITecnoNic\CMITecnoNic\Models\TecnoNicModel.edmx
-- --------------------------------------------------
USE master
Go

CREATE DATABASE  TecnoNic;
Go 

SET QUOTED_IDENTIFIER OFF;
GO
USE [TecnoNic];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1),
    [Nombre] nvarchar(max)  NULL,
    [Apellido] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Telefono] nvarchar(max)  NULL,
    [Direccion] nvarchar(max)  NULL,
    [Ciudad] nvarchar(max)  NULL,
    [Pais] nvarchar(max)  NULL,
    [Estado] nvarchar(max)  NULL,
    [Codigo_Postal] nvarchar(max)  NULL,
    [UsuarioId] int  NULL,
	[ModifiedDate] [datetime] NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1),
    [NombreUsuario] nvarchar(max)  NULL,
    [Contraseña] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Tipo] nvarchar(max)  NULL	
);
GO

-- Creating table 'Suscripciones'
CREATE TABLE [dbo].[Suscripciones] (
    [Id] int IDENTITY(1,1),
    [Fecha_Inicio] nvarchar(max)  NULL,
    [Fecha_Finalizacion] nvarchar(max)  NULL,
    [ClienteId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Notificaciones'
CREATE TABLE [dbo].[Notificaciones] (
    [Id] int IDENTITY(1,1),
    [Mensaje] nvarchar(max)  NULL,
    [Fecha] nvarchar(max)  NULL,
    [ClienteId] int  NULL
);
GO

-- Creating table 'Programa_Fidelidades'
CREATE TABLE [dbo].[Programa_Fidelidades] (
    [Id] int IDENTITY(1,1),
    [Puntos] int  NULL,
    [ClienteId] int  NULL
);
GO

-- Creating table 'Direcciones_Alternativas'
CREATE TABLE [dbo].[Direcciones_Alternativas] (
    [Id] int IDENTITY(1,1),
    [Tipo] nvarchar(max)  NULL,
    [Direccion] nvarchar(max)  NULL,
    [Ciudad] nvarchar(max)  NULL,
    [Estado] nvarchar(max)  NULL,
    [Pais] nvarchar(max)  NULL,
    [ClienteId] int  NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [Id] int IDENTITY(1,1),
    [Fecha_pedido] nvarchar(max)  NULL,
    [Direccion_Envio] nvarchar(max)  NULL,
    [Direccion_Pago] nvarchar(max)  NULL,
    [ClienteId] int  NULL,
    [Descuento_CuponesId] int  NULL,
    [Estado_pedidoId] int  NULL,
    [Metodos_PagoId] int  NULL,
	[ModifiedDate] [datetime] NOT NULL,

);
GO

-- Creating table 'Area_Envios'
CREATE TABLE [dbo].[Area_Envios] (
    [Id] int IDENTITY(1,1),
    [NombreArea] nvarchar(max)  NULL,
    [CostoEnvio] decimal(18,2)  NULL,
	[ModifiedDate] [datetime] NOT NULL,
);
GO


-- Creating table 'Wishlist'
CREATE TABLE [dbo].[Wishlist] (
    [Id] int IDENTITY(1,1),
    [ClienteId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Comentarios_ProductoSet'
CREATE TABLE [dbo].[Comentarios_ProductoSet] (
    [Id] int IDENTITY(1,1),
    [Fecha_Comentario] nvarchar(max)  NULL,
    [Comentario] nvarchar(max)  NULL,
    [Valoracion] nvarchar(max)  NULL,
    [ClienteId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Carrtio_compras'
CREATE TABLE [dbo].[Carrtio_compras] (
    [Id] int IDENTITY(1,1),
    [Cantidad] nvarchar(max)  NULL,
    [ClienteId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Valoracion_productos'
CREATE TABLE [dbo].[Valoracion_productos] (
    [Id] int IDENTITY(1,1),
    [Valoracion] nvarchar(max)  NULL,
    [ClienteId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1),
    [Colores] nvarchar(max)  NULL,
    [Dimensiones] nvarchar(max)  NULL,
    [EAN] nvarchar(max)  NULL,
    [URL_Imagen] nvarchar(max)  NULL,
    [Fabricante] nvarchar(max)  NULL,
    [Numero_Fabrica] nvarchar(max)  NULL,
    [Nombre] nvarchar(max)  NULL,
    [Categoria_Principal] nvarchar(max)  NULL,
    [Fecha_Reseña] nvarchar(max)  NULL,
    [Fecha_Vista_Reseña] nvarchar(max)  NULL,
    [Recomendar_Reseña] nvarchar(max)  NULL,
    [Num_Ayudas_Review] nvarchar(max)  NULL,
    [Calificacion_Review] nvarchar(max)  NULL,
    [URL_Fuente_Review] nvarchar(max)  NULL,
    [Texto_Review] nvarchar(max)  NULL,
    [Titulo_Review] nvarchar(max)  NULL,
    [Usuario_Review] nvarchar(max)  NULL,
    [URL_Origen] nvarchar(max)  NULL,
    [UPC] nvarchar(max)  NULL,
    [Peso] nvarchar(max)  NULL,
    [ProveedorId] int  NULL,
    [CategoriaId] int  NULL,
    [MarcaId] int  NULL,
	[Fecha Agregado] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
);

	
GO

-- Creating table 'FAQ'
CREATE TABLE [dbo].[FAQ] (
    [Id] int IDENTITY(1,1),
    [Pregunta] nvarchar(max)  NULL,
    [Respuesta] nvarchar(max)  NULL
);
GO

-- Creating table 'Proveedores'
CREATE TABLE [dbo].[Proveedores] (
    [Id] int IDENTITY(1,1),
    [NombreProveedor] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Telefono] nvarchar(max)  NULL,
    [Direccion] nvarchar(max)  NULL,
    [Ciudad] nvarchar(max)  NULL,
    [Estado] nvarchar(max)  NULL,
    [Pais] nvarchar(max)  NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1),
    [Nombre] nvarchar(max)  NULL
);
GO

-- Creating table 'Marcas'
CREATE TABLE [dbo].[Marcas] (
    [Id] int IDENTITY(1,1),
    [NombreMarca] nvarchar(max)  NULL,
    [Descripcion] nvarchar(max)  NULL
);
GO

-- Creating table 'Detalle_Pedidos'
CREATE TABLE [dbo].[Detalle_Pedidos] (
    [Id] int IDENTITY(1,1),
    [Cantidad] nvarchar(max)  NULL,
    [Precio_Unitario] nvarchar(max)  NULL,
    [PedidoId] int  NULL,
    [ProductoId] int  NULL
);
GO

-- Creating table 'Promociones'
CREATE TABLE [dbo].[Promociones] (
    [Id] int IDENTITY(1,1),
    [Nombre] nvarchar(max)  NULL,
    [Descripcion] nvarchar(max)  NULL,
    [Fecha_Inicio] nvarchar(max)  NULL,
    [Fecha_Fin] nvarchar(max)  NULL,
    [Descuento] nvarchar(max)  NULL,
	[ModifiedDate] [datetime] NOT NULL,
);
GO

-- Creating table 'Descuento_Cupones'
CREATE TABLE [dbo].[Descuento_Cupones] (
    [Id] int IDENTITY(1,1),
    [Codigo] nvarchar(max)  NULL,
    [Valor] nvarchar(max)  NULL,
    [Fecha_Inicio] nvarchar(max)  NULL,
    [Fecha_Fin] nvarchar(max)  NULL,
    [Property1] nvarchar(max)  NULL,
    [PromocionId] int  NULL,
);
GO

-- Creating table 'Estado_pedidos'
CREATE TABLE [dbo].[Estado_pedidos] (
    [Id] int IDENTITY(1,1),
    [NombreEstado] nvarchar(max)  NULL
);
GO

-- Creating table 'Metodos_Pago'
CREATE TABLE [dbo].[Metodos_Pago] (
    [Id] int IDENTITY(1,1),
    [NombreMetodo] nvarchar(max)  NULL
);
GO

-- Creating table 'Historial_Compras'
CREATE TABLE [dbo].[Historial_Compras] (
    [Id] int IDENTITY(1,1),
    [Fecha_Compra] nvarchar(max)  NULL,
    [PedidoId] int  NULL,
    [ClienteId] int  NULL
);
GO

-- Creating table 'Envios'
CREATE TABLE [dbo].[Envios] (
    [Id] int IDENTITY(1,1),
    [Pedidos Id] int NOT NULL,
    [Empresa_Envio] nvarchar(max)  NULL,
    [Metodo_Envio] nvarchar(max)  NULL,
    [Fecha_Envio] nvarchar(max)  NULL,
    [Fecha_Entrega] nvarchar(max)  NULL,
    [Direccion_Envio] nvarchar(max)  NULL,
    [Ciudad_Envio] nvarchar(max)  NULL,
    [Estado_Envio] nvarchar(max)  NULL,
    [Pais_Envio] nvarchar(max)  NULL,
    [Area_EnvioId] int  NULL,
	[ModifiedDate] [datetime] NOT NULL,
);
GO



-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Suscripciones'
ALTER TABLE [dbo].[Suscripciones]
ADD CONSTRAINT [PK_Suscripciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Notificaciones'
ALTER TABLE [dbo].[Notificaciones]
ADD CONSTRAINT [PK_Notificaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Programa_Fidelidades'
ALTER TABLE [dbo].[Programa_Fidelidades]
ADD CONSTRAINT [PK_Programa_Fidelidades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Direcciones_Alternativas'
ALTER TABLE [dbo].[Direcciones_Alternativas]
ADD CONSTRAINT [PK_Direcciones_Alternativas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Area_Envios'
ALTER TABLE [dbo].[Area_Envios]
ADD CONSTRAINT [PK_Area_Envios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Wishlist'
ALTER TABLE [dbo].[Wishlist]
ADD CONSTRAINT [PK_Wishlist]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comentarios_ProductoSet'
ALTER TABLE [dbo].[Comentarios_ProductoSet]
ADD CONSTRAINT [PK_Comentarios_ProductoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Carrtio_compras'
ALTER TABLE [dbo].[Carrtio_compras]
ADD CONSTRAINT [PK_Carrtio_compras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Valoracion_productos'
ALTER TABLE [dbo].[Valoracion_productos]
ADD CONSTRAINT [PK_Valoracion_productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FAQ'
ALTER TABLE [dbo].[FAQ]
ADD CONSTRAINT [PK_FAQ]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Proveedores'
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [PK_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Marcas'
ALTER TABLE [dbo].[Marcas]
ADD CONSTRAINT [PK_Marcas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Detalle_Pedidos'
ALTER TABLE [dbo].[Detalle_Pedidos]
ADD CONSTRAINT [PK_Detalle_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Promociones'
ALTER TABLE [dbo].[Promociones]
ADD CONSTRAINT [PK_Promociones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Descuento_Cupones'
ALTER TABLE [dbo].[Descuento_Cupones]
ADD CONSTRAINT [PK_Descuento_Cupones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Estado_pedidos'
ALTER TABLE [dbo].[Estado_pedidos]
ADD CONSTRAINT [PK_Estado_pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Metodos_Pago'
ALTER TABLE [dbo].[Metodos_Pago]
ADD CONSTRAINT [PK_Metodos_Pago]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Historial_Compras'
ALTER TABLE [dbo].[Historial_Compras]
ADD CONSTRAINT [PK_Historial_Compras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Envios'
ALTER TABLE [dbo].[Envios]
ADD CONSTRAINT [PK_Envios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioId] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_UsuarioCliente]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO


-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCliente'
CREATE INDEX [IX_FK_UsuarioCliente]
ON [dbo].[Clientes]
    ([UsuarioId]);
GO

-- Creating foreign key on [ClienteId] in table 'Suscripciones'
ALTER TABLE [dbo].[Suscripciones]
ADD CONSTRAINT [FK_ClienteSuscripcion]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteSuscripcion'
CREATE INDEX [IX_FK_ClienteSuscripcion]
ON [dbo].[Suscripciones]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Notificaciones'
ALTER TABLE [dbo].[Notificaciones]
ADD CONSTRAINT [FK_ClienteNotificacion]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteNotificacion'
CREATE INDEX [IX_FK_ClienteNotificacion]
ON [dbo].[Notificaciones]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Programa_Fidelidades'
ALTER TABLE [dbo].[Programa_Fidelidades]
ADD CONSTRAINT [FK_ClientePrograma_Fidelidad]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientePrograma_Fidelidad'
CREATE INDEX [IX_FK_ClientePrograma_Fidelidad]
ON [dbo].[Programa_Fidelidades]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Direcciones_Alternativas'
ALTER TABLE [dbo].[Direcciones_Alternativas]
ADD CONSTRAINT [FK_ClienteDireccion_Alternativa]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteDireccion_Alternativa'
CREATE INDEX [IX_FK_ClienteDireccion_Alternativa]
ON [dbo].[Direcciones_Alternativas]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_ClientePedido]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientePedido'
CREATE INDEX [IX_FK_ClientePedido]
ON [dbo].[Pedidos]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Wishlist'
ALTER TABLE [dbo].[Wishlist]
ADD CONSTRAINT [FK_ClienteWishlist]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteWishlist'
CREATE INDEX [IX_FK_ClienteWishlist]
ON [dbo].[Wishlist]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Comentarios_ProductoSet'
ALTER TABLE [dbo].[Comentarios_ProductoSet]
ADD CONSTRAINT [FK_ClienteComentarios_Productos]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteComentarios_Productos'
CREATE INDEX [IX_FK_ClienteComentarios_Productos]
ON [dbo].[Comentarios_ProductoSet]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Carrtio_compras'
ALTER TABLE [dbo].[Carrtio_compras]
ADD CONSTRAINT [FK_ClienteCarrtio_compras]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteCarrtio_compras'
CREATE INDEX [IX_FK_ClienteCarrtio_compras]
ON [dbo].[Carrtio_compras]
    ([ClienteId]);
GO

-- Creating foreign key on [ClienteId] in table 'Valoracion_productos'
ALTER TABLE [dbo].[Valoracion_productos]
ADD CONSTRAINT [FK_ClienteValoracion_producto]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteValoracion_producto'
CREATE INDEX [IX_FK_ClienteValoracion_producto]
ON [dbo].[Valoracion_productos]
    ([ClienteId]);
GO

-- Creating foreign key on [ProductoId] in table 'Valoracion_productos'
ALTER TABLE [dbo].[Valoracion_productos]
ADD CONSTRAINT [FK_ProductoValoracion_producto]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoValoracion_producto'
CREATE INDEX [IX_FK_ProductoValoracion_producto]
ON [dbo].[Valoracion_productos]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoId] in table 'Carrtio_compras'
ALTER TABLE [dbo].[Carrtio_compras]
ADD CONSTRAINT [FK_ProductoCarrtio_compras]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoCarrtio_compras'
CREATE INDEX [IX_FK_ProductoCarrtio_compras]
ON [dbo].[Carrtio_compras]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoId] in table 'Comentarios_ProductoSet'
ALTER TABLE [dbo].[Comentarios_ProductoSet]
ADD CONSTRAINT [FK_ProductoComentarios_Producto]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoComentarios_Producto'
CREATE INDEX [IX_FK_ProductoComentarios_Producto]
ON [dbo].[Comentarios_ProductoSet]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoId] in table 'Wishlist'
ALTER TABLE [dbo].[Wishlist]
ADD CONSTRAINT [FK_ProductoWishlist]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoWishlist'
CREATE INDEX [IX_FK_ProductoWishlist]
ON [dbo].[Wishlist]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoId] in table 'Suscripciones'
ALTER TABLE [dbo].[Suscripciones]
ADD CONSTRAINT [FK_ProductoSuscripcion]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoSuscripcion'
CREATE INDEX [IX_FK_ProductoSuscripcion]
ON [dbo].[Suscripciones]
    ([ProductoId]);
GO

-- Creating foreign key on [ProveedorId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_ProveedorProducto]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorProducto'
CREATE INDEX [IX_FK_ProveedorProducto]
ON [dbo].[Productos]
    ([ProveedorId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[Productos]
    ([CategoriaId]);
GO

-- Creating foreign key on [MarcaId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_MarcaProducto]
    FOREIGN KEY ([MarcaId])
    REFERENCES [dbo].[Marcas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarcaProducto'
CREATE INDEX [IX_FK_MarcaProducto]
ON [dbo].[Productos]
    ([MarcaId]);
GO

-- Creating foreign key on [PedidoId] in table 'Detalle_Pedidos'
ALTER TABLE [dbo].[Detalle_Pedidos]
ADD CONSTRAINT [FK_PedidoDetalle_Pedido]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoDetalle_Pedido'
CREATE INDEX [IX_FK_PedidoDetalle_Pedido]
ON [dbo].[Detalle_Pedidos]
    ([PedidoId]);
GO

-- Creating foreign key on [ProductoId] in table 'Detalle_Pedidos'
ALTER TABLE [dbo].[Detalle_Pedidos]
ADD CONSTRAINT [FK_ProductoDetalle_Pedido]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoDetalle_Pedido'
CREATE INDEX [IX_FK_ProductoDetalle_Pedido]
ON [dbo].[Detalle_Pedidos]
    ([ProductoId]);
GO

-- Creating foreign key on [PromocionId] in table 'Descuento_Cupones'
ALTER TABLE [dbo].[Descuento_Cupones]
ADD CONSTRAINT [FK_PromocionDescuento_Cupones]
    FOREIGN KEY ([PromocionId])
    REFERENCES [dbo].[Promociones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PromocionDescuento_Cupones'
CREATE INDEX [IX_FK_PromocionDescuento_Cupones]
ON [dbo].[Descuento_Cupones]
    ([PromocionId]);
GO

-- Creating foreign key on [Descuento_CuponesId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_Descuento_CuponesPedido]
    FOREIGN KEY ([Descuento_CuponesId])
    REFERENCES [dbo].[Descuento_Cupones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Descuento_CuponesPedido'
CREATE INDEX [IX_FK_Descuento_CuponesPedido]
ON [dbo].[Pedidos]
    ([Descuento_CuponesId]);
GO

-- Creating foreign key on [Estado_pedidoId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_Estado_pedidoPedido]
    FOREIGN KEY ([Estado_pedidoId])
    REFERENCES [dbo].[Estado_pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Estado_pedidoPedido'
CREATE INDEX [IX_FK_Estado_pedidoPedido]
ON [dbo].[Pedidos]
    ([Estado_pedidoId]);
GO

-- Creating foreign key on [Metodos_PagoId] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_Metodos_PagoPedido]
    FOREIGN KEY ([Metodos_PagoId])
    REFERENCES [dbo].[Metodos_Pago]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Metodos_PagoPedido'
CREATE INDEX [IX_FK_Metodos_PagoPedido]
ON [dbo].[Pedidos]
    ([Metodos_PagoId]);
GO

-- Creating foreign key on [PedidoId] in table 'Historial_Compras'
ALTER TABLE [dbo].[Historial_Compras]
ADD CONSTRAINT [FK_PedidoHistorial_Compras]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoHistorial_Compras'
CREATE INDEX [IX_FK_PedidoHistorial_Compras]
ON [dbo].[Historial_Compras]
    ([PedidoId]);
GO

-- Creating foreign key on [ClienteId] in table 'Historial_Compras'
ALTER TABLE [dbo].[Historial_Compras]
ADD CONSTRAINT [FK_ClienteHistorial_Compras]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteHistorial_Compras'
CREATE INDEX [IX_FK_ClienteHistorial_Compras]
ON [dbo].[Historial_Compras]
    ([ClienteId]);
GO

-- Creating foreign key on [Area_EnvioId] in table 'Envios'
ALTER TABLE [dbo].[Envios]
ADD CONSTRAINT [FK_Area_EnvioEnvios]
    FOREIGN KEY ([Area_EnvioId])
    REFERENCES [dbo].[Area_Envios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Area_EnvioEnvios'
CREATE INDEX [IX_FK_Area_EnvioEnvios]
ON [dbo].[Envios]
    ([Area_EnvioId]);
GO


ALTER TABLE [dbo].[Envios]
ADD CONSTRAINT [FK_PedidosEnvios]
    FOREIGN KEY ([Pedidos Id])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO


-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCliente'
CREATE INDEX [IX_FK_PedidosEnvios]
ON [dbo].[Envios]
    ([Pedidos Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------