CREATE TABLE [dbo].[Mod_DT_Ky_DaiLy] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [ModDtKyId]               INT            NULL,
    [ModProductAgentParentId] INT            NULL,
    [ModProductAgentId]       INT            NULL,
    [Code]                    NVARCHAR (50)  NULL,
    [Name]                    NVARCHAR (200) NULL,
    [Type]                    INT            CONSTRAINT [DF_Mod_DT_Ky_DaiLy_Type] DEFAULT ((0)) NULL,
    [Value]                   FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_Value] DEFAULT ((0)) NULL,
    [TotalFirst]              FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_TotalFirst] DEFAULT ((0)) NULL,
    [TotalLast]               FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_TotalLast] DEFAULT ((0)) NULL,
    [TongTienLayHang]         FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_TongTienLayHang] DEFAULT ((0)) NULL,
    [TongTienHoaHong]         FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_TongTienHoaHong] DEFAULT ((0)) NULL,
    [ModLoaiDaiLyCode]        NVARCHAR (50)  NULL,
    [ModLoaiDaiLyName]        NVARCHAR (200) NULL,
    [ModLoaiDaiLyType]        INT            CONSTRAINT [DF_Mod_DT_Ky_DaiLy_ModLoaiDaiLyType] DEFAULT ((0)) NULL,
    [ModLoaiDaiLyValue]       FLOAT (53)     CONSTRAINT [DF_Mod_DT_Ky_DaiLy_ModLoaiDaiLyValue] DEFAULT ((0)) NULL,
    [Activity]                BIT            CONSTRAINT [DF_Mod_DT_Ky_DaiLy_Activity] DEFAULT ((1)) NULL,
    [CreateDate]              DATETIME       CONSTRAINT [DF_Mod_DT_Ky_DaiLy_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_Ky_DaiLy] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_Mod_DT_Ky] FOREIGN KEY ([ModDtKyId]) REFERENCES [dbo].[Mod_DT_Ky] ([ID]),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_Mod_Product_Agent] FOREIGN KEY ([ModProductAgentParentId]) REFERENCES [dbo].[Mod_Product_Agent] ([ID]),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_Mod_Product_AgentParent] FOREIGN KEY ([ModProductAgentId]) REFERENCES [dbo].[Mod_Product_Agent] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'ModLoaiDaiLyValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại khuyến mại: 0: %/ tổng số tiền | 1: số tiền giảm/sản phẩm | 2: Số tiền giảm (tiền mặt)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'ModLoaiDaiLyType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng tiền hoa hồng được hưởng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'TongTienHoaHong';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng số tiền nhập hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'TongTienLayHang';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng tiền sau kỳ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'TotalLast';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng tiền có trước kỳ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'TotalFirst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại khuyến mại: 0: %/ tổng số tiền | 1: số tiền giảm/sản phẩm | 2: Số tiền giảm (tiền mặt)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đại lý cha, giới thiệu đại lý con', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'ModProductAgentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đại lý nhập sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky_DaiLy', @level2type = N'COLUMN', @level2name = N'ModProductAgentParentId';

