USE [master]
GO
/****** Object:  Database [Banco]    Script Date: 08/12/2012 14:55:22 ******/
CREATE DATABASE [Banco] ON  PRIMARY 
( NAME = N'Banco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Banco.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Banco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Banco_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Banco] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banco] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Banco] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Banco] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Banco] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Banco] SET ARITHABORT OFF
GO
ALTER DATABASE [Banco] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Banco] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Banco] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Banco] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Banco] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Banco] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Banco] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Banco] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Banco] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Banco] SET  DISABLE_BROKER
GO
ALTER DATABASE [Banco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Banco] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Banco] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Banco] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Banco] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Banco] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Banco] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Banco] SET  READ_WRITE
GO
ALTER DATABASE [Banco] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Banco] SET  MULTI_USER
GO
ALTER DATABASE [Banco] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Banco] SET DB_CHAINING OFF
GO
USE [Banco]
GO
/****** Object:  Table [dbo].[Tipo_usuarios]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [char](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_pessoas]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_pessoas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [char](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sangues]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sangues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [char](3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pessoas](
	[cep] [char](20) NULL,
	[telefone2] [char](50) NULL,
	[cidade] [char](30) NULL,
	[cpf] [char](15) NULL,
	[data_nascimento] [date] NULL,
	[email] [char](50) NULL,
	[endereco] [char](255) NULL,
	[estado] [char](2) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [char](255) NULL,
	[observacao] [char](255) NULL,
	[telefone1] [char](50) NULL,
	[tipo_pessoa_id] [int] NULL,
	[cargo] [char](30) NULL,
	[nome_usuario] [char](30) NULL,
	[senha] [char](30) NULL,
	[cnpj] [char](30) NULL,
	[sangue_id] [int] NULL,
	[tipo_usuario_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movimentacoes]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimentacoes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NULL,
	[credito] [int] NULL,
	[debito] [int] NULL,
	[pessoa_id] [int] NULL,
	[status] [bit] NULL,
	[sangue_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fichas_predoacao]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fichas_predoacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aprovada] [bit] NULL,
	[peso_doador] [real] NULL,
	[aborto_parto] [bit] NULL,
	[gravida] [bit] NULL,
	[amamentando] [bit] NULL,
	[tatuagem_piercing_acupuntura] [bit] NULL,
	[transfusao] [bit] NULL,
	[bebidas_alcoolicas] [bit] NULL,
	[usuario_drogas] [bit] NULL,
	[doencas_infectocontagiosas] [bit] NULL,
	[gripe_resfriado_diarreia] [bit] NULL,
	[ferimento] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correspondencias]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correspondencias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pessoa_id] [int] NULL,
	[data] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracoes]    Script Date: 08/12/2012 14:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracoes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome_conf] [char](255) NULL,
	[valor_conf] [char](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
