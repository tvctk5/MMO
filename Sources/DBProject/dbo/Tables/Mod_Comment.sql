CREATE TABLE [dbo].[Mod_Comment] (
    [ID]        INT             IDENTITY (1, 1) NOT NULL,
    [NewsID]    INT             NULL,
    [ReplyByID] INT             NULL,
    [Name]      NVARCHAR (50)   NULL,
    [Email]     VARCHAR (50)    NULL,
    [Content]   NVARCHAR (1000) NULL,
    [HasReply]  BIT             NULL,
    [IP]        VARCHAR (50)    NULL,
    [Created]   DATETIME        NULL,
    [Activity]  BIT             NULL,
    CONSTRAINT [PK_Mod_Comment] PRIMARY KEY CLUSTERED ([ID] ASC)
);

