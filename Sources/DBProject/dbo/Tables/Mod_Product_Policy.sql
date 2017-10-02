CREATE TABLE [dbo].[Mod_Product_Policy] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (250) NULL,
    [Priority]    BIT            NULL,
    [StartDate]   DATETIME       NULL,
    [FinishDate]  DATETIME       NULL,
    [Type]        INT            NULL,
    [Status]      INT            NULL,
    [Value]       FLOAT (53)     NULL,
    [Discription] NVARCHAR (250) NULL,
    [Content]     NVARCHAR (250) NULL,
    [CreateDate]  DATETIME       NULL,
    CONSTRAINT [PK_Mod_Product_Policy] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nội dung tặng quà : Nếu Type là 2', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Content';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mô tả về khuyến mãi giảm giá và giảm %', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Discription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá trị giảm tiền hoặc % giảm: Nếu Type là 0; 1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Không sử dụng | 1: Sử dụng | 2: Đã hết hạn', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại chính sách: 0: Giảm tiền | 1: Giảm % | 2: Nội dung tặng quà', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày kết thúc', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'FinishDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày bắt đầu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'StartDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có ưu tiên hay không: 1: Ưu tiên | 0: Không ưu tiên ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Priority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên chính sách', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng chính sách cho tài liệu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Policy';

