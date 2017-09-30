CREATE TABLE [dbo].[Mod_Product_PropertiesList] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [PropertiesGroupsId] INT            NULL,
    [Code]               NVARCHAR (50)  NULL,
    [Name]               NVARCHAR (200) NULL,
    [Note]               NVARCHAR (500) NULL,
    [Type]               INT            CONSTRAINT [DF_Mod_Product_PropertiesList_Type] DEFAULT ((0)) NULL,
    [ViewOldData]        BIT            CONSTRAINT [DF_Mod_Product_PropertiesList_ViewOldData] DEFAULT ((1)) NULL,
    [Unit]               NVARCHAR (50)  NULL,
    [CreateDate]         DATETIME       NULL,
    [Order]              INT            CONSTRAINT [DF_Mod_Product_PropertiesList_ViewOldData1] DEFAULT ((1)) NULL,
    [Activity]           BIT            CONSTRAINT [DF_Mod_Product_PropertiesList_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_PropertiesList] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_PropertiesList_Mod_Product_PropertiesGroups] FOREIGN KEY ([PropertiesGroupsId]) REFERENCES [dbo].[Mod_Product_PropertiesGroups] ([ID]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của nhóm: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị dữ liệu trước đó lên để cho chọn hay không. 0: Không hiển thị | 1: Hiển thị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Order';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đơn vị tính cho giá trị của thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Unit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị dữ liệu trước đó lên để cho chọn hay không. 0: Không hiển thị | 1: Hiển thị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'ViewOldData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Text Inline | 1: Text MutiLine', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Danh sách các thuộc tính', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_PropertiesList';

