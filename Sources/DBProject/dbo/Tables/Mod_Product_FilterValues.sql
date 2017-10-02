CREATE TABLE [dbo].[Mod_Product_FilterValues] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [ProductFilterId] INT            NULL,
    [Value]           NVARCHAR (500) NULL,
    CONSTRAINT [PK_Mod_Product_FilterValues] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_FilterValues_Mod_Product_Filter] FOREIGN KEY ([ProductFilterId]) REFERENCES [dbo].[Mod_Product_Filter] ([ID])
);

