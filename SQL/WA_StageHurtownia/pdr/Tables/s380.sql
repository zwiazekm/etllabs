CREATE TABLE [pdr].[s380] (
    [s380_id]              BIGINT        NOT NULL,
    [code]                 VARCHAR (1)   NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [last_modification_tm] DATETIME      NULL,
    [valid_from]           DATE          NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        NULL,
    [description]          VARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140) NOT NULL,
    PRIMARY KEY CLUSTERED ([s380_id] ASC)
);

