CREATE TABLE [osoz].[sl_ograniczenie_waznosci] (
    [id]               BIGINT        NOT NULL,
    [czas_modyfikacji] DATETIME      NULL,
    [aktywna]          BIT           NOT NULL,
    [kod]              VARCHAR (2)   NOT NULL,
    [nazwa]            VARCHAR (255) NOT NULL,
    [opis]             VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

