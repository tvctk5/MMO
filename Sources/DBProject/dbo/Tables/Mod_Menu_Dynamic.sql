CREATE TABLE [dbo].[Mod_Menu_Dynamic] (
    [ID]            INT             IDENTITY (1, 1) NOT NULL,
    [ParentID]      INT             NULL,
    [ModMenuTypeID] INT             NULL,
    [LangID]        INT             NULL,
    [SysPageID]     INT             NULL,
    [Name]          NVARCHAR (200)  NULL,
    [Url]           NVARCHAR (500)  NULL,
    [IconUrl]       NVARCHAR (500)  NULL,
    [ShowPopup]     BIT             NULL,
    [Order]         INT             NULL,
    [Activity]      BIT             NULL,
    [CreateDate]    DATETIME        NULL,
    [CssIcon]       NVARCHAR (50)   NULL,
    [Code]          NVARCHAR (MAX)  NULL,
    [Description]   NVARCHAR (1024) NULL,
    CONSTRAINT [PK_Mod_Menu_Dynamic] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Menu_Dynamic_Mod_Menu_Type] FOREIGN KEY ([ModMenuTypeID]) REFERENCES [dbo].[Mod_Menu_Type] ([ID]),
    CONSTRAINT [FK_Mod_Menu_Dynamic_Sys_Lang] FOREIGN KEY ([LangID]) REFERENCES [dbo].[Sys_Lang] ([ID]),
    CONSTRAINT [FK_Mod_Menu_Dynamic_Sys_Page] FOREIGN KEY ([SysPageID]) REFERENCES [dbo].[Sys_Page] ([ID])
);

