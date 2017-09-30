CREATE TABLE [dbo].[Mod_Product_Info_Types] (
    [ID]             INT      IDENTITY (1, 1) NOT NULL,
    [ProductInfoId]  INT      NULL,
    [ProductTypesId] INT      NULL,
    [CreateDate]     DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Info_Types] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Types_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mod_Product_Info_Types_Mod_Product_Types] FOREIGN KEY ([ProductTypesId]) REFERENCES [dbo].[Mod_Product_Types] ([ID]) ON DELETE CASCADE
);

