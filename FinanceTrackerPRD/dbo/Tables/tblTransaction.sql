CREATE TABLE [dbo].[tblTransaction] (
    [transaction_id]        INT             IDENTITY (1, 1) NOT NULL,
    [transaction_date]      DATETIME        NULL,
    [transaction_amount]    NUMERIC (18, 2) NULL,
    [category_id]           INT             NULL,
    [location_id]           INT             NULL,
    [account_id]            INT             NULL,
    [added_by]              INT             NULL,
    [added_on]              DATETIME        CONSTRAINT [DF_tblTransaction_added_on] DEFAULT (getdate()) NULL,
    [event_id]              INT             NULL,
    [comments]              NVARCHAR (2000) NULL,
    [linked_transaction_id] INT             NULL,
    CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED ([transaction_id] ASC),
    CONSTRAINT [FK_tblTransaction_tblAccount] FOREIGN KEY ([account_id]) REFERENCES [dbo].[tblAccount] ([account_id]),
    CONSTRAINT [FK_tblTransaction_tblCategory] FOREIGN KEY ([category_id]) REFERENCES [dbo].[tblCategory] ([category_id]),
    CONSTRAINT [FK_tblTransaction_tblEvent] FOREIGN KEY ([event_id]) REFERENCES [dbo].[tblEvent] ([event_id]),
    CONSTRAINT [FK_tblTransaction_tblLocation] FOREIGN KEY ([location_id]) REFERENCES [dbo].[tblLocation] ([location_id]),
    CONSTRAINT [FK_tblTransaction_tblUser] FOREIGN KEY ([added_by]) REFERENCES [dbo].[tblUser] ([user_id])
);

