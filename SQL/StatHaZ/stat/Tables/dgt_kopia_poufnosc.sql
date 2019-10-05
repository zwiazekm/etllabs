CREATE TABLE [stat].[dgt_kopia_poufnosc] (
    [nr_reguly]     DECIMAL (11) NOT NULL,
    [nip]           VARCHAR (10) NULL,
    [kod_tow_p]     VARCHAR (8)  NULL,
    [kraj_przez_p]  VARCHAR (2)  NULL,
    [kraj_wys_p]    VARCHAR (2)  NULL,
    [kraj_poch_p]   VARCHAR (2)  NULL,
    [kraj]          VARCHAR (2)  NULL,
    [wazna_od_mies] INT          NULL,
    [wazna_od_rok]  INT          NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [WaznaOdRokMc]  AS           ([dbo].[KonwertujMiRNaRokMc]([wazna_od_mies],[wazna_od_rok])),
    [WaznaDoRokMc]  AS           ([dbo].[KonwertujMiRNaRokMc](isnull([wazna_do_mies],(12)),isnull([wazna_do_rok],(2100)))),
    [regon]         VARCHAR (14) NULL,
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_poufnosc] PRIMARY KEY CLUSTERED ([nr_reguly] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [kraj]
    ON [stat].[dgt_kopia_poufnosc]([kraj]);


GO
CREATE STATISTICS [regon]
    ON [stat].[dgt_kopia_poufnosc]([regon]);


GO
CREATE STATISTICS [wazna_do_rok]
    ON [stat].[dgt_kopia_poufnosc]([wazna_do_rok]);


GO
CREATE STATISTICS [wazna_od_rok]
    ON [stat].[dgt_kopia_poufnosc]([wazna_od_rok]);

