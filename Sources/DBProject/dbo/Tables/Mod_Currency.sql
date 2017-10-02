CREATE TABLE [dbo].[Mod_Currency] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (50)   NULL,
    [Code]         NVARCHAR (50)   NULL,
    [Symbol]       NCHAR (10)      NULL,
    [ExchangeRate] DECIMAL (18, 6) NULL,
    CONSTRAINT [PK_Mod_Currency] PRIMARY KEY CLUSTERED ([ID] ASC)
);

