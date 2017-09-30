CREATE TABLE [dbo].[Mod_Menu_Type] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [CreateDate] DATETIME       NULL,
    CONSTRAINT [PK_Web_Menu_Type] PRIMARY KEY CLUSTERED ([ID] ASC)
);

