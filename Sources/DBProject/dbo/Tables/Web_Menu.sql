CREATE TABLE [dbo].[Web_Menu] (
    [ID]                  INT             IDENTITY (1, 1) NOT NULL,
    [LangID]              INT             NULL,
    [ParentID]            INT             NULL,
    [ProductAreaId]       INT             NULL,
    [Name]                NVARCHAR (200)  NULL,
    [Code]                VARCHAR (100)   NULL,
    [Type]                VARCHAR (50)    NULL,
    [Custom]              NVARCHAR (1000) NULL,
    [Order]               INT             NULL,
    [ParentCode]          NVARCHAR (50)   NULL,
    [CurrentCode]         NVARCHAR (50)   NULL,
    [File]                NVARCHAR (200)  NULL,
    [Activity]            BIT             NULL,
    [CssIcon]             NVARCHAR (50)   NULL,
    [MarketplaceId]       INT             CONSTRAINT [DF_Web_Menu_MarketplaceId] DEFAULT ((0)) NULL,
    [IsParentMarketplace] BIT             CONSTRAINT [DF_Web_Menu_IsParentMarketplace] DEFAULT ((0)) NULL,
    [DisplayName]         NVARCHAR (200)  NULL,
    CONSTRAINT [PK_T_MENU] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_MENU_T_LANG] FOREIGN KEY ([LangID]) REFERENCES [dbo].[Sys_Lang] ([ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_Web_Menu_AreaId] FOREIGN KEY ([ProductAreaId]) REFERENCES [dbo].[Mod_Product_Area] ([ID])
);


GO
ALTER TABLE [dbo].[Web_Menu] NOCHECK CONSTRAINT [FK_T_MENU_T_LANG];




GO
ALTER TABLE [dbo].[Web_Menu] NOCHECK CONSTRAINT [FK_T_MENU_T_LANG];




GO
ALTER TABLE [dbo].[Web_Menu] NOCHECK CONSTRAINT [FK_T_MENU_T_LANG];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã phân cấp của item hiện tại', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Web_Menu', @level2type = N'COLUMN', @level2name = N'CurrentCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã phân cấp của cấp cha', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Web_Menu', @level2type = N'COLUMN', @level2name = N'ParentCode';

