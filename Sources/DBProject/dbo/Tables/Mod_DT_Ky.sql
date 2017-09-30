CREATE TABLE [dbo].[Mod_DT_Ky] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [StartDate]  DATETIME       CONSTRAINT [DF_Mod_DT_Ky_StartDate] DEFAULT (getdate()) NULL,
    [FinishDate] DATETIME       NULL,
    [TotalFirst] FLOAT (53)     NULL,
    [TotalLast]  FLOAT (53)     NULL,
    [Activity]   BIT            CONSTRAINT [DF_Mod_DT_Ky_Activity] DEFAULT ((1)) NULL,
    [UpdateDate] DATETIME       CONSTRAINT [DF_Mod_DT_Ky_CreateDate1] DEFAULT (getdate()) NULL,
    [CreateDate] DATETIME       CONSTRAINT [DF_Mod_DT_Ky_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_DT_Ky] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng sau kỳ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky', @level2type = N'COLUMN', @level2name = N'TotalLast';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tổng trước kỳ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky', @level2type = N'COLUMN', @level2name = N'TotalFirst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Kỳ Doanh thu của các đại lý', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_DT_Ky';

