CREATE TABLE [dbo].[Mod_ListMail_Group_Email] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [MailGroupId]  INT      NULL,
    [EmailId]      INT      NULL,
    [Status]       BIT      CONSTRAINT [DF_Mod_ListMail_Group_Email_Status] DEFAULT ((1)) NULL,
    [LastDateSent] DATETIME NULL,
    CONSTRAINT [PK_Mod_ListMail_Group_Email] PRIMARY KEY CLUSTERED ([ID] ASC)
);

