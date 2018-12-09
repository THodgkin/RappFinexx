CREATE TABLE [dbo].[tblAccount_Type_Balances] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [balance]      NUMERIC (18, 2) NULL,
    [account_type] INT             NULL,
    [month_loaded] DATETIME        NULL,
    CONSTRAINT [PK_tblAccount_Type_Balances] PRIMARY KEY CLUSTERED ([ID] ASC)
);

