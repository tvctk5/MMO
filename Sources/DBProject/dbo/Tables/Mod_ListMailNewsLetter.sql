CREATE TABLE [dbo].[Mod_ListMailNewsLetter] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50) NULL,
    [Email]          NVARCHAR (50) NULL,
    [Sex]            BIT           NULL,
    [IP]             NVARCHAR (50) NULL,
    [CodeRemoveList] NVARCHAR (50) NULL,
    [CreateDate]     DATETIME      NULL,
    [Activity]       BIT           NULL,
    CONSTRAINT [PK_ModListMailNewsLetter] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mã để remove emil khỏi list', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_ListMailNewsLetter', @level2type = N'COLUMN', @level2name = N'CodeRemoveList';

