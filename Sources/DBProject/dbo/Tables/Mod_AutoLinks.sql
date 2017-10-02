CREATE TABLE [dbo].[Mod_AutoLinks] (
    [ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (100) NULL,
    [Title]    NVARCHAR (255) NULL,
    [Link]     VARCHAR (255)  NULL,
    [Created]  DATETIME       NULL,
    [Activity] BIT            NULL,
    CONSTRAINT [PK_Mod_AutoLinks] PRIMARY KEY CLUSTERED ([ID] ASC)
);

