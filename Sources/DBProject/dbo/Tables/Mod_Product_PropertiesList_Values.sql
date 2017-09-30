CREATE TABLE [dbo].[Mod_Product_PropertiesList_Values] (
    [ID]               INT   IDENTITY (1, 1) NOT NULL,
    [PropertiesListId] INT   NULL,
    [Content]          NTEXT NULL,
    CONSTRAINT [PK_Mod_Product_PropertiesList_Values] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_PropertiesList_Values_Mod_Product_PropertiesList] FOREIGN KEY ([PropertiesListId]) REFERENCES [dbo].[Mod_Product_PropertiesList] ([ID]) ON DELETE CASCADE
);

