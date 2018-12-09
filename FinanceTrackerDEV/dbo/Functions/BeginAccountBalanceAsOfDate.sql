
CREATE FUNCTION [dbo].[BeginAccountBalanceAsOfDate] (@asOfDate as date, @accountID as int)
returns decimal(10,2)

AS
BEGIN
DECLARE @accountBalance as decimal(10,2)
set @accountBalance = (
SELECT SUM(transaction_amount)
FROM dbo.tblTransaction t1  
join tblAccount t2 on t1.account_id = t2.account_id  
left join tblLocation t3 on t1.location_id = t3.location_id  
left join tblCategory t4 on t4.category_id = t1.category_id  
Where t1.account_id = @accountID
and t1.transaction_date < @asOfDate
--and t2.active = 1
)
return @accountBalance

END
