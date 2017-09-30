CREATE TABLE [dbo].[Mod_Product_Policy_Details] (
    [ID]         INT      IDENTITY (1, 1) NOT NULL,
    [PolicyId]   INT      NULL,
    [ObjectId]   INT      NULL,
    [Type]       INT      NULL,
    [CreateDate] DATETIME NULL,
    CONSTRAINT [PK_Mod_Product_Policy_Details] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Policy_Details_Mod_Product_Policy] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Mod_Product_Policy] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_Details', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Kiểu đối tượng áp dụng: 0: Nhóm sản phẩm | 1: Nhà sản xuất', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_Details', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Đối tượng liên quan tới chính sách: Của nhóm sản phẩm hoặc hãng sản xuất', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_Details', @level2type = N'COLUMN', @level2name = N'ObjectId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Chính sách Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy_Details', @level2type = N'COLUMN', @level2name = N'PolicyId';

