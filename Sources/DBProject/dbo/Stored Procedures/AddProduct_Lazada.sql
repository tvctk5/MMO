
CREATE PROCEDURE [dbo].[AddProduct_Lazada]
	@XML NVARCHAR(MAX),
	@XML2 NVARCHAR(MAX),
	@MarketplaceId INT
AS
-- begin try

	declare 
			@XMLID						int,
			@XMLID2						int,
			@ParentId					int,
			@Code						nvarchar(200);

	DECLARE @TBL_CATEGORY TABLE (
									ID				INT,
									CategoryName	nvarchar(200),
									ParentID		INT
									);
	DECLARE @TBL_BRAND TABLE (
									ID				INT,
									BrandName	nvarchar(200)
									);

	INSERT INTO @TBL_CATEGORY(ID, CategoryName, ParentID) SELECT ID, DisplayName AS CategoryName, ParentID FROM Web_Menu;

	INSERT INTO @TBL_BRAND(ID, BrandName) SELECT ID, Name AS BrandName FROM Mod_Product_Manufacturer;

		set @XML				 = dbo.ufn_Replace_XmlChars(@XML);

		exec	sp_xml_preparedocument	@XMLID out, @XML

		set @XML2				 = dbo.ufn_Replace_XmlChars(@XML2);

		exec	sp_xml_preparedocument	@XMLID2 out, @XML2

		--print @XMLID

		if @XMLID <= 0
			return
		begin 

--			DECLARE @C_C_Category_LV1 nvarchar(200), @C_C_Category_LV2 nvarchar(200), @C_C_Category_LV3 nvarchar(200),
--					@C_C_Category_LV1_Code nvarchar(200), @C_C_Category_LV2_Code nvarchar(200), @C_C_Category_LV3_Code nvarchar(200),
--					@C_CategoryName nvarchar(200), @C_CategoryCode nvarchar(200);
----------------1. CREATE CATEGORY

--			-- 1.1: Create cusor
--			DECLARE category_cursor CURSOR LOCAL FOR
--				select DISTINCT
--				   Category_LV1					= 	  x.Category_LV1			
--				  ,Category_LV2					= 	  x.Category_LV2				
--				  ,Category_LV3					= 	  x.Category_LV3	
--				  ,Category_LV1_Code			= 	  x.Category_LV1_Code			
--				  ,Category_LV2_Code			= 	  x.Category_LV2_Code				
--				  ,Category_LV3_Code			= 	  x.Category_LV3_Code	
--				from openxml(@XMLID, '//CATEGORY', 2) 
--				with
--				(
--					Category_LV1			nvarchar(200)
--					,Category_LV2           nvarchar(200)
--					,Category_LV3			nvarchar(200)
--					,Category_LV1_Code		nvarchar(200)
--					,Category_LV2_Code		nvarchar(200)
--					,Category_LV3_Code		nvarchar(200)
--				) x

--			DECLARE @TBL_CREATE_CATEGORY TABLE (
--												CategoryName	nvarchar(200),
--												CategoryCode	nvarchar(200),
--												[Order]			INT
--												);
--			-- 1.2 Open
--			OPEN category_cursor
--			FETCH NEXT FROM category_cursor   
--			INTO @C_C_Category_LV1, @C_C_Category_LV2, @C_C_Category_LV3, @C_C_Category_LV1_Code, @C_C_Category_LV2_Code, @C_C_Category_LV3_Code

--			WHILE @@FETCH_STATUS = 0  
--			BEGIN
--				set @ParentId			= 0;

--				delete from @TBL_CREATE_CATEGORY;

--				-- INSERT TO TABLE
--				INSERT INTO @TBL_CREATE_CATEGORY(CategoryName, CategoryCode, [Order]) VALUES(@C_C_Category_LV1, @C_C_Category_LV1_Code, 1);
--				INSERT INTO @TBL_CREATE_CATEGORY(CategoryName, CategoryCode, [Order]) VALUES(@C_C_Category_LV2, @C_C_Category_LV2_Code, 2);
--				INSERT INTO @TBL_CREATE_CATEGORY(CategoryName, CategoryCode, [Order]) VALUES(@C_C_Category_LV3, @C_C_Category_LV3_Code, 3);

