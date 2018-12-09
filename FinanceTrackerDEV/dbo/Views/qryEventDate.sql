CREATE VIEW [dbo].[qryEventDate] as
SELECT 
qryEC.event_id
,qryEC.InstanceID
,case 
	when qryEC.period_type_id = 'd' then DateAdd(day,([qryEC].[InstanceID]*[qryEC].[period_frequency])-[qryEC].[period_frequency],[qryEC].[event_start])
	when qryEC.period_type_id = 'ww' then DateAdd(week,([qryEC].[InstanceID]*[qryEC].[period_frequency])-[qryEC].[period_frequency],[qryEC].[event_start])
	when qryEC.period_type_id = 'm' then DateAdd(month,([qryEC].[InstanceID]*[qryEC].[period_frequency])-[qryEC].[period_frequency],[qryEC].[event_start])
	when qryEC.period_type_id = 'q' then DateAdd(quarter,([qryEC].[InstanceID]*[qryEC].[period_frequency])-[qryEC].[period_frequency],[qryEC].[event_start])
	when qryEC.period_type_id = 'yyyy' then DateAdd(year,([qryEC].[InstanceID]*[qryEC].[period_frequency])-[qryEC].[period_frequency],[qryEC].[event_start]) 
end as transaction_date, 
qryEC.Comment, 
qryEC.event_start, 
qryEC.recurrence_count,
qryEC.period_frequency, 
tblPeriod_Type.period_type
FROM qryEvent_Cartesian as qryEC LEFT JOIN tblPeriod_Type ON qryEC.period_type_id = tblPeriod_Type.period_type_id
