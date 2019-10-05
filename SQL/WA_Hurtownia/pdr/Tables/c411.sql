CREATE TABLE [pdr].[c411] (
    [c411_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [klucz]                VARCHAR (12)   NOT NULL,
    [kodcn]                VARCHAR (10)   NULL,
    [last_modification_tm] DATETIME       NULL,
    [ujm]                  VARCHAR (100)  NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    [wyszczegolnienie]     NVARCHAR (700) NULL,
    PRIMARY KEY CLUSTERED ([c411_id] ASC) ON [FG_PDR]
);

