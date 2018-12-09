CREATE TABLE [dbo].[tblBudgetDetail] (
    [budget_detail_id] INT             IDENTITY (1, 1) NOT NULL,
    [budget_id]        INT             NULL,
    [category_id]      INT             NULL,
    [created_on]       DATETIME        CONSTRAINT [DF_tblBudgetDetail_created_on] DEFAULT (getdate()) NULL,
    [budget_amount]    NUMERIC (18, 2) NULL,
    CONSTRAINT [PK_tblBudgetDetail] PRIMARY KEY CLUSTERED ([budget_detail_id] ASC)
);

