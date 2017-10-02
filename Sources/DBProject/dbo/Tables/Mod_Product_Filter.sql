CREATE TABLE [dbo].[Mod_Product_Filter] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [FilterGroupsId] INT            NULL,
    [Value]          NVARCHAR (50)  NULL,
    [Note]           NVARCHAR (200) NULL,
    [File]           NVARCHAR (500) NULL,
    [Order]          INT            NULL,
    [Activity]       BIT            CONSTRAINT [DF_Mod_Product_Filter_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_Filter] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Filter_Mod_Product_FilterGroups] FOREIGN KEY ([FilterGroupsId]) REFERENCES [dbo].[Mod_Product_FilterGroups] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của nhóm: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Filter', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id Nhóm thuộc tính lọc ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Filter', @level2type = N'COLUMN', @level2name = N'FilterGroupsId';

