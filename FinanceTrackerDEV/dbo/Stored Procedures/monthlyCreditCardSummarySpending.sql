CREATE PROCEDURE [dbo].[monthlyCreditCardSummarySpending] @account_id AS int, @begin_date as date, @end_date as date AS
BEGIN

	IF OBJECT_ID('dbo.AccountSpendingSummary', 'U') IS NOT NULL 
	BEGIN
		DROP TABLE dbo.AccountSpendingSummary;
	END

	SET @begin_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, @begin_date), 0)) --First day of previous month
	SET @end_date = (SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, @end_date), -1)) --Last Day of previous month

	SELECT sum(transaction_amount) as category_amount, category_name
	INTO dbo.AccountSpendingSummary
	FROM tbltransaction TRA
		JOIN tblAccount ACC on TRA.account_id = ACC.account_id
		JOIN tblCategory CAT on CAT.category_id = TRA.category_id
	where transaction_amount < 0
		AND transaction_date >= @begin_date
		AND transaction_date <= @end_date
		AND TRA.account_id = @account_id
	GROUP BY category_name 
	ORDER BY sum(transaction_amount) asc

END


