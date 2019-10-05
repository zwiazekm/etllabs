CREATE TABLE [osoz].[gwarancje_na_pokwitowaniach] (
    [id]                              BIGINT          NOT NULL,
    [czas_modyfikacji]                DATETIME        NULL,
    [kwota_gwarancji_na_pokwitowaniu] NUMERIC (19, 2) NOT NULL,
    [gwarancja_id]                    BIGINT          NOT NULL,
    [pokwitowanie_id]                 BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk4c8313a58f999d72] FOREIGN KEY ([gwarancja_id]) REFERENCES [osoz].[gwarancje] ([id]),
    CONSTRAINT [fk4c8313a5cac4ee22] FOREIGN KEY ([pokwitowanie_id]) REFERENCES [osoz].[pokwitowania] ([id]),
    UNIQUE NONCLUSTERED ([pokwitowanie_id] ASC) ON [FG_OSOZ]
);

