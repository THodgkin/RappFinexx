CREATE PROCEDURE [dbo].[assignCategoryIdAccount] 
AS

BEGIN

	DECLARE @accountid as int
	DECLARE @locationid as int

	SET @accountid = 
		(
			Select max(account_id) from tblAccount
		)

	INSERT INTO tblLocation(location_name, added_on)
	SELECT account_name, CURRENT_TIMESTAMP
	FROM tblAccount 
	WHERE account_id = @accountid

	SET @locationid = 
		(
			Select max(location_id) from tblLocation
		)

	UPDATE tblAccount
	SET location_id = @locationid
	where account_id = @accountid

END



