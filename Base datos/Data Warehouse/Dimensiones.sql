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
GO

		CREATE TABLE dim_Pedido (
			[Pedido Key] INT PRIMARY KEY IDENTITY(1,1), 
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Metodo Pago] NVARCHAR(100) DEFAULT 'Unknown',
			[Direccion Pago] NVARCHAR(100) DEFAULT 'Unknown',
			[Precio Unitario] DECIMAL(10, 2) NOT NULL,
			[Cantidad] INT NOT NULL,
			[Estado] NVARCHAR(100) DEFAULT 'Unknown',
			[Fecha Pedido] DATETIME DEFAULT GETDATE(),
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);

		CREATE TABLE dim_Ubicacion (
			[Ubicacion Key] INT IDENTITY (1,1) PRIMARY KEY,
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Direccion Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Estado Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Pais Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Ciudad Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);		

		CREATE TABLE dim_Cliente (
			[Cliente Key] INT PRIMARY KEY IDENTITY(1,1),
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Nombre] NVARCHAR(100) DEFAULT 'Unknown',
			[Apellido] NVARCHAR(100) DEFAULT 'Unknown',
			[Email] NVARCHAR(100) DEFAULT 'Unknown',
			[Telefono] NVARCHAR(100) DEFAULT 'Unknown',
			[Direccion] NVARCHAR(100) DEFAULT 'Unknown',
			[Ciudad] NVARCHAR(100) DEFAULT 'Unknown',
			[Pais] NVARCHAR(100) DEFAULT 'Unknown',
			[Estado] NVARCHAR(100) DEFAULT 'Unknown',
			[Codigo Postal] INT NOT NULL,
			[Puntos Fidelidad] INT NOT NULL,
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);

		CREATE TABLE dim_Ofertas (
			[Oferta Key] INT PRIMARY KEY IDENTITY(1,1),
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Nombre] NVARCHAR(100) DEFAULT 'Unknown',
			[Descripcion] NVARCHAR(100) DEFAULT 'Unknown',
			[Descuento] DECIMAL(10, 2) NOT NULL,
			[Cod Descuento] INT NOT NULL,
			[Fecha Lanzamiento] DATETIME DEFAULT GETDATE(),
			[Fecha Caducidad] DATETIME DEFAULT GETDATE(),
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);

		CREATE TABLE dim_Date (
			[Date Key]                 INT          NOT NULL,
			[Date]                     DATE         NOT NULL,
			[Day]                      TINYINT      NOT NULL,
			[Day Suffix]               CHAR (2)     NOT NULL,
			[Weekday]                  TINYINT      NOT NULL,
			[Weekday Name]             VARCHAR (10) NOT NULL,
			[Weekday Name Short]       CHAR (3)     NOT NULL,
			[Weekday Name FirstLetter] CHAR (1)     NOT NULL,
			[Day Of Year]              SMALLINT     NOT NULL,
			[Week Of Month]            TINYINT      NOT NULL,
			[Week Of Year]             TINYINT      NOT NULL,
			[Month]                    TINYINT      NOT NULL,
			[Month Name]               VARCHAR (10) NOT NULL,
			[Month Name Short]         CHAR (3)     NOT NULL,
			[Month Name FirstLetter]   CHAR (1)     NOT NULL,
			[Quarter]                  TINYINT      NOT NULL,
			[Quarter Name]             VARCHAR (6)  NOT NULL,
			[Year]                     INT          NOT NULL,
			[MMYYYY]                   CHAR (6)     NOT NULL,
			[Month Year]               CHAR (7)     NOT NULL,
			[Is Weekend]               BIT          DEFAULT ((0)) NOT NULL,
			[Is Holiday]               BIT          DEFAULT ((0)) NOT NULL,
			[Holiday Name]             VARCHAR (20) DEFAULT ('') NOT NULL,
			[Special Day]              VARCHAR (20) DEFAULT ('') NOT NULL,
			[First Date Of Year]       DATE         NULL,
			[Last Date Of Year]        DATE         NULL,
			[First Date Of Quater]     DATE         NULL,
			[Last Date Of Quater]      DATE         NULL,
			[First Date Of Month]      DATE         NULL,
			[Last Date Of Month]       DATE         NULL,
			[First Date Of Week]       DATE         NULL,
			[Last Date Of Week]        DATE         NULL,
			[Lineage Key]              INT          NULL,
			PRIMARY KEY CLUSTERED ([Date Key] ASC)
		);

		CREATE TABLE dim_AreaEnvio (
			[Area Envio Key] INT PRIMARY KEY IDENTITY(1,1),
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Area] NVARCHAR(100) DEFAULT 'Unknown',
			[Costo Envio] DECIMAL(10, 2) NOT NULL,
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);

		CREATE TABLE dim_Producto (
			[Producto Key] INT PRIMARY KEY IDENTITY(1,1),
			[Nombre] NVARCHAR(100) DEFAULT 'Unknown',
			[_Source Key] NVARCHAR(50) NOT NULL, 
			[Fecha Agregado] DATETIME DEFAULT GETDATE(),
			[Dimensiones] NVARCHAR(100) DEFAULT 'Unknown',
			[Peso] DECIMAL(10, 2) NOT NULL,
			[Nombre Categoria] NVARCHAR(100) DEFAULT 'Unknown',
			[Nombre Marca] NVARCHAR(100) DEFAULT 'Unknown',
			[Valid From] DATETIME DEFAULT GETDATE(),
			[Valid To] DATETIME DEFAULT GETDATE(),
			[Lineage Key] INT NOT NULL
		);

		CREATE TABLE Fact_Envio (
			[Envio Key] INT PRIMARY KEY IDENTITY(1,1),
			[Pedido Key] INT NOT NULL,
			[Oferta Key] INT NOT NULL,
			[Area Envio Key] INT NOT NULL,
			[Cliente Key] INT NOT NULL,
			[Producto Key] INT NOT NULL,
			[Ubicacion Key] INT NOT NULL,
			[Empresa Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Metodo Envio] NVARCHAR(100) DEFAULT 'Unknown',
			[Fecha Envio] DATETIME DEFAULT GETDATE(),
			[Fecha Entrega] DATETIME DEFAULT GETDATE(),
			[_Source Pedido Key] int NOT NULL,
			[Lineage Key] INT NOT NULL
		);

