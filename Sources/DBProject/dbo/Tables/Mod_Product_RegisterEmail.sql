CREATE TABLE [dbo].[Mod_Product_RegisterEmail] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [FullName]   NVARCHAR (200) NULL,
    [Sex]        INT            NULL,
    [Email]      NVARCHAR (50)  NULL,
    [Allow]      BIT            NULL,
    [CreateDate] DATETIME       NULL,
    CONSTRAINT [PK_Mod_Product_RegisterEmail] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Nam | 1: Nữ | 3: Khác', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_RegisterEmail', @level2type = N'COLUMN', @level2name = N'Sex';

