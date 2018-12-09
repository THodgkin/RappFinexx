CREATE TABLE [dbo].[tblAccount_Type] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [account_type] NVARCHAR (50) NULL,
    [added_by]     INT           NULL,
    [added_on]     DATETIME      NULL,
    CONSTRAINT [PK_account_type] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_tblAccount_Type_tblUser] FOREIGN KEY ([added_by]) REFERENCES [dbo].[tblUser] ([user_id])
);

