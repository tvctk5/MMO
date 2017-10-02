CREATE TABLE [dbo].[Mod_Product_FilterGroups] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (50) NULL,
    [Name]        NVARCHAR (50) NULL,
    [Type]        INT           CONSTRAINT [DF_Mod_Product_FilterGroups_Type] DEFAULT ((0)) NULL,
    [ShowControl] BIT           CONSTRAINT [DF_Mod_Product_FilterGroups_ShowControl] DEFAULT ((0)) NULL,
    [Order]       INT           NULL,
    [Activity]    BIT           CONSTRAINT [DF_Mod_Product_FilterGroups_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_FilterGroups] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của nhóm: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_FilterGroups', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị control cho người dùng click hay không: True: Hiển thị | False : Không hiển thị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_FilterGroups', @level2type = N'COLUMN', @level2name = N'ShowControl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Hiển thị radio | 1: Hiển thị check box', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_FilterGroups', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nhóm thuộc tính lọc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_FilterGroups';

