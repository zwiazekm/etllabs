CREATE TABLE [pdr].[c501] (
    [c501_id]              INT          NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [gmi]                  VARCHAR (2)  NULL,
    [kod]                  VARCHAR (7)  NOT NULL,
    [last_modification_tm] DATETIME     NULL,
    [nazdod]               VARCHAR (50) NULL,
    [nazwa]                VARCHAR (36) NULL,
    [pow]                  VARCHAR (2)  NULL,
    [rodz]                 VARCHAR (1)  NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NOT NULL,
    [woj]                  VARCHAR (2)  NULL,
    PRIMARY KEY CLUSTERED ([c501_id] ASC) ON [FG_PDR]
);

