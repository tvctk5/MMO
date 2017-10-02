CREATE TABLE [dbo].[Web_Setting] (
    [ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]  NVARCHAR (50) NULL,
    [Code]  VARCHAR (50)  NULL,
    [Value] NVARCHAR (50) NULL,
    CONSTRAINT [PK_T_SETTING] PRIMARY KEY CLUSTERED ([ID] ASC)
);

