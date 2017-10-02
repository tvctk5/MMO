CREATE TABLE [dbo].[Mod_Product_Agent] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]       INT            NULL,
    [ModCountryId]   INT            NULL,
    [ModProvinceId]  INT            NULL,
    [ModDistrictId]  INT            NULL,
    [ModWardId]      INT            NULL,
    [ModLoaiDaiLyId] INT            NULL,
    [Code]           NVARCHAR (50)  NULL,
    [Name]           NVARCHAR (200) NULL,
    [Address]        NVARCHAR (200) NULL,
    [PhoneNumber]    NVARCHAR (50)  NULL,
    [CountryName]    NVARCHAR (50)  NULL,
    [CityName]       NVARCHAR (50)  NULL,
    [CreateDate]     DATETIME       NULL,
    [Activity]       BIT            CONSTRAINT [DF_Mod_Product_Agent_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_Agent] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Agent_Mod_Loai_DaiLy] FOREIGN KEY ([ModLoaiDaiLyId]) REFERENCES [dbo].[Mod_Loai_DaiLy] ([ID]),
    CONSTRAINT [FK_Mod_Product_Agent_Mod_Ward] FOREIGN KEY ([ModWardId]) REFERENCES [dbo].[Mod_Ward] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của  đại lý: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số điện thoại  đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'PhoneNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Địa chỉ  đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'Address';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thông tin các  đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Agent';

