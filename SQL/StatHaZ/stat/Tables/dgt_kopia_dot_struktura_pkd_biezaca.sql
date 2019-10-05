CREATE TABLE [stat].[dgt_kopia_dot_struktura_pkd_biezaca] (
    [nr_poz]            VARCHAR (35)   NULL,
    [rok]               DECIMAL (4)    NOT NULL,
    [miesiac]           DECIMAL (2)    NOT NULL,
    [typ]               VARCHAR (1)    NOT NULL,
    [pkd]               VARCHAR (2)    NOT NULL,
    [kod_towarowy]      VARCHAR (8)    NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NULL,
    [rodzaj_transakcji] VARCHAR (2)    NULL,
    [udzial_w_pkd]      DECIMAL (5, 4) NULL,
    [wartosc_pozycji]   DECIMAL (15)   NULL,
    [generacjaId]       INT            NOT NULL
) ON [StatDane];


GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_dgt_kopia_dot_struktura_pkd_biezaca]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([rok] ASC, [miesiac] ASC, [typ] ASC, [pkd] ASC, [kod_towarowy] ASC, [kraj_przezn_wysyl] ASC, [kraj_pochodzenia] ASC, [rodzaj_transakcji] ASC, [generacjaId] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [kod_towarowy]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([kod_towarowy]);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysyl]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([kraj_przezn_wysyl]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([miesiac]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([nr_poz]);


GO
CREATE STATISTICS [pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([pkd]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([rodzaj_transakcji]);


GO
CREATE STATISTICS [typ]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([typ]);


GO
CREATE STATISTICS [udzial_w_pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([udzial_w_pkd]);


GO
CREATE STATISTICS [wartosc_pozycji]
    ON [stat].[dgt_kopia_dot_struktura_pkd_biezaca]([wartosc_pozycji]);

