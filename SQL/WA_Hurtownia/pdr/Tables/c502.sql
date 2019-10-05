CREATE TABLE [pdr].[c502] (
    [c502_id]              INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [last_modification_tm] DATETIME      NULL,
    [sym]                  VARCHAR (7)   NOT NULL,
    [valid_from]           DATE          NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NOT NULL,
    [gmi]                  VARCHAR (2)   NULL,
    [kod]                  VARCHAR (7)   NULL,
    [mz]                   BIT           NULL,
    [nazwa]                NVARCHAR (56) NULL,
    [pow]                  VARCHAR (2)   NULL,
    [rm]                   VARCHAR (2)   NULL,
    [rodz_gmi]             VARCHAR (1)   NULL,
    [sympod]               VARCHAR (7)   NOT NULL,
    [woj]                  VARCHAR (2)   NULL,
    PRIMARY KEY CLUSTERED ([c502_id] ASC) ON [FG_PDR]
);

