
CREATE FUNCTION [dbo].[RunningAccountBalance]
 (
 @beginDate AS DATE,
 @endDate AS DATE,
 @accountID AS INT
 )
RETURNS TABLE
AS
RETURN
	SELECT * FROM
	(
	SELECT t1.transaction_id 
	, t1.event_id as Event 
	, t2.account_name as Account 
	, t1.transaction_amount as Amount 
	, location_name as [Where] 
	, category_name as Category 
	, SUM(transaction_amount) OVER (ORDER BY transaction_date ROWS UNBOUNDED PRECEDING) as Balance
	, transaction_date as [Date] 
	FROM dbo.tblTransaction t1 
		join tblAccount t2 on t1.account_id = t2.account_id 
		left join tblLocation t3 on t1.location_id = t3.location_id 
		left join tblCategory t4 on t4.category_id = t1.category_id 
	WHERE t1.account_id = @accountID ) t1
	where t1.Date >= @beginDate
	and t1.Date <= @endDate
