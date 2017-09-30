CREATE TABLE [dbo].[Mod_Product_Order] (
    [ID]                    INT            IDENTITY (1, 1) NOT NULL,
    [TransportId]           INT            NULL,
    [PaymentId]             INT            NULL,
    [CustomersCode]         NVARCHAR (50)  NULL,
    [CustomersId]           INT            NULL,
    [UserId]                INT            NULL,
    [UserModifiedId]        INT            NULL,
    [IP]                    NVARCHAR (50)  NULL,
    [Code]                  NVARCHAR (50)  NULL,
    [QuantityProduct]       INT            NULL,
    [QuantityTotal]         INT            NULL,
    [Discount]              FLOAT (53)     CONSTRAINT [DF_Mod_Product_Order_Discount] DEFAULT ((0)) NULL,
    [TotalFriceFirst]       FLOAT (53)     NULL,
    [TotalFrice]            FLOAT (53)     NULL,
    [Note]                  NVARCHAR (500) NULL,
    [Status]                INT            NULL,
    [NguoiDat_FullName]     NVARCHAR (100) NULL,
    [NguoiDat_Sex]          BIT            CONSTRAINT [DF_Mod_Product_Order_Sex] DEFAULT ((1)) NULL,
    [NguoiDat_Address]      NVARCHAR (200) NULL,
    [NguoiDat_Email]        NVARCHAR (50)  NULL,
    [NguoiDat_PhoneNumber]  NVARCHAR (50)  NULL,
    [NguoiNhan_FullName]    NVARCHAR (100) NULL,
    [NguoiNhan_Sex]         BIT            CONSTRAINT [DF_Mod_Product_Order_Sex_1] DEFAULT ((1)) NULL,
    [NguoiNhan_Address]     NVARCHAR (200) NULL,
    [NguoiNhan_Email]       NVARCHAR (50)  NULL,
    [NguoiNhan_PhoneNumber] NVARCHAR (50)  NULL,
    [CreateDate]            DATETIME       NULL,
    [ModifiedDate]          DATETIME       NULL,
    CONSTRAINT [PK_Mod_Product_Order] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Order_Mod_Product_Payment] FOREIGN KEY ([PaymentId]) REFERENCES [dbo].[Mod_Product_Payment] ([ID]),
    CONSTRAINT [FK_Mod_Product_Order_Mod_Product_Transport] FOREIGN KEY ([TransportId]) REFERENCES [dbo].[Mod_Product_Transport] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày sửa cuối', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'ModifiedDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Mới | 1: Đã duyệt | 2: Hoàn thành | 3: Từ chối', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ghi chú', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'Note';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng tiền cho đơn hàng này (Đã trừ giảm Discount)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'TotalFrice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng tiền cho đơn hàng này (Chưa trừ giảm Discount)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'TotalFriceFirst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số tiền giảm cho cả đơn hàng: Có thể là giảm khi đặt hàng online', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'Discount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng số các sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'QuantityTotal';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số loại sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'QuantityProduct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã hóa đơn - số hóa đơn', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID người quản trị sửa cuối cùng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'UserModifiedId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID người quản trị', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã Khách hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'CustomersCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hình thức thanh toán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'PaymentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hình thức vận chuyển ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order', @level2type = N'COLUMN', @level2name = N'TransportId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảng chứa những danh sách đặt hàng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Order';

