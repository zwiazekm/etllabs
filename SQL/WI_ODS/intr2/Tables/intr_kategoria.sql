CREATE TABLE [intr2].[intr_kategoria] (
    [id_pod]        NVARCHAR (35) NOT NULL,
    [nr_poz]        INT           NULL,
    [rodz_kat]      NCHAR (1)     NOT NULL,
    [kategoria]     NCHAR (1)     NULL,
    [zakres_szczeg] NVARCHAR (4)  NULL,
    [wazna_od_mies] INT           NOT NULL,
    [wazna_od_rok]  INT           NOT NULL,
    [wazna_do_mies] INT           NULL,
    [wazna_do_rok]  INT           NULL,
    [w_systemie_od] DATETIME2 (3) NULL,
    CONSTRAINT [intr_kategoria$PK_INTR_KATEGORIA] PRIMARY KEY CLUSTERED ([id_pod] ASC, [rodz_kat] ASC, [wazna_od_mies] ASC, [wazna_od_rok] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_kategoria$FK_INTR_KATEGORIA_REF_DANE_POD] FOREIGN KEY ([id_pod]) REFERENCES [intr2].[intr_dane_pod] ([id_pod])
);

