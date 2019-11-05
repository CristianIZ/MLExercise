USE [master]
GO
/****** Object:  Database [MLPayment]    Script Date: 05/11/2019 20:57:20 ******/
CREATE DATABASE [MLPayment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MLPayment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MLPayment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MLPayment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MLPayment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MLPayment] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MLPayment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MLPayment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MLPayment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MLPayment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MLPayment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MLPayment] SET ARITHABORT OFF 
GO
ALTER DATABASE [MLPayment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MLPayment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MLPayment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MLPayment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MLPayment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MLPayment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MLPayment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MLPayment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MLPayment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MLPayment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MLPayment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MLPayment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MLPayment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MLPayment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MLPayment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MLPayment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MLPayment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MLPayment] SET RECOVERY FULL 
GO
ALTER DATABASE [MLPayment] SET  MULTI_USER 
GO
ALTER DATABASE [MLPayment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MLPayment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MLPayment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MLPayment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MLPayment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MLPayment', N'ON'
GO
ALTER DATABASE [MLPayment] SET QUERY_STORE = OFF
GO
USE [MLPayment]
GO
/****** Object:  User [czappala]    Script Date: 05/11/2019 20:57:20 ******/
CREATE USER [czappala] FOR LOGIN [czappala] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [czappala]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[BillNumber] [nvarchar](50) NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillsCharges]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillsCharges](
	[IdBill] [int] NOT NULL,
	[IdCharge] [int] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_BillsCharge] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Charges]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEvent] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Charges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Document] [varchar](50) NOT NULL,
	[DocumentType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[AddressNumber] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[BirthDate] [int] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillsCharge]    Script Date: 05/11/2019 20:57:20 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BillsCharge] ON [dbo].[BillsCharges]
(
	[IdBill] ASC,
	[IdCharge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[BillsCharges] ADD  CONSTRAINT [DF_BillsCharge_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[BillsCharges] ADD  CONSTRAINT [DF_BillsCharge_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Enabled]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  StoredProcedure [dbo].[Bills_ADD]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[Bills_ADD]
    
         @IdUser                 INT
        ,@DateIndex              INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO Bills (IdUser
		                   ,DateIndex)

		 VALUES  (@IdUser
		         ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Bills_GetById]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the Bill selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[Bills_GetById]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM Bills 
		 WHERE Id= @Id

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[BillsCharges_ADD]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[BillsCharges_ADD]
    
         @IdBill             INT
        ,@IdCharge           INT
		,@DateIndex          INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO BillsCharges(IdBill
		                         ,IdCharge
							     ,DateIndex)

		 VALUES  (@IdBill
		         ,@IdCharge
				 ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[BillsCharges_GetByBills]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the charge selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[BillsCharges_GetByBills]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM BillsCharges 
		 WHERE IdBill= @Id

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Charges_ADD]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[Charges_ADD]
    
         @EventId             INT
        ,@Amount              INT
		,@DateIndex           INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO Charges (IdEvent
		                     ,Amount
							 ,DateIndex)

		 VALUES  (@EventId
		         ,@Amount
				 ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Charges_GetById]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the charge selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[Charges_GetById]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM Charges 
		 WHERE Id= @Id

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Users_ADD]    Script Date: 05/11/2019 20:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new User in the table
-- =============================================
CREATE PROCEDURE [dbo].[Users_ADD]
    
         @Document			  varchar(50)
        ,@DocumentType		  INT
        ,@Name				  NVARCHAR(50)
        ,@Gender			  INT
        ,@Address			  NVARCHAR(100)
        ,@AddressNumber		  INT
        ,@Phone				  NVARCHAR(20)
        ,@BirthDate			  INT
        ,@DateIndex			  INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO Users ([Document]
                           ,[DocumentType]
                           ,[Name]
                           ,[Gender]
                           ,[Address]
                           ,[AddressNumber]
                           ,[Phone]
                           ,[BirthDate]
                           ,[DateIndex])

		 VALUES  (@Document
				 ,@DocumentType
				 ,@Name
				 ,@Gender
				 ,@Address
				 ,@AddressNumber
				 ,@Phone
				 ,@BirthDate
				 ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [MLPayment] SET  READ_WRITE 
GO
