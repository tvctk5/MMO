CREATE TABLE [dbo].[Mod_Parameters] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (50)  NULL,
    [Name]        NVARCHAR (100) NULL,
    [Description] NVARCHAR (500) NULL,
    [Value]       NVARCHAR (500) NULL,
    [Type]        INT            NULL,
    [Order]       INT            NULL,
    [CreateDate]  DATETIME       NULL,
    [Modified]    DATETIME       NULL,
    CONSTRAINT [PK_CP_Parameters] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Text | 1: Password | 2: Bit', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Parameters', @level2type = N'COLUMN', @level2name = N'Type';

