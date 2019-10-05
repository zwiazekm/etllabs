CREATE TABLE [pdr].[c3062] (
    [c3062_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [sekcja]               VARCHAR (1)    NOT NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NULL,
    [dzial]                VARCHAR (2)    NOT NULL,
    [grupa]                VARCHAR (4)    NULL,
    [klasa]                VARCHAR (5)    NULL,
    [nazwa]                NVARCHAR (150) NULL,
    [podklasa]             VARCHAR (7)    NULL,
    PRIMARY KEY CLUSTERED ([c3062_id] ASC) ON [FG_PDR]
);

