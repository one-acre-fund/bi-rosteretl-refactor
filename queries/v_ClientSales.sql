USE [RosterDataWarehouse]
GO

/****** Object:  View [dbo].[v_ClientSales]    Script Date: 11/19/2020 1:46:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--CREATE OR ALTER     VIEW [dbo].[v_ClientSales]
--AS
​

	SELECT   
		ClientSalesID = ROW_NUMBER() OVER(order by HashKey) 
		, a.FirstName
		, a.LastName
		,  OAFID
		, GlobalClientID
		, SeasonName
		, a.CountryName
		, a.RegionName
		, a.DistrictName
		, a.SectorName
		, a.SiteName
		, a.GroupName
		, DimClientID
		, DimSeasonID
		, DimCountryID
		, DimRegionID
		, DimDistrictID
		, DimSectorID
		, DimSiteID
		, DimGroupID, 
		CASE WHEN Dropped = 0 THEN TotalCredit ELSE 0 END AS CreditLocal
		, CASE WHEN Dropped = 0 THEN totalRepaid ELSE 0 END AS RepaymentLocal 
		, TotalRepaid_IncludingOverpayments
		, RemainingCredit TotalRemaining
		, PercentRepaid
		, NbOfRepayments NumberOfRepayments
		, LastRepayment LastRepaymentDate
		, Dropped ActiveClient
		, CASE WHEN dropped = 1 THEN 1 ELSE 0 END AS DroppedClient
		, DroppedDate
		, g.Active AS ActiveGroup
		, si.Active AS ActiveSite
		, Deceased
		,Facilitator AS IsGroupLeader
		,a.NewMember
		, a.OperationalYear
		, a.AccountNumber
		, FieldManager,FieldOfficer
		, FirstSeasonDataEntry Enrollmentdate
		, a.DataEntry CreatedDate
		, a.ClientPhone ClientPhoneNumber
FROM        cls.v_SeasonClients a
join OAF_SHARED_DIMENSIONS.dbo.DimGroup g on g.GroupID=a.DimGroupID
join OAF_SHARED_DIMENSIONS.dbo.DimSite si on a.DimSiteID=si.SiteID

--GO

