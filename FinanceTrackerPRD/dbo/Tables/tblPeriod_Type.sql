CREATE TABLE [dbo].[tblPeriod_Type] (
    [period_type_id] NVARCHAR (50) NOT NULL,
    [period_type]    NVARCHAR (50) NULL,
    [sort_order]     INT           NULL,
    CONSTRAINT [PK_tblPeriod_Type] PRIMARY KEY CLUSTERED ([period_type_id] ASC)
);

