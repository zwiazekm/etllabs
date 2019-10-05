CREATE TABLE [pdr].[c404] (
    [c404_id]              INT             NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [currency_code]        VARCHAR (3)     NOT NULL,
    [currency_name]        VARCHAR (1024)  NULL,
    [exchange_rate]        NUMERIC (10, 4) NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [multiplier]           BIGINT          NULL,
    [publication_date]     DATE            NULL,
    [table_number]         VARCHAR (20)    NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c404_id] ASC) ON [FG_PDR]
);

