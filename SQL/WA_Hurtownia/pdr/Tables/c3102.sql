CREATE TABLE [pdr].[c3102] (
    [c3102_id]             INT      NOT NULL,
    [creation_tm]          DATETIME NULL,
    [kod]                  TEXT     NOT NULL,
    [last_modification_tm] DATETIME NULL,
    [valid_from]           DATE     NOT NULL,
    [valid_to]             DATE     NULL,
    [version_]             BIGINT   NOT NULL,
    [nazwa]                TEXT     NOT NULL,
    [nieaktywny]           BIT      NULL,
    PRIMARY KEY CLUSTERED ([c3102_id] ASC) ON [FG_PDR]
) TEXTIMAGE_ON [FG_PDR];

