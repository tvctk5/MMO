CREATE TABLE [dbo].[Mod_Product_CustomersGroups] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [PointStart] INT            NULL,
    [PointEnd]   INT            NULL,
    [CreateDate] DATETIME       CONSTRAINT [DF_Mod_Product_CustomersGroups_CreateDate] DEFAULT (getdate()) NULL,
    [Activity]   BIT            CONSTRAINT [DF_Mod_Product_CustomersGroups_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_CustomersGroups] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái: 0 : Không sử dụng | 1: Sử dụng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_CustomersGroups', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tính điểm kết thúc cho nhóm khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_CustomersGroups', @level2type = N'COLUMN', @level2name = N'PointEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tính điểm bắt đầu cho nhóm khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_CustomersGroups', @level2type = N'COLUMN', @level2name = N'PointStart';

