CREATE TABLE [osoz].[rodzaje_dzialalnosci_dla_koncesji_zezwolen] (
    [id]                                          BIGINT      NOT NULL,
    [czas_modyfikacji]                            DATETIME    NULL,
    [rodzaj_dzialalnosci_dla_koncesji_zezwolenia] VARCHAR (1) NOT NULL,
    [zezwolenie_gry_hazardowe_id]                 BIGINT      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk194999a752a004c4] FOREIGN KEY ([zezwolenie_gry_hazardowe_id]) REFERENCES [osoz].[zezwolenia_gry_hazardowe] ([id])
);

