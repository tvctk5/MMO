CREATE TABLE [dbo].[Mod_Loai_DaiLy] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [Type]       INT            CONSTRAINT [DF_Mod_DT_Loai_DaiLy_Type] DEFAULT ((0)) NULL,
    [Value]      FLOAT (53)     CONSTRAINT [DF_Mod_DT_Loai_DaiLy_Value] DEFAULT ((0)) NULL,
    [Activity]   BIT            CONSTRAINT [DF_Mod_DT_Loai_DaiLy_Activity] DEFAULT ((1)) NULL,
    [CreateDate] DATETIME       CONSTRAINT [DF_Mod_DT_Loai_DaiLy_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_Loai_DaiLy] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Loai_DaiLy', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại khuyến mại: 0: %/ tổng số tiền | 1: số tiền giảm/sản phẩm | 2: Số tiền giảm (tiền mặt)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Loai_DaiLy', @level2type = N'COLUMN', @level2name = N'Type';

