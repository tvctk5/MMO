CREATE TABLE [dbo].[Mod_Product_Policy_ProductInfo] (
    [ID]            INT      IDENTITY (1, 1) NOT NULL,
    [PolicyId]      INT      NULL,
    [ProductInfoId] INT      NULL,
    [CreateDate]    DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Policy_ProductInfo] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Policy_ProductInfo_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]),
    CONSTRAINT [FK_Mod_Product_Policy_ProductInfo_Mod_Product_Policy] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Mod_Product_Policy] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_ProductInfo', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_ProductInfo', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Chính sách Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_ProductInfo', @level2type = N'COLUMN', @level2name = N'PolicyId';

