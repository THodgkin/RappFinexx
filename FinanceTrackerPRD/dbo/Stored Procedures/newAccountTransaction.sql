CREATE PROCEDURE [dbo].[newAccountTransaction] @transaction_amount as numeric(18,2)
AS
BEGIN
	DECLARE @accountid as int
	DECLARE @locationid as int
	SET @accountid = (Select MAX(account_id) from tblAccount)
	SET @locationid = (Select MAX(location_id) from tblLocation)

	IF @transaction_amount <> 0 
	BEGIN

		INSERT INTO tblTransaction(transaction_date, transaction_amount, category_id, location_id, account_id)
		VALUES (cast(getdate() as date), @transaction_amount, 1, @locationid, @accountid)
	END
	
END