CREATE TABLE [dbo].[Mod_Product_Info_Agent] (
    [ID]            INT      IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT      NULL,
    [ProductAgeId]  INT      NULL,
    [CreateDate]    DATETIME NULL,
    [Activity]      BIT      CONSTRAINT [DF_Mod_Product_Info_Agent_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_Info_Agent] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Agent_Mod_Product_City] FOREIGN KEY ([ProductAgeId]) REFERENCES [dbo].[Mod_Product_Agent] ([ID]),
    CONSTRAINT [FK_Mod_Product_Info_Agent_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái Còn hàng hay không:  (True: Còn hàng | False: Không còn hàng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Agent', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Agent', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Agent', @level2type = N'COLUMN', @level2name = N'ProductAgeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Agent', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sản phẩm - Đại lý bán sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_Agent';

