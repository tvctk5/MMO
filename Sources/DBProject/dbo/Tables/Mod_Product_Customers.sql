CREATE TABLE [dbo].[Mod_Product_Customers] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [Code]             NVARCHAR (50)  NULL,
    [UserName]         NVARCHAR (50)  NULL,
    [Pass]             NVARCHAR (50)  NULL,
    [FullName]         NVARCHAR (100) NULL,
    [Sex]              BIT            CONSTRAINT [DF_Mod_Product_Customers_Sex] DEFAULT ((1)) NULL,
    [Birthday]         DATE           NULL,
    [Address]          NVARCHAR (200) NULL,
    [Email]            NVARCHAR (50)  NULL,
    [PhoneNumber]      NVARCHAR (50)  NULL,
    [File]             NVARCHAR (200) NULL,
    [CreateDate]       DATETIME       NULL,
    [ModifiedDate]     DATETIME       NULL,
    [PointTotal]       INT            NULL,
    [DateRequestReset] DATETIME       NULL,
    [KeyReset]         NVARCHAR (50)  NULL,
    [DateReset]        DATETIME       NULL,
    [Reseted]          BIT            NULL,
    [Activity]         BIT            CONSTRAINT [DF_Mod_Product_Customers_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_Customers] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái: 0 : Không sử dụng | 1: Sử dụng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tính điểm cho khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers', @level2type = N'COLUMN', @level2name = N'PointTotal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ảnh khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers', @level2type = N'COLUMN', @level2name = N'File';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã khách hàng: Mặc định', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng thông tin khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers';

