USE [master]
GO
/****** Object:  Database [shish]    Script Date: 11.03.2023 13:32:38 ******/
CREATE DATABASE [shish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shish] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shish] SET ARITHABORT OFF 
GO
ALTER DATABASE [shish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shish] SET  MULTI_USER 
GO
ALTER DATABASE [shish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shish] SET QUERY_STORE = OFF
GO
USE [shish]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Этап выполнения] [nchar](10) NULL,
	[ЗАказчик] [nchar](10) NULL,
	[Менеджер] [nchar](10) NOT NULL,
	[Стоимость] [float] NOT NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC,
	[Дата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказные изделия]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказные изделия](
	[Артикул изделия] [int] NOT NULL,
	[Номер заказа] [int] NOT NULL,
	[Количество] [nchar](10) NULL,
 CONSTRAINT [PK_Заказные изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул изделия] ASC,
	[Номер заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Изделия]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Изделия](
	[Артикул] [int] NOT NULL,
	[Наименование] [nchar](10) NULL,
	[Ширина] [nchar](10) NULL,
	[Длина] [nchar](10) NULL,
	[Изображение] [varbinary](max) NOT NULL,
	[Комментарий] [varbinary](max) NULL,
 CONSTRAINT [PK_Изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Логин] [nchar](20) NOT NULL,
	[Пароль] [nchar](16) NOT NULL,
	[Роль] [nchar](50) NULL,
	[Наименование] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC,
	[Пароль] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад Ткани]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад Ткани](
	[Рулон] [int] NOT NULL,
	[Артикул ткани] [nchar](10) NOT NULL,
	[Длина] [nchar](10) NULL,
 CONSTRAINT [PK_Склад Ткани] PRIMARY KEY CLUSTERED 
(
	[Рулон] ASC,
	[Артикул ткани] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад Фурнитуры]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад Фурнитуры](
	[Партия] [int] NOT NULL,
	[Артикул Фурнитуры] [nchar](10) NOT NULL,
	[Количество] [nchar](10) NULL,
 CONSTRAINT [PK_Склад Фурнитуры] PRIMARY KEY CLUSTERED 
(
	[Партия] ASC,
	[Артикул Фурнитуры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ткани изделия]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ткани изделия](
	[Артикул ткани] [int] NOT NULL,
	[Артикул изделия] [int] NOT NULL,
 CONSTRAINT [PK_Ткани изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул ткани] ASC,
	[Артикул изделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ткань]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ткань](
	[Артикул] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
	[Цвет] [nchar](10) NOT NULL,
	[Рисунок] [nvarchar](50) NOT NULL,
	[Изображение] [varbinary](max) NOT NULL,
	[Состав] [nvarchar](max) NOT NULL,
	[Ширина] [int] NULL,
	[Длина] [int] NULL,
	[Цена] [float] NULL,
 CONSTRAINT [PK_Ткань] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура](
	[Артикул] [int] NOT NULL,
	[Наименование] [nchar](50) NULL,
	[Тип] [nchar](50) NULL,
	[Ширина] [int] NULL,
	[Длина] [int] NOT NULL,
	[Вес] [float] NOT NULL,
	[Изображение] [varbinary](max) NOT NULL,
	[Цена] [float] NULL,
 CONSTRAINT [PK_Фурнитура] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура Изделия]    Script Date: 11.03.2023 13:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура Изделия](
	[Артикул Фурнитуры] [int] NOT NULL,
	[Артикул Изделия] [int] NOT NULL,
	[Размещение] [nchar](10) NULL,
	[Ширина] [int] NULL,
	[Длина] [int] NULL,
	[Поворот] [int] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [PK_Фурнитура Изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул Фурнитуры] ASC,
	[Артикул Изделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказные изделия]  WITH CHECK ADD  CONSTRAINT [FK_Заказные изделия_Изделия] FOREIGN KEY([Артикул изделия])
REFERENCES [dbo].[Изделия] ([Артикул])
GO
ALTER TABLE [dbo].[Заказные изделия] CHECK CONSTRAINT [FK_Заказные изделия_Изделия]
GO
ALTER TABLE [dbo].[Склад Ткани]  WITH CHECK ADD  CONSTRAINT [FK_Склад Ткани_Ткань] FOREIGN KEY([Рулон])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[Склад Ткани] CHECK CONSTRAINT [FK_Склад Ткани_Ткань]
GO
ALTER TABLE [dbo].[Склад Фурнитуры]  WITH CHECK ADD  CONSTRAINT [FK_Склад Фурнитуры_Фурнитура] FOREIGN KEY([Партия])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[Склад Фурнитуры] CHECK CONSTRAINT [FK_Склад Фурнитуры_Фурнитура]
GO
ALTER TABLE [dbo].[Ткани изделия]  WITH CHECK ADD  CONSTRAINT [FK_Ткани изделия_Изделия] FOREIGN KEY([Артикул ткани])
REFERENCES [dbo].[Изделия] ([Артикул])
GO
ALTER TABLE [dbo].[Ткани изделия] CHECK CONSTRAINT [FK_Ткани изделия_Изделия]
GO
ALTER TABLE [dbo].[Ткани изделия]  WITH CHECK ADD  CONSTRAINT [FK_Ткани изделия_Ткань] FOREIGN KEY([Артикул изделия])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[Ткани изделия] CHECK CONSTRAINT [FK_Ткани изделия_Ткань]
GO
ALTER TABLE [dbo].[Фурнитура Изделия]  WITH CHECK ADD  CONSTRAINT [FK_Фурнитура Изделия_Изделия] FOREIGN KEY([Артикул Изделия])
REFERENCES [dbo].[Изделия] ([Артикул])
GO
ALTER TABLE [dbo].[Фурнитура Изделия] CHECK CONSTRAINT [FK_Фурнитура Изделия_Изделия]
GO
ALTER TABLE [dbo].[Фурнитура Изделия]  WITH CHECK ADD  CONSTRAINT [FK_Фурнитура Изделия_Фурнитура] FOREIGN KEY([Артикул Фурнитуры])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[Фурнитура Изделия] CHECK CONSTRAINT [FK_Фурнитура Изделия_Фурнитура]
GO
USE [master]
GO
ALTER DATABASE [shish] SET  READ_WRITE 
GO
