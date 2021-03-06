USE [master]
GO
/****** Object:  Database [ARS]    Script Date: 3/30/2019 4:42:25 PM ******/
CREATE DATABASE [ARS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ARS', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ARS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ARS_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ARS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ARS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ARS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ARS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ARS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ARS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ARS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ARS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ARS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ARS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ARS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ARS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ARS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ARS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ARS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ARS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ARS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ARS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ARS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ARS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ARS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ARS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ARS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ARS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ARS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ARS] SET RECOVERY FULL 
GO
ALTER DATABASE [ARS] SET  MULTI_USER 
GO
ALTER DATABASE [ARS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ARS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ARS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ARS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ARS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ARS]
GO
/****** Object:  Table [dbo].[airline_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airline_master](
	[airline_id] [nvarchar](50) NOT NULL,
	[airline_name] [nvarchar](50) NOT NULL,
	[flight_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_airline_master] PRIMARY KEY CLUSTERED 
(
	[airline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[booking_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_master](
	[booking_id] [numeric](18, 0) IDENTITY(33333,1) NOT NULL,
	[passenger_name] [nvarchar](50) NOT NULL,
	[airline_name] [nvarchar](50) NOT NULL,
	[from_location] [nvarchar](50) NOT NULL,
	[to_location] [nvarchar](50) NOT NULL,
	[no_of_seats] [int] NOT NULL,
	[date_of_journey] [nvarchar](50) NOT NULL,
	[duration] [nvarchar](50) NOT NULL,
	[booking_date] [nvarchar](50) NOT NULL,
	[total_price] [numeric](18, 0) NOT NULL,
	[flight_id] [nvarchar](50) NOT NULL,
	[airline_id] [nvarchar](50) NULL,
	[customer_id] [numeric](18, 0) NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_booking_master] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[flight_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight_master](
	[flight_id] [nvarchar](50) NOT NULL,
	[departure_time] [time](7) NOT NULL,
	[arrival_time] [time](7) NOT NULL,
	[fare] [numeric](18, 2) NOT NULL,
	[total_seats] [int] NOT NULL,
	[departure_date] [date] NOT NULL,
	[arrival_date] [date] NOT NULL,
 CONSTRAINT [PK_flight_master] PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[location_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_master](
	[location_id] [nvarchar](50) NOT NULL,
	[from_location] [nvarchar](50) NOT NULL,
	[to_location] [nvarchar](50) NOT NULL,
	[flight_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_location_master] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[search_temp_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_temp_master](
	[search_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[flight_id] [nvarchar](50) NOT NULL,
	[airline_name] [nvarchar](50) NOT NULL,
	[from_location] [nvarchar](50) NOT NULL,
	[departure_date] [nvarchar](50) NOT NULL,
	[to_location] [nvarchar](50) NOT NULL,
	[arrival_date] [nvarchar](50) NOT NULL,
	[fare] [numeric](18, 2) NOT NULL,
	[total_fare] [numeric](18, 2) NOT NULL,
	[total_seats] [int] NOT NULL,
	[departure_time] [time](7) NULL,
	[arrival_time] [time](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_master](
	[customer_id] [numeric](18, 0) IDENTITY(10001,1) NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[date_of_birth] [nvarchar](50) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
	[phone_number] [nvarchar](10) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[ssn_type] [nvarchar](50) NULL,
	[ssn_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_master] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI74', N'Air India', N'AIF7021')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI78', N'Air India', N'AIF7024')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI79', N'Air India', N'AIF7025')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI80', N'Air India', N'AIF7026')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI81', N'Air India', N'AIF7027')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI82', N'Air India', N'AIF7028')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI83', N'Vistara', N'FI2102')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'AI84', N'AirIndia', N'AIF7022')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'VS2100', N'Vistara', N'FI2100')
INSERT [dbo].[airline_master] ([airline_id], [airline_name], [flight_id]) VALUES (N'VS2101', N'Vistara', N'FI2101')
SET IDENTITY_INSERT [dbo].[booking_master] ON 

INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33339 AS Numeric(18, 0)), N'jhahnavi', N'Air India', N'Delhi', N'Mumbai', 2, N'Mar 25 2019 12:00AM', N'2Hrs', N'Mar-26-2019', CAST(10000 AS Numeric(18, 0)), N'AIF7028', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'jhahnavi@gmail.com', N'9491441860', N'ASV')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33343 AS Numeric(18, 0)), N'abcde', N'Air India', N'Delhi', N'Mumbai', 3, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(15000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'abdul@gmail.com', N'9704747729', N'9-66-5')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33345 AS Numeric(18, 0)), N'jhahnavi', N'Air India', N'Delhi', N'Mumbai', 1, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(5000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(10035 AS Numeric(18, 0)), N'shruti', N'abdul@gmail.com', N'9704747729', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33346 AS Numeric(18, 0)), N'jhahnavi', N'Air India', N'Delhi', N'Mumbai', 1, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(5000 AS Numeric(18, 0)), N'AIF7026', NULL, CAST(10035 AS Numeric(18, 0)), N'shruti', N'abdul@gmail.com', N'9704747729', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33347 AS Numeric(18, 0)), N'abcde', N'Air India', N'Delhi', N'Mumbai', 1, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(5000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(10035 AS Numeric(18, 0)), N'shruti', N'jhahnavi@gmail.com', N'9491441860', N'9-66-5')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33348 AS Numeric(18, 0)), N'dfds', N'Air India', N'Delhi', N'Mumbai', 1, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(5000 AS Numeric(18, 0)), N'AIF7026', NULL, CAST(10035 AS Numeric(18, 0)), N'shruti', N'abdul@gmail.com', N'9491441860', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33349 AS Numeric(18, 0)), N'vikash', N'Air India', N'Delhi', N'Mumbai', 1, N'Mar 25 2019 12:00AM', N'1Hrs', N'Mar-26-2019', CAST(5000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(20036 AS Numeric(18, 0)), N'vikash Kumar', N'vikashkmr2411@gmail.com', N'9491441860', N'hyderabad')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33360 AS Numeric(18, 0)), N'jhahnavi', N'Air India', N'Delhi', N'Mumbai', 3, N'Mar-27-2019', N'-1Hrs', N'Mar-27-2019', CAST(15000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'jhahnavi@gmail.com', N'9704747729', N'9-66-5')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33362 AS Numeric(18, 0)), N'jhahnavi', N'Air India', N'Delhi', N'Mumbai', 6, N'Mar-27-2019', N'-1Hrs', N'Mar-27-2019', CAST(30000 AS Numeric(18, 0)), N'AIF7027', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'jhahnavi@gmail.com', N'9704747729', N'9-66-5')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33363 AS Numeric(18, 0)), N'jhahnavi', N'Vistara', N'Kochi', N'Goa', 3, N'Mar-27-2019', N'-1.08333333333333Hrs', N'Mar-27-2019', CAST(9000 AS Numeric(18, 0)), N'FI2101', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'jhahnavi@gmail.com', N'9491441860', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33364 AS Numeric(18, 0)), N'abcde', N'Vistara', N'Kochi', N'Goa', 2, N'Mar-27-2019', N'-1.08333333333333Hrs', N'Mar-27-2019', CAST(4000 AS Numeric(18, 0)), N'FI2100', NULL, CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'vikashkmr2411@gmail.com', N'9704747729', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33365 AS Numeric(18, 0)), N'SWATHI', N'Vistara', N'Kochi', N'Goa', 2, N'Mar-27-2019', N'-1.08333333333333Hrs', N'Mar-27-2019', CAST(4000 AS Numeric(18, 0)), N'FI2100', NULL, CAST(20046 AS Numeric(18, 0)), N'swathi', N'swathireddy@gmail.com', N'8978540438', N'Tcfcgv')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33369 AS Numeric(18, 0)), N'SWATHI', N'Air India', N'Delhi', N'Mumbai', 2, N'Mar-28-2019', N'-1Hrs', N'Mar-28-2019', CAST(10000 AS Numeric(18, 0)), N'AIF7026', NULL, CAST(10033 AS Numeric(18, 0)), N'Abdul Kareem', N'abdul@gmail.com', N'9704747729', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33376 AS Numeric(18, 0)), N'ab', N'Air India', N'Delhi', N'Mumbai', 16, N'Apr-01-2019', N'0.0333333333333333Hrs', N'Mar-29-2019', CAST(160000 AS Numeric(18, 0)), N'AIF7025', NULL, CAST(10033 AS Numeric(18, 0)), N'Abdul Kareem', N'abdul@gmail.com', N'9704747729', N'jjuh')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33383 AS Numeric(18, 0)), N'jhahnavi,shruthi', N'Vistara', N'Kochi', N'Goa', 2, N'Mar-31-2019', N'-1.08333333333333Hrs', N'Mar-30-2019', CAST(6000 AS Numeric(18, 0)), N'FI2101', NULL, CAST(20048 AS Numeric(18, 0)), N'vikash kumar', N'vikash@gmail.com', N'9092026355', N'hyderabad')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33384 AS Numeric(18, 0)), N'jhahnavi,shruthi', N'Vistara', N'Kochi', N'Goa', 2, N'Mar-31-2019', N'-1.08333333333333Hrs', N'Mar-30-2019', CAST(6000 AS Numeric(18, 0)), N'FI2101', NULL, CAST(20048 AS Numeric(18, 0)), N'vikash kumar', N'vikash@gmail.com', N'9092026355', N'hyderabad')
INSERT [dbo].[booking_master] ([booking_id], [passenger_name], [airline_name], [from_location], [to_location], [no_of_seats], [date_of_journey], [duration], [booking_date], [total_price], [flight_id], [airline_id], [customer_id], [customer_name], [email_id], [phone], [address]) VALUES (CAST(33387 AS Numeric(18, 0)), N'shruti', N'Air India', N'Hyderabad', N'Chennai', 3, N'Mar-30-2019', N'-0.966666666666667Hrs', N'Mar-30-2019', CAST(6000 AS Numeric(18, 0)), N'AIF7024', NULL, CAST(10033 AS Numeric(18, 0)), N'Abdul Kareem', N'shrutip@gmail.com', N'8861320804', N'banglure')
SET IDENTITY_INSERT [dbo].[booking_master] OFF
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'001', CAST(N'00:00:00' AS Time), CAST(N'05:00:00' AS Time), CAST(2000.00 AS Numeric(18, 2)), 140, CAST(N'2019-03-30' AS Date), CAST(N'2019-05-30' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7021', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), CAST(2000.00 AS Numeric(18, 2)), 150, CAST(N'2019-03-30' AS Date), CAST(N'2019-03-30' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7022', CAST(N'02:00:00' AS Time), CAST(N'03:00:00' AS Time), CAST(2000.00 AS Numeric(18, 2)), 150, CAST(N'2019-03-30' AS Date), CAST(N'2019-03-30' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7023', CAST(N'08:00:00' AS Time), CAST(N'08:09:00' AS Time), CAST(4000.00 AS Numeric(18, 2)), 170, CAST(N'2019-03-30' AS Date), CAST(N'2019-03-30' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7024', CAST(N'02:02:00' AS Time), CAST(N'03:00:00' AS Time), CAST(2000.00 AS Numeric(18, 2)), 149, CAST(N'2019-03-30' AS Date), CAST(N'2019-03-30' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7025', CAST(N'03:02:00' AS Time), CAST(N'03:00:00' AS Time), CAST(10000.00 AS Numeric(18, 2)), 134, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7026', CAST(N'05:30:00' AS Time), CAST(N'06:30:00' AS Time), CAST(5000.00 AS Numeric(18, 2)), 202, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7027', CAST(N'04:30:00' AS Time), CAST(N'05:30:00' AS Time), CAST(5000.00 AS Numeric(18, 2)), 203, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'AIF7028', CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), CAST(5000.00 AS Numeric(18, 2)), 203, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'FI2100', CAST(N'17:10:00' AS Time), CAST(N'18:15:00' AS Time), CAST(2000.00 AS Numeric(18, 2)), 145, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-02' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'FI2101', CAST(N'19:15:00' AS Time), CAST(N'20:20:00' AS Time), CAST(3000.00 AS Numeric(18, 2)), -2, CAST(N'2019-03-31' AS Date), CAST(N'2019-03-29' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'FI2102', CAST(N'18:10:00' AS Time), CAST(N'19:30:00' AS Time), CAST(4500.00 AS Numeric(18, 2)), 140, CAST(N'2019-03-29' AS Date), CAST(N'2019-03-29' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'RIF7023', CAST(N'07:05:00' AS Time), CAST(N'19:14:00' AS Time), CAST(8000.00 AS Numeric(18, 2)), 200, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-01' AS Date))
INSERT [dbo].[flight_master] ([flight_id], [departure_time], [arrival_time], [fare], [total_seats], [departure_date], [arrival_date]) VALUES (N'RIF7024', CAST(N'07:05:00' AS Time), CAST(N'08:05:00' AS Time), CAST(3000.00 AS Numeric(18, 2)), 150, CAST(N'2019-04-02' AS Date), CAST(N'2019-04-02' AS Date))
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'001', N'Hyderabad', N'Chennai', N'AIF7022')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'002', N'Hyderabad', N'Bangalore', N'AIF7022')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'003', N'Bangalore', N'Hyderabad', N'RIF7023')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'004', N'Hyderabad', N'Chennai', N'AIF7024')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'005', N'Delhi', N'Mumbai', N'AIF7025')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'006', N'Delhi', N'Mumbai', N'AIF7026')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'007', N'Delhi', N'Mumbai', N'AIF7027')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'008', N'Delhi', N'Mumbai', N'AIF7028')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'009', N'Kochi', N'Goa', N'FI2100')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'010', N'Kochi', N'Goa', N'FI2101')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'011', N'Kolkata', N'Bangalore', N'FI2102')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'1', N'Bangalore', N'Hyderabad', N'AIF7022')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'2', N'Chennai', N'Hyderabad', N'RIF7023')
INSERT [dbo].[location_master] ([location_id], [from_location], [to_location], [flight_id]) VALUES (N'3', N'Hyderabad', N'Chennai', N'RIF7024')
SET IDENTITY_INSERT [dbo].[user_master] ON 

INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10033 AS Numeric(18, 0)), N'Abdul Kareem', N'1996-04-04', N'abdul.kareem@gmail.com', N'12345678@Rr', N'9502906000', N'kakinada', N'Male', N'Aadhar', N'930609105557')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10034 AS Numeric(18, 0)), N'jhahnavi', N'1996-01-21', N'saiaspilot3@gmail.com', N'Harshitha@2156', N'9092026355', N'hyderabad', N'Female', N'Aadhar', N'211943395821')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10035 AS Numeric(18, 0)), N'shruti', N'1996-11-24', N'shrutiptng@gmail.com', N'shruti@123', N'8861320804', N'Banglore', N'Female', N'Aadhar', N'123456789007')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10036 AS Numeric(18, 0)), N'ayesha parveen', N'1997-07-28', N'parveenayesha@gmail.com', N'123456789@Ak', N'6303668582', N'bandar', N'Female', N'Aadhar', N'123456789014')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10037 AS Numeric(18, 0)), N'ayesha parveen', N'1997-07-28', N'parveenayesha@gmail.com', N'123456789@Ak', N'6303668582', N'bandar', N'Female', N'Aadhar', N'123456789014')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(10038 AS Numeric(18, 0)), N'ayesha parveen', N'1997-07-28', N'parveenayesha@gmail.com', N'123456789@Ak', N'6303668582', N'bandar', N'Female', N'Aadhar', N'123456789014')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20036 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikash@2411', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930938')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20037 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikash@2411', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930938')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20038 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikashkmr@2411', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930938')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20039 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikash@2411', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930938')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20040 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikash@2411', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930937')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20041 AS Numeric(18, 0)), N'vikash Kumar', N'1996-11-24', N'vikashkmr2411@gmail.com', N'Vikash@123', N'9491441860', N'Hyderabad', N'Male', N'Aadhar', N'546763930937')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20042 AS Numeric(18, 0)), N'huhy', N'2019-03-10', N'abdul.kareemrr@gmail.com', N'Abdul@123', N'9502906000', N'jjuh', N'Male', N'Aadhar', N'930609105557')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20043 AS Numeric(18, 0)), N'huhy', N'2019-03-11', N'saiaspilot3@gmail.com', N'Pagal@123', N'9502906000', N'jjuh', N'Male', N'Aadhar', N'930609105557')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20044 AS Numeric(18, 0)), N'huhy', N'2019-03-06', N'saiaspilot3@gmail.com', N'Abdul@123', N'9502906000', N'jjuh', N'Male', N'Aadhar', N'930609105557')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20045 AS Numeric(18, 0)), N'huhy', N'2019-03-13', N'shrutipta@gmail.com', N'Abdul@1234', N'9502906001', N'jjuh', N'Male', N'Aadhar', N'930609105557')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20046 AS Numeric(18, 0)), N'swathi', N'1998-02-11', N'swathireddy@gmail.com', N'Swathi@1', N'8978540438', N'Tirupathi', N'Female', N'Aadhar', N'211943395822')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20047 AS Numeric(18, 0)), N'munish', N'1997-03-25', N'munish08@gmail.com', N'munni@123', N'7418794488', N'39-1 1st street chennai tamilnadu', N'Male', N'Aadhar', N'210242836253')
INSERT [dbo].[user_master] ([customer_id], [customer_name], [date_of_birth], [email_id], [password], [phone_number], [address], [gender], [ssn_type], [ssn_number]) VALUES (CAST(20048 AS Numeric(18, 0)), N'vikash kumar', N'1996-11-21', N'vikashkmr@gmail.com', N'Vikash@123', N'8707863728', N'hyderabad', N'Male', N'Aadhar', N'124567839725')
SET IDENTITY_INSERT [dbo].[user_master] OFF
ALTER TABLE [dbo].[airline_master]  WITH CHECK ADD  CONSTRAINT [FK_airline_master_flight_master] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight_master] ([flight_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[airline_master] CHECK CONSTRAINT [FK_airline_master_flight_master]
GO
ALTER TABLE [dbo].[booking_master]  WITH CHECK ADD  CONSTRAINT [FK_booking_master_airline_master] FOREIGN KEY([airline_id])
REFERENCES [dbo].[airline_master] ([airline_id])
GO
ALTER TABLE [dbo].[booking_master] CHECK CONSTRAINT [FK_booking_master_airline_master]
GO
ALTER TABLE [dbo].[booking_master]  WITH CHECK ADD  CONSTRAINT [FK_booking_master_flight_master] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight_master] ([flight_id])
GO
ALTER TABLE [dbo].[booking_master] CHECK CONSTRAINT [FK_booking_master_flight_master]
GO
ALTER TABLE [dbo].[booking_master]  WITH CHECK ADD  CONSTRAINT [FK_booking_master_user_master] FOREIGN KEY([customer_id])
REFERENCES [dbo].[user_master] ([customer_id])
GO
ALTER TABLE [dbo].[booking_master] CHECK CONSTRAINT [FK_booking_master_user_master]
GO
ALTER TABLE [dbo].[location_master]  WITH CHECK ADD  CONSTRAINT [FK_location_master_flight_master] FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight_master] ([flight_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[location_master] CHECK CONSTRAINT [FK_location_master_flight_master]
GO
/****** Object:  StoredProcedure [dbo].[BookingIds]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BookingIds] 
	-- Add the parameters for the stored procedure here
	@customer_id numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT booking_id from booking_master where customer_id=@customer_id
END

GO
/****** Object:  StoredProcedure [dbo].[deletebookingmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash
-- Create date: 3-15-2019
-- Description:	Booking table
-- =============================================
CREATE PROCEDURE [dbo].[deletebookingmaster]
	-- Add the parameters for the stored procedure here
	@booking_id numeric(18,0)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from booking_master 
	where booking_id=@booking_id
END

GO
/****** Object:  StoredProcedure [dbo].[deleteflightmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash 
-- Create date: 3-9-19
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteflightmaster] 
	-- Add the parameters for the stored procedure here
	@flight_id nvarchar(50),
	@departure_time datetime,
	@arrival_time datetime,
	@fare numeric(18,2),
	@total_seats int,
	@departure_date date,
	@arrival_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from flight_master
	where flight_id=@flight_id;
END

GO
/****** Object:  StoredProcedure [dbo].[deletelocationmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	location_master
-- =============================================
CREATE PROCEDURE [dbo].[deletelocationmaster] 
	-- Add the parameters for the stored procedure here
	@location_id nvarchar(50),
	@from_location nvarchar(50),
	@to_location nvarchar(50),
	@flight_id nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from  location_master 
	where location_id=@location_id;
END

GO
/****** Object:  StoredProcedure [dbo].[deletesearch_temp_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	search_temp_master
-- =============================================
CREATE PROCEDURE [dbo].[deletesearch_temp_master]
	-- Add the parameters for the stored procedure here
	--@search_id numeric(18,0),
	--@airline_name nvarchar(50),
	--@from_location nvarchar(50),
	--@departure_date datetime,
	--@to_location nvarchar(50),
	--@arrival_date datetime,
	--@fare numeric(18,0)
	
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 truncate table search_temp_master 
	 
	 
END

GO
/****** Object:  StoredProcedure [dbo].[deleteusermaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ramcharan
-- Create date: 3/21/2019
-- Description:	usermasterdelete
-- =============================================
CREATE PROCEDURE [dbo].[deleteusermaster]
	-- Add the parameters for the stored procedure here
	@cutsomer_id numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from user_master where customer_id=@cutsomer_id
END

GO
/****** Object:  StoredProcedure [dbo].[emailvalidation]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[emailvalidation] 
	-- Add the parameters for the stored procedure here
	@email_id nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select email_id from user_master where email_id=@email_id;

END

GO
/****** Object:  StoredProcedure [dbo].[insertairlinemaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	airline_master
-- =============================================
CREATE PROCEDURE [dbo].[insertairlinemaster] 
	-- Add the parameters for the stored procedure here
	@airline_id nvarchar(50),
	@airline_name nvarchar(50),
	@flight_id nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into airline_master 
	values (@airline_id,@airline_name,@flight_id)
END

GO
/****** Object:  StoredProcedure [dbo].[insertbookingmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash
-- Create date: 3-15-2019
-- Description:	Booking table
-- =============================================
CREATE PROCEDURE [dbo].[insertbookingmaster]
	-- Add the parameters for the stored procedure here
	@passenger_name nvarchar(50),
	@airline_name nvarchar(50),
	@from_location nvarchar(50),
	@to_location nvarchar(50),
	@no_of_seats int,
	@date_of_journey nvarchar(50),
	@duration nvarchar(50),
	@booking_date nvarchar(50),
	@total_price numeric(18,2),
	@customer_id numeric(18,0),
	@customer_name nvarchar(50),
	@flight_id nvarchar(50),
	@email_id nvarchar(50),
	@phone nvarchar(50),
	@address nvarchar(100)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into booking_master(passenger_name,airline_name,from_location,to_location,no_of_seats,date_of_journey,duration,booking_date,customer_id,customer_name,flight_id,email_id ,phone,address,total_price)
	values (@passenger_name,@airline_name,@from_location,@to_location,@no_of_seats,@date_of_journey,@duration,@booking_date,@customer_id,@customer_name,@flight_id,@email_id ,@phone,@address,@total_price)
END

GO
/****** Object:  StoredProcedure [dbo].[insertflightmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash 
-- Create date: 3-9-19
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertflightmaster] 
	-- Add the parameters for the stored procedure here
	@flight_id nvarchar(50),
	@departure_time datetime,
	@arrival_time datetime,
	@fare numeric(18,2),
	@total_seats int,
	@departure_date date,
	@arrival_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into flight_master
	values (@flight_id,@departure_time,@arrival_time,@fare,@total_seats,@departure_date,@arrival_date)
END

GO
/****** Object:  StoredProcedure [dbo].[insertlocationmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	location_master
-- =============================================
CREATE PROCEDURE [dbo].[insertlocationmaster] 
	-- Add the parameters for the stored procedure here
	@location_id nvarchar(50),
	@from_location nvarchar(50),
	@to_location nvarchar(50),
	@flight_id nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into location_master 
	values (@location_id,@from_location,@to_location,@flight_id)
END

GO
/****** Object:  StoredProcedure [dbo].[insertsearch_temp_master]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	search_temp_master
-- =============================================
CREATE PROCEDURE [dbo].[insertsearch_temp_master]
	-- Add the parameters for the stored procedure here
	
	@flight_id nvarchar(50),
	@airline_name nvarchar(50),
	@from_location nvarchar(50),
	@departure_date datetime,
	@to_location nvarchar(50),
	@arrival_date datetime,
	@fare numeric(18,2),
	@total_fare numeric(18,2),
	@total_seats int,
	@departure_time time(7),
	@arrival_time time(7)
	
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into search_temp_master(flight_id,airline_name,from_location,departure_date,to_location,arrival_date,fare,total_fare,total_seats,departure_time,arrival_time)
	values (@flight_id,@airline_name,@from_location,@departure_date,@to_location,@arrival_date,@fare,@total_fare,@total_seats,@departure_time,@arrival_time)
	 
END

GO
/****** Object:  StoredProcedure [dbo].[insertssnmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jhahnavi
-- Create date: 3/9/19
-- Description:	SSN_master
-- =============================================
CREATE PROCEDURE [dbo].[insertssnmaster] 
	-- Add the parameters for the stored procedure here
	@ssn_type nvarchar(50),
	@ssn_number nvarchar(50),
	@customer_id numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into ssn_master
	values(@ssn_type,@ssn_number,@customer_id)
END

GO
/****** Object:  StoredProcedure [dbo].[insertusermaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insertusermaster] 
	-- Add the parameters for the stored procedure here

	@customer_name nvarchar(50),
	@date_of_birth date,
	@email_id nvarchar(50),
	@password nvarchar(15),
	@phone_number nvarchar(10),
	@address nvarchar(100),
	@gender nvarchar(10),
	@ssn_type nvarchar(50),
	@ssn_number nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into user_master (customer_name,date_of_birth,email_id,password,phone_number,address,gender,ssn_type,ssn_number)
	values(@customer_name,@date_of_birth,@email_id,@password,@phone_number,@address,@gender,@ssn_type,@ssn_number)
	
END

GO
/****** Object:  StoredProcedure [dbo].[loginvalidation]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[loginvalidation]
	-- Add the parameters for the stored procedure here
	@email_id nvarchar(50),
	@password nvarchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from user_master where email_id=@email_id and password=@password
END

GO
/****** Object:  StoredProcedure [dbo].[SearchFlight]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SearchFlight]
	-- Add the parameters for the stored procedure here
	
	
	
	@departure_date date,
	

	@from_location nvarchar(50),
	@to_location nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        dbo.flight_master.*, dbo.airline_master.airline_name, dbo.location_master.from_location, dbo.location_master.to_location, dbo.flight_master.flight_id AS Expr1
FROM            dbo.airline_master INNER JOIN
                         dbo.flight_master ON dbo.airline_master.flight_id = dbo.flight_master.flight_id INNER JOIN
                         dbo.location_master ON dbo.flight_master.flight_id = dbo.location_master.flight_id
where location_master.from_location=@from_location and  location_master.to_location=@to_location  and  dbo.flight_master.departure_date=@departure_date
END

GO
/****** Object:  StoredProcedure [dbo].[selectbookingmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectbookingmaster] 
	-- Add the parameters for the stored procedure here
	@booking_id numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from booking_master where booking_id=@booking_id;
END

GO
/****** Object:  StoredProcedure [dbo].[selectcustomerid]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ram charan
-- Create date:3/21/19
-- Description:	selectcustomerid
-- =============================================
CREATE PROCEDURE [dbo].[selectcustomerid]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT max([customer_id]) from [user_master]
END

GO
/****** Object:  StoredProcedure [dbo].[SelectNoOfSeats]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectNoOfSeats]
	-- Add the parameters for the stored procedure here
	@flight_id nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT total_seats from flight_master where flight_id=@flight_id
END

GO
/****** Object:  StoredProcedure [dbo].[selectusermaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdul
-- Create date: 3/9/19
-- Description:	ARS_schema_User_Master
-- =============================================
CREATE PROCEDURE  [dbo].[selectusermaster]
	-- Add the parameters for the stored procedure here
	@customer_id numeric(18,0)
	
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from user_master
	where customer_id=@customer_id;
	
END
GO
/****** Object:  StoredProcedure [dbo].[ssnnumbervalidation]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ssnnumbervalidation] 
	-- Add the parameters for the stored procedure here
	@ssn_number nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ssn_number from user_master where ssn_number=@ssn_number;
END

GO
/****** Object:  StoredProcedure [dbo].[updateairlinemaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	airline_master
-- =============================================
CREATE PROCEDURE [dbo].[updateairlinemaster] 
	-- Add the parameters for the stored procedure here
	@airline_id nvarchar(50),
	@airline_name nvarchar(50),
	@flight_id nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update airline_master
	set airline_id=@airline_id,airline_name=@airline_name
	where flight_id=@flight_id

	
END

GO
/****** Object:  StoredProcedure [dbo].[updatebookingmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash
-- Create date: 3-15-2019
-- Description:	Booking table
-- =============================================
CREATE PROCEDURE [dbo].[updatebookingmaster]
	-- Add the parameters for the stored procedure here
	@booking_id numeric(18,0),
	@passenger_name nvarchar(50),
	@airline_name nvarchar(50),
	@from_location nvarchar(50),
	@to_location nvarchar(50),
	@no_of_seats int,
	@date_of_journey date,
	@duration time(7),
	@booking_date date,
	@fare numeric(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update booking_master
	set passenger_name=@passenger_name,airline_name=@airline_name,from_location=@from_location,to_location=@to_location,no_of_seats=@no_of_seats,date_of_journey=@date_of_journey,duration=@duration,booking_date=@booking_date,fare=@fare
	where booking_id=@booking_id
END

GO
/****** Object:  StoredProcedure [dbo].[updateflightmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vikash 
-- Create date: 3-9-19
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateflightmaster] 
	-- Add the parameters for the stored procedure here
	@flight_id nvarchar(50),
	@departure_time datetime,
	@arrival_time datetime,
	@fare numeric(18,2),
	@total_seats int,
	@departure_date date,
	@arrival_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  flight_master
	set departure_time=@departure_time,arrival_time=@arrival_time,fare=@fare,total_seats=@total_seats,departure_date=@departure_date,arrival_date=@arrival_date
	where flight_id=@flight_id;
END

GO
/****** Object:  StoredProcedure [dbo].[updatelocationmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		shruti
-- Create date: 3/9/19
-- Description:	location_master
-- =============================================
CREATE PROCEDURE [dbo].[updatelocationmaster] 
	-- Add the parameters for the stored procedure here
	@location_id nvarchar(50),
	@from_location nvarchar(50),
	@to_location nvarchar(50),
	@flight_id nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update location_master 
	set location_id=@location_id,from_location=@from_location,to_location=@to_location
	where flight_id=@flight_id;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateNoOfSeats]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNoOfSeats]
	-- Add the parameters for the stored procedure here
	@flight_id nvarchar(50),
	@total_seats int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update flight_master 
	set total_seats=@total_seats where flight_id=@flight_id;
END

GO
/****** Object:  StoredProcedure [dbo].[updatessnmaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jhahnavi
-- Create date: 3/9/19
-- Description:	SSN_master
-- =============================================
CREATE PROCEDURE [dbo].[updatessnmaster] 
	-- Add the parameters for the stored procedure here
	@ssn_type nvarchar(50),
	@ssn_number nvarchar(50),
	@customer_id numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update ssn_master
	set ssn_type=@ssn_type,ssn_number=@ssn_number
	where customer_id=@customer_id;
END

GO
/****** Object:  StoredProcedure [dbo].[updateusermaster]    Script Date: 3/30/2019 4:42:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdul
-- Create date: 3/9/19
-- Description:	ARS_schema_User_Master
-- =============================================
CREATE PROCEDURE [dbo].[updateusermaster] 
	-- Add the parameters for the stored procedure here
	
	@customer_name nvarchar(50),
	@date_of_birth date,
	@email_id nvarchar(50),
	@customer_id numeric(18,0),
	@phone_number nvarchar(10),
	@address nvarchar(100),
	@gender nvarchar(10),
	@ssn_type nvarchar(50),
	@ssn_number nvarchar(50)
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update user_master 
	set customer_name=@customer_name,date_of_birth=@date_of_birth,email_id=@email_id,phone_number=@phone_number,address=@address,gender=@gender,ssn_type=@ssn_type,ssn_number=@ssn_number
	where customer_id=@customer_id;
	
END

GO
USE [master]
GO
ALTER DATABASE [ARS] SET  READ_WRITE 
GO
