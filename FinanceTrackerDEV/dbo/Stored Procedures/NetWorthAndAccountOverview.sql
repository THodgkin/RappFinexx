CREATE PROCEDURE [dbo].[NetWorthAndAccountOverview] @begin_date as date, @end_date as date AS
BEGIN
	TRUNCATE TABLE BalanceSheet

	SET @begin_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, @begin_date), 0)) --First day of previous month
	SET @end_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, @end_date), -1)) --Last Day of previous month


	INSERT INTO BalanceSheet (account_id, account_name, account_type_id, account_type, beginning_balance, ending_balance, change)

	SELECT ACC.account_id, 
	ACC.account_name, 
	ACC.account_type as account_type_id,
	ACTY.account_type, 
	coalesce(dbo.BeginAccountBalanceAsOfDate(@begin_date,Acc.account_id), 0) as beginning_balance, 
	coalesce(dbo.AccountBalanceAsOfDate(@end_date,Acc.account_id), 0) as ending_balance ,
	coalesce(dbo.AccountBalanceAsOfDate(@end_date,Acc.account_id), 0) - coalesce(dbo.BeginAccountBalanceAsOfDate(@begin_date,Acc.account_id),0) as change
	FROM  tblAccount ACC 
		LEFT JOIN tblAccount_Type ACTY on ACTY.id = ACC.account_type
	WHERE (dbo.BeginAccountBalanceAsOfDate(@begin_date, Acc.account_id) <> 0
			OR dbo.AccountBalanceAsOfDate(@end_date, Acc.account_id) <> 0 )
	Order by ACC.account_type, account_name

END
