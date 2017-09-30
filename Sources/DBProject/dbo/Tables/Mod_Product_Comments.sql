CREATE TABLE [dbo].[Mod_Product_Comments] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ProductInfoId] INT            NULL,
    [UserId]        INT            NULL,
    [CustomersId]   INT            NULL,
    [Name]          NVARCHAR (50)  NULL,
    [Address]       NVARCHAR (200) NULL,
    [PhoneNumber]   NVARCHAR (20)  NULL,
    [Email]         NVARCHAR (30)  NULL,
    [Content]       NVARCHAR (500) NULL,
    [Approved]      BIT            NULL,
    [CreateDate]    DATETIME       NULL,
    [ModifiedDate]  DATETIME       NULL,
    [Activity]      BIT            CONSTRAINT [DF_Mod_Product_Comments_Activity] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Mod_Product_Comments] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Comments_Mod_Product_Info] FOREIGN KEY ([ProductInfoId]) REFERENCES [dbo].[Mod_Product_Info] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái có được duyệt hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Khách hàng Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments', @level2type = N'COLUMN', @level2name = N'CustomersId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Người duyệt', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments', @level2type = N'COLUMN', @level2name = N'ProductInfoId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng góp ý, comment cho sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Comments';

