CREATE TABLE [dbo].[Mod_Product_Area_PropretyGroup] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [ProductAreaId]     INT      NULL,
    [PropertiesGroupId] INT      NULL,
    [CreateDate]        DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Area_PropretyGroup] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Area_PropretyGroup_Mod_Product_Area] FOREIGN KEY ([ProductAreaId]) REFERENCES [dbo].[Mod_Product_Area] ([ID]),
    CONSTRAINT [FK_Mod_Product_Area_PropretyGroup_Mod_Product_PropretyGroups] FOREIGN KEY ([PropertiesGroupId]) REFERENCES [dbo].[Mod_Product_PropertiesGroups] ([ID])
);

