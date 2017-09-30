CREATE TABLE [dbo].[Mod_District] (
    [ID]               INT            NOT NULL,
    [ModProvinceId]    INT            NULL,
    [Code]             NVARCHAR (50)  NULL,
    [Name]             NVARCHAR (200) NULL,
    [Type]             NVARCHAR (50)  NULL,
    [FullName]         NVARCHAR (50)  NULL,
    [ProvinceFullName] NVARCHAR (50)  NULL,
    [Location]         NVARCHAR (50)  NULL,
    [Activity]         BIT            CONSTRAINT [DF_Mod_District_Activity] DEFAULT ((1)) NULL,
    [CreateDate]       DATETIME       CONSTRAINT [DF_Mod_District_CreateDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Mod_District] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Mod_District_Mod_Province] FOREIGN KEY ([ModProvinceId]) REFERENCES [dbo].[Mod_Province] ([ID])
);

