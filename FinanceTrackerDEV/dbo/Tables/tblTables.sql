CREATE TABLE [dbo].[tblTables] (
    [table_id]   INT           IDENTITY (1, 1) NOT NULL,
    [table_name] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblTables] PRIMARY KEY CLUSTERED ([table_id] ASC)
);

