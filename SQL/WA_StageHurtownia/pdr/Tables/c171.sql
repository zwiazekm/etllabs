CREATE TABLE [pdr].[c171] (
    [c171_id]              INT         NOT NULL,
    [creation_tm]          DATETIME    NULL,
    [kod_urzedu]           VARCHAR (8) NOT NULL,
    [last_modification_tm] DATETIME    NULL,
    [rok]                  INT         NOT NULL,
    [valid_from]           DATE        NULL,
    [valid_to]             DATE        NULL,
    [version_]             BIGINT      DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c171_id] ASC)
);

