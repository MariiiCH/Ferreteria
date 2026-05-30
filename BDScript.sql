USE [master]
GO
/****** Objeto: Database [FERRETERI] Fecha de script: 05/29/2026 8:24:04 PM ******/
CREATE DATABASE [FERRETERI]
GO
ALTER DATABASE [FERRETERI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FERRETERI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FERRETERI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FERRETERI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FERRETERI] SET ARITHABORT OFF 
GO
ALTER DATABASE [FERRETERI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FERRETERI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FERRETERI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FERRETERI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FERRETERI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FERRETERI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FERRETERI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FERRETERI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FERRETERI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FERRETERI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FERRETERI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FERRETERI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FERRETERI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FERRETERI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FERRETERI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FERRETERI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FERRETERI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FERRETERI] SET RECOVERY FULL 
GO
ALTER DATABASE [FERRETERI] SET  MULTI_USER 
GO
ALTER DATABASE [FERRETERI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FERRETERI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FERRETERI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FERRETERI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FERRETERI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FERRETERI] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [FERRETERI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FERRETERI] SET QUERY_STORE = ON
GO
ALTER DATABASE [FERRETERI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FERRETERI]
GO
/****** Objeto: Table [dbo].[Categorias] Fecha de script: 05/29/2026 8:24:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Movimientos] Fecha de script: 05/29/2026 8:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[idMov] [int] IDENTITY(1,1) NOT NULL,
	[FK_idProd] [int] NOT NULL,
	[tipoMov] [varchar](100) NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Productos] Fecha de script: 05/29/2026 8:24:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProd] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](75) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[stock] [smallint] NULL,
	[FK_idCategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombre]) VALUES (1, N'Herramientas')
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombre]) VALUES (2, N'Pinturas')
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombre]) VALUES (3, N'Electricidad')
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombre]) VALUES (4, N'Plomeria')
GO
INSERT [dbo].[Categorias] ([idCategoria], [nombre]) VALUES (5, N'Tornilleria')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (2, 1, N'entrada', 10, CAST(N'2026-05-20' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (3, 1, N'salida', 2, CAST(N'2026-05-21' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (4, 2, N'entrada', 15, CAST(N'2026-05-21' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (5, 3, N'salida', 3, CAST(N'2026-05-22' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (6, 4, N'ajuste', 5, CAST(N'2026-05-22' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (7, 5, N'devolucion', 1, CAST(N'2026-05-23' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (8, 6, N'entrada', 8, CAST(N'2026-05-23' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (9, 7, N'salida', 4, CAST(N'2026-05-24' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (10, 8, N'ajuste', 2, CAST(N'2026-05-24' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (11, 9, N'devolucion', 1, CAST(N'2026-05-25' AS Date))
GO
INSERT [dbo].[Movimientos] ([idMov], [FK_idProd], [tipoMov], [cantidad], [fecha]) VALUES (12, 10, N'entrada', 20, CAST(N'2026-05-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (1, N'Martillo', CAST(12.50 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (2, N'Destornillador Plano', CAST(4.75 AS Decimal(10, 2)), 35, 1)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (3, N'Destornillador Phillips', CAST(5.25 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (4, N'Pintura Blanca 1 Galon', CAST(18.99 AS Decimal(10, 2)), 15, 2)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (5, N'Pintura Azul 1 Galon', CAST(19.99 AS Decimal(10, 2)), 10, 2)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (6, N'Cable Electrico 10m', CAST(25.50 AS Decimal(10, 2)), 12, 3)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (7, N'Interruptor Simple', CAST(3.25 AS Decimal(10, 2)), 40, 3)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (8, N'Tubo PVC 1/2"', CAST(6.80 AS Decimal(10, 2)), 25, 4)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (9, N'Codo PVC 1/2"', CAST(1.50 AS Decimal(10, 2)), 50, 4)
GO
INSERT [dbo].[Productos] ([idProd], [nombre], [precio], [stock], [FK_idCategoria]) VALUES (10, N'Caja Tornillos 1"', CAST(8.99 AS Decimal(10, 2)), 100, 5)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Movimientos] FOREIGN KEY([FK_idProd])
REFERENCES [dbo].[Productos] ([idProd])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Productos_Movimientos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([FK_idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [chk_movimientos] CHECK  (([tipoMov]='devolucion' OR [tipoMov]='ajuste' OR [tipoMov]='salida' OR [tipoMov]='entrada'))
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [chk_movimientos]
GO
USE [master]
GO
ALTER DATABASE [FERRETERI] SET  READ_WRITE 
GO
