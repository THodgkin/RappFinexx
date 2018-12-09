CREATE TABLE [dbo].[tblDate_Range] (
    [date_range_id]       INT            IDENTITY (1, 1) NOT NULL,
    [date_range]          NVARCHAR (50)  NULL,
    [date_function_begin] NVARCHAR (400) NULL,
    [date_function_end]   NVARCHAR (400) NULL,
    CONSTRAINT [PK_tblDate_Range] PRIMARY KEY CLUSTERED ([date_range_id] ASC)
);

