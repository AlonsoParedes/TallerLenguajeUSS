USE [master]
GO
/****** Object:  Database [DB_SistemaTaiPaper]    Script Date: 18/10/2022 2:56:21 ******/
CREATE DATABASE [DB_SistemaTaiPaper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbsistema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_SistemaTaiPaper.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbsistema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_SistemaTaiPaper_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_SistemaTaiPaper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET  MULTI_USER 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_SistemaTaiPaper', N'ON'
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET QUERY_STORE = OFF
GO
USE [DB_SistemaTaiPaper]
GO
/****** Object:  UserDefinedTableType [dbo].[type_detalle_ingreso]    Script Date: 18/10/2022 2:56:22 ******/
CREATE TYPE [dbo].[type_detalle_ingreso] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[type_detalle_venta]    Script Date: 18/10/2022 2:56:22 ******/
CREATE TYPE [dbo].[type_detalle_venta] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[stock] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[descuento] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[types_detalle_ingreso]    Script Date: 18/10/2022 2:56:22 ******/
CREATE TYPE [dbo].[types_detalle_ingreso] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_venta] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[imagen] [varchar](20) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[num_documento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[clave] [varbinary](max) NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK__usuario__080A9743A17C642F] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie_comprobante] [varchar](7) NULL,
	[num_comprobante] [varchar](10) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__estado__267ABA7A]  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK__detalle_i__iding__2E1BDC42] FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_ingreso] CHECK CONSTRAINT [FK__detalle_i__iding__2E1BDC42]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK__detalle_v__idven__35BCFE0A] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [FK__detalle_v__idven__35BCFE0A]
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK__ingreso__idusuar__2B3F6F97] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK__ingreso__idusuar__2B3F6F97]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK__usuario__idrol__276EDEB3] FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK__usuario__idrol__276EDEB3]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idusuario__32E0915F] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idusuario__32E0915F]
GO
/****** Object:  StoredProcedure [dbo].[articulo_activar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento activar artiulo
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite activar un articulo>
--EXECUTE dbo.articulo_activar
-- ===================================================

create proc [dbo].[articulo_activar]
@idarticulo integer
as
update articulo set estado=1
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_actualizar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento actualizar articulo
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer la actualización de los acticulos>
--EXECUTE dbo.articulo_actualizar
-- ===================================================

create  proc [dbo].[articulo_actualizar]
@idarticulo integer,
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(50),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
update articulo set idcategoria=@idcategoria,codigo=@codigo,
nombre=@nombre,precio_venta=@precio_venta,stock=@stock,
descripcion=@descripcion,imagen=@imagen
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar articulo
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer una busqueda de articulos>
--EXECUTE dbo.articulo_buscar
-- ===================================================

create proc [dbo].[articulo_buscar]
@valor varchar(50)
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
where a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%'
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_codigo]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar codigo articulo por codido
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer una busqueda de articulos por codigo>
--EXECUTE dbo.articulo_buscar_codigo
-- ===================================================

create proc [dbo].[articulo_buscar_codigo]
@valor varchar(50)
as
select idarticulo,codigo,nombre,precio_venta,stock from articulo
where codigo=@valor
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_codigo_venta]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar articulo por codigo de venta
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer una busqueda de articulos por codigo de venta>
--EXECUTE dbo.articulo_buscar_codigo_venta
-- ===================================================

create proc [dbo].[articulo_buscar_codigo_venta]
@valor varchar(50)
as
select idarticulo,codigo,nombre,precio_venta,stock
from articulo
where codigo=@valor and stock>0
GO
/****** Object:  StoredProcedure [dbo].[articulo_buscar_venta]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer una busqueda de articulos por venta>
--EXECUTE dbo.articulo_buscar_venta
-- ===================================================

create proc [dbo].[articulo_buscar_venta]
@valor varchar(50)
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
where (a.nombre like '%' +@valor + '%' Or a.descripcion like '%' +@valor + '%')
and a.stock>0
order by a.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[articulo_desactivar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento desactivar articulo 
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite desactivar los articulos >
--EXECUTE dbo.articulo_desactivar
-- ===================================================

create proc [dbo].[articulo_desactivar]
@idarticulo integer
as
update articulo set estado=0
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_eliminar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento eliminar una categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite eliminar una categoria que ya no utilicemos>
--EXECUTE dbo.categoria_eliminar
-- ===================================================

create proc [dbo].[articulo_eliminar]
@idarticulo integer
as
delete from articulo
where idarticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[articulo_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento agregar articulo 
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite agregar un articulo a la BD>
--EXECUTE dbo.articulo_insertar
-- ===================================================

create proc [dbo].[articulo_insertar]
@idcategoria integer,
@codigo varchar(50),
@nombre varchar(100),
@precio_venta decimal(11,2),
@stock integer,
@descripcion varchar(255),
@imagen varchar(20)
as
insert into articulo (idcategoria,codigo,nombre,precio_venta,stock,descripcion,imagen)
values (@idcategoria,@codigo,@nombre,@precio_venta,@stock,@descripcion,@imagen)
GO
/****** Object:  StoredProcedure [dbo].[articulo_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar articulo
-- ===================================================
-- Author: <Paico Santos Paola>
-- Create date: <13/10/2022>
-- Description: <permite hacer una lista de los acticulos>
--EXECUTE dbo.articulo_listar
-- ===================================================

create proc [dbo].[articulo_listar]
as
select a.idarticulo as ID,a.idcategoria,c.nombre as Categoria,
a.codigo as Codigo,a.nombre as Nombre,a.precio_venta as Precio_Venta,
a.stock as Stock,a.descripcion as Descripcion,a.imagen as Imagen,
a.estado as Estado
from articulo a inner join categoria c on a.idcategoria=c.idcategoria
order by a.idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_activar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento activar una categoria 
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite activar una categoria>
--EXECUTE dbo.categoria_activar
-- ===================================================

create proc [dbo].[categoria_activar]
@idcategoria int
as
update categoria set estado=1
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_actualizar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento actualizar una categoria 
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite realizar una actualización a las categorias ya almacenadas>
--EXECUTE dbo.categoria_actualizar
-- ===================================================

create proc [dbo].[categoria_actualizar]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(255)
as
update categoria set nombre=@nombre,descripcion=@descripcion
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar una categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite realizar una busqueda de categoria>
--EXECUTE dbo.categoria_buscar
-- ===================================================

create proc [dbo].[categoria_buscar]
@valor varchar(50)
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
where nombre like '%' + @valor + '%' Or descripcion like '%' + @valor + '%'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[categoria_desactivar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento desactiva una categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite desactivar una categoria que se encuentra activa>
--EXECUTE dbo.categoria_desactivar
-- ===================================================

create proc [dbo].[categoria_desactivar]
@idcategoria int
as
update categoria set estado=0
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_eliminar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento elimina una categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite eliminar una categoria que ya no utilicemos>
--EXECUTE dbo.categoria_eliminar
-- ===================================================

create proc [dbo].[categoria_eliminar]
@idcategoria int
as
delete from categoria
where idcategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[categoria_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento inserta una categoria 
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite insertar una nueva categoria>
--EXECUTE dbo.categoria_insertar
-- ===================================================

create proc [dbo].[categoria_insertar]
@nombre varchar(50),
@descripcion varchar(255)
as
insert into categoria (nombre,descripcion) values (@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[categoria_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite listar las categorias almacenadas en la BD>
--EXECUTE dbo.categoria_listar
-- ===================================================

create proc [dbo].[categoria_listar]
as
select idcategoria as ID,nombre as Nombre,descripcion as Descripcion,estado as Estado
from categoria
order by idcategoria desc
GO
/****** Object:  StoredProcedure [dbo].[categoria_seleccionar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento seleccionar categoria
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite seleccionar los datos una categoria>
--EXECUTE dbo.categoria_seleccionar
-- ===================================================

create proc [dbo].[categoria_seleccionar]
as
select idcategoria,nombre from categoria
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[ingreso_anular]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento anular ingreso
-- ===================================================
-- Author: <Wilmer Cunyarache>
-- Create date: <13/10/2022>
-- Description: <permite anular un ingreso registrado>
--EXECUTE dbo.ingreso_anular
-- ===================================================

create proc [dbo].[ingreso_anular]
@idingreso int
as
update ingreso set estado='Anulado'
where idingreso=@idingreso;
update articulo 
set stock=stock-d.cantidad
from articulo a
inner join
(select idarticulo,cantidad from detalle_ingreso where idingreso=@idingreso) as d
on a.idarticulo=d.idarticulo;
GO
/****** Object:  StoredProcedure [dbo].[ingreso_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar ingresos
-- ===================================================
-- Author: <Wilmer Cunyarache>
-- Create date: <13/10/2022>
-- Description: <permite realizar una busqueda de los ingresos>
--EXECUTE dbo.ingreso_buscar
-- ===================================================

create proc [dbo].[ingreso_buscar]
@valor varchar(50)
as
select i.idingreso as ID, i.idusuario,u.nombre as Usuario,p.nombre as Proveedor,
i.tipo_comprobante as Tipo_Comprobante,i.serie_comprobante as Serie,
i.num_comprobante as Numero,i.fecha as Fecha,i.impuesto as Impuesto,
i.total as Total,i.estado as Estado
from ingreso i inner join usuario u on i.idusuario=u.idusuario
inner join persona p on i.idproveedor=p.idpersona
where i.num_comprobante like '%' +@valor + '%' Or p.nombre like '%' +@valor + '%' 
order by i.fecha asc
GO
/****** Object:  StoredProcedure [dbo].[ingreso_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento insertar ingresos
-- ===================================================
-- Author: <Wilmer Cunyarache>
-- Create date: <13/10/2022>
-- Description: <permite insertar ingresos>
--EXECUTE dbo.ingreso_buscar
-- ===================================================

create proc [dbo].[ingreso_insertar]
@idingreso int output,
@idusuario int,
@idproveedor int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(4,2),
@total decimal(11,2),
@detalle type_detalle_ingreso READONLY
as
begin
	--Insertamos en la cabecera
	insert into ingreso (idproveedor,idusuario,tipo_comprobante,serie_comprobante,
	num_comprobante,fecha,impuesto,total,estado)
	values(@idproveedor,@idusuario,@tipo_comprobante,@serie_comprobante,
	@num_comprobante,getdate(),@impuesto,@total,'Aceptado');
	--Obtener el idingreso autogenerado
	SET @idingreso=@@IDENTITY;
	--Insertar los detalles
	insert detalle_ingreso (idingreso,idarticulo,cantidad,precio)
	select @idingreso,d.idarticulo,d.cantidad,d.precio
	from @detalle d;
end
GO
/****** Object:  StoredProcedure [dbo].[ingreso_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar ingresos
-- ===================================================
-- Author: <Wilmer Cunyarache>
-- Create date: <13/10/2022>
-- Description: <permite listar los ingresos>
--EXECUTE dbo.ingreso_listar
-- ===================================================

create proc [dbo].[ingreso_listar]
as
select i.idingreso as ID, i.idusuario,u.nombre as Usuario,p.nombre as Proveedor,
i.tipo_comprobante as Tipo_Comprobante,i.serie_comprobante as Serie,
i.num_comprobante as Numero,i.fecha as Fecha,i.impuesto as Impuesto,
i.total as Total,i.estado as Estado
from ingreso i inner join usuario u on i.idusuario=u.idusuario
inner join persona p on i.idproveedor=p.idpersona
order by i.idingreso desc
GO
/****** Object:  StoredProcedure [dbo].[ingreso_listar_detalle]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar detalles de ingresos
-- ===================================================
-- Author: <Wilmer Cunyarache>
-- Create date: <13/10/2022>
-- Description: <permite listar los detalles de los ingreso>
--EXECUTE dbo.ingreso_listar_detalle
-- ===================================================

create proc [dbo].[ingreso_listar_detalle]
@idingreso int
as
select d.idarticulo as ID,a.codigo as CODIGO,a.nombre as ARTICULO,
d.cantidad as CANTIDAD,d.precio as PRECIO,(d.precio*d.cantidad) as IMPORTE
from detalle_ingreso d inner join articulo a on d.idarticulo=a.idarticulo
where d.idingreso=@idingreso
GO
/****** Object:  StoredProcedure [dbo].[persona_actualizar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento actualizar persona
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite actualizar los datos de una persona>
--EXECUTE dbo.persona_actualizar
-- ===================================================

create proc [dbo].[persona_actualizar]
@idpersona integer,
@tipo_persona varchar(20),
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
update persona set tipo_persona=@tipo_persona,nombre=@nombre,
tipo_documento=@tipo_documento,num_documento=@num_documento,direccion=@direccion,
telefono=@telefono,email=@email
where idpersona=@idpersona
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar persona
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite buscar una persona>
--EXECUTE dbo.persona_buscar
-- ===================================================

create proc [dbo].[persona_buscar]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where nombre like '%' +@valor + '%' Or email like '%' +@valor + '%'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar_clientes]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar cliente
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite buscar un cliente dentro de la tabla persona>
--EXECUTE dbo.persona_buscar_clientes
-- ===================================================

create proc [dbo].[persona_buscar_clientes]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where (nombre like '%' +@valor + '%' Or email like '%' +@valor + '%')
and tipo_persona='Cliente'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_buscar_proveedores]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar proveedor
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite buscar un proveedor dentro de la tabla persona>
--EXECUTE dbo.persona_buscar_proveedores
-- ===================================================

create proc [dbo].[persona_buscar_proveedores]
@valor varchar(50)
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where (nombre like '%' +@valor + '%' Or email like '%' +@valor + '%')
and tipo_persona='Proveedor'
order by nombre asc
GO
/****** Object:  StoredProcedure [dbo].[persona_eliminar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento eliminar persona
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite eliminar dentro de la tabla persona>
--EXECUTE dbo.persona_buscar_proveedores
-- ===================================================

create proc [dbo].[persona_eliminar]
@idpersona integer
as
delete from persona
where idpersona=@idpersona
GO
/****** Object:  StoredProcedure [dbo].[persona_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento insertar una persona
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite insertar una persona a la tabla>
--EXECUTE dbo.persona_insertar
-- ===================================================

create proc [dbo].[persona_insertar]
@tipo_persona varchar(20),
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50)
as
insert into persona (tipo_persona,nombre,tipo_documento,num_documento,direccion,telefono,email)
values (@tipo_persona,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email)
GO
/****** Object:  StoredProcedure [dbo].[persona_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar persona
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite listar a la tabla persona>
--EXECUTE dbo.persona_listar
-- ===================================================

create proc [dbo].[persona_listar]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[persona_listar_clientes]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar clientes
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite listar a los clientes>
--EXECUTE dbo.persona_listar_clientes
-- ===================================================

create proc [dbo].[persona_listar_clientes]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where tipo_persona='Cliente'
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[persona_listar_proveedores]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar proveedores
-- ===================================================
-- Author: <Edwin Santamaria>
-- Create date: <13/10/2022>
-- Description: <permite listar a los proveedores>
--EXECUTE dbo.persona_listar_proveedores
-- ===================================================

create proc [dbo].[persona_listar_proveedores]
as
select idpersona as ID, tipo_persona as Tipo_Persona,nombre as Nombre,
tipo_documento as Tipo_Documento,num_documento as Num_Documento,
direccion as Direccion,telefono as Telefono,email as Email
from persona
where tipo_persona='Proveedor'
order by idpersona desc
GO
/****** Object:  StoredProcedure [dbo].[rol_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar roles
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite listar los roles>
--EXECUTE dbo.rol_listar
-- ===================================================

create proc [dbo].[rol_listar]
as
select idrol,nombre from rol
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[usuario_activar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento activar usurio
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite activar usuario>
--EXECUTE dbo.usuario_activar
-- ===================================================

create proc [dbo].[usuario_activar]
@idusuario integer
as
update usuario set estado=1
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_actualizar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento actualizar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite actualizar el usuario>
--EXECUTE dbo.usuario_actualizar
-- ===================================================

create proc [dbo].[usuario_actualizar]
@idusuario integer,
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
if @clave<>''
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email,clave=HASHBYTES('SHA2_256', @clave)
where idusuario=@idusuario;
else
update usuario set idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where idusuario=@idusuario;
GO
/****** Object:  StoredProcedure [dbo].[usuario_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite buscar un usuario>
--EXECUTE dbo.usuario_buscar
-- ===================================================

create proc [dbo].[usuario_buscar]
@valor varchar(50)
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[usuario_desactivar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento desactivar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite desactivar el usuario>
--EXECUTE dbo.usuario_desactivar
-- ===================================================

create proc [dbo].[usuario_desactivar]
@idusuario integer
as
update usuario set estado=0
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_eliminar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento eliminar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite eliminar un usuario>
--EXECUTE dbo.usuario_eliminar
-- ===================================================

create proc [dbo].[usuario_eliminar]
@idusuario integer
as
delete from usuario
where idusuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento insertar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite agregar un usuario>
--EXECUTE dbo.usuario_insertar
-- ===================================================

create proc [dbo].[usuario_insertar]
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
insert into usuario (idrol,nombre,tipo_documento,num_documento,direccion,telefono,email,clave)
values (@idrol,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email,HASHBYTES('SHA2_256',@clave))
GO
/****** Object:  StoredProcedure [dbo].[usuario_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite listar los usuarios>
--EXECUTE dbo.usuario_listar
-- ===================================================

create proc [dbo].[usuario_listar]
as
select u.idusuario as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.idrol=r.idrol
 order by u.idusuario desc
GO
/****** Object:  StoredProcedure [dbo].[usuario_login]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento login usuario
-- ===================================================
-- Author: <Carlos Guarniz>
-- Create date: <13/10/2022>
-- Description: <permite validar el ingreso al login>
--EXECUTE dbo.usuario_login
-- ===================================================


create proc [dbo].[usuario_login]
@email varchar(50),
@clave varchar(50)
as
select u.idusuario,u.idrol,r.nombre as rol,u.nombre,u.estado
from usuario u inner join rol r on u.idrol=r.idrol
where u.email=@email and u.clave=HASHBYTES('SHA2_256',@clave)
GO
/****** Object:  StoredProcedure [dbo].[venta_anular]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento anular venta
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite anular una venta registrada>
--EXECUTE dbo.venta_anular
-- ===================================================

create proc [dbo].[venta_anular]
@idventa int
as
update venta set estado='Anulado'
where idventa=@idventa;
update articulo
set stock=stock+d.cantidad
from articulo a
inner join
(select idarticulo,cantidad from detalle_venta where idventa=@idventa) as d
on a.idarticulo=d.idarticulo;
GO
/****** Object:  StoredProcedure [dbo].[venta_buscar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento buscar venta
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite buscar una venta>
--EXECUTE dbo.venta_buscar
-- ===================================================

create proc [dbo].[venta_buscar]
@valor varchar(50)
as
select v.idventa as ID,v.idusuario,u.nombre as Usuario,p.nombre as Cliente,
v.tipo_comprobante as Tipo_Comprobante,v.serie_comprobante as Serie,
v.num_comprobante as Numero,v.fecha as Fecha,v.impuesto as Impuesto,
v.total as Total,v.estado as Estado
from venta v inner join usuario u on v.idusuario=u.idusuario
inner join persona p on v.idcliente=p.idpersona
where v.num_comprobante like '%' + @valor + '%' Or p.nombre like '%' + @valor + '%'
Order by v.fecha asc
GO
/****** Object:  StoredProcedure [dbo].[venta_comprobante]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento venta comprobante
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite realizar el tipo de comprobante>
--EXECUTE dbo.venta_comprobante
-- ===================================================

create proc [dbo].[venta_comprobante]
@idventa int
as
select p.nombre as Cliente,p.direccion,p.telefono,p.email,
u.nombre as Usuario,v.tipo_comprobante,v.serie_comprobante,v.num_comprobante,
v.fecha,v.impuesto,v.total,
a.nombre as articulo,d.cantidad,d.precio,d.descuento,
((d.cantidad*d.precio)-d.descuento) as importe
from venta v inner join persona p on v.idcliente=p.idpersona
inner join usuario u on v.idusuario=u.idusuario
inner join detalle_venta d on v.idventa=d.idventa
inner join articulo a on d.idarticulo=a.idarticulo
where v.idventa=@idventa
GO
/****** Object:  StoredProcedure [dbo].[venta_consulta_fechas]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento consultar venta por fecha
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite consultar las ventas de una fecha>
--EXECUTE dbo.venta_consulta_fechas
-- ===================================================

create proc [dbo].[venta_consulta_fechas]
@fecha_inicio date,
@fecha_fin date
as
select v.idventa as ID,v.idusuario,u.nombre as Usuario,p.nombre as Cliente,
v.tipo_comprobante as Tipo_Comprobante,v.serie_comprobante as Serie,
v.num_comprobante as Numero,v.fecha as Fecha,v.impuesto as Impuesto,
v.total as Total,v.estado as Estado
from venta v inner join usuario u on v.idusuario=u.idusuario
inner join persona p on v.idcliente=p.idpersona
where v.fecha>=@fecha_inicio and v.fecha<=@fecha_fin
Order by v.idventa desc
GO
/****** Object:  StoredProcedure [dbo].[venta_insertar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento insertar una venta 
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite insertar una venta>
--EXECUTE dbo.venta_consulta_fechas
-- ===================================================

create proc [dbo].[venta_insertar]
@idventa int output,
@idusuario int,
@idcliente int,
@tipo_comprobante varchar(20),
@serie_comprobante varchar(7),
@num_comprobante varchar(10),
@impuesto decimal(4,2),
@total decimal(11,2),
@detalle type_detalle_venta READONLY
as
begin
	insert into venta (idusuario,idcliente,tipo_comprobante,serie_comprobante,
	num_comprobante,fecha,impuesto,total,estado)
	values (@idusuario,@idcliente,@tipo_comprobante,@serie_comprobante,
	@num_comprobante,getdate(),@impuesto,@total,'Aceptado');
	
	set @idventa=@@IDENTITY;

	insert detalle_venta (idventa,idarticulo,cantidad,precio,descuento)
	select @idventa,d.idarticulo,d.cantidad,d.precio,d.descuento
	from @detalle d;
end
GO
/****** Object:  StoredProcedure [dbo].[venta_listar]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar ventas
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite listar ventas>
--EXECUTE dbo.venta_listar
-- ===================================================

create proc [dbo].[venta_listar]
as
select v.idventa as ID,v.idusuario,u.nombre as Usuario,p.nombre as Cliente,
v.tipo_comprobante as Tipo_Comprobante,v.serie_comprobante as Serie,
v.num_comprobante as Numero,v.fecha as Fecha,v.impuesto as Impuesto,
v.total as Total,v.estado as Estado
from venta v inner join usuario u on v.idusuario=u.idusuario
inner join persona p on v.idcliente=p.idpersona
Order by v.idventa desc
GO
/****** Object:  StoredProcedure [dbo].[venta_listar_detalle]    Script Date: 18/10/2022 2:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento listar detalle venta
-- ===================================================
-- Author: <Segundo Asenjo>
-- Create date: <13/10/2022>
-- Description: <permite listar detalles de la ventas>
--EXECUTE dbo.venta_listar_detalle
-- ===================================================

create proc [dbo].[venta_listar_detalle]
@idventa int
as
select d.idarticulo as ID,a.codigo as CODIGO, a.nombre as ARTICULO,
d.cantidad as CANTIDAD,d.precio as PRECIO,d.descuento as DESCUENTO,
((d.cantidad*d.precio)-d.descuento) as IMPORTE
from detalle_venta d inner join articulo a on d.idarticulo=a.idarticulo
where d.idventa=@idventa
GO
USE [master]
GO
ALTER DATABASE [DB_SistemaTaiPaper] SET  READ_WRITE 
GO
