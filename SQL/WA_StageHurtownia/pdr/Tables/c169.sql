CREATE TABLE [pdr].[c169] (
    [c169_id]              INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [dzien]                VARCHAR (2)   NOT NULL,
    [last_modification_tm] DATETIME      NULL,
    [miesiac]              VARCHAR (2)   NOT NULL,
    [nazwa]                NVARCHAR (35) NULL,
    [nazwa_en]             VARCHAR (35)  NULL,
    [rok]                  VARCHAR (4)   NOT NULL,
    [ruchome]              BIT           NOT NULL,
    [valid_from]           DATE          NULL,
    [valid_to]             DATE          NULL,
    [nazwa_eng]            VARCHAR (35)  NULL,
    [version_]             BIGINT        DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c169_id] ASC)
);

