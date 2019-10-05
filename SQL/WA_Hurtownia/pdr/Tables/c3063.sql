CREATE TABLE [pdr].[c3063] (
    [c3063_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [przelicznik]          NUMERIC (3, 2) NOT NULL,
    [ustalanyprzez]        INT            NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    [waluta]               VARCHAR (3)    NULL,
    PRIMARY KEY CLUSTERED ([c3063_id] ASC) ON [FG_PDR]
);

