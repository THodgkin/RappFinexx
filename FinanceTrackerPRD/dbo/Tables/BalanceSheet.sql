CREATE TABLE [dbo].[BalanceSheet] (
    [account_id]        INT             NOT NULL,
    [account_name]      NVARCHAR (250)  NULL,
    [account_type_id]   INT             NULL,
    [account_type]      NVARCHAR (50)   NULL,
    [beginning_balance] NUMERIC (12, 2) NULL,
    [ending_balance]    NUMERIC (12, 2) NULL,
    [change]            NUMERIC (12, 2) NULL
);

