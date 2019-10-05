CREATE TABLE [stat].[dgt_kopia_dot_struktura_pkd_roczna] (
    [nr_poz]            VARCHAR (35)   NULL,
    [rok]               INT            NOT NULL,
    [typ]               VARCHAR (1)    NOT NULL,
    [pkd]               VARCHAR (2)    NOT NULL,
    [kod_towarowy]      VARCHAR (8)    NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NULL,
    [rodzaj_transakcji] VARCHAR (2)    NULL,
    [udzial_w_pkd]      DECIMAL (6, 5) NOT NULL,
    [generacjaId]       INT            NOT NULL
) ON [StatDane];


GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_dgt_kopia_dot_struktura_pkd_roczna]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([rok] ASC, [typ] ASC, [pkd] ASC, [kod_towarowy] ASC, [kraj_przezn_wysyl] ASC, [kraj_pochodzenia] ASC, [rodzaj_transakcji] ASC, [generacjaId] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([generacjaId]);


GO
CREATE STATISTICS [kod_towarowy]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([kod_towarowy]);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysyl]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([kraj_przezn_wysyl]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([nr_poz]);


GO
CREATE STATISTICS [pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([pkd]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([rodzaj_transakcji]);


GO
CREATE STATISTICS [typ]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([typ]);


GO
CREATE STATISTICS [udzial_w_pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_roczna]([udzial_w_pkd]);

