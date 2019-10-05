CREATE TABLE [osoz].[procedury_celne] (
    [id]               BIGINT        NOT NULL,
    [czas_modyfikacji] DATETIME      NULL,
    [aktywna]          BIT           NOT NULL,
    [kod]              VARCHAR (15)  NOT NULL,
    [nazwa]            VARCHAR (255) NOT NULL,
    [opis]             VARCHAR (255) NULL,
    [typ]              VARCHAR (15)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    UNIQUE NONCLUSTERED ([kod] ASC) ON [FG_OSOZ]
);

