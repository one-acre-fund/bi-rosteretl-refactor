USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_ClientBundles]    Script Date: 9/7/2020 11:16:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Landing_ClientBundles]') AND type in (N'U'))
DROP TABLE [cls].[Landing_ClientBundles]
GO

/****** Object:  Table [cls].[Landing_ClientBundles]    Script Date: 9/7/2020 11:16:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_ClientBundles](
	[OAFID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[CreditCycleID] [varchar](50) NULL,
	[SeasonID] [varchar](50) NULL,
	[RegionID] [varchar](50) NULL,
	[DistrictID] [varchar](50) NULL,
	[SectorID] [varchar](50) NULL,
	[SiteID] [varchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[CountryID] [varchar](50) NULL,
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
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_ClientBundles_Historical]    Script Date: 9/7/2020 11:17:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Landing_ClientBundles_Historical]') AND type in (N'U'))
DROP TABLE [cls].[Landing_ClientBundles_Historical]
GO

/****** Object:  Table [cls].[Landing_ClientBundles_Historical]    Script Date: 9/7/2020 11:17:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_ClientBundles_Historical](
	[DistrictName] [varchar](50) NULL,
	[DistrictID] [varchar](50) NULL,
	[SeasonID] [varchar](50) NULL,
	[CreditCycleID] [varchar](50) NULL,
	[RegionID] [varchar](50) NULL,
	[SectorID] [varchar](50) NULL,
	[SiteID] [varchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[CountryID] [varchar](50) NULL,
	[CreditCycleName] [varchar](50) NULL,
	[SectorName] [varchar](50) NULL,
	[SiteName] [varchar](50) NULL,
	[GroupName] [varchar](50) NULL,
	[ClientName] [varchar](50) NULL,
	[OAFID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[BundleName] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[BundleCredit] [varchar](50) NULL,
	[BundleSignUpDate] [varchar](50) NULL,
	[ClientBundleChoices] [varchar](50) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[ClientBundles_Errors]    Script Date: 9/7/2020 11:17:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[ClientBundles_Errors]') AND type in (N'U'))
DROP TABLE [cls].[ClientBundles_Errors]
GO

/****** Object:  Table [cls].[ClientBundles_Errors]    Script Date: 9/7/2020 11:17:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[ClientBundles_Errors](
	[OAFID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[AuditID] [int] NULL,
	[DistrictName] [varchar](50) NULL,
	[DistrictID] [varchar](50) NULL,
	[SeasonID] [varchar](50) NULL,
	[CreditCycleID] [varchar](50) NULL,
	[RegionID] [varchar](50) NULL,
	[SectorID] [varchar](50) NULL,
	[SiteID] [varchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[CountryID] [varchar](50) NULL,
	[CreditCycleName] [varchar](50) NULL,
	[SectorName] [varchar](50) NULL,
	[SiteName] [varchar](50) NULL,
	[GroupName] [varchar](50) NULL,
	[ClientName] [varchar](50) NULL,
	[BundleName] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[BundleCredit] [varchar](50) NULL,
	[BundleSignUpDate] [varchar](50) NULL,
	[ClientBundleChoices] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_VerticalRepayments]    Script Date: 9/7/2020 11:22:17 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Landing_VerticalRepayments]') AND type in (N'U'))
DROP TABLE [cls].[Landing_VerticalRepayments]
GO

/****** Object:  Table [cls].[Landing_VerticalRepayments]    Script Date: 9/7/2020 11:22:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_VerticalRepayments](
	[District] [varchar](50) NULL,
	[Sector] [varchar](50) NULL,
	[Site] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[SiteAtTimeOfRepayment] [varchar](50) NULL,
	[GroupAtTimeOfRepayment] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[OAFID] [varchar](50) NULL,
	[Dropped] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[ReceiptID] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[RepaymentDate] [varchar](50) NULL,
	[DataEntryDate] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[RepaymentPhoneNumber] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[BulkUploaded] [varchar](50) NULL,
	[Autosaved] [varchar](50) NULL,
	[SeasonName] [varchar](250) NULL,
	[PrimaryID] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSectorID] [varchar](50) NULL,
	[RosterSiteID] [varchar](50) NULL,
	[RosterGroupID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_VerticalRepayments_Historical]    Script Date: 9/7/2020 11:22:37 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Landing_VerticalRepayments_Historical]') AND type in (N'U'))
DROP TABLE [cls].[Landing_VerticalRepayments_Historical]
GO

/****** Object:  Table [cls].[Landing_VerticalRepayments_Historical]    Script Date: 9/7/2020 11:22:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_VerticalRepayments_Historical](
	[SeasonName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[OAFID] [varchar](50) NULL,
	[Dropped] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[PrimaryID] [varchar](50) NULL,
	[Sector] [varchar](50) NULL,
	[Site] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[SiteAtTimeOfRepayment] [varchar](50) NULL,
	[GroupAtTimeOfRepayment] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[ReceiptID] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[RepaymentDate] [varchar](50) NULL,
	[DataEntryDate] [varchar](50) NULL,
	[RepaymentPhoneNumber] [varchar](50) NULL,
	[BulkUploaded] [varchar](50) NULL,
	[Autosaved] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSectorID] [varchar](50) NULL,
	[RosterSiteID] [varchar](50) NULL,
	[RosterGroupID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[VerticalRepayments_Errors]    Script Date: 9/7/2020 11:23:21 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[VerticalRepayments_Errors]') AND type in (N'U'))
DROP TABLE [cls].[VerticalRepayments_Errors]
GO

/****** Object:  Table [cls].[VerticalRepayments_Errors]    Script Date: 9/7/2020 11:23:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[VerticalRepayments_Errors](
	[SeasonName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[OAFID] [varchar](50) NULL,
	[Dropped] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[PrimaryID] [varchar](50) NULL,
	[Sector] [varchar](50) NULL,
	[Site] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[SiteAtTimeOfRepayment] [varchar](50) NULL,
	[GroupAtTimeOfRepayment] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[ReceiptID] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[RepaymentDate] [varchar](50) NULL,
	[DataEntryDate] [varchar](50) NULL,
	[RepaymentPhoneNumber] [varchar](50) NULL,
	[BulkUploaded] [varchar](50) NULL,
	[Autosaved] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSectorID] [varchar](50) NULL,
	[RosterSiteID] [varchar](50) NULL,
	[RosterGroupID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[landing_ADS_Historical]    Script Date: 9/7/2020 11:25:59 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[landing_ADS_Historical]') AND type in (N'U'))
DROP TABLE [cls].[landing_ADS_Historical]
GO

/****** Object:  Table [cls].[landing_ADS_Historical]    Script Date: 9/7/2020 11:25:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[landing_ADS_Historical](
	[DistrictName] [varchar](50) NULL,
	[DeliveryName] [varchar](250) NULL,
	[Item_ID] [varchar](250) NULL,
	[Credit] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[GlobalProductName] [varchar](100) NULL,
	[FinanceID] [varchar](50) NULL,
	[DeliveryDate] [varchar](50) NULL,
	[UnitTypeID] [varchar](50) NULL,
	[BookingMechanism] [varchar](50) NULL,
	[RosterClientID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[AuditID] [int] NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_ADS]    Script Date: 9/7/2020 11:29:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Landing_ADS]') AND type in (N'U'))
DROP TABLE [cls].[Landing_ADS]
GO

/****** Object:  Table [cls].[Landing_ADS]    Script Date: 9/7/2020 11:29:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_ADS](
	[DistrictName] [varchar](50) NULL,
	[DeliveryName] [varchar](250) NULL,
	[Item_ID] [varchar](250) NULL,
	[Credit] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[GlobalProductName] [varchar](100) NULL,
	[FinanceID] [varchar](50) NULL,
	[DeliveryDate] [varchar](50) NULL,
	[UnitTypeID] [varchar](50) NULL,
	[BookingMechanism] [varchar](50) NULL,
	[RosterClientID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[AuditID] [int] NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[GlobalClientID] [varchar](50) NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[ADS_Errors]    Script Date: 9/7/2020 11:29:38 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[ADS_Errors]') AND type in (N'U'))
DROP TABLE [cls].[ADS_Errors]
GO

/****** Object:  Table [cls].[ADS_Errors]    Script Date: 9/7/2020 11:29:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[ADS_Errors](
	[DistrictName] [varchar](50) NULL,
	[DeliveryName] [varchar](250) NULL,
	[Item_ID] [varchar](250) NULL,
	[Credit] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[GlobalProductName] [varchar](100) NULL,
	[FinanceID] [varchar](50) NULL,
	[DeliveryDate] [varchar](50) NULL,
	[UnitTypeID] [varchar](50) NULL,
	[BookingMechanism] [varchar](50) NULL,
	[RosterClientID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

