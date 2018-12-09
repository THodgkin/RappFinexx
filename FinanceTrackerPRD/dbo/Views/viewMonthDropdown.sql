


CREATE view [dbo].[viewMonthDropdown]
as
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+4, 0) as actual_date, datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+4, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+4, 0)) as [selected_month]
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+3, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+3, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+3, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+2, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+2, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+2, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+1, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+1, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())+1, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate()), 0) , datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-0, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-0, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-1, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-1, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-1, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-2, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-2, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-2, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-3, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-3, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-3, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-4, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-4, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-4, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-5, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-5, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-5, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-6, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-6, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-6, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-7, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-7, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-7, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-8, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-8, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-8, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-9, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-9, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-9, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-10, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-10, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-10, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-11, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-11, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-11, 0))
union all
SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-12, 0), datename(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-12, 0))+ '-' + datename(year,DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate())-12, 0))

