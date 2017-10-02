CREATE TABLE [dbo].[Mod_Product_PriceSale_History] (
    [ID]            INT        IDENTITY (1, 1) NOT NULL,
    [UserId]        INT        NULL,
    [ProductInfoId] INT        NOT NULL,
    [Price]         FLOAT (53) NULL,
    [SaleOffType]   BIT        NULL,
    [SaleOffValue]  FLOAT (53) NULL,
    [PriceSale]     FLOAT (53) NULL,
    [StartDate]     DATETIME   NULL,
    [FinishDate]    DATETIME   NULL,
    [CreateDate]    DATETIME   NULL,
    CONSTRAINT [PK_Mod_Product_PriceSale_History] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_PriceSale_History_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PriceSale_History', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'True: Giảm theo % | False: Giảm theo tiền', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PriceSale_History', @level2type = N'COLUMN', @level2name = N'SaleOffType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PriceSale_History', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID người quản trị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PriceSale_History', @level2type = N'COLUMN', @level2name = N'UserId';

