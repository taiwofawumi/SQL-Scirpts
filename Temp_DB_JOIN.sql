SELECT DISTINCT [dbo].[FirstTable].[Col1], [dbo].[FirstTable].[Col2], [dbo].[SecondTable].[Col1], [dbo].[SecondTable].[Col2] 
FROM [dbo].[FirstTable]
JOIN [dbo].[SecondTable] ON [dbo].[FirstTable].[Col1] = [dbo].[SecondTable].[Col1] 