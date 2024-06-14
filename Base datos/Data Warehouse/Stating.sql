USE master;
GO

IF NOT EXISTS (
    SELECT name 
    FROM master.dbo.sysdatabases 
    WHERE name = 'TecnoNic_DW'
)
BEGIN
    CREATE DATABASE TecnoNic_DW;
END
GO

USE TecnoNic_DW;

	CREATE TABLE staging_Pedido (
		[Pedido Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Metodo Pago] NVARCHAR(100) NOT NULL,
		[Direccion Pago] NVARCHAR(100) NOT NULL,
		[Precio Unitario] DECIMAL(10, 2) NOT NULL,
		[Cantidad] INT NOT NULL,
		[Estado] NVARCHAR(100) NOT NULL,
		[Fecha Pedido] DATETIME DEFAULT GETDATE(),
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_Ubicacion (
		[Ubicacion Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Direccion Envio] NVARCHAR(100) NOT NULL,
		[Estado Envio] NVARCHAR(100) NOT NULL,
		[Pais Envio] NVARCHAR(100) NOT NULL,
		[Ciudad Envio] NVARCHAR(100) NOT NULL,
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_Cliente (
		[Cliente Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Nombre] NVARCHAR(100) NOT NULL,
		[Apellido] NVARCHAR(100) NOT NULL,
		[Email] NVARCHAR(100) NOT NULL,
		[Telefono] NVARCHAR(100) NOT NULL,
		[Direccion] NVARCHAR(100) NOT NULL,
		[Ciudad] NVARCHAR(100) NOT NULL,
		[Pais] NVARCHAR(100) NOT NULL,
		[Estado] NVARCHAR(100) NOT NULL,
		[Codigo Postal] INT NOT NULL,
		[Puntos Fidelidad] INT NOT NULL,
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_Ofertas (
		[Oferta Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Nombre] NVARCHAR(100) NOT NULL,
		[Descripcion] NVARCHAR(100) NOT NULL,
		[Descuento] DECIMAL(10, 2) NOT NULL,
		[Cod Descuento] INT NOT NULL,
		[Fecha Lanzamiento] DATETIME NOT NULL,
		[Fecha Caducidad] DATETIME NOT NULL,
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_AreaEnvio (
		[Area Envio Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Area] NVARCHAR(100) NOT NULL,
		[Costo Envio] DECIMAL(10, 2) NOT NULL,
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_Producto (
		[Producto Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[_Source Key] NVARCHAR(50) NOT NULL,
		[Nombre] NVARCHAR(100) NOT NULL,
		[Fecha Agregado] DATETIME NOT NULL,
		[Dimensiones] NVARCHAR(100) NOT NULL,
		[Peso] DECIMAL(10, 2) NOT NULL,
		[Nombre Categoria] NVARCHAR(100) NOT NULL,
		[Nombre Marca] NVARCHAR(100) NOT NULL,
		[Valid From] DATETIME NOT NULL,
		[Valid To] DATETIME NOT NULL
	);

	CREATE TABLE staging_Envio (
		[Envio Key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
		[Pedido Key] INT NULL,
		[Oferta Key] INT NULL,
		[Area Envio Key] INT NULL,
		[Cliente Key] INT  NULL,
		[Producto Key] INT  NULL,
		[Ubicacion Key] INT  NULL,
		[_Source Envio Key] int NOT NULL,
		[_Source Pedido Key] int NOT NULL,
		[_Source Oferta Key] int NOT NULL,
		[_Source Area Envio Key] int NOT NULL,
		[_Source Cliente Key] int NOT NULL,
		[_Source Producto Key] int NOT NULL,
		[_Source Ubicacion Key] int NOT NULL,
		[Empresa Envio] NVARCHAR(100) NOT NULL,
		[Metodo Envio] NVARCHAR(100) NOT NULL,
		[Fecha Envio] DATETIME DEFAULT GETDATE(),
		[Fecha Entrega] DATETIME DEFAULT GETDATE(),
		[Modified Date] DATETIME NOT NULL,
	);

