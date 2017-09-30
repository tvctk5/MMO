CREATE TABLE [dbo].[Mod_Product_Office] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ProductCityId] INT            NULL,
    [Code]          NVARCHAR (50)  NULL,
    [Name]          NVARCHAR (200) NULL,
    [Address]       NVARCHAR (50)  NULL,
    [PhoneNumber]   NVARCHAR (50)  NULL,
    [CreateDate]    DATETIME       NULL,
    [Activity]      BIT            CONSTRAINT [DF_Mod_Product_Office_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_Office] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Office_Mod_Product_City] FOREIGN KEY ([ProductCityId]) REFERENCES [dbo].[Mod_Product_City] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của  đại lý: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Office', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Office', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số điện thoại  đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Office', @level2type = N'COLUMN', @level2name = N'PhoneNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Địa chỉ  đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Office', @level2type = N'COLUMN', @level2name = N'Address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cho biết văn phòng này nằm ở tỉnh nào', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Office', @level2type = N'COLUMN', @level2name = N'ProductCityId';

