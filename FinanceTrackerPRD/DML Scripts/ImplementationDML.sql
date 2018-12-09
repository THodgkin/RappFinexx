GO
USE [master]
GO
ALTER DATABASE [Test Finance Tracker] SET  READ_WRITE 
GO


Use  [Test Finance Tracker]
GO
  INSERT INTO 
  [Test Finance Tracker].dbo.tblUser (user_name, last_name, first_name, password)
  SELECT 'system'
  , 'system'
  , 'system'
  , 'system';

 INSERT INTO [Test Finance Tracker].dbo.tblAccount_Type (account_type, added_by, added_on)
 SELECT 'Checking', 1, getdate();
 INSERT INTO [Test Finance Tracker].dbo.tblAccount_Type (account_type, added_by, added_on)
 SELECT 'Credit Card', 1, getdate();
 INSERT INTO [Test Finance Tracker].dbo.tblAccount_Type (account_type, added_by, added_on)
 SELECT 'Loan', 1, getdate();
 INSERT INTO [Test Finance Tracker].dbo.tblAccount_Type (account_type, added_by, added_on)
 SELECT 'Asset', 1, getdate();
 INSERT INTO [Test Finance Tracker].dbo.tblAccount_Type (account_type, added_by, added_on)
 SELECT 'Saving', 1, getdate();

 SET identity_insert [Test Finance Tracker].dbo.tblCategory ON;
 GO
 INSERT INTO [Test Finance Tracker].dbo.tblCategory (category_id, category_name, added_on, added_by)
 VALUES(1, 'Initial Balance', GETDATE(), 1)
 INSERT INTO [Test Finance Tracker].dbo.tblCategory (category_id, category_name, added_on, added_by)
 VALUES(10, 'Transfer', GETDATE(), 1)
 SET identity_insert [Test Finance Tracker].dbo.tblCategory OFF;
 GO


SET IDENTITY_INSERT [Test Finance Tracker].dbo.tblReport ON
GO
INSERT INTO [Test Finance Tracker].dbo.tblReport (report_id, report_name, report_description, loaded_on)
VALUES (1, 'Monthly Account Summary', 'Shows information about a specific account and its acticity during the selected time period broken down by category spending', GETDATE())
INSERT INTO [Test Finance Tracker].dbo.tblReport (report_id, report_name, report_description, loaded_on)
VALUES (2, 'Balance Sheet & Net Worth', 'Shows all accounts and balances from the start and end of the selected period. Also shows overall Net Worth', GETDATE())
INSERT INTO [Test Finance Tracker].dbo.tblReport (report_id, report_name, report_description, loaded_on)
VALUES (3, 'Debt "as of" report', 'Shows all debt by account type and account as of the entered date', GETDATE())
SET IDENTITY_INSERT [Test Finance Tracker].dbo.tblReport OFF
GO

INSERT INTO [Test Finance Tracker].[dbo].[tblPeriod_Type] (period_type_id, period_type, sort_order)
VALUES('d','day(s)',1)
INSERT INTO [Test Finance Tracker].[dbo].[tblPeriod_Type] (period_type_id, period_type, sort_order)
VALUES('m','month(s)',3)
INSERT INTO [Test Finance Tracker].[dbo].[tblPeriod_Type] (period_type_id, period_type, sort_order)
VALUES('q','quarter(s)',4)
INSERT INTO [Test Finance Tracker].[dbo].[tblPeriod_Type] (period_type_id, period_type, sort_order)
VALUES('ww','week(s)',2)
INSERT INTO [Test Finance Tracker].[dbo].[tblPeriod_Type] (period_type_id, period_type, sort_order)
VALUES('yyyy','year(s)',5)

SET IDENTITY_INSERT [Test Finance Tracker].[dbo].[tblCount] ON;
GO
DECLARE @i INT;
SELECT @i = 1;
WHILE @i <= 10000
BEGIN
    INSERT INTO [Test Finance Tracker].[dbo].[tblCount](CountID) VALUES (@i);
    SELECT @i = @i + 1;
END;
SET IDENTITY_INSERT [Test Finance Tracker].[dbo].[tblCount] OFF;
GO