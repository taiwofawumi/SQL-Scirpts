-- Use your Database
USE [TSB_AIR_Raw]
GO

-- Drop table if it already exist. It will be recreated later
DROP TABLE IF EXISTS [dbo].[Staging_Main_Partitioned_Copy]
GO
-- Create a copy of your Partioned table so that you can run updates on the copy
SELECT * 
INTO Staging_Main_Partitioned_Copy
FROM [dbo].[Staging_Main_Partitioned]
GO

-- Run column updates (i.e. remove duplicates) on the copy you just created
UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Airport_Name] = '' WHERE [Airport_Name_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Airport_Province] = '' WHERE [Airport_Province_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Region] = '' WHERE [Region_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Province] = '' WHERE [Province_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Location] = '' WHERE [Location_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Latitude] = '' WHERE [Latitude_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Longitude] = '' WHERE [Longitude_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Type] = '' WHERE [Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Category] = '' WHERE [Category_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Incident_Type] = '' WHERE [Incident_Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Date] = '' WHERE [Date_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Time] = '' WHERE [Time_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Flight_Phase] = '' WHERE [Flight_Phase_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Aircraft_Type] = '' WHERE [Aircraft_Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Aircraft_Make] = '' WHERE [Aircraft_Make_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Aircraft_Model] = '' WHERE [Aircraft_Model_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Operator_Type]= '' WHERE [Operator_Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Organization] = '' WHERE [Organization_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Landing_Gear] = '' WHERE [Landing_Gear_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [YearOfManuf] = '' WHERE [YearOfManuf_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Operation_Type] = '' WHERE [Operation_Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Engine_Type] = '' WHERE [Engine_Type_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Engine_Make] = '' WHERE [Engine_Make_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [Engine_Model] = '' WHERE [Engine_Model_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [TotalFatalCount] = '' WHERE [TotalFatalCount_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [TotalMinorCount] = '' WHERE [TotalMinorCount_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [TotalNoneCount] = ''  WHERE [TotalNoneCount_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [TotalSeriousCount] = '' WHERE [TotalSeriousCount_PartID] > 1

UPDATE [dbo].[Staging_Main_Partitioned_Copy] SET [TotalUnknownCount] = '' WHERE [TotalUnknownCount_PartID] > 1
GO