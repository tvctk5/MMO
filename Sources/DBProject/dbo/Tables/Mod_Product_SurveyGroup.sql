CREATE TABLE [dbo].[Mod_Product_SurveyGroup] (
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (200) NULL,
    [Code]       NVARCHAR (200) NULL,
    [StartDate]  DATETIME       NULL,
    [FinishDate] DATETIME       NULL,
    [Type]       INT            CONSTRAINT [DF_Mod_Product_SurveyGroup_Type] DEFAULT ((0)) NULL,
    [CreateDate] DATETIME       NULL,
    [Activity]   BIT            NULL,
    CONSTRAINT [PK_Mod_Product_SurveyGroup] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: Radio | 1: Checkbox (Chọn 1 | Chọn nhiều)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_SurveyGroup', @level2type = N'COLUMN', @level2name = N'Type';

