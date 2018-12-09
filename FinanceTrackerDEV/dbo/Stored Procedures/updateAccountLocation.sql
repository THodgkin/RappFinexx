CREATE PROCEDURE [dbo].[updateAccountLocation] @accountid AS int
AS
BEGIN
	
	UPDATE t1
	SET location_name = account_name
	FROM tblLocation t1
	INNER JOIN tblAccount t2 on t1.location_id = t2.location_id
	WHERE t2.account_id = @accountid

END
