CREATE TABLE [dbo].[Mod_Product_Info_PropertyFilter] (
    [ID]              INT      IDENTITY (1, 1) NOT NULL,
    [ProductInfoId]   INT      NULL,
    [ProductFilterId] INT      NULL,
    [CreateDate]      DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Info_PropertyFilter] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_PropertyFilter_Mod_Product_Filter] FOREIGN KEY ([ProductFilterId]) REFERENCES [dbo].[Mod_Product_Filter] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mod_Product_Info_PropertyFilter_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);

