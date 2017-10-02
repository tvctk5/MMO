CREATE TABLE [dbo].[CP_Access] (
    [RefCode] VARCHAR (50) NULL,
    [RoleID]  INT          NULL,
    [UserID]  INT          NULL,
    [Type]    VARCHAR (50) NULL,
    [Value]   INT          NULL,
    CONSTRAINT [FK_Sys.CP.Access_Sys.CP.User] FOREIGN KEY ([UserID]) REFERENCES [dbo].[CP_User] ([ID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_T_USER_ACCESS_T_ROLE] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[CP_Role] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[CP_Access] NOCHECK CONSTRAINT [FK_Sys.CP.Access_Sys.CP.User];


GO
ALTER TABLE [dbo].[CP_Access] NOCHECK CONSTRAINT [FK_T_USER_ACCESS_T_ROLE];

