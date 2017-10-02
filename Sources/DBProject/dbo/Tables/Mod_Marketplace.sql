CREATE TABLE [dbo].[Mod_Marketplace] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (200) NULL,
    [WebsiteLink] NVARCHAR (200) NULL,
    CONSTRAINT [PK_Mod_Marketplace] PRIMARY KEY CLUSTERED ([ID] ASC)
);

