CREATE TABLE [stat].[dgt_kopia_dot_obroty_roczne] (
    [nip]                  VARCHAR (10) NOT NULL,
    [rok]                  SMALLINT     NOT NULL,
    [sr_mies_stat_przywoz] DECIMAL (15) NULL,
    [sr_mies_stat_wywoz]   DECIMAL (15) NULL,
    [roczny_stat_przywoz]  DECIMAL (15) NULL,
    [roczny_stat_wywoz]    DECIMAL (15) NULL,
    [generacjaId]          INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_obroty_roczne] PRIMARY KEY CLUSTERED ([nip] ASC, [rok] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_obroty_roczne]([rok]);


GO
CREATE STATISTICS [sr_mies_stat_przywoz]
    ON [stat].[dgt_kopia_dot_obroty_roczne]([sr_mies_stat_przywoz]);


GO
CREATE STATISTICS [sr_mies_stat_wywoz]
    ON [stat].[dgt_kopia_dot_obroty_roczne]([sr_mies_stat_wywoz]);

