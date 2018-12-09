CREATE TABLE [dbo].[tblUser] (
    [user_id]    INT            IDENTITY (1, 1) NOT NULL,
    [user_name]  NVARCHAR (50)  NULL,
    [last_name]  NVARCHAR (50)  NULL,
    [first_name] NVARCHAR (50)  NULL,
    [password]   NVARCHAR (255) NULL,
    CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED ([user_id] ASC)
);

