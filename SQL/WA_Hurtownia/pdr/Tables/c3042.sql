CREATE TABLE [pdr].[c3042] (
    [c3042_id]             INT            NOT NULL,
    [a]                    NVARCHAR (1)   NULL,
    [c]                    NVARCHAR (1)   NULL,
    [creation_tm]          DATETIME       NULL,
    [d]                    NVARCHAR (1)   NULL,
    [idgry]                VARCHAR (2)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [opis]                 NVARCHAR (120) NULL,
    [stawka]               NUMERIC (5, 4) NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3042_id] ASC) ON [FG_PDR]
);

