CREATE TABLE [osoz].[towary] (
    [id]                    BIGINT        NOT NULL,
    [czas_modyfikacji]      DATETIME      NULL,
    [kod_towaru]            VARCHAR (10)  NOT NULL,
    [opis]                  VARCHAR (255) NULL,
    [potencjalnie_wrazliwy] BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

