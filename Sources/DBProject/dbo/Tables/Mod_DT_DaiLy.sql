CREATE TABLE [dbo].[Mod_DT_DaiLy] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [ModProductAgentParentId] INT            NULL,
    [ModProductAgentId]       INT            NULL,
    [ModDTLoaiDaiLyId]        INT            NULL,
    [Code]                    NVARCHAR (50)  NULL,
    [Name]                    NVARCHAR (200) NULL,
    [ModLoaiDaiLyCode]        NVARCHAR (50)  NULL,
    [ModLoaiDaiLyName]        NVARCHAR (200) NULL,
    [ModLoaiDaiLyType]        INT            CONSTRAINT [DF_Mod_DT_DaiLy_Type] DEFAULT ((0)) NULL,
    [ModLoaiDaiLyValue]       FLOAT (53)     CONSTRAINT [DF_Mod_DT_DaiLy_Value] DEFAULT ((0)) NULL,
    [Transfer]                FLOAT (53)     NULL,
    [Activity]                BIT            CONSTRAINT [DF_Mod_DT_DaiLy_Activity] DEFAULT ((1)) NULL,
    [CreateDate]              DATETIME       CONSTRAINT [DF_Mod_DT_DaiLy_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_DaiLy] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_DT_DaiLy_Mod_Product_Agent] FOREIGN KEY ([ModProductAgentId]) REFERENCES [dbo].[Mod_Product_Agent] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số dư sẽ chuyển sang kỳ kế tiếp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_DaiLy', @level2type = N'COLUMN', @level2name = N'Transfer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_DaiLy', @level2type = N'COLUMN', @level2name = N'ModLoaiDaiLyValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại khuyến mại: 0: %/ tổng số tiền | 1: số tiền giảm/sản phẩm | 2: Số tiền giảm (tiền mặt)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_DaiLy', @level2type = N'COLUMN', @level2name = N'ModLoaiDaiLyType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đại lý cha, giới thiệu đại lý con', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_DaiLy', @level2type = N'COLUMN', @level2name = N'ModProductAgentParentId';

