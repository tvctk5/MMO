CREATE TABLE [dbo].[Mod_Country] (
    [ID]         INT            NOT NULL,
    [Code]       NVARCHAR (50)  NULL,
    [Name]       NVARCHAR (200) NULL,
    [Activity]   BIT            NULL,
    [CreateDate] DATETIME       NULL,
    CONSTRAINT [PK_Mod_Country] PRIMARY KEY CLUSTERED ([ID] ASC)
);

