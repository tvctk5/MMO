-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[FN_GET_CATEGORY_CURRENTCODE]
(
	@ParentId int
)
RETURNS nvarchar(50)
AS
BEGIN

	DECLARE @CODE_MAX NVARCHAR(50);
	DECLARE @PARENT_CODE NVARCHAR(50);

	SET @PARENT_CODE = (SELECT TOP 1 wm.CurrentCode FROM Web_Menu wm WHERE wm.ID = @ParentId)
	SET @CODE_MAX = (SELECT TOP 1 ISNULL(wm.CurrentCode, '') FROM Web_Menu wm WHERE wm.ParentID = @ParentId ORDER BY wm.CurrentCode DESC);

	IF ISNULL(@CODE_MAX, '') = ''
		BEGIN
			SET @CODE_MAX = (@PARENT_CODE + '001');
		END
	ELSE
		BEGIN
			SET @CODE_MAX = SUBSTRING(@CODE_MAX, (LEN(@PARENT_CODE) + 1), 3);

			DECLARE @CODE_NUMBER INT;
			SET @CODE_NUMBER = (CAST(@CODE_MAX AS INT) + 1);
			SET @CODE_MAX = CAST(@CODE_NUMBER AS NVARCHAR(50));

			IF LEN(@CODE_MAX) = 1
				SET @CODE_MAX = '00' + @CODE_MAX;

			IF LEN(@CODE_MAX) = 2
				SET @CODE_MAX = '0' + @CODE_MAX;

			SET @CODE_MAX = @PARENT_CODE + @CODE_MAX;
		END

	-- Return the result of the function
	RETURN @CODE_MAX

END