CREATE TABLE [dbo].[Mod_Product_Manufacturer] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (50)  NULL,
    [Name]        NVARCHAR (200) NULL,
    [Address]     NVARCHAR (50)  NULL,
    [PhoneNumber] NVARCHAR (50)  NULL,
    [Email]       NVARCHAR (50)  NULL,
    [Note]        NVARCHAR (200) NULL,
    [File]        NVARCHAR (200) NULL,
    [CreateDate]  DATETIME       NULL,
    [Activity]    BIT            CONSTRAINT [DF_Mod_Product_Manufacturer_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_Manufacturer] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái có được sử dụng hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Manufacturer', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Manufacturer', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nhà sản xuất', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Manufacturer';

