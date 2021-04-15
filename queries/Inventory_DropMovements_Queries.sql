
USE [RosterDatawarehouse]
GO

/****** Object:  Table [cls].[Inventory_DropMovements]    Script Date: 1/26/2021 1:02:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Inventory_DropMovements](
	[RosterSeasonID] [int] NULL,
	[SeasonName] [nvarchar](50) NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[InputID] [int] NULL,
	[DeliveryID] [int] NULL,
	[UnitWeight] [numeric](18, 3) NULL,
	[Quantity] [numeric](38, 3) NULL,
	[LotNumber] [nvarchar](100) NULL,
	[DistrictFrom] [nvarchar](50) NULL,
	[DropFrom] [nvarchar](513) NULL,
	[DistrictTo] [nvarchar](50) NULL,
	[DropTo] [nvarchar](513) NULL,
	[ReceiptID] [varchar](100) NULL,
	[PacketQuantity] [numeric](29, 2) NULL,
	[BaleQuantity] [numeric](29, 3) NULL,
	[MovementDate] [date] NULL,
	[InputName] [nvarchar](255) NULL,
	[MovementDescription] [varchar](100) NULL,
	[SeasonInputSizeID] [int] NULL,
	[DistrictIdFrom] [int] NULL,
	[DropIdFrom] [int] NULL,
	[DistrictIdTo] [int] NULL,
	[DropIdTo] [int] NULL,
	[DropMovementID] [int] NULL,
	[DropToType] [varchar](18) NULL,
	[DropFromType] [varchar](18) NULL,
	[HashKey] [varchar](512) NULL,
	[AuditID] [nvarchar](66) NULL,
	[AuditDateCreated] [datetime] NULL,
	[DimSeasonID] [int] NULL,
	[DimCountryID] [int] NULL,
	[DimRegionID] [int] NULL,
	[DimDistrictIDTo] [int] NULL,
	[DimDistrictIDFrom] [int] NULL,
	[DimInputID] [int] NULL,
	[OperationalYear] [int] NULL
) ON [PRIMARY]
GO


USE [RosterDatawarehouse_LandingArea]
GO

/****** Object:  Table [cls].[Landing_Inventory_DropMovements]    Script Date: 1/26/2021 1:04:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[Landing_Inventory_DropMovements](
	[SeasonID] [int] NULL,
	[SeasonName] [nvarchar](50) NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[InputID] [int] NULL,
	[DeliveryID] [int] NULL,
	[UnitWeight] [numeric](18, 3) NULL,
	[Quantity] [numeric](38, 3) NULL,
	[LotNumber] [nvarchar](100) NULL,
	[DistrictFrom] [nvarchar](50) NULL,
	[DropFrom] [nvarchar](513) NULL,
	[DistrictTo] [nvarchar](50) NULL,
	[DropTo] [nvarchar](513) NULL,
	[ReceiptID] [varchar](100) NULL,
	[PacketQuantity] [numeric](29, 2) NULL,
	[BaleQuantity] [numeric](29, 3) NULL,
	[MovementDate] [date] NULL,
	[InputName] [nvarchar](255) NULL,
	[MovementDescription] [varchar](100) NULL,
	[SeasonInputSizeID] [int] NULL,
	[DistrictIdFrom] [int] NULL,
	[DropIdFrom] [int] NULL,
	[DistrictIdTo] [int] NULL,
	[DropIdTo] [int] NULL,
	[DropMovementID] [int] NULL,
	[DropToType] [varchar](18) NULL,
	[DropFromType] [varchar](18) NULL,
	[AuditID] [int] NULL
) ON [PRIMARY]
GO

USE RosterReporting_Staging
GO

/****** Object:  Table [cls].[staging_Inventory_DropMovements]    Script Date: 1/26/2021 1:05:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [cls].[staging_Inventory_DropMovements](
	[SeasonID] [int] NULL,
	[SeasonName] [nvarchar](50) NULL,
	[DeliveryName] [nvarchar](255) NULL,
	[InputID] [int] NULL,
	[DeliveryID] [int] NULL,
	[UnitWeight] [numeric](18, 3) NULL,
	[Quantity] [numeric](38, 3) NULL,
	[LotNumber] [nvarchar](100) NULL,
	[DistrictFrom] [nvarchar](50) NULL,
	[DropFrom] [nvarchar](513) NULL,
	[DistrictTo] [nvarchar](50) NULL,
	[DropTo] [nvarchar](513) NULL,
	[ReceiptID] [varchar](100) NULL,
	[PacketQuantity] [numeric](29, 2) NULL,
	[BaleQuantity] [numeric](29, 3) NULL,
	[MovementDate] [date] NULL,
	[InputName] [nvarchar](255) NULL,
	[MovementDescription] [varchar](100) NULL,
	[SeasonInputSizeID] [int] NULL,
	[DistrictIdFrom] [int] NULL,
	[DropIdFrom] [int] NULL,
	[DistrictIdTo] [int] NULL,
	[DropIdTo] [int] NULL,
	[DropMovementID] [int] NULL,
	[DropToType] [varchar](18) NULL,
	[DropFromType] [varchar](18) NULL,
	[HashKey] [varchar](512) NULL,
	[AuditID] [nvarchar](66) NULL,
	[AuditDateCreated] [datetime] NULL
) ON [PRIMARY]
GO

USE [RosterDatawarehouse]
GO
/****** Object:  StoredProcedure [cls].[sp_IncrementalLoad_Inventory_DropMovements]    Script Date: 1/25/2021 12:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Stored procedure for production load

CREATE OR ALTER           PROCEDURE [cls].[sp_IncrementalLoad_Inventory_DropMovements](
@AuditID int, @OperationalYear int)
AS
BEGIN
--DECLARE @AuditID int = 100
Declare @MergeLog table (MergeAction nvarchar(50))
-- Merge
DECLARE @RowsExtracted int = (SELECT COUNT(*) RowsExtracted FROM RosterReporting_Staging.cls.staging_Inventory_DropMovements)

DELETE FROM cls.Inventory_DropMovements WHERE RosterSeasonID IN (SELECT distinct RosterSeasonID from OAF_SHARED_DIMENSIONS.dbo.DimSeasons where IsDeleted=0 and OperationalYear>=@OperationalYear)
DELETE FROM RosterReporting_Staging.cls.staging_Inventory_DropMovements WHERE SeasonID IN (SELECT distinct RosterSeasonID from OAF_SHARED_DIMENSIONS.dbo.DimSeasons where IsDeleted=0 and OperationalYear<@OperationalYear)
--TRUNCATE TABLE cls.Inventory_DropMovements

DECLARE @RowsInserted int = (SELECT COUNT(*) RowsInserted FROM RosterReporting_Staging.cls.staging_Inventory_DropMovements)

INSERT INTO cls.Inventory_DropMovements
           (  [RosterSeasonID]
      ,[SeasonName]
      ,[DeliveryName]
      ,[InputID]
      ,[DeliveryID]
      ,[UnitWeight]
      ,[Quantity]
      ,[LotNumber]
      ,[DistrictFrom]
      ,[DropFrom]
      ,[DistrictTo]
      ,[DropTo]
      ,[ReceiptID]
      ,[PacketQuantity]
      ,[BaleQuantity]
      ,[MovementDate]
      ,[InputName]
      ,[MovementDescription]
      ,[SeasonInputSizeID]
      ,[DistrictIdFrom]
      ,[DropIdFrom]
      ,[DistrictIdTo]
      ,[DropIdTo]
      ,[DropMovementID]
      ,[DropToType]
      ,[DropFromType]
      ,[HashKey]
      ,[AuditID]
      ,[AuditDateCreated]
		   )
	SELECT 
	   [SeasonID]
      ,[SeasonName]
      ,[DeliveryName]
      ,[InputID]
      ,[DeliveryID]
      ,[UnitWeight]
      ,[Quantity]
      ,[LotNumber]
      ,[DistrictFrom]
      ,[DropFrom]
      ,[DistrictTo]
      ,[DropTo]
      ,[ReceiptID]
      ,[PacketQuantity]
      ,[BaleQuantity]
      ,[MovementDate]
      ,[InputName]
      ,[MovementDescription]
      ,[SeasonInputSizeID]
      ,[DistrictIdFrom]
      ,[DropIdFrom]
      ,[DistrictIdTo]
      ,[DropIdTo]
      ,[DropMovementID]
      ,[DropToType]
      ,[DropFromType]
      ,[HashKey]
      ,[AuditID]
      ,[AuditDateCreated]
	FROM RosterReporting_Staging.cls.staging_Inventory_DropMovements
		   
Update cls.AuditDimension 
	SET RowsExtracted=@RowsExtracted,
		RowsInserted=@RowsInserted
	WHERE AuditID=@AuditID

update cls.Inventory_DropMovements 
	set DimCountryID = geo.CountryID 
		, DimRegionID = geo.RegionID
		, DimDistrictIDFrom = geo.DistrictID
	from (SELECT distinct  CountryID, RegionID, LocationID DistrictID, RosterDistrictID
		  FROM OAF_SHARED_DIMENSIONS.dbo.DimLocations
		  where  RosterDistrictID is not null
		  ) geo
	where cls.Inventory_DropMovements.DistrictIdFrom=geo.RosterDistrictID
		and (cls.Inventory_DropMovements.DimCountryID is null or cls.Inventory_DropMovements.AuditID=@AuditID)

update cls.Inventory_DropMovements 
		SET DimDistrictIDTo = geo.DistrictID
	from (SELECT distinct  CountryID, RegionID, LocationID DistrictID, RosterDistrictID
		  FROM OAF_SHARED_DIMENSIONS.dbo.DimLocations
		  where  RosterDistrictID is not null
		  ) geo
	where cls.Inventory_DropMovements.DistrictIdTo=geo.RosterDistrictID
		and (cls.Inventory_DropMovements.DimCountryID is null or cls.Inventory_DropMovements.AuditID=@AuditID)

update cls.Inventory_DropMovements 
	set DimSeasonID=s.SeasonID, OperationalYear=s.OperationalYear
	from (SELECT distinct CountryID, SeasonID, RosterSeasonID, OperationalYear
		 FROM OAF_SHARED_DIMENSIONS.dbo.DimSeasons 
		 where isDeleted=0)s 
	where cls.Inventory_DropMovements.DimCountryID=s.CountryId
	and cls.Inventory_DropMovements.RosterSeasonID=s.RosterSeasonID and ISNUMERIC(cls.Inventory_DropMovements.RosterSeasonID)=1

	and (cls.Inventory_DropMovements.DimSeasonID is null or cls.Inventory_DropMovements.AuditID=@AuditID)

update cls.Inventory_DropMovements 
	set DimInputID=c.InputID
	from (select distinct InputID, RosterInputID
		  from OAF_SHARED_DIMENSIONS.dbo.DimInputs
		) c 
	where  cls.Inventory_DropMovements.InputID=c.RosterInputID
	and cls.Inventory_DropMovements.DimInputID is null


TRUNCATE TABLE RosterDatawarehouse_LandingArea.cls.Landing_Inventory_DropMovements

END

GRANT EXEC ON [cls].[sp_IncrementalLoad_Inventory_DropMovements] to CSSSIS0001

