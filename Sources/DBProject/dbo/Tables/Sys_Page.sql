CREATE TABLE [dbo].[Sys_Page] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [TemplateID]      INT            NULL,
    [ModuleCode]      VARCHAR (50)   NULL,
    [LangID]          INT            NULL,
    [MenuID]          INT            NULL,
    [ParentID]        INT            NULL,
    [Name]            NVARCHAR (100) NULL,
    [Code]            VARCHAR (100)  NULL,
    [LinkTitle]       NVARCHAR (100) NULL,
    [PageTitle]       NVARCHAR (100) NULL,
    [PageDescription] NVARCHAR (500) NULL,
    [PageKeywords]    NVARCHAR (500) NULL,
    [Content]         NTEXT          NULL,
    [Custom]          NTEXT          NULL,
    [Order]           INT            NULL,
    [Activity]        BIT            NULL,
    [ViewInMenu]      BIT            CONSTRAINT [DF_Sys_Page_ViewInMenu] DEFAULT ((0)) NULL,
    [ViewInSiteMap]   BIT            CONSTRAINT [DF_Sys_Page_ViewInMenu1] DEFAULT ((0)) NULL,
    [ChangeCss]       BIT            CONSTRAINT [DF_Sys_Page_ViewInSiteMap1] DEFAULT ((0)) NULL,
    [CssFile]         NVARCHAR (MAX) NULL,
    [ChangeJs]        BIT            CONSTRAINT [DF_Sys_Page_ViewInSiteMap2] DEFAULT ((0)) NULL,
    [JsFile]          NVARCHAR (MAX) NULL,
    [CssContent]      NVARCHAR (MAX) NULL,
    [JsContent]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_T_PAGE] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_PAGE_T_LANG] FOREIGN KEY ([LangID]) REFERENCES [dbo].[Sys_Lang] ([ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_T_PAGE_T_MENU] FOREIGN KEY ([MenuID]) REFERENCES [dbo].[Web_Menu] ([ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_T_PAGE_T_TEMPLATE] FOREIGN KEY ([TemplateID]) REFERENCES [dbo].[Sys_Template] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_LANG];


GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_MENU];


GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_TEMPLATE];

