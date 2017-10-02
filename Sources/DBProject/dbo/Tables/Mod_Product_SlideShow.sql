CREATE TABLE [dbo].[Mod_Product_SlideShow] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT            NULL,
    [Name]          NVARCHAR (50)  NULL,
    [UrlReSize]     NVARCHAR (500) NULL,
    [UrlFull]       NVARCHAR (500) NULL,
    [Order]         INT            NULL,
    [CreateDate]    DATETIME       NULL,
    CONSTRAINT [PK_Mod_Product_SlideShow] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_SlideShow_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_SlideShow', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng danh sách ảnh cho sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_SlideShow';

