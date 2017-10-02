CREATE TABLE [dbo].[Mod_ListMail_Group] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (200) NULL,
    [Status]       BIT            CONSTRAINT [DF_Mod_ListMail_Group_Status] DEFAULT ((1)) NULL,
    [LastDateSent] DATETIME       NULL,
    CONSTRAINT [PK_Mod_ListMail_Group] PRIMARY KEY CLUSTERED ([ID] ASC)
);

