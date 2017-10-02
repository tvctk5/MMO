CREATE TABLE [dbo].[Mod_Product_Info_Office] (
    [ID]              INT IDENTITY (1, 1) NOT NULL,
    [ProductInfoId]   INT NULL,
    [ProductOfficeId] INT NULL,
    [CountNumber]     INT NULL,
    CONSTRAINT [PK_Mod_Product_Info_Office] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Office_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mod_Product_Info_Office_Mod_Product_Office] FOREIGN KEY ([ProductOfficeId]) REFERENCES [dbo].[Mod_Product_Office] ([ID])
);

