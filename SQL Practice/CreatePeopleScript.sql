USE [People]
GO
/****** Object:  Table [dbo].[CompanyTable]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTable](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NULL,
	[Employees] [int] NULL,
	[SectorId] [int] NULL,
 CONSTRAINT [PK_CompanyTable] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobby]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobby](
	[HobbyId] [int] IDENTITY(1,1) NOT NULL,
	[Hobby] [nvarchar](10) NULL,
 CONSTRAINT [PK_Hobby] PRIMARY KEY CLUSTERED 
(
	[HobbyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[TitleID] [int] NULL,
	[CompanyId] [int] NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]) PERSISTED,
	[AgeInDays]  AS (datediff(day,[DateOfBirth],getdate())),
	[AgeInYears]  AS (datediff(year,[DateOfBirth],getdate())),
	[AgeInYearsTwo]  AS (datediff(year,[DateOfBirth],getdate())-case when dateadd(year,datediff(year,[DateOfBirth],getdate()),[DateOfBirth])>getdate() then (1) else (0) end),
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonHobby]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonHobby](
	[PersonHobbyId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[HobbyId] [int] NOT NULL,
	[DateStarted] [date] NULL,
	[HoursPerWeek] [tinyint] NULL,
 CONSTRAINT [PK_PersonHobby] PRIMARY KEY CLUSTERED 
(
	[PersonHobbyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[SectorId] [int] IDENTITY(1,1) NOT NULL,
	[Sector] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 2/12/2020 1:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyTable] ON 

INSERT [dbo].[CompanyTable] ([CompanyId], [Company], [Website], [Employees], [SectorId]) VALUES (1, N'LEGO', N'Lego.com', 2000, NULL)
INSERT [dbo].[CompanyTable] ([CompanyId], [Company], [Website], [Employees], [SectorId]) VALUES (2, N'CosCo', N'CosCo.co', 20, NULL)
INSERT [dbo].[CompanyTable] ([CompanyId], [Company], [Website], [Employees], [SectorId]) VALUES (3, N'Wallmart', N'Wall.mart', 200000, NULL)
SET IDENTITY_INSERT [dbo].[CompanyTable] OFF
SET IDENTITY_INSERT [dbo].[Hobby] ON 

INSERT [dbo].[Hobby] ([HobbyId], [Hobby]) VALUES (1, N'LEGO')
INSERT [dbo].[Hobby] ([HobbyId], [Hobby]) VALUES (2, N'Art')
INSERT [dbo].[Hobby] ([HobbyId], [Hobby]) VALUES (3, N'Jet Ski')
INSERT [dbo].[Hobby] ([HobbyId], [Hobby]) VALUES (4, N'Gaming')
SET IDENTITY_INSERT [dbo].[Hobby] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [DateOfBirth], [TitleID], [CompanyId]) VALUES (1, N'Seb', N'K', CAST(N'1000-01-01' AS Date), 1, 1)
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [DateOfBirth], [TitleID], [CompanyId]) VALUES (2, N'Iri', N'aK', CAST(N'1021-04-02' AS Date), 3, 1)
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [DateOfBirth], [TitleID], [CompanyId]) VALUES (3, N'Ad', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([TitleID], [Title]) VALUES (1, N'Mr')
INSERT [dbo].[Title] ([TitleID], [Title]) VALUES (2, N'Ms')
INSERT [dbo].[Title] ([TitleID], [Title]) VALUES (3, N'Mrs')
INSERT [dbo].[Title] ([TitleID], [Title]) VALUES (4, N'Doctor')
INSERT [dbo].[Title] ([TitleID], [Title]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Title] OFF
ALTER TABLE [dbo].[CompanyTable]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTable_Sector] FOREIGN KEY([SectorId])
REFERENCES [dbo].[Sector] ([SectorId])
GO
ALTER TABLE [dbo].[CompanyTable] CHECK CONSTRAINT [FK_CompanyTable_Sector]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_CompanyTable] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyTable] ([CompanyId])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_CompanyTable]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Title]
GO
ALTER TABLE [dbo].[PersonHobby]  WITH CHECK ADD  CONSTRAINT [FK_PersonHobby_Hobby] FOREIGN KEY([HobbyId])
REFERENCES [dbo].[Hobby] ([HobbyId])
GO
ALTER TABLE [dbo].[PersonHobby] CHECK CONSTRAINT [FK_PersonHobby_Hobby]
GO
ALTER TABLE [dbo].[PersonHobby]  WITH CHECK ADD  CONSTRAINT [FK_PersonHobby_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonHobby] CHECK CONSTRAINT [FK_PersonHobby_Person]
GO
