CREATE TABLE [osoz].[zabezpieczenia_generalne_procedury] (
    [id]                BIGINT   NOT NULL,
    [czas_modyfikacji]  DATETIME NULL,
    [jednostka_id]      BIGINT   NOT NULL,
    [zabezpieczenie_id] BIGINT   NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

