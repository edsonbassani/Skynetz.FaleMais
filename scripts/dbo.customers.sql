CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(100) NOT NULL, 
    [MiddleName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(100) NOT NULL, 
    [PlanId] INT NOT NULL
)
