CREATE TABLE [osoz].[uzupelnienia_kwoty] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [data_uzupelnienia]       DATETIME        NOT NULL,
    [kwota_uzupelnienia]      NUMERIC (19, 2) NOT NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [sl_waluty_id]            BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

