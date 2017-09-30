CREATE TABLE [dbo].[CP_UserLog] (
    [ID]      INT            IDENTITY (1, 1) NOT NULL,
    [UserID]  INT            NULL,
    [IP]      VARCHAR (50)   NULL,
    [Note]    NVARCHAR (100) NULL,
    [Created] DATETIME       NULL,
    CONSTRAINT [PK_T_USER_LOG] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Sys.CP.UserLog_Sys.CP.User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[CP_User] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[CP_UserLog] NOCHECK CONSTRAINT [FK_Sys.CP.UserLog_Sys.CP.User];

