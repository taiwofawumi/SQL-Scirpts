/****** Script for SelectTopNRows command from SSMS  ******/
SELECT	COUNT([OccID]) AS Duplicates, OccID
  FROM [TSB_AIR_Raw].[dbo].[Staging_Main_Extract]
  GROUP BY OccID
  ORDER BY Duplicates DESC
  
  SELECT * FROM [dbo].[Staging_Main]
  WHERE OccID = 46716 OR OccID = 58548 -- AND [OperationTypeID_DisplayEng] = 'AIR TRANSPORT'