--				DECLARE category_create_cursor CURSOR LOCAL FOR
--																SELECT CategoryName, CategoryCode 
--																FROM @TBL_CREATE_CATEGORY
--																WHERE ISNULL(CategoryName, '') <> ''
--																ORDER BY [Order];

--				SET @ParentId			= 0;
--				-- 1.2.1 Open
--				OPEN category_create_cursor
--				FETCH NEXT FROM category_create_cursor   
--				INTO @C_CategoryName, @C_CategoryCode
--				WHILE @@FETCH_STATUS = 0  
--					BEGIN
					
--					DECLARE @ItemId_Temp int, @ParentType varchar(50), @ParentCode nvarchar(50);
					
--					-- GET ITEM ID
--					set @ItemId_Temp = (SELECT TOP 1 ISNULL(wm.ID, 0) FROM  Web_Menu wm WHERE UPPER(wm.DisplayName) = UPPER(@C_CategoryName) AND wm.MarketplaceId = @MarketplaceId AND (@ParentId = 0 OR (@ParentId <> 0 AND wm.ParentID = @ParentId)));
--					IF @ItemId_Temp IS NULL OR @ItemId_Temp <= 0
--						BEGIN
--							-- Check category
--							IF(@ParentId IS NULL OR @ParentId <=0)
--								BEGIN
--									set @ParentId = (SELECT TOP 1 ISNULL(wm.ID, 0) FROM  Web_Menu wm WHERE wm.IsParentMarketplace = 1 AND wm.MarketplaceId = @MarketplaceId);
--								END
--							-- end Check category	

--							-- get type
--							set @ParentType = (SELECT TOP 1 ISNULL(wm.[Type], 'Product') FROM  Web_Menu wm WHERE wm.ID = @ParentId);
--							-- get Parent Code
--							set @ParentCode = (SELECT TOP 1 ISNULL(wm.CurrentCode, '0') FROM  Web_Menu wm WHERE wm.ID = @ParentId);


--							-- CREATE CATEGORY
--							DECLARE @CURRENTCODE_MAX_BY_PARENT NVARCHAR(20);
--							SET @CURRENTCODE_MAX_BY_PARENT = [dbo].FN_GET_CATEGORY_CURRENTCODE(@ParentId);

--							-- Insert new category
--							INSERT INTO [dbo].[Web_Menu]
--									([LangID]
--									,[ParentID]
--									,[Name]
--									,[Code]
--									,[Type]
--									,[ParentCode]
--									,[CurrentCode]
--									,[Activity]
--									,[MarketplaceId]
--									,[IsParentMarketplace]
--									,[DisplayName])
--								VALUES
--									(1
--									,@ParentId
--									,@C_CategoryName
--									,@C_CategoryCode
--									,@ParentType
--									,@ParentCode
--									,@CURRENTCODE_MAX_BY_PARENT
--									,1
--									,@MarketplaceId
--									,0
--									,@C_CategoryName);;
--							SET @ItemId_Temp = @@IDENTITY;
--						END

--						-- INSERT TO TABLE
--						IF(NOT EXISTS(SELECT ID FROM @TBL_CATEGORY WHERE ID = @ItemId_Temp))
--							BEGIN
--								INSERT INTO @TBL_CATEGORY(ID, CategoryName, ParentID) VALUES(@ItemId_Temp, @C_CategoryName, @ParentId);
--							END

--						-- reset parent id 
--						SET @ParentId = @ItemId_Temp;

--						-- Get the next vendor.  
--						FETCH NEXT FROM category_create_cursor   
--						INTO @C_CategoryName, @C_CategoryCode
--					END   
--				CLOSE category_create_cursor;  
--				DEALLOCATE category_create_cursor;  
--				--- End cusor

