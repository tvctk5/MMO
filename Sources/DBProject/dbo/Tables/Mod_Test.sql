CREATE TABLE [dbo].[Mod_Test] (
    [ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Column1] NVARCHAR (50) NULL,
    [Column2] NTEXT         NULL,
    CONSTRAINT [PK_Mod_Test] PRIMARY KEY CLUSTERED ([ID] ASC)
);

