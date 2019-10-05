CREATE TABLE [osoz].[kwoty_na_zabezpieczeniach] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [kwota_na_zabezpieczeniu] NUMERIC (19, 2) NOT NULL,
    [pokwitowanie_id]         BIGINT          NOT NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

