--from tblTransaction
--where location_id = 64


--Select sum(transaction_amount)
--, datename(year,transaction_date) + '-' + RIGHT('0' + RTRIM(MONTH(transaction_date)), 2)
--FROM tblTransaction
--WHERE category_id = 4
--GROUP BY datename(year,transaction_date) + '-' + RIGHT('0' + RTRIM(MONTH(transaction_date)), 2)
--ORDER BY datename(year,transaction_date) + '-' + RIGHT('0' + RTRIM(MONTH(transaction_date)), 2)


--Select t1.category_id
--From tbltransaction t1 join tblcategory t2 on t1.category_id = t2.category_id
--where category_name = 'employer contribution'


CREATE PROCEDURE [dbo].[YearlyReturnOnInvestment] @Account as varchar(250), @Begin_date as date, @End_date as date
AS
BEGIN




	DECLARE @beginning_balance as decimal(10,2)
	DECLARE @ending_balance as decimal(10,2)
	DECLARE @interest as decimal(10,2)
	DECLARE @delta as decimal(10,2)
	DECLARE @contributions as decimal(10,2)
	DECLARE @accountType as int
	DECLARE @dayspassed as int

	set @dayspassed = (Select datediff(day,@begin_date,@end_date))

	set @accountType = (Select account_type from tblAccount where account_id = @Account)
	IF @accountType <> 4
	Begin
		Print 'This function only works on Asset accounts'
		Return
	End

	set @beginning_balance = (
		SELECT sum(t1.transaction_amount)
		FROM tblTransaction t1 join
		tblAccount t2 on t1.account_id = t2.account_id
		WHERE t2.account_id = (@Account)
		AND transaction_date < @begin_date
	)
	set @ending_balance = (
		SELECT sum(t1.transaction_amount)
		FROM tblTransaction t1 join
		tblAccount t2 on t1.account_id = t2.account_id
		WHERE t2.account_id in (@Account)
		AND transaction_date <= @end_date
	)

	set @delta = @beginning_balance - @ending_balance 
	set @interest = (
		Select sum(t1.transaction_amount)
		FROM tblTransaction t1 join
		tblAccount t2 on t1.account_id = t2.account_id
		WHERE t2.account_id = (@Account)
		AND transaction_date > @begin_date
		AND transaction_date <= @end_date
		AND t1.category_id = 14
		)

		Select @delta as delta
		, @interest as interest

		Select @dayspassed

END

