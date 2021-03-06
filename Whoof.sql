USE [master]
GO
/****** Object:  Database [DoggyStyle]    Script Date: 5/2/2022 12:45:16 AM ******/
CREATE DATABASE [DoggyStyle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoggyStyle', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DoggyStyle.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DoggyStyle_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DoggyStyle_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DoggyStyle] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoggyStyle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoggyStyle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoggyStyle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoggyStyle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoggyStyle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoggyStyle] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoggyStyle] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoggyStyle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoggyStyle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoggyStyle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoggyStyle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoggyStyle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoggyStyle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoggyStyle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoggyStyle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoggyStyle] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DoggyStyle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoggyStyle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoggyStyle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoggyStyle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoggyStyle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoggyStyle] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoggyStyle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoggyStyle] SET RECOVERY FULL 
GO
ALTER DATABASE [DoggyStyle] SET  MULTI_USER 
GO
ALTER DATABASE [DoggyStyle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoggyStyle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoggyStyle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoggyStyle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DoggyStyle] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DoggyStyle] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DoggyStyle', N'ON'
GO
ALTER DATABASE [DoggyStyle] SET QUERY_STORE = OFF
GO
USE [DoggyStyle]
GO
/****** Object:  Table [dbo].[EventExtention]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventExtention](
	[EventExtentionId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Description] [nvarchar](300) NULL,
	[Ext_String_1] [nvarchar](100) NULL,
	[Ext_String_2] [nvarchar](100) NULL,
	[Ext_Numeric_1] [decimal](10, 2) NULL,
	[Ext_Date_1] [datetime] NULL,
 CONSTRAINT [PK_EventExtention] PRIMARY KEY CLUSTERED 
(
	[EventExtentionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Start] [datetime] NOT NULL,
	[DurationInMin] [int] NOT NULL,
	[ThemeColor] [nvarchar](10) NULL,
	[IsFullDay] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAllEvents]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwAllEvents] as
SELECT	EventId, Subject as EventSubject, Ext_String_1 as EventType, Start as EventStartDate, DATEADD(minute, 60 * [Ext_Numeric_1], [Start]) as EventEndDate, DurationInMin as EventDuration
FROM	[dbo].[Events] ev left join [dbo].[EventExtention] ex on ex.EventExtentionId = CAST(ev.Description as INT)
WHERE	ev.Description IS NOT NULL



GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IdNumber] [nvarchar](15) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[eMail] [nvarchar](100) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVsRoles]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVsRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserVsRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_EventExtention_Type]    Script Date: 5/2/2022 12:45:16 AM ******/
CREATE NONCLUSTERED INDEX [IDX_EventExtention_Type] ON [dbo].[EventExtention]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[IsSlotAvailable]    Script Date: 5/2/2022 12:45:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[IsSlotAvailable] 
	@eventTypeId int,
	@fromDate datetime,
	@allDayFlag tinyint

AS
BEGIN

	DECLARE @evId int
	DECLARE @evType nvarchar(100)
	DECLARE @evSubject nvarchar(100)
	DECLARE @evStartDate DateTime
	DECLARE @evEndDate DatetIme
	DECLARE @evDuration int

	DECLARE @slotAvaiable int = 1
	DECLARE @isOnTheEdge int = 0
	DECLARE @eventDuration int
	DECLARE @eventWithDuration DateTime
	
	DECLARE AllEvents CURSOR 
	--LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR 
		SELECT	EventId, EventSubject, EventType, EventStartDate, EventEndDate, EventDuration
		FROM	[dbo].[vwAllEvents] 
		ORDER BY EventStartDate desc;
	
	--SET @slotAvaiable = 0
	SELECT	@eventDuration = Ext_Numeric_1
	FROM	[dbo].[EventExtention]
	WHERE	EventExtentionId = @eventTypeId

	SET @eventWithDuration = DATEADD(minute, 60 * @eventDuration, @fromDate)
	
	OPEN AllEvents
	FETCH NEXT FROM AllEvents INTO @evId, @evType, @evSubject, @evStartDate, @evEndDate, @evDuration
	WHILE (@@FETCH_STATUS = 0 AND @slotAvaiable = 1)
	BEGIN
		-- Start time request is out of existing start event in the log
		IF (@evStartDate < @fromDate AND @fromDate < @evEndDate)
			SET @slotAvaiable = 0
				--BREAK;

        -- Start time request is exact like existing start event in the log
        IF (@evStartDate = @fromDate OR @fromDate = @evEndDate)
			--BEGIN
			SET @isOnTheEdge = @isOnTheEdge + 1
			--END

        -- End time request is out of existing end event in the log
        IF (@evStartDate < @eventWithDuration AND @eventWithDuration < @evEndDate)
			--BEGIN
			SET @slotAvaiable = 0
				--BREAK;
			--END

        -- End time request is exact like existing end event in the log
        IF (@evStartDate = @eventWithDuration OR @eventWithDuration = @evEndDate)
            SET @isOnTheEdge = @isOnTheEdge + 1

        -- Either request time for start / end coincides with the start / end time of the existing event in the log - or none.
        IF (@isOnTheEdge < 2)
			BEGIN
				-- Check if the other end is out : the request is overlap and over
				IF ((@evStartDate = @fromDate AND @evEndDate < @eventWithDuration) OR (@evEndDate = @eventWithDuration AND @evStartDate > @fromDate))
					--BEGIN
						SET @slotAvaiable = 0
						--BREAK;
					--END
				--CONTINUE;
			END
        ELSE
			--BEGIN
				SET @slotAvaiable = 0;

				--BREAK;
			--END

		FETCH NEXT FROM AllEvents INTO @evId, @evType, @evSubject, @evStartDate, @evEndDate, @evDuration
	END

	CLOSE AllEvents
	DEALLOCATE AllEvents

	SELECT @slotAvaiable

END

GO
USE [master]
GO
ALTER DATABASE [DoggyStyle] SET  READ_WRITE 
GO
