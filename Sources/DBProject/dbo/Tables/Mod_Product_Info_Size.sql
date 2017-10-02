CREATE TABLE [dbo].[Mod_Product_Info_Size] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT           NULL,
    [SizeCode]      NVARCHAR (50) NULL,
    [SizeName]      NVARCHAR (50) NULL,
    [CountNumber]   INT           NULL,
    [Price]         FLOAT (53)    NULL,
    [Activity]      BIT           NULL,
    [Order]         INT           NULL,
    [CreateDate]    DATETIME      NULL,
    CONSTRAINT [PK_Mod_Product_Info_Size] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Size_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sắp xếp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'Order';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượng sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'CountNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên màu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'SizeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã màu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Size', @level2type = N'COLUMN', @level2name = N'SizeCode';

