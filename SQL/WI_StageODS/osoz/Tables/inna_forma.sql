CREATE TABLE [osoz].[inna_forma] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [kwota]                   NUMERIC (19, 2) NULL,
    [opis_innej_formy]        TEXT            NOT NULL,
    [status_wpisu]            VARCHAR (1)     NOT NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [pokwitowanie_id]         BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

