
CREATE view [dbo].[viewNetWorth]
as
Select *, Checking+Credit+Loan+Asset+Saving as [Net Worth]
from 
(
Select datename(month,month_loaded)+ ' '+ cast(datepart(year,month_loaded) as nvarchar(50)) as [Month],
min(Case when account_type = 1 then balance end) as Checking,
min(Case when account_type = 2 then balance end) as Credit,
min(Case when account_type = 3 then balance end) as Loan,
min(Case when account_type = 4 then balance end) as Asset,
min(Case when account_type = 5 then balance end) as Saving
from tblAccount_Type_Balances
group by month_loaded
) T1

