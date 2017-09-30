CREATE TABLE [dbo].[Mod_Feedback] (
    [ID]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (50)  NULL,
    [Address] NVARCHAR (100) NULL,
    [Phone]   VARCHAR (50)   NULL,
    [Mobile]  VARCHAR (50)   NULL,
    [Email]   VARCHAR (100)  NULL,
    [Title]   NVARCHAR (100) NULL,
    [Content] NTEXT          NULL,
    [IP]      VARCHAR (50)   NULL,
    [Created] DATETIME       NULL,
    CONSTRAINT [PK_T_FEEDBACK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

