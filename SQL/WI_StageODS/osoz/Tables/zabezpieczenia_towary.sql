CREATE TABLE [osoz].[zabezpieczenia_towary] (
    [id]                BIGINT   NOT NULL,
    [czas_modyfikacji]  DATETIME NULL,
    [wykluczony]        BIT      NOT NULL,
    [towar_id]          BIGINT   NOT NULL,
    [zabezpieczenie_id] BIGINT   NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

