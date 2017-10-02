CREATE TABLE [dbo].[Mod_Product_Info_Color] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT           NULL,
    [ColorCode]     NVARCHAR (50) NULL,
    [ColorName]     NVARCHAR (50) NULL,
    [CountNumber]   INT           NULL,
    [Activity]      BIT           NULL,
    [Order]         INT           NULL,
    [CreateDate]    DATETIME      NULL,
    CONSTRAINT [PK_Mod_Product_Info_Color] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductInfo_Color] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sắp xếp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'Order';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượng sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'CountNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên màu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'ColorName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã màu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Color', @level2type = N'COLUMN', @level2name = N'ColorCode';

