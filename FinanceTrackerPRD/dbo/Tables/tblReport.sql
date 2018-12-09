CREATE TABLE [dbo].[tblReport] (
    [report_id]          INT           IDENTITY (1, 1) NOT NULL,
    [report_name]        VARCHAR (50)  NULL,
    [report_description] VARCHAR (550) NULL,
    [loaded_on]          DATETIME      CONSTRAINT [DF_tblReport_loaded_on] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tblReport] PRIMARY KEY CLUSTERED ([report_id] ASC)
);

