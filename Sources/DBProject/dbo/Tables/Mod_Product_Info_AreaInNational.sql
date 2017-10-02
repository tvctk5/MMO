CREATE TABLE [dbo].[Mod_Product_Info_AreaInNational] (
    [ID]                    INT      IDENTITY (1, 1) NOT NULL,
    [ProductInfoId]         INT      NULL,
    [ProductNationalAreaId] INT      NULL,
    [CreateDate]            DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Info_AreaInNational] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_AreaInNational_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mod_Product_Info_AreaInNational_Mod_Product_National_Area] FOREIGN KEY ([ProductNationalAreaId]) REFERENCES [dbo].[Mod_Product_National_Area] ([ID]) ON DELETE CASCADE
);

