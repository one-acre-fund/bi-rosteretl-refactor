USE Rosterreporting_Staging
GO

/****** Object:  Table [cls].[staging_ADS]    Script Date: 9/7/2020 11:55:06 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[staging_ADS]') AND type in (N'U'))
DROP TABLE [cls].[staging_ADS]
GO

/****** Object:  Table [cls].[staging_ADS]    Script Date: 9/7/2020 11:55:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[staging_ADS](
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
	[RosterRegionID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL,
	[CountryCode] [nvarchar](5) NULL,
	[AuditDateCreated] [datetime] NULL,
	[DimSeasonID] [int] NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimClientID] [int] NULL,
	[GlobalClientID] [varchar](100) NULL,
	[AuditID] [int] NULL,
	[HashKey] [varchar](512) NULL
) ON [PRIMARY]
GO

USE Rosterreporting_Staging
GO

/****** Object:  Table [cls].[Staging_ClientBundles]    Script Date: 9/7/2020 11:56:51 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Staging_ClientBundles]') AND type in (N'U'))
DROP TABLE [cls].[Staging_ClientBundles]
GO

/****** Object:  Table [cls].[Staging_ClientBundles]    Script Date: 9/7/2020 11:56:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Staging_ClientBundles](
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
	[AuditID] [int] NULL,
	[DimSeasonID] [int] NULL,
	[DimCreditCycleID] [int] NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimSectorID] [int] NULL,
	[DimSiteID] [int] NULL,
	[DimGroupID] [int] NULL,
	[DimClientID] [int] NULL,
	[AuditDateCreated] [datetime] NULL,
	[HashKey] [varchar](512) NULL
) ON [PRIMARY]
GO

USE Rosterreporting_Staging
GO

/****** Object:  Table [cls].[Staging_VerticalRepayments]    Script Date: 9/7/2020 11:57:19 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[cls].[Staging_VerticalRepayments]') AND type in (N'U'))
DROP TABLE [cls].[Staging_VerticalRepayments]
GO

/****** Object:  Table [cls].[Staging_VerticalRepayments]    Script Date: 9/7/2020 11:57:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Staging_VerticalRepayments](
	[District] [varchar](50) NULL,
	[PrimaryID] [varchar](50) NULL,
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
	[HashKey] [varchar](512) NULL,
	[AuditID] [nvarchar](66) NULL,
	[AuditDateCreated] [datetime] NULL,
	[CountryCode] [varchar](10) NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimSectorID] [int] NULL,
	[DimSiteID] [int] NULL,
	[DimGroupID] [int] NULL,
	[DimSeasonID] [int] NULL,
	[DimClientID] [int] NULL,
	[RosterSeasonID] [varchar](50) NULL,
	[RosterRegionID] [varchar](50) NULL,
	[RosterDistrictID] [varchar](50) NULL,
	[RosterSectorID] [varchar](50) NULL,
	[RosterSiteID] [varchar](50) NULL,
	[RosterGroupID] [varchar](50) NULL,
	[RosterCountryID] [varchar](50) NULL
) ON [PRIMARY]
GO

USE Rosterreporting_Staging
GO

/****** Object:  Table [dbo].[staging_SeasonClientSignatures]    Script Date: 9/7/2020 11:57:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[staging_SeasonClientSignatures]') AND type in (N'U'))
DROP TABLE [dbo].[staging_SeasonClientSignatures]
GO

/****** Object:  Table [dbo].[staging_SeasonClientSignatures]    Script Date: 9/7/2020 11:57:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[staging_SeasonClientSignatures](
	[GlobalClientID] [varchar](50) NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictID] [int] NULL,
	[DimClientID] [int] NULL,
	[DimSeasonID] [int] NULL,
	[DistrictID] [int] NULL,
	[ClientID] [int] NULL,
	[SeasonID] [int] NULL,
	[ClientSignature] [varchar](max) NULL,
	[DateSigned] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[ClientSignatureOrderHash] [varchar](64) NULL,
	[Hash] [varchar](512) NULL,
	[AuditID] [nvarchar](66) NULL,
	[AuditDateCreated] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


