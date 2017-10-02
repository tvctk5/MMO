CREATE TABLE [dbo].[Mod_Ward] (
    [ID]               INT            NOT NULL,
    [ModDistrictId]    INT            NULL,
    [Code]             NVARCHAR (50)  NULL,
    [Name]             NVARCHAR (200) NULL,
    [Type]             NVARCHAR (50)  NULL,
    [FullName]         NVARCHAR (50)  NULL,
    [DistrictFullName] NVARCHAR (50)  NULL,
    [Location]         NVARCHAR (50)  NULL,
    [Activity]         BIT            CONSTRAINT [DF_Mod_Ward_Activity] DEFAULT ((1)) NULL,
    [CreateDate]       DATETIME       CONSTRAINT [DF_Mod_Ward_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_Ward] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Ward_Mod_District] FOREIGN KEY ([ModDistrictId]) REFERENCES [dbo].[Mod_District] ([ID])
);

