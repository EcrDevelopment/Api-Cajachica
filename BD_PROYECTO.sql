USE [master]
GO
/****** Object:  Database [BDPROYECTO]    Script Date: 11/11/2021 14:36:36 ******/
CREATE DATABASE [BDPROYECTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDINTERBANK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDINTERBANK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDINTERBANK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDINTERBANK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDPROYECTO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDPROYECTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDPROYECTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDPROYECTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDPROYECTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDPROYECTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDPROYECTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDPROYECTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDPROYECTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDPROYECTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDPROYECTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDPROYECTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDPROYECTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDPROYECTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDPROYECTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDPROYECTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDPROYECTO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDPROYECTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDPROYECTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDPROYECTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDPROYECTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDPROYECTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDPROYECTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDPROYECTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDPROYECTO] SET RECOVERY FULL 
GO
ALTER DATABASE [BDPROYECTO] SET  MULTI_USER 
GO
ALTER DATABASE [BDPROYECTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDPROYECTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDPROYECTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDPROYECTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDPROYECTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDPROYECTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDPROYECTO', N'ON'
GO
ALTER DATABASE [BDPROYECTO] SET QUERY_STORE = OFF
GO
USE [BDPROYECTO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NULL,
	[cantidadCuentasAhorro] [int] NULL,
	[fechaInicioAfiliacion] [date] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaAhorro]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorro](
	[idCuentaAhorro] [int] IDENTITY(1,1) NOT NULL,
	[idTipoCuentaAhorro] [int] NULL,
	[idCliente] [int] NULL,
	[numeroTarjeta] [varchar](25) NULL,
	[numeroCuenta] [varchar](25) NULL,
	[codigoCuentaInterbancaria] [varchar](25) NULL,
	[fechaEmisionCuenta] [date] NULL,
	[fechaCaducidadCuenta] [date] NULL,
	[tipoMoneda] [int] NULL,
	[saldoCuentaAhorro] [decimal](18, 2) NULL,
	[tipocambio] [decimal](18, 2) NULL,
	[cantidadMovimientos] [int] NULL,
 CONSTRAINT [PK_CuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[idCuentaAhorro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombreDepartamento] [varchar](30) NULL,
	[idPais] [int] NULL,
 CONSTRAINT [PK_Departamento_1] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[idDistrito] [int] NULL,
 CONSTRAINT [PK_Direccion_1] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[idDistrito] [int] IDENTITY(1,1) NOT NULL,
	[nombreDistrito] [varchar](30) NULL,
	[idProvincia] [int] NULL,
 CONSTRAINT [PK_Distrito_1] PRIMARY KEY CLUSTERED 
(
	[idDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocIdentidad]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocIdentidad](
	[idDocumentoIdentidad] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDocumentoIdentidad] [int] NULL,
	[numeroDocumentoIdentidad] [varchar](20) NULL,
 CONSTRAINT [PK_DocIdentidad] PRIMARY KEY CLUSTERED 
(
	[idDocumentoIdentidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[idCuentaAhorro] [int] NULL,
	[idDireccion] [int] NULL,
	[tipoMoneda] [int] NULL,
	[codigMovimiento] [varchar](20) NULL,
	[importe] [decimal](18, 2) NULL,
	[fechaMovimiento] [date] NULL,
	[horaMovimiento] [time](7) NULL,
	[tipoCambio] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nombrePais] [varchar](30) NULL,
	[nombreNacionalidad] [varchar](25) NULL,
 CONSTRAINT [PK_Pais_1] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](30) NULL,
	[apellidoPaterno] [varchar](30) NULL,
	[apellidoMaterno] [varchar](30) NULL,
	[idDocumentoIdentidad] [int] NULL,
	[telefono] [varchar](11) NULL,
	[sexo] [char](1) NULL,
	[correo] [varchar](60) NULL,
	[edad] [int] NULL,
	[idDireccion] [int] NULL,
	[fechaNacimiento] [datetime] NULL,
 CONSTRAINT [PK_Persona_1] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombreProvincia] [varchar](30) NULL,
	[idDepartamento] [int] NULL,
 CONSTRAINT [PK_Provincia_1] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuentaAhorro]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuentaAhorro](
	[idTipoCuentaAhorro] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
 CONSTRAINT [PK_TipoCuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[idTipoCuentaAhorro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoIdentidad]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoIdentidad](
	[idTipoDocumentoIdentidad] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoDocumentoIdentidad] [varchar](30) NULL,
 CONSTRAINT [PK_TipoDocumentoIdentidad] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoIdentidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 11/11/2021 14:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idTipoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoMovimiento] [varchar](30) NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Persona1] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Persona1]
GO
ALTER TABLE [dbo].[CuentaAhorro]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorro_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[CuentaAhorro] CHECK CONSTRAINT [FK_CuentaAhorro_Cliente]
GO
ALTER TABLE [dbo].[CuentaAhorro]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorro_TipoCuentaAhorro] FOREIGN KEY([idTipoCuentaAhorro])
REFERENCES [dbo].[TipoCuentaAhorro] ([idTipoCuentaAhorro])
GO
ALTER TABLE [dbo].[CuentaAhorro] CHECK CONSTRAINT [FK_CuentaAhorro_TipoCuentaAhorro]
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Pais]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Distrito] FOREIGN KEY([idDistrito])
REFERENCES [dbo].[Distrito] ([idDistrito])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Distrito]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FK_Distrito_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FK_Distrito_Provincia]
GO
ALTER TABLE [dbo].[DocIdentidad]  WITH CHECK ADD  CONSTRAINT [FK_DocIdentidad_TipoDocumentoIdentidad] FOREIGN KEY([idTipoDocumentoIdentidad])
REFERENCES [dbo].[TipoDocumentoIdentidad] ([idTipoDocumentoIdentidad])
GO
ALTER TABLE [dbo].[DocIdentidad] CHECK CONSTRAINT [FK_DocIdentidad_TipoDocumentoIdentidad]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_CuentaAhorro] FOREIGN KEY([idCuentaAhorro])
REFERENCES [dbo].[CuentaAhorro] ([idCuentaAhorro])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_CuentaAhorro]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_Direccion]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_TipoMovimiento] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_TipoMovimiento]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Direccion1] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Direccion1]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_DocIdentidad] FOREIGN KEY([idDocumentoIdentidad])
REFERENCES [dbo].[DocIdentidad] ([idDocumentoIdentidad])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_DocIdentidad]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Departamento]
GO
USE [master]
GO
ALTER DATABASE [BDPROYECTO] SET  READ_WRITE 
GO
