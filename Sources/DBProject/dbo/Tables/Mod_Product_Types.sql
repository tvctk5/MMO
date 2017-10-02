CREATE TABLE [dbo].[Mod_Product_Types] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50) NULL,
    [Name]       NVARCHAR (50) NULL,
    [CreateDate] DATETIME      NULL,
    [Activity]   BIT           NULL,
    CONSTRAINT [PK_Mod_Product_Types] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại sản phẩm: Mới, hot, ..', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Types';

