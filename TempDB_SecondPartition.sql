ALTER TABLE [dbo].[ThirdTable]
--SELECT [ID], [Column 2], [Column 6], 
SELECT
	ROW_NUMBER() OVER (PARTITION BY [dbo].[ThirdTable].[ID], [dbo].[ThirdTable].[Column 2] 
	ORDER BY [dbo].[ThirdTable].[ID]) AS RNCID2
INTO [dbo].[ThirdTable]
FROM [dbo].[ThirdTable]

UPDATE [dbo].[ThirdTable_Partition_C2]
SET [Column 2] = Null
WHERE RNC2 > 1

UPDATE [dbo].[ThirdTable_Partition_C6]
SET [Column 6] = Null
WHERE RNC6 > 1