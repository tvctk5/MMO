CREATE TABLE [dbo].[Mod_Product_Order_Details] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [OrderId]           INT            NULL,
    [ProductInfoId]     INT            NULL,
    [MenuID]            INT            NULL,
    [LangID]            INT            NULL,
    [Code]              NVARCHAR (50)  NULL,
    [Name]              NVARCHAR (200) NULL,
    [File]              NVARCHAR (500) NULL,
    [Quantity]          INT            NULL,
    [FriceInput]        FLOAT (53)     NULL,
    [Frice]             FLOAT (53)     NULL,
    [PriceSale]         FLOAT (53)     NULL,
    [ShowVAT]           BIT            NULL,
    [VAT]               BIT            CONSTRAINT [DF_Mod_Product_Order_Details_VAT] DEFAULT ((0)) NULL,
    [SaleOffType]       BIT            NULL,
    [PriceTextSaleView] NVARCHAR (50)  CONSTRAINT [DF_Mod_Product_Order_Details_Discount] DEFAULT ((0)) NULL,
    [TotalFrice]        FLOAT (53)     NULL,
    [Gifts]             NVARCHAR (500) NULL,
    [Attach]            BIT            NULL,
    [Note]              NVARCHAR (500) NULL,
    CONSTRAINT [PK_Mod_Product_Order_Details] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Order_Details_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]),
    CONSTRAINT [FK_Mod_Product_Order_Details_Mod_Product_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Mod_Product_Order] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Xem sản phẩm này có phải hàng khuyến mại, đi kèm hay không : 0: Hàng mua mất phí | 1: Hàng đi kèm miễn phí', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'Attach';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quà tặng, Hàng khuyến mãi, hàng đi kèm sản phẩm (Nếu có)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'Gifts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số tiền cuối cùng cần chi phí cho sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'TotalFrice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số tiền giảm đc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'PriceTextSaleView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Kiểu giảm: TRUE: % | FALSE: Tiền', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'SaleOffType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đã có VAT hay chưa', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'VAT';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá sản phẩm đã giảm giá', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'PriceSale';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá sản phẩm bán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'Frice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá gốc SP trong thời điểm lúc đặt mua', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'FriceInput';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'Quantity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order_Details', @level2type = N'COLUMN', @level2name = N'ProductInfoId';

