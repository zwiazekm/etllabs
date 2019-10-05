CREATE TABLE [intr2].[intr_okres_sprawozd_kraj_kontrahent] (
    [id_pod]                      NVARCHAR (35)   NOT NULL,
    [nr_poz]                      INT             NOT NULL,
    [kraj]                        NVARCHAR (2)    NOT NULL,
    [id_kontrahenta]              NVARCHAR (17)   NOT NULL,
    [data_aktualizacji]           DATETIME2 (3)   NOT NULL,
    [deklaracja]                  DECIMAL (14, 2) NULL,
    [vies]                        DECIMAL (14, 2) NULL,
    [vies_trojstronne]            DECIMAL (14, 2) NULL,
    [deklaracja_pozycje_FLKZ]     DECIMAL (14, 2) NULL,
    [deklaracja_kod_transakcji_1] DECIMAL (14, 2) NULL,
    CONSTRAINT [intr_okres_sprawozd_kraj_kontrahent$intr_okres_11840042182] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC, [kraj] ASC, [id_kontrahenta] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_okres_sprawozd_kraj_kontrahent$FK_INTR_OKR_SPR_KRAJ_KONTRAHENT_REF_INTR_OKR_SPR_KRAJ] FOREIGN KEY ([id_pod], [nr_poz], [kraj]) REFERENCES [intr2].[intr_okres_sprawozd_kraj] ([id_pod], [nr_poz], [kraj])
);

