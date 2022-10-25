USE [master]
GO
CREATE DATABASE [asm_sof2031]
--  USE [master] drop database [asm_sof2031] 
-- select * from [Products]
go
use asm_sof2031
CREATE TABLE [dbo].[Categories](
	[Id] [char](4)  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
)
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1)  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Price2] [float] NOT NULL,
	[Soluong] [float],
	[CategoryId] [char](4) NOT NULL,
	)
GO

CREATE TABLE [dbo].[Giohang](
	[Id] [int] IDENTITY(1,1)  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Price2] [float] NOT NULL,
	[Soluong] [float],
	[CategoryId] [char](4),
)
GO


CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
)
GO

CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1)  NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) ,
	[Email] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) ,
	[Admin] [bit] ,
)
go

CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1),
	[Username] [nvarchar](50),
	[CreateDate] [date] ,
)
go

CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) ,
	[OrderId] [int] ,
	[ProductId] [int],
	[Price] [float],
	[Quantity] [int],
)
go


INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'samsung')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'iphone')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'oppo')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'xiaomi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'realme')

SET IDENTITY_INSERT [dbo].[Products] ON 
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Price2], [Soluong],  [CategoryId]) VALUES (1, N'Samsung Galaxy S22 Ultra 5G', N'1001.jpg', 28990000, 30990000,76,  N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Price2], [Soluong],   [CategoryId]) VALUES (2, N'iPhone 11 64GB', N'1002.jpg', 12890000, 14990000,55,  N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Price2],[Soluong],    [CategoryId]) VALUES (3, N'OPPO Reno7 Z 5G ', N'1003.jpg', 10490000, 15990000,123, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Price2], [Soluong],   [CategoryId]) VALUES (4, N'Xiaomi 11T 5G 128GB ', N'1004.jpg', 9990000, 10990000,98, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Price2], [Soluong],   [CategoryId]) VALUES (5, N'Realme C35 64GB', N'1005.jpg', 4290000, 4990000,120, N'1004')
SET IDENTITY_INSERT [dbo].[Products] OFF

INSERT INTO Accounts (Username, Password, Email, Fullname, Admin) VALUES (N'hoai', N'123', N'hoaihoai448@gmail.com', N'Vanhoai', 0)
INSERT INTO Accounts (Username, Password, Email, Fullname, Admin) VALUES (N'admin', N'123', N'123@gmail.com', N'admin', 1)

INSERT INTO Orders (Username, CreateDate) VALUES (N'admin', '2022-06-20')
-- select * from OrderDetails
