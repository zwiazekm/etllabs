CREATE TABLE [stat].[dgt_kopia_dot_obroty_miesieczne] (
    [id_pod]           VARCHAR (35) NOT NULL,
    [miesiac]          DECIMAL (2)  NOT NULL,
    [rok]              DECIMAL (4)  NOT NULL,
    [stat_przywoz]     DECIMAL (15) NULL,
    [stat_wywoz]       DECIMAL (15) NULL,
    [trans_nu_przywoz] DECIMAL (15) NULL,
    [trans_nu_wywoz]   DECIMAL (15) NULL,
    [generacjaId]      INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_obroty_miesieczne] PRIMARY KEY CLUSTERED ([id_pod] ASC, [miesiac] ASC, [rok] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([generacjaId]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([miesiac]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([rok]);


GO
CREATE STATISTICS [stat_przywoz]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([stat_przywoz]);


GO
CREATE STATISTICS [stat_wywoz]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([stat_wywoz]);


GO
CREATE STATISTICS [trans_nu_przywoz]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([trans_nu_przywoz]);


GO
CREATE STATISTICS [trans_nu_wywoz]
    ON [stat].[dgt_kopia_dot_obroty_miesieczne]([trans_nu_wywoz]);

