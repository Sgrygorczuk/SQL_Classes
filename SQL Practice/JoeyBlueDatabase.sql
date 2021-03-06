USE [Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/12/2020 3:20:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Age] [int] NULL,
	[City] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/12/2020 3:20:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/12/2020 3:20:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Age], [City]) VALUES (1, N'Joey', N'Adams', 12, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Age], [City]) VALUES (2, N'Harry', N'Bet', 42, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Age], [City]) VALUES (3, N'Karren', N'Tedy', 34, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Age], [City]) VALUES (4, N'Lassy', N'Sams', 74, NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Age], [City]) VALUES (5, N'Kis', N'Dams', 31, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerID], [ProductID]) VALUES (1, CAST(N'2020-02-12T14:54:04.510' AS DateTime), 2, 3)
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerID], [ProductID]) VALUES (2, CAST(N'2020-02-12T14:54:04.510' AS DateTime), 3, 1)
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerID], [ProductID]) VALUES (3, CAST(N'2020-02-12T14:54:04.510' AS DateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (1, N'Ball', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (2, N'Hat', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (3, N'Shirt', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (4, N'Ball', 5.63)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (5, N'Hat', 10.99)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (6, N'Shirt', 23.53)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (7, N'Ball', 5.63)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (8, N'Hat', 10.99)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price]) VALUES (9, N'Shirt', 23.53)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
