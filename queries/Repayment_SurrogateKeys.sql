/*
	Current ID keys
	- CountryID
	- RegionID
	- DistrictID
	- SectorID
	- SiteID
	- GroupID
	- SeasonID
	- ClientID

	Surrogate keys
	- DimClientID
	- DimSeasonID
	- DimCountryID
	- DimRegionID
	- DimDistrictID
	- DimSectorID
	- DimSiteID
	- DimGroupID
*/

/*

Update
    cls.staging_VerticalRepayments
set
    DimCountryID = geo.CountryID,
    DimRegionID = geo.RegionID,
    DimDistrictID = geo.DistrictID,
    DimSectorID = geo.SectorID,
    DimSiteID = geo.SiteID,
    DimGroupID = geo.GroupID
from
    (
        select
            CountryID,
            RegionID,
            DistrictID,
            SectorID,
            SiteID,
            GroupID,
            DistrictName,
            SiteName,
            GroupName,
			RosterGroupID,
			RosterDistrictID
        from
            OAF_SHARED_DIMENSIONS.dbo.DimGroup
        where
            isDeleted = 0
    ) geo
where
    geo.RosterDistrictID = cls.staging_VerticalRepayments.RosterDistrictID
    and geo.RosterGroupID = staging_VerticalRepayments.RosterGroupID
    and cls.staging_VerticalRepayments.DimCountryID is null




Update
    cls.staging_VerticalRepayments
set
    DimSeasonID = s.SeasonID
from
    (
        select
            CountryID,
            SeasonID,
            RosterSeasonID,
            SeasonName
        from
            OAF_SHARED_DIMENSIONS.dbo.DimSeasons
        where
            RosterSeasonID is not null
            and isDeleted = 0
    ) s
where
    s.RosterSeasonID = cls.staging_VerticalRepayments.RosterSeasonID
    and s.CountryID = cls.staging_VerticalRepayments.DimCountryID
    and cls.staging_VerticalRepayments.DimSeasonID is null
update
    cls.staging_VerticalRepayments
set
    DimClientID = client.DimClientID
from
    (
        SELECT
            cs.GlobalClientID,
            cs.ClientID DimClientID
        from
            OAF_SHARED_DIMENSIONS.dbo.DimRosterClient cs
    ) client
where
    cast(client.GlobalClientID as nvarchar(150)) = cls.staging_VerticalRepayments.GlobalClientID
    and cls.staging_VerticalRepayments.DimClientID is null
*/




