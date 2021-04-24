/*
Script Base de Datos, Proyecto de Ingenieria
version: 1.0
fecha: 21 / 04 / 2021

Creadores:

Thomas Calero
Fabricio Quesada

*/

USE [db_consulta_legal]
GO
/****** Object:  Table [dbo].[tb_boleta]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_cambio_boleta]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_clasificador]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_comentario_respuesta]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_departamento]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_evidencia]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_genero]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_respuesta_legal]    Script Date: 4/23/2021 4:30:01 PM ******/
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
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 4/23/2021 4:30:01 PM ******/
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
