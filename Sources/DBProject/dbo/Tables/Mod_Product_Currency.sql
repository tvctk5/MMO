CREATE TABLE [dbo].[Mod_Product_Currency] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (50)  NULL,
    [Name]        NVARCHAR (200) NULL,
    [VND]         FLOAT (53)     NULL,
    [Description] NVARCHAR (200) NULL,
    [Activity]    BIT            CONSTRAINT [DF_Mod_Product_Currency_Activity] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Mod_Product_Currency] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái có được duyệt hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Currency', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng tỷ giá', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Currency';

