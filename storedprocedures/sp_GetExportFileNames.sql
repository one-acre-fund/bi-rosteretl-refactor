USE [RosterDatawarehouse]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetExportFileNames]    Script Date: 9/2/2020 9:09:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER        PROCEDURE [dbo].[sp_GetExportFileNames](
	--DECLARE 
	@Folder varchar(50), --= 'E:\rosterdata-weekly\',
	@Pattern varchar(50)-- = 'ClientBundles'
)

AS
BEGIN

 

drop table if exists #exportFiles

create table #exportFiles(ExportFileName varchar(max), depth int, isFile int)
delete  from #exportFiles
insert into #exportFiles (ExportFileName,depth,isFile)

EXEC xp_dirtree @Folder, 2, 1

delete from #exportFiles where ExportFileName not like CONCAT('%',@Pattern,'%') or ExportFileName='ClientBundles_270_Rwanda_18082020_061003.csv'



SELECT FilePath
FROM (
	select 
		FilePath, 
		ROW_NUMBER() over (partition by FileN,Country order by FileDate desc) RowN
	FROM (
		select
			CASE 
				WHEN ExportFileName like '%Burundi%' then 'Burundi'
				WHEN ExportFileName like '%Malawi%' then 'Malawi'
				WHEN ExportFileName like '%Rwanda%' then 'Rwanda'
				WHEN ExportFileName like '%Kenya%' then 'Kenya'
				WHEN ExportFileName like '%Myanmar%' then 'Myanmar'
				WHEN ExportFileName like '%Uganda%' then 'Uganda'
				WHEN ExportFileName like '%Zambia%' then 'Zambia'
				WHEN ExportFileName like '%Tanzania%' then 'Tanzania'
				WHEN ExportFileName like '%Nigeria%' then 'Nigeria'
				WHEN ExportFileName like '%India%' then 'India'
			else null
			end as Country,
		CASE 
				WHEN ExportFileName like '%Burundi%' then CONCAT(@Folder,'Burundi',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Malawi%' then CONCAT(@Folder,'Malawi',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Rwanda%' then CONCAT(@Folder,'Rwanda',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Kenya%' then CONCAT(@Folder,'Kenya',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Myanmar%' then CONCAT(@Folder,'Myanmar',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Uganda%' then CONCAT(@Folder,'Uganda',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Zambia%' then CONCAT(@Folder,'Zambia',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Tanzania%' then CONCAT(@Folder,'Tanzania',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%India%' then CONCAT(@Folder,'India',CONCAT('\',ExportFileName))
				WHEN ExportFileName like '%Nigeria%' then CONCAT(@Folder,'Nigeria',CONCAT('\',ExportFileName))

		else null
		end as FilePath,
		SUBSTRING(ExportFileName,1,17) FileN, 
		Replace(RIGHT(ExportFileName,19), '.csv','') FileDate, 
		ExportFileName
	from #exportFiles 
	--where exportfilename not like '%Myanmar%'
	) a
) names 
where RowN=1 and FilePath is not null

END