--				-- Get the next vendor.  
--				FETCH NEXT FROM category_cursor   
--				INTO @C_C_Category_LV1, @C_C_Category_LV2, @C_C_Category_LV3, @C_C_Category_LV1_Code, @C_C_Category_LV2_Code, @C_C_Category_LV3_Code
--			END   
--			CLOSE category_cursor;  
--			DEALLOCATE category_cursor;  
--			--- End cusor

----------------END 1. CREATE CATEGORY

----------------2. CREATE BAND
--			DECLARE @C_BandName nvarchar(50);

--			-- 1.1: Create cusor
--			DECLARE band_cursor CURSOR LOCAL FOR
--				select DISTINCT
--				   Brand					= 	  x.Brand
--				from openxml(@XMLID, '//CATEGORY', 2) 
--				with
--				(
--					Brand					nvarchar(50)
--				) x

--				WHERE Brand IS NOT NULL AND ISNULL(Brand, '') <> ''

--			-- 1.2 Open
--			OPEN band_cursor
--			FETCH NEXT FROM band_cursor   
--			INTO @C_BandName

--			WHILE @@FETCH_STATUS = 0  
--			BEGIN
--					DECLARE @BandId_Temp int;
					
--					-- GET ITEM ID
--					set @BandId_Temp = (SELECT TOP 1 ISNULL(wm.ID, 0) FROM  Mod_Product_Manufacturer wm WHERE UPPER(wm.Name) = UPPER(@C_BandName));
--					IF @BandId_Temp IS NULL OR @BandId_Temp <= 0
--						BEGIN
--							INSERT INTO [dbo].[Mod_Product_Manufacturer]
--								   ([Code]
--								   ,[Name]
--								   ,[CreateDate]
--								   ,[Activity])
--							 VALUES
--								   (@C_BandName
--								   ,@C_BandName
--								   ,GETDATE()
--								   ,1);

--							SET @BandId_Temp = @@IDENTITY;
--						END

--						-- INSERT TO TABLE
--						IF(NOT EXISTS(SELECT ID FROM @TBL_BRAND WHERE ID = @BandId_Temp))
--							BEGIN
--								INSERT INTO @TBL_BRAND(ID, BrandName) VALUES(@BandId_Temp, @C_BandName);
--							END

--				-- Get the next vendor.  
--				FETCH NEXT FROM band_cursor   
--				INTO @C_BandName
--			END   
--			CLOSE band_cursor;  
--			DEALLOCATE band_cursor;  
--			--- End cusor

----------------END 2. CREATE BAND

---------------- 3. INSERT PRODUCT
--			-- DECLARE product_cursor CURSOR LOCAL FOR

--			-- 3.1. UPDATE
				
--				UPDATE mmo
--				SET [Name]						= x.Name
--				  ,[DisplayName]				= x.Name
--				  ,[PageTitle]					= x.PageTitle
--				  ,[SalePrice]					= x.SalePrice
--				  ,[DiscountedPrice]			= x.DiscountedPrice
--				  ,[DiscountedPercentage]		= x.DiscountedPercentage
--				  ,[DiscountedValue]			= x.DiscountedValue
--				  ,[CurrencyId]					= 1
--				  ,[Category_LV1]				= lv1.CategoryName
--				  ,[Category_LV2]				= lv2.CategoryName
--				  ,[Category_LV3]				= lv3.CategoryName
--				  ,[Category_LV1_Id]			= lv1.ID
--				  ,[Category_LV2_Id]			= lv2.ID
--				  ,[Category_LV3_Id]			= lv3.ID
--				  ,[CategoryPath]				= x.CategoryPath
--				  ,[Image1]						= x.Image1
--				  ,[Image2]						= x.Image2
--				  ,[Image3]						= x.Image3
--				  ,[Image4]						= x.Image4
--				  ,[Image5]						= x.Image5
--				  ,[Url]						= NULL
--				  ,[RedirectUrl]				= x.RedirectUrl
--				  ,[Brand]						= b.BrandName
--				  ,[BrandId]					= b.ID
--				  ,[Status]						= 1
--				  ,[MenuID]						= ISNULL(lv3.ID, ISNULL(lv2.ID, lv1.ID))
--				  ,[LangID]						= 1				
				 
