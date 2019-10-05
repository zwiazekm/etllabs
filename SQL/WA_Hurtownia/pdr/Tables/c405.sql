CREATE TABLE [pdr].[c405] (
    [c405_id]              INT             NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [currency_code]        VARCHAR (3)     NOT NULL,
    [currency_name]        VARCHAR (80)    NOT NULL,
    [exchange_rate]        NUMERIC (10, 4) NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [multiplier]           INT             NOT NULL,
    [table_number]         VARCHAR (20)    NOT NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c405_id] ASC) ON [FG_PDR]
);

