CREATE TABLE [stat].[dgt_kopia_dot_kategoria] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NULL,
    [rodz_kat]      CHAR (1)     NOT NULL,
    [kategoria]     CHAR (1)     NULL,
    [zakres_szczeg] VARCHAR (4)  NULL,
    [wazna_od_mies] INT          NOT NULL,
    [wazna_od_rok]  INT          NOT NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [w_systemie_od] DATETIME     NULL,
    [generacjaId]   INT          NOT NULL
) ON [StatDane];


GO
CREATE STATISTICS [w_systemie_od]
    ON [stat].[dgt_kopia_dot_kategoria]([w_systemie_od]);


GO
CREATE STATISTICS [zakres_szczeg]
    ON [stat].[dgt_kopia_dot_kategoria]([zakres_szczeg]);

