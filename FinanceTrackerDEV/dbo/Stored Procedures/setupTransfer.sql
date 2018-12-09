CREATE PROCEDURE [dbo].[setupTransfer] @fromAccount as int, @toAccount as int ,@Amount as numeric(18,2), @transferDate as date, @comment as varchar(2000) = null
AS
BEGIN

	DECLARE @fromTrID as int
	DECLARE @toTrID as int
	DECLARE @fromAccLoc as int
	DECLARE @toAccLoc as int


	set @fromAccLoc = (Select location_id from tblAccount where account_id = @fromAccount)
	set @toAccLoc = (Select location_id from tblAccount where account_id = @toAccount)

	--from
	insert into tblTransaction
	(transaction_date, transaction_amount, category_id, location_id, account_id, added_on, comments)
	Select @transferDate, @Amount * (-1), 10, @toAccLoc, @fromAccount, GETDATE(), @comment

	set @fromTrID = (Select IDENT_CURRENT('tblTransaction'))

	--to
	insert into tblTransaction
	(transaction_date, transaction_amount, category_id, location_id, account_id, added_on, comments)
	Select @transferDate, @Amount, 10, @fromAccLoc, @toAccount, GETDATE(), @comment

	set @toTrID = (Select IDENT_CURRENT('tblTransaction'))

	update tblTransaction
	set linked_transaction_id = @fromTrID
	where transaction_id = @toTrID

	update tblTransaction
	set linked_transaction_id = @toTrID
	where transaction_id = @fromTrID

END
