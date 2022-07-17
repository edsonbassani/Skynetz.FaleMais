CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [CustomerId] INT NOT NULL, 
    [Secret] VARCHAR(300) NOT NULL, 
    [LastLogin] DATETIME NOT NULL
)
