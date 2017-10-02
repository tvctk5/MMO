CREATE TABLE [dbo].[Sys_Site] (
    [ID]      INT             IDENTITY (1, 1) NOT NULL,
    [PageID]  INT             NULL,
    [LangID]  INT             NULL,
    [Name]    NVARCHAR (50)   NULL,
    [Code]    VARCHAR (50)    NULL,
    [Custom]  NVARCHAR (1000) NULL,
    [Default] BIT             NULL,
    [Order]   INT             NULL,
    CONSTRAINT [PK_T_APP] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_APP_T_PAGE] FOREIGN KEY ([PageID]) REFERENCES [dbo].[Sys_Page] ([ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_T_SITE_T_LANG] FOREIGN KEY ([LangID]) REFERENCES [dbo].[Sys_Lang] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[Sys_Site] NOCHECK CONSTRAINT [FK_T_APP_T_PAGE];


GO
ALTER TABLE [dbo].[Sys_Site] NOCHECK CONSTRAINT [FK_T_SITE_T_LANG];

