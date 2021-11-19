-- Use your Database
USE [TSB_AIR_Raw]
GO
-- Drop table if it already exist. It will be recreated later
DROP TABLE IF EXISTS [dbo].[Staging_Main_Extract]
GO

-- Select columns from Raw Database
SELECT DISTINCT
[dbo].[Occurrence_Table].[OccID],
[dbo].[Occurrence_Table].[OccNo],
[AirportID_AirportName],
[AirportID_ProvinceID_DisplayEng],
[OccRegionID_DisplayEng],
[ProvinceID_DisplayEng],
[Location],
[Latitude],
[Longitude],
[OccTypeID_DisplayEng],
[ICAO_DisplayEng],
[OccIncidentTypeID_DisplayEng],
[OccDate],
[OccTime],
[PhaseID_DisplayEng],
[AircraftTypeID_DisplayEng],
[AircraftMakeID_DisplayEng],
[AircraftModelID_DisplayEng],
[OperatorTypeID_DisplayEng],
[OrganizationID_DisplayEng],
[LandingGearID_DisplayEng],
[YearOfManuf],
[OperationTypeID_DisplayEng],
[EngineTypeID_DisplayEng],
[EngineMakeID_DisplayEng],
[EngineModelID_DisplayEng],
[TotalFatalCount],
[TotalMinorCount],
[TotalNoneCount],
[TotalSeriousCount],
[TotalUnknownCount]
INTO Staging_Main_Extract -- Create new table to hold extracted columns
FROM
[dbo].[Occurrence_Table]
LEFT OUTER JOIN
[dbo].[Events_Phases_Table] ON [dbo].[Occurrence_Table].OccID = [dbo].[Events_Phases_Table].OccID
LEFT OUTER JOIN
[dbo].[Aircraft_Table] ON [dbo].[Occurrence_Table].OccID = [dbo].[Aircraft_Table].occid
WHERE
[CountryID_DisplayEng] = 'CANADA' -- Considering only events in Canada
GO