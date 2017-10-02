CREATE TABLE [dbo].[Mod_Chat_History] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [From_Name]     NVARCHAR (50)  NULL,
    [From_UserName] NVARCHAR (50)  NULL,
    [From_Id]       INT            NULL,
    [To_Name]       NVARCHAR (50)  NULL,
    [To_UserName]   NVARCHAR (50)  NULL,
    [To_Id]         INT            NULL,
    [Message]       NVARCHAR (MAX) NULL,
    [IP]            NVARCHAR (50)  NULL,
    [Activity]      BIT            NULL,
    [CreateDate]    DATETIME       NULL,
    CONSTRAINT [PK_Mod_Chat_History] PRIMARY KEY CLUSTERED ([ID] ASC)
);

