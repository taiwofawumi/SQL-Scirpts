-- Use your Database
USE [TSB_AIR_Raw]
GO

-- Drop table if it already exist. It will be recreated later
DROP TABLE IF EXISTS [dbo].[Staging_Main]
GO

-- Select your final columns (dropping the partition columns) and assign a unique ID
SELECT --ROW_NUMBER() OVER(ORDER BY [OccID] ASC) AS ID
	   [OccID]
	  ,[Airport_Name]      
	  ,[Airport_Province]      
      ,[Region]     
      ,[Province]      
      ,[Location]      
      ,[Latitude]      
      ,[Longitude]      
      ,[Type]     
      ,[Category]      
      ,[Incident_Type]      
      ,[Date]     
      ,[Time]      
      ,[Flight_Phase]   
      ,[Aircraft_Type]      
      ,[Aircraft_Make]      
      ,[Aircraft_Model]     
      ,[Operator_Type] AS Aircraft_Operator_Type    
      ,[Organization] AS Aircraft_Organization     
      ,[Landing_Gear] AS Aircraft_Landing_Gear     
      ,[YearOfManuf] AS Aircraft_YearOfManuf   
      ,[Operation_Type]      
      ,[Engine_Type]     
      ,[Engine_Make]     
      ,[Engine_Model]     
      ,[TotalFatalCount]      
      ,[TotalMinorCount]   
      ,[TotalNoneCount]    
      ,[TotalSeriousCount]   
      ,[TotalUnknownCount]  
  INTO Staging_Main --create new table to hold your final columns
  FROM [dbo].[Staging_Main_Partitioned_Copy]
  GO