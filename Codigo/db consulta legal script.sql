USE [master]
GO
/****** Object:  Database [db_consulta_legal]    Script Date: 05/06/2021 01:25:29 a.m. ******/
CREATE DATABASE [db_consulta_legal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_consulta_legal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THOMAS_SQLSERVER\MSSQL\DATA\db_consulta_legal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_consulta_legal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.THOMAS_SQLSERVER\MSSQL\DATA\db_consulta_legal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_consulta_legal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_consulta_legal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_consulta_legal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_consulta_legal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_consulta_legal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_consulta_legal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_consulta_legal] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_consulta_legal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_consulta_legal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_consulta_legal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_consulta_legal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_consulta_legal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_consulta_legal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_consulta_legal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_consulta_legal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_consulta_legal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_consulta_legal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_consulta_legal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_consulta_legal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_consulta_legal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_consulta_legal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_consulta_legal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_consulta_legal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_consulta_legal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_consulta_legal] SET RECOVERY FULL 
GO
ALTER DATABASE [db_consulta_legal] SET  MULTI_USER 
GO
ALTER DATABASE [db_consulta_legal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_consulta_legal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_consulta_legal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_consulta_legal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_consulta_legal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_consulta_legal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_consulta_legal', N'ON'
GO
ALTER DATABASE [db_consulta_legal] SET QUERY_STORE = OFF
GO
USE [db_consulta_legal]
GO
/****** Object:  Table [dbo].[tb_boleta]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_boleta](
	[idBoleta] [int] NOT NULL,
	[idUsuario] [smallint] NOT NULL,
	[idClasificador] [tinyint] NOT NULL,
	[idRespuesta] [int] NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[palabraClave1] [varchar](16) NOT NULL,
	[palabraClave2] [varchar](16) NULL,
	[comentario] [varchar](256) NOT NULL,
	[ipDispositivo] [varchar](12) NOT NULL,
 CONSTRAINT [PK_tb_boleta] PRIMARY KEY CLUSTERED 
(
	[idBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cambio_boleta]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cambio_boleta](
	[idCambio] [tinyint] NOT NULL,
	[idBoleta] [int] NOT NULL,
	[idClasificador] [tinyint] NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[palabraClave1] [varchar](16) NOT NULL,
	[palabraClave2] [varchar](16) NULL,
	[comentario] [varchar](256) NOT NULL,
	[ipDispositivo] [varchar](12) NOT NULL,
 CONSTRAINT [PK_tb_cambio_boleta] PRIMARY KEY CLUSTERED 
(
	[idCambio] ASC,
	[idBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_clasificador]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_clasificador](
	[idClasificador] [tinyint] NOT NULL,
	[descripcion] [varchar](96) NOT NULL,
 CONSTRAINT [PK_tb_clasificador] PRIMARY KEY CLUSTERED 
(
	[idClasificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_comentario_respuesta]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comentario_respuesta](
	[idComentario] [tinyint] NOT NULL,
	[descripcion] [varchar](16) NOT NULL,
 CONSTRAINT [PK_tb_comentario_respuesta] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_departamento]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_departamento](
	[idDepartamento] [tinyint] NOT NULL,
	[descripcion] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tb_departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_evidencia]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_evidencia](
	[idEvidencia] [tinyint] NOT NULL,
	[idBoleta] [int] NOT NULL,
	[urlArchivoEvidencia] [varchar](48) NULL,
	[detalle] [varchar](512) NOT NULL,
 CONSTRAINT [PK_tb_evidencia] PRIMARY KEY CLUSTERED 
(
	[idEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_genero]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_genero](
	[idGenero] [tinyint] NOT NULL,
	[descripcion] [varchar](16) NULL,
 CONSTRAINT [PK_tb_genero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_login]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_login](
	[contrasena] [varchar](60) NOT NULL,
	[nombreUsuario] [varchar](16) NOT NULL,
	[idUsuario] [smallint] NOT NULL,
 CONSTRAINT [PK_tb_login] PRIMARY KEY CLUSTERED 
(
	[nombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_respuesta_legal]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_respuesta_legal](
	[idRespuesta] [int] NOT NULL,
	[idComentario] [tinyint] NOT NULL,
	[idUsuario] [smallint] NOT NULL,
	[detalle] [varchar](512) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[ipDispositivo] [varchar](12) NULL,
 CONSTRAINT [PK_tb_respuesta_legal] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[idUsuario] [smallint] NOT NULL,
	[idGenero] [tinyint] NOT NULL,
	[idDepartamento] [tinyint] NOT NULL,
	[cedula] [varchar](16) NOT NULL,
	[nombre] [varchar](16) NOT NULL,
	[apellidos] [varchar](32) NOT NULL,
	[urlArchivoFoto] [varchar](48) NULL,
	[fechaNacimiento] [date] NOT NULL,
	[correo] [varchar](48) NOT NULL,
	[celular] [varchar](24) NULL,
 CONSTRAINT [PK_tb_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_boleta_tb_clasificador] FOREIGN KEY([idClasificador])
REFERENCES [dbo].[tb_clasificador] ([idClasificador])
GO
ALTER TABLE [dbo].[tb_boleta] CHECK CONSTRAINT [FK_tb_boleta_tb_clasificador]
GO
ALTER TABLE [dbo].[tb_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_boleta_tb_respuesta_legal] FOREIGN KEY([idRespuesta])
REFERENCES [dbo].[tb_respuesta_legal] ([idRespuesta])
GO
ALTER TABLE [dbo].[tb_boleta] CHECK CONSTRAINT [FK_tb_boleta_tb_respuesta_legal]
GO
ALTER TABLE [dbo].[tb_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_boleta_tb_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tb_usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tb_boleta] CHECK CONSTRAINT [FK_tb_boleta_tb_usuario]
GO
ALTER TABLE [dbo].[tb_cambio_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_cambio_boleta_tb_boleta] FOREIGN KEY([idBoleta])
REFERENCES [dbo].[tb_boleta] ([idBoleta])
GO
ALTER TABLE [dbo].[tb_cambio_boleta] CHECK CONSTRAINT [FK_tb_cambio_boleta_tb_boleta]
GO
ALTER TABLE [dbo].[tb_cambio_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_cambio_boleta_tb_clasificador] FOREIGN KEY([idClasificador])
REFERENCES [dbo].[tb_clasificador] ([idClasificador])
GO
ALTER TABLE [dbo].[tb_cambio_boleta] CHECK CONSTRAINT [FK_tb_cambio_boleta_tb_clasificador]
GO
ALTER TABLE [dbo].[tb_evidencia]  WITH CHECK ADD  CONSTRAINT [FK_tb_evidencia_tb_boleta] FOREIGN KEY([idBoleta])
REFERENCES [dbo].[tb_boleta] ([idBoleta])
GO
ALTER TABLE [dbo].[tb_evidencia] CHECK CONSTRAINT [FK_tb_evidencia_tb_boleta]
GO
ALTER TABLE [dbo].[tb_login]  WITH CHECK ADD  CONSTRAINT [FK_tb_login_tb_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tb_usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[tb_login] CHECK CONSTRAINT [FK_tb_login_tb_usuario]
GO
ALTER TABLE [dbo].[tb_respuesta_legal]  WITH CHECK ADD  CONSTRAINT [FK_tb_respuesta_legal_tb_comentario_respuesta] FOREIGN KEY([idComentario])
REFERENCES [dbo].[tb_comentario_respuesta] ([idComentario])
GO
ALTER TABLE [dbo].[tb_respuesta_legal] CHECK CONSTRAINT [FK_tb_respuesta_legal_tb_comentario_respuesta]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[tb_departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_departamento]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[tb_genero] ([idGenero])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_genero]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_correo_usuario]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultar_correo_usuario] 
	-- Add the parameters for the stored procedure here
	@idUsuario smallint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT correo from tb_usuario where idUsuario = @idUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_login]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_consultar_login]
@nombreUsuario as varchar(16)
as
select contrasena,nombreUsuario, idUsuario
from dbo.tb_login
where nombreUsuario = @nombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[sp_validar_login]    Script Date: 05/06/2021 01:25:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_validar_login] 
	-- Add the parameters for the stored procedure here
	@nombreUsuario varchar(16), @contrasena varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT idUsuario from tb_login where nombreUsuario = @nombreUsuario and contrasena = @contrasena
END
GO
USE [master]
GO
ALTER DATABASE [db_consulta_legal] SET  READ_WRITE 
GO
