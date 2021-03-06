USE [master]
GO
/****** Object:  Database [CarStoreDB]    Script Date: 8/30/2016 5:07:28 PM ******/
CREATE DATABASE [CarStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarStoreDB', FILENAME = N'd:\Programs\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CarStoreDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarStoreDB_log', FILENAME = N'd:\Programs\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CarStoreDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarStoreDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarStoreDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CarStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarStoreDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarStoreDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CarStoreDB]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 8/30/2016 5:07:29 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMaterials]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductMaterials] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[ImageGUID] [nvarchar](200) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseStates]    Script Date: 8/30/2016 5:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseStates](
	[PurchaseStateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PurchaseStates] PRIMARY KEY CLUSTERED 
(
	[PurchaseStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (1, N'Other')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (2, N'Retro')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (3, N'Sportcar')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (4, N'Movie Models')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[ProductMaterials] ON 

INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (1, N'Other')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (2, N'1:18')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (3, N'1:24')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (4, N'1:12')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (5, N'1:43')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (6, N'1:64')
INSERT [dbo].[ProductMaterials] ([MaterialID], [MaterialName]) VALUES (7, N'1:32')
SET IDENTITY_INSERT [dbo].[ProductMaterials] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (2, N'Volkswagen Beetle "Forrest Gump" Movie', N'Volkswagen', N'Brand new 1:64 scale car model of 1961 Volkswagen Beetle "Forrest Gump" Movie (1994) die cast model car by Greenlight.
Limited Edition.
Has Rubber Tires.
Comes in a blister pack.
Detailed Interior, Exterior.
Metal Body and Chassis.
Officially Licensed Product.
Dimensions Approximately L-2 1/2 Inches Long.', 4, 6, 9.99, N'f6d861e6-b2c6-47f6-970a-db2f7157343b.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (3, N'Family Truckster Wagon Queen "National Lampoon''s Vacation"', N'Family Truckster', N'Brand new 1:64 scale car model of 1979 Family Truckster Wagon Queen "National Lampoon''s Vacation" (1983) in Blister Pack die cast model car by Greenlight.
Limited Edition.
Has Rubber Tires.
Comes in a blister pack.
Detailed Interior, Exterior.
Metal Body and Chassis.
Officially Licensed Product.
Dimensions Approximately L-2 1/2 Inches Long.', 4, 6, 9.99, N'6c7a8958-2e9a-42a1-924f-c81faf460382.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (4, N'Volkswagen Beetle "The Love Bug" Herbie', N'Volkswagen', N'Brand new 1:18 scale diecast car model of Volkswagen Beetle "The Love Bug" Herbie #53 die cast car model by Hotwheels.
Brand new box.
Rubber tires.
Made of diecast metal.
Detailed interior, exterior.
Dimensions approximately L-8, W-4, H-3.55 inches.
Volkswagen Beetle "The Love Bug" Herbie #53 1/18 Diecast Model Car by Hotwheels.', 4, 2, 59.99, N'0a3fdcc6-2e7d-4b52-93ec-8f01e8e78684.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (5, N'Volkswagen Type 2 Bus (T2B) "Lost" TV Series', N'Volkswagen', N'1971 Volkswagen Type 2 Bus (T2B) "Lost" TV Series (2004-2010) 1/18 Diecast Model by Greenlight.', 4, 2, 69.99, N'd3088d62-e24d-45b9-b96a-d930787a1e84.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (6, N'Pontiac Firebird Trans Am "Kill Bill" Movie', N'Pontiac', N'Limited Edition.
Has Rubber Tires.
Comes in a blister pack.
Detailed Interior, Exterior.
Metal Body and Chassis.
Officially Licensed Product.
Dimensions Approximately L-2 1/2 Inches Long.
1979 Pontiac Firebird Trans Am "Kill Bill" Movie Part 1 & 2 1/64 Diecast Model Car by Greenlight.', 4, 6, 9.99, N'b31610f8-9478-407a-9afb-88c8b16432ac.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (7, N'Chrysler 300C Black "Breaking Bad"', N'Chrysler ', N'Brand new 1:64 scale car model of 2012 Chrysler 300C Black "Breaking Bad" 2008-2013 TV Series Episode 5.04 Hollywood Series 9 die cast model car by Greenlight.
Limited Edition.
Has Rubber Tires.
Comes in a blister pack.
Detailed Interior, Exterior.
Metal Body and Chassis.
Officially Licensed Product.
Dimensions Approximately L-2 1/2 Inches Long.
2012 Chrysler 300C SRT-8 Black "Breaking Bad" 2008-2013 TV Series Episode 5.04 Hollywood Series 9 1/64 Diecast Model Car by Greenlight.', 4, 6, 9.99, N'b13fff07-8832-48cb-bd17-2b40a018219d.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (8, N'Dodge Challenger SRT Hellcat Green', N'Dodge ', N' 2015 Dodge Challenger SRT Hellcat Green 1/24 Diecast Model Car by Jada.', 3, 3, 19.99, N'20dea412-b5c6-4b2b-b4a3-306480671331.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (9, N'Ferrari 250 GTO #19 Le Mans', N'Ferrari ', N'Brand new 1:18 scale diecast car model of 1962 Ferrari 250 GTO #19 Le Mans Red Limited Edition to 1500pcs die cast car by CMC.
PLEASE NOTE:
Front vents are in the box and NOT attached to the car. There is a corresponding screw for each hood vent. 
Also, we have included a mini flat head screwdriver for each model.  
Please be aware.
A highlight of the 30th 24 Hours of Le Mans that took place from June 23rd to 24th, 1962 was the debut of the newly-developed Ferrari 250 GTO, which went into the race with high expectations and optimism. The race was the 8th series run of the World Sportscar Championship of the year.
What was new was the classification of participating vehicles into 18 different racing classes. In the experimental class, the driver-duo Olivier Gendebien /Phil Hill raced a highly powerful Ferrari 330 TRI/LM Testa Rossa Spyder to the first place in overall standing. For the GT class, Ferrari had a new trump card -- the Belgian driver-duo Pierre Noblet/Jean Guichet in 250 GTO Chassis #3705 with the license plate MO-77914. This was a team with seasoned experience in endurance racing as well as prudent and outstanding driving skills.
Fifty-five teams started off on the course. The Olivier Gendebien/Phil Hill team finished first in overall standing after completing 331 laps that totaled 4,451.255 km in 24 hours. Their average speed was 185.469 km/h, with Phil Hill driving the Spyder to establish the fastest lap time at 3.57.700 minutes, 204.202 km/h.
Also remarkable was the result achieved by Pierre Noblet /Jean Guichet, the GT-class winner team in its Ferrari 250 GTO with starting #19 on a blue, white, and red tricolor-striped body. They covered a distance of 4,384.136 km in 24 hours, completing 326 laps at an average speed of 182.67 km/h. In addition to their first-place finish in the GT class, the remarkable performance led them to a 2nd position in overall standing. Three of the participant GTO’s finished in the top six places, thus making Le Mans 1962 one of the most successful racing events for Ferrari to this day.
Has steerable wheels.
Brand new box.
Rubber tires.
Made of diecast with some plastic parts.
Detailed interior, exterior, engine compartment.
Dimensions approximately L-10.5, W-4.5, H-3.5 inches.
1962 Ferrari 250 GTO #19 Le Mans Red Limited Edition to 1500pcs die cast car by CMC.', 2, 2, 499.99, N'072dee56-c6c2-4a65-9d8d-0552d9ac9e2f.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (10, N'Ferrari 488 GTB Yellow 1/24', N'Ferrari ', N'Ferrari 488 GTB Yellow 1/24 Diecast Model Car by Bburago.', 3, 3, 19.99, N'97dd53ce-fd88-4719-bbbc-ac3d42fe9f12.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (11, N'Lamborghini Veneno Roadster Green', N'Lamborghini ', N'Lamborghini Veneno Roadster Green with Green Line 1/18 Diecast Model Car by Kyosho.', 3, 2, 109.99, N'a4366d24-ad72-49b3-bfdf-eec32c14cc8b.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (12, N'Aston Martin DB5 007 Edition James Bond', N'Aston Martin', N'Brand new 1:12 scale Aston Martin DB5 007 Edition James Bond Car Limited Edition to 1500pcs by GT Spirit.
A true work of art, the DB5 is, without contest, THE James Bond car! With bodywork made of aluminium, it was produced by Carrozzeria Touring (using their licensed trademark design “Superleggera”).
Brand new box.
Rubber tires.
Detailed interior, exterior.
Dimensions approximately L-15, W-6, H-4.5 inches.', 4, 4, 299.99, N'1288fedf-6dc0-4771-b8a0-bbe81ff4a114.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (13, N'Chevrolet Corvette Red', N'Chevrolet', N'Brand new 1:18 scale diecast 1962 Chevrolet Corvette Red by AutoArt.
Only 6000 Produced Worldwide.
Has steerable wheels.
Brand new box.
Rubber tires.
Made of diecast with some plastic parts.
Detailed interior, exterior, engine compartment.
Dimensions approximately L-10, W-4, H-3.5 inches.
1962 Chevrolet Corvette Red Limited to 6000pc 1/18 Diecast Model Car by Autoart.', 2, 2, 139.99, N'a4d07d70-7fa3-45a0-aafb-d7f36ec80f10.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (14, N'Dodge Demon 340 Black "Hemmings Muscle Machines"', N'Dodge', N'One of the most collectible Mopars to date—the 1971 Dodge Demon had separate badging as a stand-alone model even though it shared many components, options and sheet metal with the Dart. The wide stance, fastback lines and the muscular 340 4-bbl V8 made this a popular lower-priced performance car in the early 1970s. This is a 1:18 replica of the vehicle that is featured in the Hemmings Muscle Machines, April 2005 issue.
Brand new box.
Rubber tires.
Detailed interior, exterior.
Opening doors, hood & trunk
Steerable front wheels.
Serialized chassis.
Accurate interior and chassis.
Made of diecast metal.
Dimensions approximately L-10, W-4.5, H-3.25 inches.
1971 Dodge Demon 340 "Hemmings Muscle Machines" Limited Edition to 1002pc 1/18 Diecast Model Car by Autoworld.', 2, 2, 94.99, N'424fef0e-a5bb-474a-981c-af35b9b1f143.jpg')
INSERT [dbo].[Products] ([ID], [Model], [Brand], [Description], [CategoryID], [MaterialID], [Price], [ImageGUID]) VALUES (16, N'CAT Caterpillar D4 7U Crawler', N'CAT Caterpillar', N'CAT Caterpillar D4 7U Crawler with 4S Blade and #44 Hydraulic Unit 1/16 Diecast Model by Speccast.', 1, 2, 179.99, N'4032f4dd-e42b-497e-b2fe-bd3db502829c.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductMaterials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[ProductMaterials] ([MaterialID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductMaterials]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Customers]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Products]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_PurchaseStates] FOREIGN KEY([StateID])
REFERENCES [dbo].[PurchaseStates] ([PurchaseStateID])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_PurchaseStates]
GO
USE [master]
GO
ALTER DATABASE [CarStoreDB] SET  READ_WRITE 
GO
