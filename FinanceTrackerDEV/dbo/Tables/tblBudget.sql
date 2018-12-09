CREATE TABLE [dbo].[tblBudget] (
    [budget_id]         INT      IDENTITY (1, 1) NOT NULL,
    [created_on]        DATETIME CONSTRAINT [DF_tblBudget_created_on] DEFAULT (getdate()) NULL,
    [budget_begin_date] DATETIME NULL,
    [budget_end_date]   DATETIME NULL,
    CONSTRAINT [PK_tblBudget] PRIMARY KEY CLUSTERED ([budget_id] ASC)
);

