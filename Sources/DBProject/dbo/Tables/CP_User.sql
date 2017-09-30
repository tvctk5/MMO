CREATE TABLE [dbo].[CP_User] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [LoginName] VARCHAR (50)   NULL,
    [Password]  VARCHAR (50)   NULL,
    [Name]      NVARCHAR (50)  NULL,
    [Address]   NVARCHAR (100) NULL,
    [Phone]     NVARCHAR (50)  NULL,
    [Email]     NVARCHAR (100) NULL,
    [Activity]  BIT            NULL,
    CONSTRAINT [PK_T_USER] PRIMARY KEY CLUSTERED ([ID] ASC)
);

