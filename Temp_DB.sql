
--USE Temp_DB
--GO
-- Sample Table
--CREATE TABLE FirstTable (Col1 INT, Col2 nvarchar(5))
--CREATE TABLE SecondTable (Col1 INT, Col2 nvarchar(5))

--GO

INSERT INTO FirstTable (Col1, Col2)
VALUES (1, 'A'), (2, 'B'), (2, 'C'), (2, 'D'), (2, 'E'), (2, 'F'), (NULL, 'G')
GO
INSERT INTO SecondTable (Col1, Col2)
VALUES (1, 'H'), (2, 'I'), (2, 'J'), (2, 'K'), (2, 'L'), (2, 'M')

--ALTER TABLE [dbo].[FirstTable]
--ADD ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY;
--DELETE FROM [dbo].[FirstTable]
--DELETE FROM [dbo].[SecondTable]