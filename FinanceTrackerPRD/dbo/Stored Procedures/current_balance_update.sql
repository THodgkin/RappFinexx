Create procedure [dbo].[current_balance_update] as
begin

	declare @account_type_id int
	declare @account_type_limit int

	set @account_type_limit = (Select max(id) from tblAccount_Type)
	set @account_type_id  = 1

	While @account_type_id <= @account_type_limit

	BEGIN


	insert into tblAccount_Type_Balances
	(ACCOUNT_TYPE, balance, month_loaded)

	Select id, sum(account_balance),cast(getdate() as date)
	from
	(
	SELECT sum(transaction_amount)+t2.opening_balance as account_balance, account_name, t3.id
	FROM tblTransaction t1 
	JOIN tblAccount t2 on t1.account_id = t2.account_id
	JOIN tblAccount_type t3 on t2.account_type = t3.id
	WHERE cast(transaction_date as date) <= cast(getdate() as date)
	and t3.id = @account_type_id
	GROUP BY account_name, t3.id, t2.opening_balance

	) as overview
	group by id

	set @account_type_id = @account_type_id + 1

	END

END
--Select dbo.BOMONTH(getdate())
--Select dateadd(day,1,eomonth(getdate()))
