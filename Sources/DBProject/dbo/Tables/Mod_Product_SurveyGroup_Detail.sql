CREATE TABLE [dbo].[Mod_Product_SurveyGroup_Detail] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [SurveyGroupId] INT            NULL,
    [Code]          NVARCHAR (200) NULL,
    [Name]          NVARCHAR (200) NULL,
    [Vote]          INT            NULL,
    [Order]         INT            NULL,
    [Activity]      BIT            NULL,
    CONSTRAINT [PK_Mod_Product_SurveyGroup_Detail] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_SurveyGroup_Detail_Mod_Product_SurveyGroup_Detail] FOREIGN KEY ([SurveyGroupId]) REFERENCES [dbo].[Mod_Product_SurveyGroup] ([ID]) ON DELETE CASCADE
);

