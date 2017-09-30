CREATE TABLE [dbo].[Mod_Product_National_Area] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ProductNationalId] INT           NULL,
    [Code]              NVARCHAR (50) NULL,
    [Name]              NVARCHAR (50) NULL,
    [CreateDate]        DATETIME      NULL,
    [Activity]          BIT           NULL,
    CONSTRAINT [PK_Mod_Product_National_Area] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_National_Area_Mod_Product_National] FOREIGN KEY ([ProductNationalId]) REFERENCES [dbo].[Mod_Product_National] ([ID]) ON DELETE CASCADE
);

