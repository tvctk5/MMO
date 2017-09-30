CREATE TABLE [dbo].[Mod_Adv] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [MenuID]      INT             NULL,
    [Name]        NVARCHAR (100)  NULL,
    [AdvCode]     NVARCHAR (1000) NULL,
    [Description] NVARCHAR (1000) NULL,
    [File]        NVARCHAR (100)  NULL,
    [Width]       INT             NULL,
    [Height]      INT             NULL,
    [AddInTag]    NVARCHAR (100)  NULL,
    [URL]         NVARCHAR (100)  NULL,
    [Target]      VARCHAR (50)    NULL,
    [Order]       INT             NULL,
    [Activity]    BIT             NULL,
    CONSTRAINT [PK_T_ADV] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_ADV_T_MENU] FOREIGN KEY ([MenuID]) REFERENCES [dbo].[Web_Menu] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[Mod_Adv] NOCHECK CONSTRAINT [FK_T_ADV_T_MENU];

