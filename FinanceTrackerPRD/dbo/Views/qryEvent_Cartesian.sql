
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view 
[dbo].[qryEvent_Cartesian]
as
SELECT E.event_id, C.CountID AS InstanceID, E.comment, E.event_start, E.recurrence_count, E.period_frequency, E.period_type_id
FROM tblEvent E cross join tblCount C
WHERE (((E.recurrence_count) Is Null)) OR (((C.CountID)<=E.recurrence_count))

