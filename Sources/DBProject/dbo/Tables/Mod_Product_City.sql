CREATE TABLE [dbo].[Mod_Product_City] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ProductNationalId] INT            NULL,
    [Code]              NVARCHAR (50)  NULL,
    [Name]              NVARCHAR (200) NULL,
    [CreateDate]        DATETIME       NULL,
    [Activity]          BIT            CONSTRAINT [DF_Mod_Product_City_Activity] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Mod_Product_City_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_City_Mod_Product_National] FOREIGN KEY ([ProductNationalId]) REFERENCES [dbo].[Mod_Product_National] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái của  đại lý: Có được sử dụng hay không (True: Sử dụng | False: Không sử dụng)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_City', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ngày tạo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_City', @level2type = N'COLUMN', @level2name = N'CreateDate';

