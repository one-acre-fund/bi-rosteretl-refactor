/*
	Current ID keys
	- ClientID
	- DistrictID
	- SeasonID

	Surrogate keys
	- GlobalClientID
	- DimClientID
	- DimSeasonID
	- DimCountryID
	- DimRegionID
	- DimDistrictID
*/

/*
	Update cls.staging_ADS
		set DimCountryID=geo.CountryID,
			DimRegionID=geo.RegionID,
			DimDistrictID=geo.LocationID
	from (
		select CountryID, RegionID, LocationID
		from OAF_SHARED_DIMENSIONS.dbo.DimLocations
		where RosterDistrictID is not null 
		) geo
	where geo.RosterDistrictID=cls.staging_ADS.DistrictID
	and cls.staging_ADS.DimCountryID is null


	Update cls.staging_ADS
		set DimSeasonID=s.SeasonID,
	from (
		select CountryID, SeasonID,RosterSeasonID
		from OAF_SHARED_DIMENSIONS.dbo.DimSeasons 
		where RosterSeasonID is not null 
		) s
	where s.RosterSeasonID=cls.staging_ADS.SeasonID
	and s.CountryID=cls.staging_ADS.DimCountryID
	and cls.staging_ADS.DimSeasonID is null


	update cls.staging_ADS
		set DimClientID=client.DimClientID,
			GlobalClientID=client.GlobalClientID
	from (
		SELECT distinct c.ClientID,c.DistrictID,cs.ClientID DimClientID, cs.GlobalClientID
		from OAF_SHARED_DIMENSIONS.dbo.DimRosterClient cs
		join OAF_SHARED_DIMENSIONS_staging.dbo.Staging_Clients c on cs.GlobalClientID=c.GlobalClientID
	) client
	where client.ClientID=cls.staging_ADS.ClientID and client.DistrictID=cls.staging_ADS.DistrictID
	and cls.staging_ADS.DimClientID is null

*/