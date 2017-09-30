-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION FN_CREATE_CATEGORY
(
	-- Add the parameters for the function here
	-- <@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
	@ParentId int,
	@DisplayName nvarchar(200),
	@Code nvarchar(200),
	@MarketplaceId int
)
RETURNS INT
AS
BEGIN

		DECLARE @ItemId_Temp int, @ParentType varchar(50), @ParentCode nvarchar(50), @QueryString nvarchar(2048), @ParmDefinition nvarchar(1024);
		-- Check category
		IF(@ParentId IS NULL OR @ParentId <=0)
			BEGIN
				set @ParentId = (SELECT TOP 1 ISNULL(wm.ID, 0) FROM  Web_Menu wm WHERE wm.IsParentMarketplace = 1 AND wm.MarketplaceId = @MarketplaceId);
			END
		-- end Check category

		-- get type
		set @ParentType = (SELECT TOP 1 ISNULL(wm.[Type], 'Product') FROM  Web_Menu wm WHERE wm.ID = @ParentId);
		-- get Parent Code
		set @ParentCode = (SELECT TOP 1 ISNULL(wm.CurrentCode, '0') FROM  Web_Menu wm WHERE wm.ID = @ParentId);
		
		-- GET ITEM ID
		set @ItemId_Temp = (SELECT TOP 1 ISNULL(wm.ID, 0) FROM  Web_Menu wm WHERE UPPER(wm.DisplayName) = UPPER(@DisplayName) AND wm.MarketplaceId = @MarketplaceId AND (@ParentId = 0 OR wm.ParentID = @ParentId));
		IF @ItemId_Temp IS NULL OR @ItemId_Temp <= 0
			BEGIN
				-- CREATE CATEGORY
				DECLARE @CURRENTCODE_MAX_BY_PARENT NVARCHAR(20);
				SET @CURRENTCODE_MAX_BY_PARENT = [dbo].FN_GET_CATEGORY_CURRENTCODE(@ParentId);

				-- Insert new category
				SET @QueryString = N'INSERT INTO [dbo].[Web_Menu]
					   ([LangID]
					   ,[ParentID]
					   ,[Name]
					   ,[Code]
					   ,[Type]
					   ,[ParentCode]
					   ,[CurrentCode]
					   ,[Activity]
					   ,[MarketplaceId]
					   ,[IsParentMarketplace]
					   ,[DisplayName])
				 VALUES
					   (1
					   ,@_ParentId
					   ,@_DisplayName
					   ,@_Code
					   ,@_ParentType
					   ,@_ParentCode
					   ,@_CURRENTCODE_MAX_BY_PARENT
					   ,1
					   ,@_MarketplaceId
					   ,0
					   ,@_DisplayName);';

				SET @ParmDefinition = N'@_ParentId int, @_DisplayName nvarchar(200), @_Code varchar(100), @_ParentType varchar(50), @_ParentCode nvarchar(50), @_CURRENTCODE_MAX_BY_PARENT nvarchar(50), @_MarketplaceId int';  

				EXEC sp_executesql @QueryString, @ParmDefinition, @_ParentId = @ParentId, @_DisplayName = @DisplayName, @_Code = @Code, @_ParentType = @ParentType, @_ParentCode = @ParentCode, @_CURRENTCODE_MAX_BY_PARENT = @CURRENTCODE_MAX_BY_PARENT, @_MarketplaceId = @MarketplaceId

				SET @ItemId_Temp = (SELECT MAX(ID) FROM  Web_Menu);
			END

		RETURN @ItemId_Temp;
END