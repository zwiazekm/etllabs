CREATE TABLE [osoz].[towary_potencjalnie_wrazliwe] (
    [id]               BIGINT        NOT NULL,
    [czas_modyfikacji] DATETIME      NULL,
    [kod_towaru]       VARCHAR (10)  NOT NULL,
    [opis]             VARCHAR (255) NULL,
    [aktywna]          BIT           NOT NULL,
    [id_pdr]           INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

