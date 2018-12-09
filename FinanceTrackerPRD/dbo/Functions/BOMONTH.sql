CREATE FUNCTION [dbo].[BOMONTH] (@dd datetime)
   RETURNS date
AS
BEGIN
  declare @YYYY_MM_DD datetime;
  
  SET @YYYY_MM_DD = DATEADD(month, DATEDIFF(month, 0, @dd), 0);   
  
  return @YYYY_MM_DD
END 