--				FROM
--					(SELECT 
--						SKU						
--						,Name					
--						,SalePrice				
--						,DiscountedPrice        
--						,DiscountedPercentage	
--						,Category_LV1			
--						,Category_LV2           
--						,Category_LV3			
--						,Image1					
--						,Image2					
--						,Image3			        
--						,Image4				    
--						,Image5					
--						,RedirectUrl			
--						,Brand					
--						,CategoryPath			
--						,DiscountedValue		
--						,DisplayName			
--						,MarketplaceId			
--						,PageTitle				
--						,Category_LV1_Code		
--						,Category_LV2_Code		
--						,Category_LV3_Code		

--					from openxml(@XMLID, '//CATEGORY', 2) 
--					with
--					(
--						SKU						nvarchar(100)
--						,Name					nvarchar(500)
--						,SalePrice				decimal(18, 2)
--						,DiscountedPrice        decimal(18, 2)
--						,DiscountedPercentage	int
--						,Category_LV1			nvarchar(200)
--						,Category_LV2           nvarchar(200)
--						,Category_LV3			nvarchar(200)
--						,Image1					nvarchar(1024)
--						,Image2					nvarchar(1024)
--						,Image3			        nvarchar(1024)
--						,Image4				    nvarchar(1024)
--						,Image5					nvarchar(1024)
--						,RedirectUrl			nvarchar(2048)
--						,Brand					nvarchar(50)
--						,CategoryPath			nvarchar(1024)
--						,DiscountedValue		decimal(18, 2)
--						,DisplayName			nvarchar(500)
--						,MarketplaceId			int
--						,PageTitle				nvarchar(200)
--						,Category_LV1_Code		nvarchar(200)
--						,Category_LV2_Code		nvarchar(200)
--						,Category_LV3_Code		nvarchar(200)
--					) 
--					y) x INNER JOIN [MMO_Product] mmo ON UPPER(x.SKU) = UPPER(mmo.SKU) AND mmo.MarketplaceId = @MarketplaceId
--					JOIN @TBL_CATEGORY lv1 ON UPPER(lv1.CategoryName) = UPPER(x.Category_LV1)
--					LEFT JOIN @TBL_CATEGORY lv2 ON UPPER(lv2.CategoryName) = UPPER(x.Category_LV2) AND lv2.ParentID = lv1.ID
--					LEFT JOIN @TBL_CATEGORY lv3 ON UPPER(lv3.CategoryName) = UPPER(x.Category_LV3) AND lv3.ParentID = lv2.ID
--					LEFT JOIN @TBL_BRAND b ON x.Brand IS NOT NULL AND ISNULL(x.Brand, '') <> '' AND UPPER(b.BrandName) = UPPER(x.Brand)

			-- 3.1. INSERT

			INSERT INTO [dbo].[MMO_Product]
					   ([SKU]
					   ,[Name]
					   ,[DisplayName]
					   ,[PageTitle]
					   ,[SalePrice]
					   ,[DiscountedPrice]
					   ,[DiscountedPercentage]
					   ,[DiscountedValue]
					   ,[CurrencyId]
					   ,[Category_LV1]
					   ,[Category_LV2]
					   ,[Category_LV3]
					   ,[Category_LV1_Id]
					   ,[Category_LV2_Id]
					   ,[Category_LV3_Id]
					   ,[CategoryPath]
					   ,[Image1]
					   ,[Image2]
					   ,[Image3]
					   ,[Image4]
					   ,[Image5]
					   ,[Url]
					   ,[RedirectUrl]
					   ,[Brand]
					   ,[BrandId]
					   ,[Status]
					   ,[MenuID]
					   ,[LangID]
					   ,[UserId]
					   ,[MarketplaceId])

					SELECT DISTINCT
					   [SKU]					= x.SKU
					  ,[Name]					= x.Name
					  ,[DisplayName]			= x.Name
					  ,[PageTitle]				= x.PageTitle
					  ,[SalePrice]				= x.SalePrice
					  ,[DiscountedPrice]		= x.DiscountedPrice
					  ,[DiscountedPercentage]	= x.DiscountedPercentage
					  ,[DiscountedValue]		= x.DiscountedValue
					  ,[CurrencyId]				= 1
					  ,[Category_LV1]			= lv1.CategoryName
					  ,[Category_LV2]			= lv2.CategoryName
					  ,[Category_LV3]			= lv3.CategoryName
					  ,[Category_LV1_Id]		= lv1.ID
					  ,[Category_LV2_Id]		= lv2.ID
					  ,[Category_LV3_Id]		= lv3.ID
					  ,[CategoryPath]			= x.CategoryPath
					  ,[Image1]					= x.Image1
					  ,[Image2]					= x.Image2
					  ,[Image3]					= x.Image3
					  ,[Image4]					= x.Image4
					  ,[Image5]					= x.Image5
					  ,[Url]					= NULL
					  ,[RedirectUrl]			= x.RedirectUrl
					  ,[Brand]					= b.BrandName
					  ,[BrandId]				= b.ID
					  ,[Status]					= 1
					  ,[MenuID]					= ISNULL(lv3.ID, ISNULL(lv2.ID, lv1.ID))
					  ,[LangID]					= 1
					  ,[UserId]					= 1
					  ,[MarketplaceId] = @MarketplaceId
					 FROM
						(SELECT 
							ISNULL(z.SKU,y.SKU)											SKU
							,ISNULL(z.Name,y.Name)										Name				
							,ISNULL(z.SalePrice,y.SalePrice)							SalePrice			
							,ISNULL(z.DiscountedPrice,y.DiscountedPrice)				DiscountedPrice    
							,ISNULL(z.DiscountedPercentage,y.DiscountedPercentage)		DiscountedPercentage
							,ISNULL(z.Category_LV1,y.Category_LV1)						Category_LV1	
							,ISNULL(z.Category_LV2,y.Category_LV2)						Category_LV2    
							,ISNULL(z.Category_LV3,y.Category_LV3)						Category_LV3
							,ISNULL(z.Image1,y.Image1)									Image1		
							,ISNULL(z.Image2,y.Image2)									Image2		
							,ISNULL(z.Image3,y.Image3)									Image3   
							,ISNULL(z.Image4,y.Image4)									Image4   
							,ISNULL(z.Image5,y.Image5)									Image5	
							,ISNULL(z.RedirectUrl,y.RedirectUrl)						RedirectUrl		
							,ISNULL(z.Brand,y.Brand)									Brand
							,ISNULL(z.CategoryPath,y.CategoryPath)						CategoryPath
							,ISNULL(z.DiscountedValue,y.DiscountedValue)				DiscountedValue	
							,ISNULL(z.DisplayName,y.DisplayName)						DisplayName
							,ISNULL(z.MarketplaceId,y.MarketplaceId)					MarketplaceId	
							,ISNULL(z.PageTitle,y.PageTitle)							PageTitle	
							,ISNULL(z.Category_LV1_Code,y.Category_LV1_Code)			Category_LV1_Code	
							,ISNULL(z.Category_LV2_Code,y.Category_LV2_Code)			Category_LV2_Code	
							,ISNULL(z.Category_LV3_Code,y.Category_LV3_Code)			Category_LV3_Code

						from openxml(@XMLID, '//PRODUCT', 2) 
						with
						(
							SKU						nvarchar(100)
							,Name					nvarchar(500)
							,SalePrice				decimal(18, 2)
							,DiscountedPrice        decimal(18, 2)
							,DiscountedPercentage	int
							,Category_LV1			nvarchar(200)
							,Category_LV2           nvarchar(200)
							,Category_LV3			nvarchar(200)
							,Image1					nvarchar(1024)
							,Image2					nvarchar(1024)
							,Image3			        nvarchar(1024)
							,Image4				    nvarchar(1024)
							,Image5					nvarchar(1024)
							,RedirectUrl			nvarchar(2048)
							,Brand					nvarchar(50)
							,CategoryPath			nvarchar(1024)
							,DiscountedValue		decimal(18, 2)
							,DisplayName			nvarchar(500)
							,MarketplaceId			int
							,PageTitle				nvarchar(200)
							,Category_LV1_Code		nvarchar(200)
							,Category_LV2_Code		nvarchar(200)
							,Category_LV3_Code		nvarchar(200)
						) y
						left join 
						(
						SELECT *
						from openxml(@XMLID2, '//PRODUCT', 2) 
						with
						(
							SKU						nvarchar(100)
							,Name					nvarchar(500)
							,SalePrice				decimal(18, 2)
							,DiscountedPrice        decimal(18, 2)
							,DiscountedPercentage	int
							,Category_LV1			nvarchar(200)
							,Category_LV2           nvarchar(200)
							,Category_LV3			nvarchar(200)
							,Image1					nvarchar(1024)
							,Image2					nvarchar(1024)
							,Image3			        nvarchar(1024)
							,Image4				    nvarchar(1024)
							,Image5					nvarchar(1024)
							,RedirectUrl			nvarchar(2048)
							,Brand					nvarchar(50)
							,CategoryPath			nvarchar(1024)
							,DiscountedValue		decimal(18, 2)
							,DisplayName			nvarchar(500)
							,MarketplaceId			int
							,PageTitle				nvarchar(200)
							,Category_LV1_Code		nvarchar(200)
							,Category_LV2_Code		nvarchar(200)
							,Category_LV3_Code		nvarchar(200)
						)
						) z on z.SKU = y.SKU

						WHERE y.SKU NOT IN (SELECT SKU FROM MMO_Product WHERE MarketplaceId = @MarketplaceId)
					) x
					JOIN @TBL_CATEGORY lv1 ON UPPER(lv1.CategoryName) = UPPER(x.Category_LV1)
					LEFT JOIN @TBL_CATEGORY lv2 ON UPPER(lv2.CategoryName) = UPPER(x.Category_LV2) AND lv2.ParentID = lv1.ID
					LEFT JOIN @TBL_CATEGORY lv3 ON UPPER(lv3.CategoryName) = UPPER(x.Category_LV3) AND lv3.ParentID = lv2.ID
					LEFT JOIN @TBL_BRAND b ON x.Brand IS NOT NULL AND ISNULL(x.Brand, '') <> '' AND UPPER(b.BrandName) = UPPER(x.Brand)


--------------END 3. INSERT PRODUCT
			
		exec sp_xml_removedocument @XMLID;
		exec sp_xml_removedocument @XMLID2;
		return 1;
	end
--end try


--begin catch
		
	----if @@trancount > 0
	--	--rollback tran import_orders

	--declare	@ErrorNum			int,
	--		@ErrorMsg			varchar(200),
	--		@ErrorProc			varchar(50),
	--		@SessionID			bigint,
	--		@AddlInfo			varchar(500)

	--set @ErrorNum				= error_number()
	--set @ErrorMsg				= 'ren_Insert_Order: ' + error_message()
	--set @ErrorProc				= error_procedure()
	--set @AddlInfo				= @XML
		
	--print @ErrorMsg

	--exec utl_Insert_ErrorLog @ErrorNum, @ErrorMsg, @ErrorProc, 'ren_Order', 'ADD', @SessionID, @AddlInfo

--end catch