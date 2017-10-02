CREATE TABLE [dbo].[Mod_Product_Info_ProductGroups] (
    [ID]            INT IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT NULL,
    [MenuID]        INT NULL,
    [Activity]      BIT CONSTRAINT [DF_Mod_Product_Info_ProductGroups_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_Info_ProductGroups] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_MenuId] FOREIGN KEY ([MenuID]) REFERENCES [dbo].[Web_Menu] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Mod_Product_Info_ProductGroups_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'True: Nếu nhóm đó là nhóm chính của SP | False: Nếu nhóm đó là các nhóm liên quan', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_ProductGroups', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_ProductGroups', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lưu các nhóm sản phẩm liên quan', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info_ProductGroups';

