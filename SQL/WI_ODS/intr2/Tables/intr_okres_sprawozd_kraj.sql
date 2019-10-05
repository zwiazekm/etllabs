CREATE TABLE [intr2].[intr_okres_sprawozd_kraj] (
    [id_pod]                      NVARCHAR (35)   NOT NULL,
    [nr_poz]                      INT             NOT NULL,
    [kraj]                        NVARCHAR (2)    NOT NULL,
    [data_aktualizacji]           DATETIME2 (3)   NOT NULL,
    [deklaracja]                  DECIMAL (14, 2) NULL,
    [vies]                        DECIMAL (14, 2) NULL,
    [vies_trojstronne]            DECIMAL (14, 2) NULL,
    [deklaracja_pozycje_FLKZ]     DECIMAL (14, 2) NULL,
    [deklaracja_kod_transakcji_1] DECIMAL (14, 2) NULL,
    CONSTRAINT [intr_okres_sprawozd_kraj$intr_okres_11200039902] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC, [kraj] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_okres_sprawozd_kraj$FK_INTR_OKR_SPR_KRAJ_REF_INTR_OKR_SPR] FOREIGN KEY ([id_pod], [nr_poz]) REFERENCES [intr2].[intr_okres_sprawozd] ([id_pod], [nr_poz])
);

