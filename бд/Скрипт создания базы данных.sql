USE [master]
GO
/****** Object:  Database [test_fis]    Script Date: 20.08.2021 22:41:40 ******/
CREATE DATABASE [test_fis] ON  PRIMARY 
( NAME = N'test_fis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\test_fis.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_fis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\test_fis_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test_fis] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test_fis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test_fis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test_fis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test_fis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test_fis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test_fis] SET ARITHABORT OFF 
GO
ALTER DATABASE [test_fis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test_fis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test_fis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test_fis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test_fis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test_fis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test_fis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test_fis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test_fis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test_fis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test_fis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test_fis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test_fis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test_fis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test_fis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test_fis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test_fis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test_fis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test_fis] SET  MULTI_USER 
GO
ALTER DATABASE [test_fis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test_fis] SET DB_CHAINING OFF 
GO
USE [test_fis]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[id_publisher] [int] NOT NULL,
	[id_author] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Copy]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_book] [int] NOT NULL,
	[inStock] [bit] NOT NULL,
 CONSTRAINT [PK_Copy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_student] [int] NOT NULL,
	[id_copy] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 20.08.2021 22:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

GO
INSERT [dbo].[Author] ([id], [name]) VALUES (1, N'А.С. Пушкин')
GO
INSERT [dbo].[Author] ([id], [name]) VALUES (2, N'Л.Н.Толстой')
GO
INSERT [dbo].[Author] ([id], [name]) VALUES (3, N'А.П. Чехов')
GO
INSERT [dbo].[Author] ([id], [name]) VALUES (4, N'А.Р. Фет')
GO
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (1, N'Капитанская дочка', 3, 1, 1998)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (2, N'Пиковая дама', 2, 1, 2002)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (3, N'Руслан и Людмила', 3, 1, 2010)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (4, N'Анна Каренина', 1, 2, 2015)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (5, N'Война и Мир', 1, 2, 2009)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (6, N'Война и Мир', 2, 2, 2019)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (7, N'Палата №6', 3, 3, 2004)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (8, N'Дама с собачкой', 1, 3, 2004)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (9, N'Человек в футляре', 3, 3, 2003)
GO
INSERT [dbo].[Book] ([id], [name], [id_publisher], [id_author], [year]) VALUES (11, N'Палач', 3, 4, 2010)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Copy] ON 

GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (2, 1, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (3, 1, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (4, 2, 0)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (5, 4, 0)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (6, 5, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (7, 5, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (8, 6, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (9, 7, 1)
GO
INSERT [dbo].[Copy] ([id], [id_book], [inStock]) VALUES (10, 11, 1)
GO
SET IDENTITY_INSERT [dbo].[Copy] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (1, 3, 9, CAST(N'2021-08-10' AS Date), CAST(N'2021-08-15' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (3, 4, 1, CAST(N'2021-08-08' AS Date), CAST(N'2021-08-10' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (4, 8, 2, CAST(N'2020-10-10' AS Date), CAST(N'2021-02-10' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (5, 3, 5, CAST(N'2021-07-07' AS Date), CAST(N'2021-07-17' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (6, 3, 3, CAST(N'2021-07-07' AS Date), CAST(N'2021-07-17' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (7, 4, 9, CAST(N'2021-08-05' AS Date), CAST(N'2021-08-07' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (8, 6, 4, CAST(N'2021-08-20' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (9, 7, 5, CAST(N'2021-08-19' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (10, 7, 9, CAST(N'2021-08-17' AS Date), CAST(N'2021-08-18' AS Date))
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (11, 3, 1, CAST(N'2021-08-15' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (12, 5, 1, CAST(N'2021-08-15' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (13, 6, 1, CAST(N'2021-08-15' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (14, 7, 1, CAST(N'2021-08-15' AS Date), NULL)
GO
INSERT [dbo].[Orders] ([id], [id_student], [id_copy], [FromDate], [ToDate]) VALUES (15, 3, 10, CAST(N'2021-08-15' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

GO
INSERT [dbo].[Publisher] ([id], [name]) VALUES (1, N'Феникс')
GO
INSERT [dbo].[Publisher] ([id], [name]) VALUES (2, N'Ювента')
GO
INSERT [dbo].[Publisher] ([id], [name]) VALUES (3, N'Эксмо')
GO
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (3, N'Смирнов Антон', N'222111    ')
GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (4, N'Николаев Николай', N'222112    ')
GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (5, N'Александров Александр', N'2222222   ')
GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (6, N'Михайлов Михаил', N'333111    ')
GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (7, N'Иванов Иван', N'111333    ')
GO
INSERT [dbo].[Student] ([id], [name], [phone]) VALUES (8, N'Степанов Степан', N'221133    ')
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([id_author])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([id_publisher])
REFERENCES [dbo].[Publisher] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Book] FOREIGN KEY([id_book])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK_Copy_Book]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Copy] FOREIGN KEY([id_copy])
REFERENCES [dbo].[Copy] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Copy]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Student] FOREIGN KEY([id_student])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Student]
GO
USE [master]
GO
ALTER DATABASE [test_fis] SET  READ_WRITE 
GO
