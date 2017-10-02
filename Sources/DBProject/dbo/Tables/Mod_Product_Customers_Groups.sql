CREATE TABLE [dbo].[Mod_Product_Customers_Groups] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [CustomersGroupsId] INT      NULL,
    [CustomersId]       INT      NOT NULL,
    [CreateDate]        DATETIME NULL,
    [Activity]          BIT      CONSTRAINT [DF_Mod_Product_Customers_Groups_Activity] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_Mod_Product_Customers_Groups] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_Product_Customers_Groups_Mod_Product_Customers] FOREIGN KEY ([CustomersId]) REFERENCES [dbo].[Mod_Product_Customers] ([ID]),
    CONSTRAINT [FK_Mod_Product_Customers_Groups_Mod_Product_CustomersGroups] FOREIGN KEY ([CustomersGroupsId]) REFERENCES [dbo].[Mod_Product_CustomersGroups] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Trạng thái: 0 : Không sử dụng | 1: Sử dụng', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers_Groups', @level2type = N'COLUMN', @level2name = N'Activity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Khách hàng Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers_Groups', @level2type = N'COLUMN', @level2name = N'CustomersId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nhóm khách hàng Id', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Mod_Product_Customers_Groups', @level2type = N'COLUMN', @level2name = N'CustomersGroupsId';

