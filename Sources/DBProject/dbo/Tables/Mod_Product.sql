CREATE TABLE [dbo].[Mod_Product] (
    [ID]       INT             IDENTITY (1, 1) NOT NULL,
    [MenuID]   INT             NULL,
    [Name]     NVARCHAR (100)  NULL,
    [Code]     VARCHAR (100)   NULL,
    [File]     NVARCHAR (100)  NULL,
    [Summary]  NVARCHAR (1000) NULL,
    [Content]  NTEXT           NULL,
    [Frice]    INT             NULL,
    [Quantity] INT             NULL,
    [Order]    INT             NULL,
    [Activity] BIT             NULL,
    CONSTRAINT [PK_Mod_Product] PRIMARY KEY CLUSTERED ([ID] ASC)
);

