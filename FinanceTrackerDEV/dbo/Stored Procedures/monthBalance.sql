CREATE PROCEDURE [dbo].[monthBalance] @account_id as int, @begin_date as date, @end_date as date
AS

BEGIN
	TRUNCATE TABLE tblBalancesAndDifference

 	SET @begin_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, @begin_date), 0)) --First day of month
	SET @end_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, @end_date), -1)) --Last Day of month 

	DECLARE @beginning_balance as numeric(9,2)
	DECLARE @ending_balance as numeric(9,2)
	DECLARE @balance_difference as numeric(9,2)

	set @beginning_balance = (
		 Select sum(transaction_amount) + avg(acc.opening_balance)
		 from tbltransaction TRA
		 join tblAccount ACC on TRA.account_id = ACC.account_id
		 where ACC.account_id = @account_id
		 and transaction_date < @begin_date
 )

 	set @ending_balance = (
		 Select sum(transaction_amount) + avg(acc.opening_balance)
		 from tbltransaction TRA
		 join tblAccount ACC on TRA.account_id = ACC.account_id
		 where ACC.account_id = @account_id
		 and transaction_date < @end_date
 )

	 set @balance_difference = (@ending_balance - @beginning_balance)

	 INSERT INTO tblBalancesAndDifference (ID, beginning_balance, ending_balance, balance_difference)
	 Select 1, @beginning_balance as beginning_balance, 
	 @ending_balance as ending_balance, 
	 @balance_difference as balance_difference

 END
