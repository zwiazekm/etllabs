CREATE TABLE [osoz].[gwarancje_na_pokwitowaniach] (
    [id]                              BIGINT          NOT NULL,
    [czas_modyfikacji]                DATETIME        NULL,
    [kwota_gwarancji_na_pokwitowaniu] NUMERIC (19, 2) NOT NULL,
    [gwarancja_id]                    BIGINT          NOT NULL,
    [pokwitowanie_id]                 BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

