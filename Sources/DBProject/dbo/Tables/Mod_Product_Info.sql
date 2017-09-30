CREATE TABLE [dbo].[Mod_Product_Info] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [ManufacturerId]     INT             NULL,
    [MenuID]             INT             NULL,
    [LangID]             INT             NULL,
    [UserId]             INT             NULL,
    [Type]               INT             CONSTRAINT [DF_Mod_Product_Info_Type] DEFAULT ((0)) NULL,
    [PageTitle]          NVARCHAR (200)  NULL,
    [PageDescription]    NVARCHAR (500)  NULL,
    [PageKeywords]       NVARCHAR (500)  NULL,
    [SKU]                NVARCHAR (100)  NULL,
    [Code]               NVARCHAR (100)  NULL,
    [Name]               NVARCHAR (200)  NULL,
    [CountNumber]        INT             NULL,
    [PriceInput]         FLOAT (53)      NULL,
    [Price]              FLOAT (53)      NULL,
    [ShowPrice]          BIT             NULL,
    [SaleOff]            BIT             NULL,
    [SaleOffType]        BIT             NULL,
    [SaleOffValue]       FLOAT (53)      NULL,
    [PriceSale]          FLOAT (53)      NULL,
    [StartDate]          DATETIME        NULL,
    [FinishDate]         DATETIME        NULL,
    [PriceTextSaleView]  NVARCHAR (50)   NULL,
    [VAT]                BIT             CONSTRAINT [DF_Mod_Product_Info_VAT] DEFAULT ((1)) NULL,
    [ShowVAT]            BIT             NULL,
    [InfoBasic]          NVARCHAR (1000) NULL,
    [Gifts]              NVARCHAR (500)  NULL,
    [Promotion]          NVARCHAR (500)  NULL,
    [Policy]             NVARCHAR (500)  NULL,
    [InfoHighlight]      NVARCHAR (500)  NULL,
    [File]               NVARCHAR (200)  NULL,
    [Preview]            INT             NULL,
    [ShowPreview]        BIT             NULL,
    [BuyCount]           INT             NULL,
    [ShowBuyCount]       BIT             NULL,
    [CommentCount]       INT             NULL,
    [ShowCommentCount]   BIT             NULL,
    [ShowCallRequire]    BIT             CONSTRAINT [DF_Mod_Product_Info_ShowCallRequire] DEFAULT ((0)) NULL,
    [CallRequireCount]   INT             CONSTRAINT [DF_Mod_Product_Info_CallRequireCount] DEFAULT ((0)) NULL,
    [ShowLike]           BIT             CONSTRAINT [DF_Mod_Product_Info_ShowLike] DEFAULT ((0)) NULL,
    [LikeCount]          INT             CONSTRAINT [DF_Mod_Product_Info_LikeCount] DEFAULT ((0)) NULL,
    [Warranty]           NVARCHAR (200)  NULL,
    [Status]             BIT             NULL,
    [StatusNote]         NVARCHAR (200)  NULL,
    [ShowStatus]         BIT             NULL,
    [ShowIcon]           INT             CONSTRAINT [DF_Mod_Product_Info_ShowIcon] DEFAULT ((0)) NULL,
    [NewsPost]           NTEXT           NULL,
    [SizeInfo]           NTEXT           NULL,
    [ProductsConnection] NVARCHAR (200)  NULL,
    [ProductsAttach]     NVARCHAR (200)  NULL,
    [ProductType]        INT             CONSTRAINT [DF_Mod_Product_Info_ProductType] DEFAULT ((2)) NULL,
    [ProductFilterIds]   NVARCHAR (500)  NULL,
    [PostDate]           DATETIME        NULL,
    [RuntimeDateStart]   DATETIME        NULL,
    [RuntimeDateFinish]  DATETIME        NULL,
    [CreateDate]         DATETIME        NULL,
    [ModifiedDate]       DATETIME        NULL,
    [Activity]           BIT             CONSTRAINT [DF_Mod_Product_Info_Activity] DEFAULT ((1)) NULL,
    [Deleted]            BIT             CONSTRAINT [DF_Mod_Product_Info_Delete] DEFAULT ((0)) NULL,
    [DeleteDate]         DATETIME        CONSTRAINT [DF_Mod_Product_Info_DeleteDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_Product_Info] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Info_Mod_Product_Manufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Mod_Product_Manufacturer] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày xóa', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'DeleteDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0 : Chưa xóa | 1: Đã xóa', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Deleted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái: 0 : Không bán | 1: Bán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ModifiedDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'CreateDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày kết thúc đăng bán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'RuntimeDateFinish';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày bắt đầu đăng bán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'RuntimeDateStart';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày đăng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'PostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Danh sách các thuộc tính lọc ID: Cách nhau bằng dấu '',''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ProductFilterIds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Kiểu sản phẩm: 0: Dành cho Nam giới | 1: Dành cho Nữ giới | 2: Không xác định', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ProductType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Danh sách các sản phẩm bán kèm: Cách nhau bằng dấu '',''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ProductsAttach';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Danh sách các sản phẩm liên quan: Cách nhau bằng dấu '',''', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ProductsConnection';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thông tin chi tiết về kích thước Size', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'SizeInfo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bài viết giới thiệu', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'NewsPost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Không hiển thị | 1: New | 2: Hot | 3: Khuyến mại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowIcon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cho biết note sản phẩm mới bao nhiêu % hoặc cũ bao nhiêu %', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'StatusNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái hàng mới (true) | hàng cũ (false)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bảo hành tại đâu - thời gian', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Warranty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt mua', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'LikeCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Yêu cầu gọi điện khi mua (1: Yêu cầu | 0: không yêu cầu)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowLike';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt mua', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'CallRequireCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Yêu cầu gọi điện khi mua (1: Yêu cầu | 0: không yêu cầu)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowCallRequire';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị số lượt mua hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowCommentCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt mua', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'CommentCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị số lượt mua hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowBuyCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt mua', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'BuyCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị số lượt xem hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowPreview';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt xem', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Preview';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thông tin nổi bật khác', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'InfoHighlight';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thông tin khuyến mãi cho sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Promotion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Quà tặng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Gifts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Thông tin mô tả cơ bản cho sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'InfoBasic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số % giảm hoặc số tiền giảm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'PriceTextSaleView';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày kết thúc giảm giá', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'FinishDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày bắt đầu giảm giá', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'StartDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'True: Giảm theo % | False: Giảm theo tiền', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'SaleOffType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giảm giá True | Không giảm giá False', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'SaleOff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Có hiển thị giá hay không', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ShowPrice';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá bán', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Price';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Giá nhập', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'PriceInput';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'CountNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tên sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã sản phẩm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Sản phẩm thường | 1: Sản phẩm nhóm', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Người quản trị: Tạo, cập nhật', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'UserId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id Nhà sản xuất', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Info', @level2type = N'COLUMN', @level2name = N'ManufacturerId';

