CREATE TABLE [stat].[dgt_kopia_dgt_kraje_cois] (
    [kc_kod_iso]   VARCHAR (2)   NULL,
    [kc_nazwa_pol] VARCHAR (255) NULL,
    [generacjaId]  INT           NOT NULL
) ON [StatDane];


GO
CREATE STATISTICS [kc_kod_iso]
    ON [stat].[dgt_kopia_dgt_kraje_cois]([kc_kod_iso]);


GO
CREATE STATISTICS [kc_nazwa_pol]
    ON [stat].[dgt_kopia_dgt_kraje_cois]([kc_nazwa_pol]);

