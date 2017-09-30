CREATE TABLE [dbo].[Mod_DT_CapDaiLy_TyLe] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]   INT            NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [Type]       INT            CONSTRAINT [DF_Mod_DT_CapDaiLy_TyLe_Type] DEFAULT ((0)) NULL,
    [Value]      FLOAT (53)     CONSTRAINT [DF_Mod_DT_CapDaiLy_TyLe_Value] DEFAULT ((0)) NULL,
    [Activity]   BIT            CONSTRAINT [DF_Mod_DT_CapDaiLy_TyLe_Activity] DEFAULT ((1)) NULL,
    [CreateDate] DATETIME       CONSTRAINT [DF_Mod_DT_CapDaiLy_TyLe_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_CapDaiLy_TyLe] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_DT_CapDaiLy_TyLe_Mod_DT_CapDaiLy_TyLe] FOREIGN KEY ([ParentID]) REFERENCES [dbo].[Mod_DT_CapDaiLy_TyLe] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_CapDaiLy_TyLe', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại khuyến mại: 0: %/ tổng số tiền | 1: số tiền giảm/sản phẩm | 2: Số tiền giảm (tiền mặt)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_CapDaiLy_TyLe', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tỷ lệ hoa hồng trên mỗi cấp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_CapDaiLy_TyLe';

