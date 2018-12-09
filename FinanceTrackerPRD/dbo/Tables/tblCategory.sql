CREATE TABLE [dbo].[tblCategory] (
    [category_id]   INT            IDENTITY (1, 1) NOT NULL,
    [category_name] NVARCHAR (255) NULL,
    [added_on]      DATETIME       CONSTRAINT [DF_tblCategory_added_on] DEFAULT (getdate()) NULL,
    [added_by]      INT            NULL,
    CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED ([category_id] ASC),
    CONSTRAINT [FK_tblCategory_tblUser] FOREIGN KEY ([added_by]) REFERENCES [dbo].[tblUser] ([user_id]),
    CONSTRAINT [IX_tblCategory] UNIQUE NONCLUSTERED ([category_name] ASC)
);

