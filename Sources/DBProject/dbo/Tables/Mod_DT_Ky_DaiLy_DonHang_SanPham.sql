CREATE TABLE [dbo].[Mod_DT_Ky_DaiLy_DonHang_SanPham] (
    [ID]                    INT        IDENTITY (1, 1) NOT NULL,
    [ModDtKyId]             INT        NULL,
    [ModDTKyDaiLyId]        INT        NULL,
    [ModDTKyDaiLyDonHangId] INT        NULL,
    [ModProductId]          INT        NULL,
    [SoLuong]               INT        NULL,
    [DonGia]                FLOAT (53) NULL,
    [ChietKhau]             FLOAT (53) NULL,
    [TongTien]              FLOAT (53) NULL,
    [TongSauGiam]           FLOAT (53) NULL,
    CONSTRAINT [PK_Mod_DT_Ky_DaiLy_DonHang_SanPham] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_DonHang_SanPham_Mod_DT_Ky_DaiLy_DonHang1] FOREIGN KEY ([ModDTKyDaiLyDonHangId]) REFERENCES [dbo].[Mod_DT_Ky_DaiLy_DonHang] ([ID]),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_DonHang_SanPham_Mod_Product_Info] FOREIGN KEY ([ModProductId]) REFERENCES [dbo].[Mod_Product_Info] ([ID])
);

