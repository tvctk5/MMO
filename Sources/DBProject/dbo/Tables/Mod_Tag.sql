CREATE TABLE [dbo].[Mod_Tag] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (255)  NULL,
    [Code]        VARCHAR (255)   NULL,
    [Title]       NVARCHAR (255)  NULL,
    [Keywords]    NVARCHAR (1000) NULL,
    [Description] NVARCHAR (1000) NULL
);

