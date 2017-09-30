CREATE TABLE [dbo].[Sys_Template] (
    [ID]         INT            NOT NULL,
    [LangID]     INT            NULL,
    [Name]       NVARCHAR (50)  NULL,
    [File]       VARCHAR (50)   NULL,
    [Custom]     NTEXT          NULL,
    [Order]      INT            NULL,
    [CssFile]    NVARCHAR (MAX) NULL,
    [JsFile]     NVARCHAR (MAX) NULL,
    [CssContent] NVARCHAR (MAX) NULL,
    [JsContent]  NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_T_TEMPLATE] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_TEMPLATE_T_LANG] FOREIGN KEY ([LangID]) REFERENCES [dbo].[Sys_Lang] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[Sys_Template] NOCHECK CONSTRAINT [FK_T_TEMPLATE_T_LANG];

