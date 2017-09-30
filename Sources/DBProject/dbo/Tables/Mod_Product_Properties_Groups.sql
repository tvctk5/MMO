CREATE TABLE [dbo].[Mod_Product_Properties_Groups] (
    [ID]                 INT      IDENTITY (1, 1) NOT NULL,
    [PropertiesListId]   INT      NULL,
    [PropertiesGroupsId] INT      NULL,
    [CreateDate]         DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Properties_PropertiesGroups] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Properties_Groups', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Properties_Groups', @level2type = N'COLUMN', @level2name = N'PropertiesListId';

