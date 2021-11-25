USE [PRJ301_SE1506_Assignment_BuiThiThuyLinh]
GO
/****** Object:  Table [dbo].[tblCategorys] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorys](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategorys] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategorys] ON
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (1, N'Case')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (2, N'CPU')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (3, N'MainBoard')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (4, N'VGA')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (5, N'RAM')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (6, N'PSU')
SET IDENTITY_INSERT [dbo].[tblCategorys] OFF
/****** Object:  Table [dbo].[tblRoles]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](2) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'ADMINSTATION')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'USER')
/****** Object:  Table [dbo].[tblUsers] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](200) NULL,
	[email] [varchar](50) NULL,
	[roleID] [varchar](2) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [address], [email], [roleID], [status]) VALUES (N'admin', N'admin', N'Admin', N'0123456789', N'309/18', N'admin@gmail.com', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [address], [email], [roleID], [status]) VALUES (N'linh', N'123', N'Thuy Linh', N'0159753246', N'Binh Phuoc', N'linh@gmail.com', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [phone], [address], [email], [roleID], [status]) VALUES (N'tien', N'123', N'Minh Tien', N'0357951624', N'Binh Duong', N'tien@gmail.com', N'US', 1)
/****** Object:  Table [dbo].[tblProducts]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[price] [float] NULL,
	[image] [varchar](50) NULL,
	[supplier] [nvarchar](50) NULL,
	[importDate] [datetime] NULL,
	[quantity] [int] NULL,
	[categoryID] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (1, N'Corsair 680XR GBTB', 25, N'CaseCorsair680X RGBTG.png', N'Corsair', CAST(0x0000AB4300000000 AS DateTime), 10, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (2, N'AMD Ryzen 75800X', 45, N'CPUAMDRyzen75800X.png', N'AMD', CAST(0x0000A88100000000 AS DateTime), 8, 2, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (3, N'ASUS PRIMEB 450MA', 20, N'MainboardASUSPRIMEB450MA.png', N'ASUS', CAST(0x0000A7E300000000 AS DateTime), 3, 3, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (4, N'Jetek M500500', 10, N'PSUJetekM500500.png', N'Jetek', CAST(0x0000A15F00000000 AS DateTime), 10, 6, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (5, N'Desktop Adata XPG Spectrix D60G RGB 8GB', 20, N'RamDesktopAdataXPGSpectrixD60GRGB8GB.png', N'Desktop', CAST(0x00008FE700000000 AS DateTime), 15, 5, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (6, N'ASUS DUAL RTX2060 Super 8 GEVOV2', 150, N'VGAASUSDUALRTX2060Super8GEVOV2.png', N'ASUS', CAST(0x0000ADF600000000 AS DateTime), 5, 4, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (7, N'Desktop Gskill Trident ZRGB 16GB', 20, N'RAMDesktopGskillTridentZRGB16GB.png', N'Desktop', CAST(0x0000AB0500000000 AS DateTime), 11, 5, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (8, N'Gigabyte GAGPP 650B650W Active PFC', 18, N'PSUGigabyteGAGPP650B650WActivePFC.png', N'Gigabyte', CAST(0x0000A0E100000000 AS DateTime), 12, 6, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (9, N'ASUS TUF RX6800XTO 16G GAMING', 125, N'VGAASUSTUFRX6800XTO16GGAMING.png', N'ASUS', CAST(0x0000A9EB00000000 AS DateTime), 11, 4, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (10, N'Intel Corei5 10400', 75, N'CPUIntelCorei510400.png', N'Intel', CAST(0x0000AAD800000000 AS DateTime), 22, 2, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (11, N'SAMA Jazovoplus XII', 15, N'CaseSAMAJazovoplusXII.png', N'GAMA', CAST(0x0000A1F800000000 AS DateTime), 12, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (12, N'ASUS TUF GAMING Z590PLUS WIFI', 27, N'MainboardASUSTUFGAMINGZ590PLUSWIFI.png', N'ASUS', CAST(0x0000AD2700000000 AS DateTime), 5, 3, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (13, N'ASUS ROG STRIX 1000W GOLD', 30, N'PSUASUSROGSTRIX1000WGOLD1000W.png', N'ASUS', CAST(0x0000AD2700000000 AS DateTime), 7, 6, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (14, N'Gigabyte B550 AORUS ELITE', 52, N'MainboardGigabyteB550AORUSELITE.png', N'Gigabyte', CAST(0x0000AD2700000000 AS DateTime), 11, 3, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (15, N'Intel Corei7 9700F', 90, N'CPUIntelCorei79700F.png', N'Intel', CAST(0x0000AD2700000000 AS DateTime), 21, 2, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (16, N'GIGABYTE RX570 GAMING 4G', 100, N'VGAGIGABYTERX570GAMING4G.png', N'Gigabyte', CAST(0x0000AD2700000000 AS DateTime), 50, 4, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (17, N'EKlassic InWin303EK Black', 27, N'CaseEKlassicInWin303EKBlack.png', N'EK', CAST(0x0000AD2700000000 AS DateTime), 13, 1, 1)
INSERT [dbo].[tblProducts] ([productID], [title], [price], [image], [supplier], [importDate], [quantity], [categoryID], [status]) VALUES (18, N'Desktop Gskill Trident ZNeo 16GB', 34, N'RAMDesktopGskillTridentZNeo16GB.png', N'Desktop', CAST(0x0000AD2700000000 AS DateTime), 21, 5, 1)
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
/****** Object:  Table [dbo].[tblOrders]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[date] [datetime] NULL,
	[total] [float] NULL,
	[code] [varchar](15) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'linh1/7/21 4:36 PM', N'linh', CAST(0x0000AD5D01118F40 AS DateTime), 100, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'linh1/7/21 4:43 PM', N'linh', CAST(0x0000AD5D01137B70 AS DateTime), 150, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'linh9/7/21 10:59 AM', N'linh', CAST(0x0000AD6000B4FFF0 AS DateTime), 1200, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'LLtien7/10/21 2:08 PM', N'tien', CAST(0x0000AD6100E8E900 AS DateTime), 80, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'LLtien7/10/21 2:13 PM', N'tien', CAST(0x0000AD6100EA4890 AS DateTime), 20, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'LLtien7/10/21 2:16 PM', N'tien', CAST(0x0000AD6100EB1B80 AS DateTime), 20, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'tien4/7/21 10:48 AM', N'tien', CAST(0x0000AD6000B1FA80 AS DateTime), 220, NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total], [code]) VALUES (N'tien4/7/21 4:44 PM', N'tien', CAST(0x0000AD5D0113C1C0 AS DateTime), 20, NULL)
/****** Object:  Table [dbo].[tblOrderDetails]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [varchar](50) NULL,
	[productID] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetailID] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, N'linh1/7/21 4:36 PM', 3, 20, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, N'linh1/7/21 4:43 PM', 4, 10, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, N'linh1/7/21 4:43 PM', 5, 20, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, N'tien4/7/21 4:44 PM', 5, 20, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, N'tien4/7/21 10:48 AM', 4, 10, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, N'tien4/7/21 10:48 AM', 8, 18, 10)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, N'linh9/7/21 10:59 AM', 6, 150, 8)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, N'LLtien7/10/21 2:08 PM', 3, 20, 4)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, N'LLtien7/10/21 2:13 PM', 3, 20, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, N'LLtien7/10/21 2:16 PM', 3, 20, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
/****** Object:  ForeignKey [FK_tblOrderDetailID_tblOrders]    ******/
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailID_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetailID_tblOrders]
GO
/****** Object:  ForeignKey [FK_tblOrderDetailID_tblProducts]  ******/
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetailID_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetailID_tblProducts]
GO
/****** Object:  ForeignKey [FK_tblOrders_tblUsers]   ******/
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
/****** Object:  ForeignKey [FK_tblProducts_tblCategorys]  *****/
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategorys] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategorys] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategorys]
GO
/****** Object:  ForeignKey [FK_tblUsers_tblRoles1]   ******/
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles1] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles1]
GO
