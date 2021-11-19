-- Use your Database
USE [TSB_AIR_Raw]
GO
-- Drop table if it already exist. It will be recreated later
DROP TABLE IF EXISTS [dbo].[Staging_Main_Partitioned]
GO

-- Create partitions for each extracted. Each column is partitioned by OccID and the column itself.
-- The created partition row numbers is used to remove false duplicates in the next stage
SELECT [OccID]
      ,[AirportID_AirportName] AS Airport_Name
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [AirportID_AirportName] ORDER BY [OccID]) AS Airport_Name_PartID
      ,[AirportID_ProvinceID_DisplayEng] AS Airport_Province
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [AirportID_ProvinceID_DisplayEng] ORDER BY [OccID]) AS Airport_Province_PartID
      ,[OccRegionID_DisplayEng] AS Region
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OccRegionID_DisplayEng] ORDER BY [OccID]) AS Region_PartID
      ,[ProvinceID_DisplayEng] AS Province
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [ProvinceID_DisplayEng] ORDER BY [OccID]) AS Province_PartID
      ,[Location] AS Location
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [Location] ORDER BY [OccID]) AS Location_PartID
      ,[Latitude] AS Latitude
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [Latitude] ORDER BY [OccID]) AS Latitude_PartID
      ,[Longitude] AS Longitude
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [Longitude] ORDER BY [OccID]) AS Longitude_PartID
      ,[OccTypeID_DisplayEng] AS Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OccTypeID_DisplayEng] ORDER BY [OccID]) AS Type_PartID
      ,[ICAO_DisplayEng] AS Category
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [ICAO_DisplayEng] ORDER BY [OccID]) AS Category_PartID
      ,[OccIncidentTypeID_DisplayEng] AS Incident_Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OccIncidentTypeID_DisplayEng] ORDER BY [OccID]) AS Incident_Type_PartID
      ,[OccDate] AS Date
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OccDate] ORDER BY [OccID]) AS Date_PartID
      ,[OccTime] AS Time
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OccTime] ORDER BY [OccID]) AS Time_PartID
      ,[PhaseID_DisplayEng] AS Flight_Phase
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [PhaseID_DisplayEng] ORDER BY [OccID]) AS Flight_Phase_PartID
      ,[AircraftTypeID_DisplayEng] AS Aircraft_Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [AircraftTypeID_DisplayEng] ORDER BY [OccID]) AS Aircraft_Type_PartID
      ,[AircraftMakeID_DisplayEng] AS Aircraft_Make
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [AircraftMakeID_DisplayEng] ORDER BY [OccID]) AS Aircraft_Make_PartID
      ,[AircraftModelID_DisplayEng] AS Aircraft_Model
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [AircraftModelID_DisplayEng] ORDER BY [OccID]) AS Aircraft_Model_PartID
      ,[OperatorTypeID_DisplayEng] AS Operator_Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OperatorTypeID_DisplayEng] ORDER BY [OccID]) AS Operator_Type_PartID
      ,[OrganizationID_DisplayEng] AS Organization
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OrganizationID_DisplayEng] ORDER BY [OccID]) AS Organization_PartID
      ,[LandingGearID_DisplayEng] AS Landing_Gear
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [LandingGearID_DisplayEng] ORDER BY [OccID]) AS Landing_Gear_PartID
      ,[YearOfManuf] AS YearOfManuf
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [YearOfManuf] ORDER BY [OccID]) AS YearOfManuf_PartID
      ,[OperationTypeID_DisplayEng] AS Operation_Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [OperationTypeID_DisplayEng] ORDER BY [OccID]) AS Operation_Type_PartID
      ,[EngineTypeID_DisplayEng] AS Engine_Type
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [EngineTypeID_DisplayEng] ORDER BY [OccID]) AS Engine_Type_PartID
      ,[EngineMakeID_DisplayEng] AS Engine_Make
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [EngineMakeID_DisplayEng] ORDER BY [OccID]) AS Engine_Make_PartID
      ,[EngineModelID_DisplayEng] AS Engine_Model
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [EngineModelID_DisplayEng] ORDER BY [OccID]) AS Engine_Model_PartID
      ,[TotalFatalCount] AS TotalFatalCount
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [TotalFatalCount] ORDER BY [OccID]) AS TotalFatalCount_PartID
      ,[TotalMinorCount] AS TotalMinorCount
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [TotalMinorCount] ORDER BY [OccID]) AS TotalMinorCount_PartID
      ,[TotalNoneCount] AS TotalNoneCount
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [TotalNoneCount] ORDER BY [OccID]) AS TotalNoneCount_PartID
      ,[TotalSeriousCount] AS TotalSeriousCount
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [TotalSeriousCount] ORDER BY [OccID]) AS TotalSeriousCount_PartID
      ,[TotalUnknownCount] AS TotalUnknownCount
	  ,ROW_NUMBER() OVER(PARTITION BY [OccID], [TotalUnknownCount] ORDER BY [OccID]) AS TotalUnknownCount_PartID
INTO Staging_Main_Partitioned -- Insert in a new table
FROM [dbo].[Staging_Main_Extract]
GO