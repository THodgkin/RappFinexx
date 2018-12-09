CREATE TABLE [dbo].[tblBudgetDetail] (
    [budget_detail_id] INT             NULL,
    [transaction_id]   INT             NULL,
    [budget_id]        INT             NULL,
    [created_on]       DATETIME        NULL,
    [budget_amount]    NUMERIC (18, 2) NULL
);

