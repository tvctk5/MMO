CREATE TABLE [dbo].[Mod_Product_Price_History] (
    [ID]            INT        IDENTITY (1, 1) NOT NULL,
    [UserId]        INT        NULL,
    [ProductInfoId] INT        NULL,
    [Type]          BIT        NULL,
    [BeforePrice]   FLOAT (53) NULL,
    [AfterPrice]    FLOAT (53) NULL,
    [CreateDate]    DATETIME   NULL,
    CONSTRAINT [PK_Mod_Product_Price_History] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Price_History_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số tiền sau khi thay đổi', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Price_History', @level2type = N'COLUMN', @level2name = N'AfterPrice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số tiền trc khi thay đổi', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Price_History', @level2type = N'COLUMN', @level2name = N'BeforePrice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Kiểu thay đổi: True - Tăng | False: Giảm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Price_History', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Price_History', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID người quản trị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Price_History', @level2type = N'COLUMN', @level2name = N'UserId';

