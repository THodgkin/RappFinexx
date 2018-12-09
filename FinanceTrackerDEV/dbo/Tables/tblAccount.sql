CREATE TABLE [dbo].[tblAccount] (
    [account_id]      INT             IDENTITY (1, 1) NOT NULL,
    [account_name]    NVARCHAR (250)  NULL,
    [account_abbrev]  NVARCHAR (50)   NULL,
    [opening_balance] NUMERIC (18, 2) NULL,
    [opening_date]    DATETIME        NULL,
    [account_type]    INT             NULL,
    [added_by]        INT             NULL,
    [added_on]        DATETIME        CONSTRAINT [DF_tblAccount_added_on] DEFAULT (getdate()) NULL,
    [account_number]  NVARCHAR (150)  NULL,
    [routing_number]  NVARCHAR (150)  NULL,
    [interest_rate]   NUMERIC (18, 4) NULL,
    [active]          INT             CONSTRAINT [DF_tblAccount_active] DEFAULT ((1)) NULL,
    [website]         VARCHAR (50)    NULL,
    [username]        VARCHAR (50)    NULL,
    [password]        VARCHAR (50)    NULL,
    [location_id]     INT             NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([account_id] ASC),
    CONSTRAINT [FK_tblAccount_tblAccount_Type] FOREIGN KEY ([account_type]) REFERENCES [dbo].[tblAccount_Type] ([id]),
    CONSTRAINT [FK_tblAccount_tblLocation] FOREIGN KEY ([location_id]) REFERENCES [dbo].[tblLocation] ([location_id]),
    CONSTRAINT [FK_tblAccount_tblUser] FOREIGN KEY ([added_by]) REFERENCES [dbo].[tblUser] ([user_id])
);

