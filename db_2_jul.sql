USE [master]
GO
/****** Object:  Database [db_consulta_legal]    Script Date: 7/2/2021 3:01:44 PM ******/
CREATE DATABASE [db_consulta_legal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_consulta_legal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_consulta_legal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_consulta_legal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_consulta_legal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [db_consulta_legal] SET QUERY_STORE = OFF
GO
USE [db_consulta_legal]
GO
/****** Object:  User [app_user]    Script Date: 7/2/2021 3:01:44 PM ******/
CREATE USER [app_user] FOR LOGIN [app_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [app_user]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [app_user]
GO
/****** Object:  Table [dbo].[tb_boleta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_boleta](
	[idBoleta] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](16) NOT NULL,
	[idClasificador] [tinyint] NOT NULL,
	[idRespuesta] [int] NULL,
	[fechaHora] [datetime] NOT NULL,
	[palabraClave1] [varchar](16) NOT NULL,
	[palabraClave2] [varchar](16) NULL,
	[comentario] [varchar](256) NOT NULL,
	[ipDispositivo] [varchar](32) NOT NULL,
 CONSTRAINT [PK_tb_boleta] PRIMARY KEY CLUSTERED 
(
	[idBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_clasificador]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_clasificador](
	[idClasificador] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](96) NOT NULL,
 CONSTRAINT [PK_tb_clasificador] PRIMARY KEY CLUSTERED 
(
	[idClasificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_recuperar_boletas]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_recuperar_boletas]
AS
SELECT dbo.tb_boleta.idBoleta AS id, dbo.tb_boleta.palabraClave1 AS clave1, dbo.tb_boleta.palabraClave2 AS clave2, dbo.tb_boleta.idRespuesta AS estado, dbo.tb_clasificador.descripcion AS clasificador, dbo.tb_boleta.comentario AS consulta, 
                  dbo.tb_boleta.fechaHora AS fecha
FROM     dbo.tb_boleta INNER JOIN
                  dbo.tb_clasificador ON dbo.tb_boleta.idClasificador = dbo.tb_clasificador.idClasificador
GO
/****** Object:  Table [dbo].[tb_cambio_boleta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cambio_boleta](
	[idCambio] [tinyint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tb_comentario_respuesta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comentario_respuesta](
	[idComentario] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](16) NOT NULL,
 CONSTRAINT [PK_tb_comentario_respuesta] PRIMARY KEY CLUSTERED 
(
	[idComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_departamento]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_departamento](
	[idDepartamento] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](64) NOT NULL,
 CONSTRAINT [PK_tb_departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_evidencia]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_evidencia](
	[idEvidencia] [tinyint] IDENTITY(1,1) NOT NULL,
	[idBoleta] [int] NOT NULL,
	[urlArchivoEvidencia] [varchar](128) NULL,
	[detalle] [varchar](512) NOT NULL,
 CONSTRAINT [PK_tb_evidencia] PRIMARY KEY CLUSTERED 
(
	[idEvidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_genero]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_genero](
	[idGenero] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](16) NULL,
 CONSTRAINT [PK_tb_genero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_login]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_login](
	[correo] [varchar](48) NOT NULL,
	[contrasena] [varchar](60) NOT NULL,
	[cedula] [varchar](16) NOT NULL,
 CONSTRAINT [PK_tb_login_1] PRIMARY KEY CLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_respuesta_legal]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_respuesta_legal](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idComentario] [tinyint] NULL,
	[idUsuario] [varchar](16) NOT NULL,
	[detalle] [varchar](512) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[ipDispositivo] [varchar](12) NULL,
 CONSTRAINT [PK_tb_respuesta_legal] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[cedula] [varchar](16) NOT NULL,
	[idDepartamento] [tinyint] NOT NULL,
	[idGenero] [tinyint] NOT NULL,
	[nombre] [varchar](16) NOT NULL,
	[apellidos] [varchar](32) NOT NULL,
	[urlArchivoFoto] [varchar](48) NULL,
	[fechaNacimiento] [date] NOT NULL,
	[correo] [varchar](48) NOT NULL,
	[celular] [varchar](24) NULL,
	[codigo] [smallint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tb_usuario_1] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
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
ALTER TABLE [dbo].[tb_boleta]  WITH CHECK ADD  CONSTRAINT [FK_tb_boleta_tb_usuario] FOREIGN KEY([cedula])
REFERENCES [dbo].[tb_usuario] ([cedula])
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
ALTER TABLE [dbo].[tb_login]  WITH CHECK ADD  CONSTRAINT [FK_tb_login_tb_usuario] FOREIGN KEY([cedula])
REFERENCES [dbo].[tb_usuario] ([cedula])
GO
ALTER TABLE [dbo].[tb_login] CHECK CONSTRAINT [FK_tb_login_tb_usuario]
GO
ALTER TABLE [dbo].[tb_respuesta_legal]  WITH CHECK ADD  CONSTRAINT [FK_tb_respuesta_legal_tb_comentario_respuesta] FOREIGN KEY([idComentario])
REFERENCES [dbo].[tb_comentario_respuesta] ([idComentario])
GO
ALTER TABLE [dbo].[tb_respuesta_legal] CHECK CONSTRAINT [FK_tb_respuesta_legal_tb_comentario_respuesta]
GO
ALTER TABLE [dbo].[tb_respuesta_legal]  WITH CHECK ADD  CONSTRAINT [FK_tb_respuesta_legal_tb_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tb_usuario] ([cedula])
GO
ALTER TABLE [dbo].[tb_respuesta_legal] CHECK CONSTRAINT [FK_tb_respuesta_legal_tb_usuario]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[tb_departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_departamento]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_genero1] FOREIGN KEY([idGenero])
REFERENCES [dbo].[tb_genero] ([idGenero])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_genero1]
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_correo_usuario]    Script Date: 7/2/2021 3:01:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_consultar_login]    Script Date: 7/2/2021 3:01:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insertar_boleta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_boleta]
@cedula AS VARCHAR(16),
@clasificador AS TINYINT,
@fechaHora AS DATETIME,
@palabraClave1 AS VARCHAR(16),
@palabraClave2 AS VARCHAR(16),
@comentario AS VARCHAR(256),
@ip AS VARCHAR(32),
@url AS VARCHAR(128),
@id AS INT OUTPUT
AS
BEGIN
	insert into [dbo].[tb_boleta] ([cedula],
								   [idClasificador],
								   [fechaHora],
								   [palabraClave1],
								   [palabraClave2],
								   [comentario],
								   [ipDispositivo])
	values (@cedula,
			@clasificador,
			@fechaHora,
			@palabraClave1,
			@palabraClave2,
			@comentario,
			@ip)
	select @id = idBoleta from tb_boleta where fechaHora = @fechaHora;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_evidencia]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_evidencia]
@boleta AS INT,
@url AS VARCHAR(48),
@detalle AS VARCHAR(512)
AS
BEGIN
	insert into [dbo].[tb_evidencia] ([idBoleta],
								   [urlArchivoEvidencia],
								   [detalle])
	values (@boleta,
			@url,
			@detalle)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_respuesta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_respuesta]
@cedula AS VARCHAR(16),
@detalle AS VARCHAR(512),
@fechaHora AS DATETIME,
@ip AS VARCHAR(32),
@id AS INT OUT
AS
BEGIN
	INSERT INTO [DBO].[tb_respuesta_legal] ([idUsuario], [detalle], [fechaHora], [ipDispositivo])
	values (@cedula, @detalle, @fechaHora, @fechaHora);
	SELECT @id = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_usuario]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insertar_usuario]
@cedula as varchar(16),
@nombre as varchar(16),
@apellidos as varchar(32),
@fechaNacimiento as date,
@correo as varchar(48),
@celular as varchar(24),
@contrasena as varchar(60),
@genero as tinyint,
@departamento as tinyint
AS
BEGIN
	insert into dbo.tb_usuario ([cedula],[nombre],[apellidos],[fechaNacimiento],[correo],[celular],[idGenero],[idDepartamento])
	values (@cedula,@nombre,@apellidos,@fechaNacimiento,@correo,@celular,@genero,@departamento)
	insert into dbo.tb_login ([cedula],[contrasena],[correo]) 
	values (@cedula,@contrasena,@correo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_modificar_boleta]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_modificar_boleta]
@idBoleta AS INT,
@idRespuesta AS INT

AS
BEGIN
	UPDATE [DBO].[tb_boleta] 
	SET [idRespuesta] = @idRespuesta
	WHERE [idBoleta] = @idBoleta
END
GO
/****** Object:  StoredProcedure [dbo].[sp_recuperar_id_departamento]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_recuperar_id_departamento] 
   @descripcion VARCHAR(16),
   @id TINYINT OUTPUT
AS  
BEGIN  
   SELECT  @id=[idDepartamento]
   FROM [db_consulta_legal].[dbo].[tb_departamento]
   WHERE [dbo].[tb_departamento].[descripcion] = @descripcion  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_recuperar_id_genero]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_recuperar_id_genero] 
   @descripcion VARCHAR(16),
   @id TINYINT OUTPUT
AS  
BEGIN  
   SELECT  @id=[idGenero]
   FROM [db_consulta_legal].[dbo].[tb_genero]
   WHERE [dbo].[tb_genero].[descripcion] = @descripcion  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_recuperar_login]    Script Date: 7/2/2021 3:01:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_recuperar_login] 
   @correo varchar(48),
   @cedula varchar(16) OUTPUT,
   @contrasena varchar(60) OUTPUT
AS  
BEGIN  
   SELECT  @cedula=[cedula], @contrasena=[contrasena]
   FROM [db_consulta_legal].[dbo].[tb_login]
   WHERE [dbo].[tb_login].correo = @correo  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_validar_login]    Script Date: 7/2/2021 3:01:44 PM ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[31] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_boleta"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 313
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_clasificador"
            Begin Extent = 
               Top = 46
               Left = 606
               Bottom = 288
               Right = 800
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2148
         Alias = 2592
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_recuperar_boletas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_recuperar_boletas'
GO
USE [master]
GO
ALTER DATABASE [db_consulta_legal] SET  READ_WRITE 
GO
