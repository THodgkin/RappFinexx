CREATE PROCEDURE [dbo].[calculateCurrentDebt] @as_of_date as Date
as
BEGIN

	TRUNCATE TABLE CurrentDebt
	INSERT INTO CurrentDebt (owed, account_name, account_type)
	SELECT sum(transaction_amount) as owed, t2.account_name, t3.account_type
	FROM tblTransaction t1 
	left join tblAccount t2 on t1.account_id = t2.account_id
	left join tblAccount_Type t3 on t2.account_type = t3.id
	WHERE cast(transaction_date as date) <= @as_of_date
		AND t2.account_id <> 24
	GROUP BY t2.account_name, t2.account_id, t3.account_type
	HAVING sum(transaction_amount) < 0
	ORDER BY SUM (transaction_amount) desc

END
