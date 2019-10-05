CREATE TABLE [stat].[dgt_kopia_intr_wlasc_terytor] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [identyfikator] VARCHAR (10) NULL,
    [wazna_od_mies] INT          NULL,
    [wazna_od_rok]  INT          NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [generacjaId]   INT          NOT NULL,
    [WaznaOdRokMc]  AS           ([wazna_od_mies]+(100)*[wazna_od_rok]),
    [WaznaDoRokMc]  AS           (isnull([wazna_do_mies],(12))+(100)*isnull([wazna_do_rok],(2100))),
    CONSTRAINT [PK_dgt_kopia_intr_wlasc_terytor] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [identyfikator]
    ON [stat].[dgt_kopia_intr_wlasc_terytor]([identyfikator]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_intr_wlasc_terytor]([nr_poz]);

