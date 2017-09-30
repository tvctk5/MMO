CREATE TABLE [dbo].[Mod_Product_Groups_PropertiesGroups] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ProductGroupsId]    INT NULL,
    [PropertiesGroupsId] INT NULL,
    CONSTRAINT [PK_Mod_Product_Info_PropertiesGroups] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Groups_PropertiesGroups_Mod_Product_Groups] FOREIGN KEY ([ProductGroupsId]) REFERENCES [dbo].[Mod_Product_Groups] ([ID]),
    CONSTRAINT [FK_Mod_Product_Info_PropertiesGroups_Mod_Product_PropertiesGroups] FOREIGN KEY ([PropertiesGroupsId]) REFERENCES [dbo].[Mod_Product_PropertiesGroups] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id Nhóm thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups_PropertiesGroups', @level2type = N'COLUMN', @level2name = N'PropertiesGroupsId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups_PropertiesGroups', @level2type = N'COLUMN', @level2name = N'ProductGroupsId';

