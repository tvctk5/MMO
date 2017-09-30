CREATE TABLE [dbo].[Mod_Product_Info_Details] (
    [ID]                 INT   IDENTITY (1, 1) NOT NULL,
    [ProductInfoId]      INT   NULL,
    [PropertiesGroupsId] INT   NULL,
    [PropertiesListId]   INT   NULL,
    [Content]            NTEXT NULL,
    CONSTRAINT [PK_Mod_Product_Info_Details] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Details_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Details', @level2type = N'COLUMN', @level2name = N'ProductInfoId';

