CREATE TABLE [pdr].[c503] (
    [c503_id]              INT            NOT NULL,
    [cecha]                VARCHAR (5)    NULL,
    [creation_tm]          DATETIME       NULL,
    [kodgm]                VARCHAR (7)    NULL,
    [kodulicy]             VARCHAR (12)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwaulicy1]          NVARCHAR (100) NULL,
    [nazwaulicy2]          NVARCHAR (100) NULL,
    [symgm]                VARCHAR (2)    NULL,
    [symmiejsc]            VARCHAR (7)    NULL,
    [sympow]               VARCHAR (2)    NULL,
    [symrodzgm]            VARCHAR (1)    NULL,
    [symulicy]             VARCHAR (5)    NULL,
    [symwoj]               VARCHAR (2)    NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c503_id] ASC)
);

