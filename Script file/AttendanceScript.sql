USE [master]
GO
/****** Object:  Database [DigitalAttendanceSystem]    Script Date: 11/5/2020 3:46:37 PM ******/
CREATE DATABASE [DigitalAttendanceSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalAttendanceSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DigitalAttendanceSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalAttendanceSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DigitalAttendanceSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DigitalAttendanceSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalAttendanceSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalAttendanceSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalAttendanceSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DigitalAttendanceSystem', N'ON'
GO
ALTER DATABASE [DigitalAttendanceSystem] SET QUERY_STORE = OFF
GO
USE [DigitalAttendanceSystem]
GO
/****** Object:  Table [dbo].[department_tbl]    Script Date: 11/5/2020 3:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department_tbl](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_department_tbl] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_attendance_tbl]    Script Date: 11/5/2020 3:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_attendance_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkDate] [date] NOT NULL,
	[FirstTimeIn] [datetime] NULL,
	[FirstTimeOut] [datetime] NULL,
	[TotalHours] [decimal](18, 0) NULL,
	[EmployeeId] [int] NOT NULL,
	[SecondTimeIn] [datetime] NULL,
	[SecondTimeOut] [datetime] NULL,
 CONSTRAINT [PK_employee_attendance_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_tbl]    Script Date: 11/5/2020 3:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_tbl](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_employee_tbl] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[department_tbl] ON 

INSERT [dbo].[department_tbl] ([DepartmentId], [DepartmentName]) VALUES (1, N'IT                                                ')
INSERT [dbo].[department_tbl] ([DepartmentId], [DepartmentName]) VALUES (2, N'Accounts                                          ')
SET IDENTITY_INSERT [dbo].[department_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[employee_attendance_tbl] ON 

INSERT [dbo].[employee_attendance_tbl] ([Id], [WorkDate], [FirstTimeIn], [FirstTimeOut], [TotalHours], [EmployeeId], [SecondTimeIn], [SecondTimeOut]) VALUES (1, CAST(N'2020-11-02' AS Date), CAST(N'2020-11-02T09:00:00.000' AS DateTime), CAST(N'2020-11-02T11:30:00.000' AS DateTime), CAST(7 AS Decimal(18, 0)), 1, CAST(N'2020-11-02T13:30:00.000' AS DateTime), CAST(N'2020-11-02T17:30:00.000' AS DateTime))
INSERT [dbo].[employee_attendance_tbl] ([Id], [WorkDate], [FirstTimeIn], [FirstTimeOut], [TotalHours], [EmployeeId], [SecondTimeIn], [SecondTimeOut]) VALUES (4, CAST(N'2020-11-03' AS Date), CAST(N'2020-11-03T09:00:00.000' AS DateTime), CAST(N'2020-11-03T11:30:00.000' AS DateTime), CAST(7 AS Decimal(18, 0)), 1, CAST(N'2020-11-03T13:30:00.000' AS DateTime), CAST(N'2020-11-03T17:30:00.000' AS DateTime))
INSERT [dbo].[employee_attendance_tbl] ([Id], [WorkDate], [FirstTimeIn], [FirstTimeOut], [TotalHours], [EmployeeId], [SecondTimeIn], [SecondTimeOut]) VALUES (5, CAST(N'2020-11-04' AS Date), CAST(N'2020-11-04T09:00:00.000' AS DateTime), CAST(N'2020-11-02T11:30:00.000' AS DateTime), CAST(7 AS Decimal(18, 0)), 1, CAST(N'2020-11-04T13:30:00.000' AS DateTime), CAST(N'2020-11-04T17:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[employee_attendance_tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[employee_tbl] ON 

INSERT [dbo].[employee_tbl] ([EmployeeId], [Name], [DepartmentId]) VALUES (1, N'Wahib                                             ', 1)
INSERT [dbo].[employee_tbl] ([EmployeeId], [Name], [DepartmentId]) VALUES (2, N'Naseem                                            ', 1)
INSERT [dbo].[employee_tbl] ([EmployeeId], [Name], [DepartmentId]) VALUES (3, N'Ashraf                                            ', 2)
INSERT [dbo].[employee_tbl] ([EmployeeId], [Name], [DepartmentId]) VALUES (4, N'Nouman                                            ', 2)
SET IDENTITY_INSERT [dbo].[employee_tbl] OFF
GO
USE [master]
GO
ALTER DATABASE [DigitalAttendanceSystem] SET  READ_WRITE 
GO
