CREATE TABLE [intr2].[intr_vies] (
    [nip]               NVARCHAR (10)   NOT NULL,
    [rok]               INT             NOT NULL,
    [miesiac]           INT             NOT NULL,
    [typ]               NCHAR (1)       NOT NULL,
    [kod_kraju]         NVARCHAR (2)    NOT NULL,
    [id_kontrahenta]    NVARCHAR (17)   NOT NULL,
    [kwota]             DECIMAL (14, 2) NOT NULL,
    [kwota_trojstronna] DECIMAL (14, 2) NULL,
    [kod_us]            NVARCHAR (4)    NOT NULL,
    [rodzaj_okresu]     NCHAR (1)       NOT NULL,
    [data_aktualizacji] DATETIME2 (3)   NOT NULL,
    [id_vies]           BIGINT          NOT NULL,
    CONSTRAINT [PK_intr_vies] PRIMARY KEY CLUSTERED ([id_vies] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_vies$intr_vies_1520005415] CHECK ([intr_vies].[typ]='W' OR [intr_vies].[typ]='P'),
    CONSTRAINT [intr_vies$intr_vies_1536005472] CHECK ([intr_vies].[rodzaj_okresu]='K' OR [intr_vies].[rodzaj_okresu]='M')
);

