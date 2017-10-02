CREATE TABLE [dbo].[Mod_Province] (
    [ID]             INT            NOT NULL,
    [ModCountryId]   INT            CONSTRAINT [DF_Mod_Province_ModCountryId] DEFAULT ((281)) NULL,
    [Code]           NVARCHAR (50)  NULL,
    [Name]           NVARCHAR (200) NULL,
    [Type]           NVARCHAR (50)  NULL,
    [FullName]       NVARCHAR (200) NULL,
    [ModCountryName] NVARCHAR (50)  NULL,
    [Activity]       BIT            CONSTRAINT [DF_Mod_Province_Activity] DEFAULT ((1)) NULL,
    [CreateDate]     DATETIME       CONSTRAINT [DF_Mod_Province_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_Province] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Province_Mod_Country] FOREIGN KEY ([ModCountryId]) REFERENCES [dbo].[Mod_Country] ([ID])
);

