CREATE TABLE [intr2].[intr_priorytet] (
    [id_pod]        NVARCHAR (35) NOT NULL,
    [nr_poz]        INT           NULL,
    [rodzaj_prior]  NCHAR (1)     NOT NULL,
    [priorytet]     DECIMAL (2)   NULL,
    [wazna_od_mies] INT           NOT NULL,
    [wazna_od_rok]  INT           NOT NULL,
    [wazna_do_mies] INT           NULL,
    [wazna_do_rok]  INT           NULL,
    [w_systemie_od] DATETIME2 (3) NULL,
    CONSTRAINT [intr_priorytet$PK_INTR_PRIORYTET] PRIMARY KEY CLUSTERED ([id_pod] ASC, [rodzaj_prior] ASC, [wazna_od_mies] ASC, [wazna_od_rok] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_priorytet$FK_INTR_PRIORYTET_REF_DANE_POD] FOREIGN KEY ([id_pod]) REFERENCES [intr2].[intr_dane_pod] ([id_pod])
);

