CREATE TABLE [dbo].[Plans]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(50) NOT NULL, 
    [Origin] TINYINT NOT NULL, 
    [Destination] TINYINT NOT NULL, 
    [Fare] VARCHAR(50) NOT NULL DEFAULT 0, 
    [DiscountedValue] DECIMAL NOT NULL DEFAULT 0, 
    [FullValue] DECIMAL NOT NULL DEFAULT 0 
)
