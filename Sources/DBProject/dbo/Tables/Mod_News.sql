CREATE TABLE [dbo].[Mod_News] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [MenuID]          INT             NULL,
    [Type]            NVARCHAR (50)   NULL,
    [State]           INT             NULL,
    [SlideType]       INT             NULL,
    [Name]            NVARCHAR (100)  CONSTRAINT [DF_Mod_News_Name] DEFAULT ((0)) NULL,
    [Code]            VARCHAR (100)   NULL,
    [Summary]         NVARCHAR (1000) NULL,
    [Tags]            NVARCHAR (255)  NULL,
    [PageTitle]       NVARCHAR (100)  NULL,
    [PageDescription] NVARCHAR (500)  NULL,
    [PageKeywords]    NVARCHAR (500)  NULL,
    [Content]         NTEXT           NULL,
    [Custom]          NVARCHAR (1000) NULL,
    [File]            NVARCHAR (100)  NULL,
    [Published]       DATETIME        NULL,
    [Order]           INT             NULL,
    [CountViewed]     INT             NULL,
    [CountComment]    INT             NULL,
    [Activity]        BIT             NULL,
    [CssIcon]         NVARCHAR (50)   NULL,
    CONSTRAINT [PK_T_NEWS] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_T_NEWS_T_MENU] FOREIGN KEY ([MenuID]) REFERENCES [dbo].[Web_Menu] ([ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[Mod_News] NOCHECK CONSTRAINT [FK_T_NEWS_T_MENU];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Số lượt xem bài viết', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_News', @level2type = N'COLUMN', @level2name = N'CountViewed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại slide cho tin tức: 0: Không áp dụng | 1: Slide top | 2: Slide tin tức mới/ nổi bật', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_News', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Loại tin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_News', @level2type = N'COLUMN', @level2name = N'Type';

