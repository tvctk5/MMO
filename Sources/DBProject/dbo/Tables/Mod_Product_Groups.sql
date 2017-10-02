CREATE TABLE [dbo].[Mod_Product_Groups] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [ParentId]         INT            NULL,
    [Web_MenuId]       INT            NULL,
    [Web_MenuParentId] INT            NULL,
    [Code]             NVARCHAR (50)  NULL,
    [CodeParent]       NVARCHAR (50)  NULL,
    [Name]             NVARCHAR (200) NOT NULL,
    [Note]             NVARCHAR (200) NULL,
    [File]             NVARCHAR (200) NULL,
    [CreateDate]       DATETIME       NULL,
    [Activity]         BIT            CONSTRAINT [DF_Mod_Product_Groups_SuDung] DEFAULT ((1)) NOT NULL,
    [ShowHide]         BIT            CONSTRAINT [DF_Mod_Product_Groups_Activity1] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_Groups] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của nhóm: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'ShowHide';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của nhóm: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ảnh của nhóm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'File';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ghi chú', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'Note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên nhóm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số hiệu phân cấp: Cha - con', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'CodeParent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã nhóm thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nhóm sản phẩm Cha', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups', @level2type = N'COLUMN', @level2name = N'ParentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nhóm sản phẩm - Chủng loại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Groups';

