USE [E:\PROJECTS\SKYNETZ.FALEMAIS\SKYNETZ.FALEMAIS.DATAACCESS\DB\SKYNETZ.FALEMAIS.MDF]
GO
/****** Object:  Table [dbo].[Authorization]    Script Date: 7/17/2022 12:29:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[SystemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Authoriz__3214EC0714027F2A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/17/2022 12:29:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[EMail] [varchar](200) NOT NULL,
	[PlanId] [int] NOT NULL,
 CONSTRAINT [PK__Customer__3214EC07397DD57F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fares]    Script Date: 7/17/2022 12:29:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fares](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [tinyint] NOT NULL,
	[Destination] [tinyint] NOT NULL,
	[Time] [int] NOT NULL,
	[PlanId] [int] NOT NULL,
	[StarterValue] [decimal](18, 2) NOT NULL,
	[DiscountedValue] [decimal](18, 2) NOT NULL,
	[FullValue] [decimal](18, 2) NOT NULL,
	[UnitValue] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC072EEB446D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 7/17/2022 12:29:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authorization] ON 

INSERT [dbo].[Authorization] ([Id], [CustomerId], [LastLogin], [Expires], [SystemId]) VALUES (2, 1, CAST(N'2022-07-16T13:59:00.000' AS DateTime), CAST(N'2022-07-22T00:00:00.000' AS DateTime), N'8db78685-d885-4fbb-a098-1427b669bd28')
SET IDENTITY_INSERT [dbo].[Authorization] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [MiddleName], [LastName], [EMail], [PlanId]) VALUES (1, N'Michael', N'K', N'Pennington', N'mp@skynetz.local', 4)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Fares] ON 

INSERT [dbo].[Fares] ([Id], [Origin], [Destination], [Time], [PlanId], [StarterValue], [DiscountedValue], [FullValue], [UnitValue]) VALUES (1, 11, 16, 20, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
INSERT [dbo].[Fares] ([Id], [Origin], [Destination], [Time], [PlanId], [StarterValue], [DiscountedValue], [FullValue], [UnitValue]) VALUES (2, 11, 17, 80, 2, CAST(0.00 AS Decimal(18, 2)), CAST(37.40 AS Decimal(18, 2)), CAST(136.00 AS Decimal(18, 2)), CAST(1.70 AS Decimal(18, 2)))
INSERT [dbo].[Fares] ([Id], [Origin], [Destination], [Time], [PlanId], [StarterValue], [DiscountedValue], [FullValue], [UnitValue]) VALUES (3, 18, 11, 200, 3, CAST(0.00 AS Decimal(18, 2)), CAST(167.20 AS Decimal(18, 2)), CAST(380.00 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
INSERT [dbo].[Fares] ([Id], [Origin], [Destination], [Time], [PlanId], [StarterValue], [DiscountedValue], [FullValue], [UnitValue]) VALUES (4, 18, 17, 100, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Fares] OFF
GO
SET IDENTITY_INSERT [dbo].[Plans] ON 

INSERT [dbo].[Plans] ([Id], [Description]) VALUES (1, N'FaleMais 30')
INSERT [dbo].[Plans] ([Id], [Description]) VALUES (2, N'FaleMais 60')
INSERT [dbo].[Plans] ([Id], [Description]) VALUES (3, N'FaleMais 120')
INSERT [dbo].[Plans] ([Id], [Description]) VALUES (4, N'Sem Fale Mais')
SET IDENTITY_INSERT [dbo].[Plans] OFF
GO
ALTER TABLE [dbo].[Fares] ADD  CONSTRAINT [DF_Fares_StarterValue]  DEFAULT ((0)) FOR [StarterValue]
GO
ALTER TABLE [dbo].[Fares] ADD  CONSTRAINT [DF__Plans__Discounte__2E1BDC42]  DEFAULT ((0)) FOR [DiscountedValue]
GO
ALTER TABLE [dbo].[Fares] ADD  CONSTRAINT [DF__Plans__FullValue__2F10007B]  DEFAULT ((0)) FOR [FullValue]
GO
ALTER TABLE [dbo].[Authorization]  WITH CHECK ADD  CONSTRAINT [FK_Authorization_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Authorization] CHECK CONSTRAINT [FK_Authorization_Customers]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Plans] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plans] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Plans]
GO
ALTER TABLE [dbo].[Fares]  WITH CHECK ADD  CONSTRAINT [FK_Fares_Plans] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plans] ([Id])
GO
ALTER TABLE [dbo].[Fares] CHECK CONSTRAINT [FK_Fares_Plans]
GO
