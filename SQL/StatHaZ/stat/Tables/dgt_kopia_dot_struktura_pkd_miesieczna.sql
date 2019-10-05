CREATE TABLE [stat].[dgt_kopia_dot_struktura_pkd_miesieczna] (
    [nr_poz]            VARCHAR (35)   NULL,
    [rok]               DECIMAL (4)    NULL,
    [miesiac]           DECIMAL (2)    NULL,
    [typ]               VARCHAR (1)    NULL,
    [pkd]               VARCHAR (2)    NULL,
    [kod_towarowy]      VARCHAR (8)    NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NULL,
    [rodzaj_transakcji] VARCHAR (2)    NULL,
    [udzial_w_pkd]      DECIMAL (6, 5) NULL,
    [generacjaId]       INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_struktura_pkd_miesieczna] PRIMARY KEY CLUSTERED ([generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([generacjaId]);


GO
CREATE STATISTICS [kod_towarowy]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([kod_towarowy]);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysyl]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([kraj_przezn_wysyl]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([miesiac]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([nr_poz]);


GO
CREATE STATISTICS [pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([pkd]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([rodzaj_transakcji]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([rok]);


GO
CREATE STATISTICS [typ]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([typ]);


GO
CREATE STATISTICS [udzial_w_pkd]
    ON [stat].[dgt_kopia_dot_struktura_pkd_miesieczna]([udzial_w_pkd]);

