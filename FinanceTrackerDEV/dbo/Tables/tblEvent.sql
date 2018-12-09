CREATE TABLE [dbo].[tblEvent] (
    [event_id]           INT             IDENTITY (1, 1) NOT NULL,
    [event_start]        DATETIME        NULL,
    [recurrence_count]   INT             NULL,
    [period_frequency]   INT             NULL,
    [period_type_id]     NVARCHAR (50)   NULL,
    [comment]            NVARCHAR (MAX)  NULL,
    [transaction_amount] NUMERIC (18, 2) NULL,
    [account]            INT             NULL,
    [location]           INT             NULL,
    [category]           INT             NULL,
    [added_on]           DATETIME        CONSTRAINT [DF_tblEvent_added_on] DEFAULT (getdate()) NULL,
    [added_by]           INT             NULL,
    CONSTRAINT [PK_tblEvent] PRIMARY KEY CLUSTERED ([event_id] ASC),
    CONSTRAINT [FK_tblEvent_tblAccount] FOREIGN KEY ([account]) REFERENCES [dbo].[tblAccount] ([account_id]),
    CONSTRAINT [FK_tblEvent_tblCategory] FOREIGN KEY ([category]) REFERENCES [dbo].[tblCategory] ([category_id]),
    CONSTRAINT [FK_tblEvent_tblLocation] FOREIGN KEY ([location]) REFERENCES [dbo].[tblLocation] ([location_id]),
    CONSTRAINT [FK_tblEvent_tblPeriod_Type] FOREIGN KEY ([period_type_id]) REFERENCES [dbo].[tblPeriod_Type] ([period_type_id])
);

