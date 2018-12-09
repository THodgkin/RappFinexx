CREATE TABLE [dbo].[tblLocation] (
    [location_id]   INT            IDENTITY (1, 1) NOT NULL,
    [location_name] NVARCHAR (255) NULL,
    [category_id]   INT            NULL,
    [added_by]      INT            NULL,
    [added_on]      DATETIME       NULL,
    CONSTRAINT [PK_tblLocation] PRIMARY KEY CLUSTERED ([location_id] ASC),
    CONSTRAINT [FK_tblLocation_tblCategory] FOREIGN KEY ([category_id]) REFERENCES [dbo].[tblCategory] ([category_id]),
    CONSTRAINT [FK_tblLocation_tblUser] FOREIGN KEY ([added_by]) REFERENCES [dbo].[tblUser] ([user_id])
);

