CREATE TABLE [dbo].[Mod_Product_Info_City] (
    [ID]            INT IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT NULL,
    [ProductCityId] INT NULL,
    CONSTRAINT [PK_Mod_Product_City] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_City_Mod_Product_City] FOREIGN KEY ([ProductCityId]) REFERENCES [dbo].[Mod_Product_City] ([ID]),
    CONSTRAINT [FK_Mod_Product_Info_City_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);

