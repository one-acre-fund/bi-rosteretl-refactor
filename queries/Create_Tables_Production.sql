USE RosterDatawarehouse
GO

/****** Object:  Table [cls].[ETLErrors]    Script Date: 9/7/2020 12:04:50 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[ETLErrors]') AND type in (N'U'))
DROP TABLE [cls].[ETLErrors]
GO

/****** Object:  Table [cls].[ETLErrors]    Script Date: 9/7/2020 12:04:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[ETLErrors](
	[AuditID] [int] NULL,
	[Pk_ID] [nvarchar](100) NULL,
	[Machine_Name] [nvarchar](200) NULL,
	[Package_Name] [nvarchar](200) NULL,
	[Task_Name] [nvarchar](200) NULL,
	[Error_Code] [int] NULL,
	[Error_Description] [nvarchar](max) NULL,
	[Dated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE RosterDatawarehouse
GO

/****** Object:  Table [cls].[AuditDimension]    Script Date: 9/7/2020 12:05:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[AuditDimension]') AND type in (N'U'))
DROP TABLE [cls].[AuditDimension]
GO

/****** Object:  Table [cls].[AuditDimension]    Script Date: 9/7/2020 12:05:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[AuditDimension](
	[AuditID] [int] NOT NULL,
	[PackageName] [nvarchar](100) NULL,
	[RowsExtracted] [int] NULL,
	[RowsInserted] [int] NULL,
	[RowsUpdated] [int] NULL,
	[LoadStartTime] [datetime] NULL,
	[LoadEndTime] [datetime] NULL,
	[RowsWithErrors] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE RosterDatawarehouse
GO

/****** Object:  Table [cls].[AuditDimensionFiles]    Script Date: 9/7/2020 12:06:04 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[AuditDimensionFiles]') AND type in (N'U'))
DROP TABLE [cls].[AuditDimensionFiles]
GO

/****** Object:  Table [cls].[AuditDimensionFiles]    Script Date: 9/7/2020 12:06:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[AuditDimensionFiles](
	[AuditID] [int] NULL,
	[FileName] [nvarchar](150) NULL,
	[PackageName] [nvarchar](150) NULL,
	[RowsExtracted] [int] NULL,
	[LoadStartTime] [datetime] NULL,
	[LoadEndTime] [datetime] NULL
) ON [PRIMARY]
GO


USE RosterDatawarehouse
GO

/****** Object:  Table [cls].[AccountDeliverySummary]    Script Date: 9/7/2020 12:03:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[AccountDeliverySummary]') AND type in (N'U'))
DROP TABLE [cls].[AccountDeliverySummary]
GO

/****** Object:  Table [cls].[AccountDeliverySummary]    Script Date: 9/7/2020 12:03:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[AccountDeliverySummary](
	[DistrictName] [nvarchar](255) NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[Item_ID] [nvarchar](255) NULL,
	[Credit] [float] NULL,
	[Quantity] [float] NULL,
	[ProductName] [nvarchar](255) NULL,
	[GlobalProductName] [nvarchar](255) NULL,
	[FinanceID] [nvarchar](255) NULL,
	[DeliveryDate] [nvarchar](50) NULL,
	[UnitTypeID] [nvarchar](255) NULL,
	[BookingMechanism] [nvarchar](255) NULL,
	[RosterClientID] [int] NULL,
	[RosterDistrictID] [int] NULL,
	[RosterSeasonID] [int] NULL,
	[HashKey] [varchar](512) NULL,
	[AuditID] [nvarchar](66) NULL,
	[CountryCode] [nvarchar](5) NULL,
	[AuditDateCreated] [datetime] NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimSeasonID] [int] NULL,
	[DimClientID] [int] NULL,
	[GlobalClientID] [uniqueidentifier] NULL,
	[RosterCountryID] [int] NULL,
	[RosterRegionID] [int] NULL
) ON [PRIMARY]
GO

USE RosterDatawarehouse
GO

/****** Object:  Table [cls].[ClientBundles]    Script Date: 9/7/2020 12:03:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[ClientBundles]') AND type in (N'U'))
DROP TABLE [cls].[ClientBundles]
GO

/****** Object:  Table [cls].[ClientBundles]    Script Date: 9/7/2020 12:03:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[ClientBundles](
	[RosterClientID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[RosterCreditCycleID] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSectorID] [varchar](50) NULL,
	[RosterSiteID] [varchar](50) NULL,
	[RosterGroupID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[CreditCycleName] [varchar](50) NULL,
	[DistrictName] [varchar](50) NULL,
	[SectorName] [varchar](50) NULL,
	[SiteName] [varchar](50) NULL,
	[GroupName] [varchar](50) NULL,
	[ClientName] [varchar](50) NULL,
	[BundleName] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[BundleCredit] [varchar](50) NULL,
	[BundleSignUpDate] [varchar](50) NULL,
	[ClientBundleChoices] [varchar](50) NULL,
	[AuditID] [int] NULL,
	[AuditDateCreated] [datetime] NULL,
	[HashKey] [varchar](512) NULL,
	[DimSeasonID] [int] NULL,
	[DimCreditCycleID] [int] NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimSectorID] [int] NULL,
	[DimSiteID] [int] NULL,
	[DimGroupID] [int] NULL
) ON [PRIMARY]
GO

USE RosterDatawarehouse
GO

ALTER TABLE [cls].[VerticalRepayments] DROP CONSTRAINT [DF_VerticalRepayments_Amount]
GO

/****** Object:  Table [cls].[VerticalRepayments]    Script Date: 9/7/2020 12:04:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[VerticalRepayments]') AND type in (N'U'))
DROP TABLE [cls].[VerticalRepayments]
GO

/****** Object:  Table [cls].[VerticalRepayments]    Script Date: 9/7/2020 12:04:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[VerticalRepayments](
	[District] [nvarchar](255) NULL,
	[Sector] [nvarchar](255) NULL,
	[Site] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[SiteAtTimeOfRepayment] [nvarchar](255) NULL,
	[GroupAtTimeOfRepayment] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[OAFID] [bigint] NULL,
	[Dropped] [bit] NULL,
	[Amount] [numeric](18, 5) NULL,
	[ReceiptID] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[RepaymentDate] [datetime] NULL,
	[DataEntryDate] [datetime] NULL,
	[GlobalClientID] [nvarchar](255) NULL,
	[RepaymentPhoneNumber] [bigint] NULL,
	[AccountNumber] [bigint] NULL,
	[BulkUploaded] [bit] NULL,
	[Autosaved] [bit] NULL,
	[SeasonName] [varchar](250) NULL,
	[HashKey] [varchar](512) NULL,
	[AuditID] [int] NULL,
	[AuditDateCreated] [datetime] NULL,
	[CountryCode] [nvarchar](5) NULL,
	[PrimaryID] [varchar](50) NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimSectorID] [int] NULL,
	[DimSiteID] [int] NULL,
	[DimGroupID] [int] NULL,
	[DimSeasonID] [int] NULL,
	[DimClientID] [int] NULL,
	[RosterSeasonID] [int] NULL,
	[RosterRegionID] [int] NULL,
	[RosterDistrictID] [int] NULL,
	[RosterSectorID] [int] NULL,
	[RosterSiteID] [int] NULL,
	[RosterGroupID] [int] NULL,
	[RosterCountryID] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [cls].[VerticalRepayments] ADD  CONSTRAINT [DF_VerticalRepayments_Amount]  DEFAULT ((0.00000)) FOR [Amount]
GO

