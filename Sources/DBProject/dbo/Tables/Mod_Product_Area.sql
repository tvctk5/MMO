CREATE TABLE [dbo].[Mod_Product_Area] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50) NULL,
    [Name]       NVARCHAR (50) NULL,
    [Activity]   BIT           NULL,
    [CreateDate] DATETIME      NULL,
    CONSTRAINT [PK_Mod_Product_Area] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng danh mục các lĩnh vực ngành nghề kinh doanh', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Area';

