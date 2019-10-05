CREATE TABLE [pdr].[c3040] (
    [c3040_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodcn]                VARCHAR (8)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (120) NOT NULL,
    [stawka]               NUMERIC (8, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3040_id] ASC) ON [FG_PDR]
);

