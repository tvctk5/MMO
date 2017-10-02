CREATE TABLE [dbo].[CP_Role] (
    [ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]  NVARCHAR (50) NULL,
    [Code]  VARCHAR (50)  NULL,
    [Lock]  BIT           NULL,
    [Order] INT           NULL,
    CONSTRAINT [PK_T_ROLE] PRIMARY KEY CLUSTERED ([ID] ASC)
);

