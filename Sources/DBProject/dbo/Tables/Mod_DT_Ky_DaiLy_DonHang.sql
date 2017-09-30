CREATE TABLE [dbo].[Mod_DT_Ky_DaiLy_DonHang] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [ModDtKyId]      INT            NULL,
    [ModDTKyDaiLyId] INT            NULL,
    [Code]           NVARCHAR (50)  NULL,
    [Name]           NVARCHAR (200) NULL,
    [NgayTao]        DATETIME       NULL,
    [ChietKhau]      FLOAT (53)     NULL,
    [TongSanPham]    INT            NULL,
    [TongTien]       FLOAT (53)     NULL,
    [TongSauGiam]    FLOAT (53)     NULL,
    [Activity]       BIT            CONSTRAINT [DF_Mod_DT_Ky_DaiLy_DonHang_Activity] DEFAULT ((1)) NULL,
    [CreateDate]     DATETIME       CONSTRAINT [DF_Mod_DT_Ky_DaiLy_DonHang_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_Ky_DaiLy_DonHang] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_DT_Ky_DaiLy_DonHang_Mod_DT_Ky_DaiLy] FOREIGN KEY ([ModDTKyDaiLyId]) REFERENCES [dbo].[Mod_DT_Ky_DaiLy] ([ID])
);

