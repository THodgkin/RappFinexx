CREATE TABLE [dbo].[tblAccountTotals] (
    [transaction_id] INT             NOT NULL,
    [Event]          INT             NULL,
    [Account]        VARCHAR (1000)  NULL,
    [Amount]         NUMERIC (18, 2) NULL,
    [Where]          VARCHAR (1000)  NULL,
    [Category]       VARCHAR (1000)  NULL,
    [Balance]        NUMERIC (18, 2) NULL,
    [Date]           DATETIME        NULL
);

