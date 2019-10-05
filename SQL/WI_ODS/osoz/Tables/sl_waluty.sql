CREATE TABLE [osoz].[sl_waluty] (
    [id]               BIGINT        NOT NULL,
    [czas_modyfikacji] DATETIME      NULL,
    [aktywna]          BIT           NOT NULL,
    [kod]              VARCHAR (4)   NOT NULL,
    [nazwa]            VARCHAR (255) NOT NULL,
    [opis]             VARCHAR (255) NULL,
    [id_pdr]           INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    UNIQUE NONCLUSTERED ([nazwa] ASC) ON [FG_OSOZ]
);

