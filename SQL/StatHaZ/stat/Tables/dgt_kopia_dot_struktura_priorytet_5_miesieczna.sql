CREATE TABLE [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna] (
    [nr_poz]            VARCHAR (35)   NULL,
    [nip]               VARCHAR (10)   NOT NULL,
    [regon]             VARCHAR (14)   NULL,
    [typ]               VARCHAR (1)    NOT NULL,
    [rok]               DECIMAL (4)    NOT NULL,
    [miesiac]           DECIMAL (2)    NOT NULL,
    [kod_towarowy]      VARCHAR (8)    NOT NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NOT NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NOT NULL,
    [rodzaj_transakcji] VARCHAR (2)    NOT NULL,
    [udzial_w_obrotach] DECIMAL (6, 5) NULL,
    [generacjaId]       INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_struktura_priorytet_5_miesieczna] PRIMARY KEY CLUSTERED ([nip] ASC, [typ] ASC, [rok] ASC, [miesiac] ASC, [kod_towarowy] ASC, [kraj_przezn_wysyl] ASC, [kraj_pochodzenia] ASC, [rodzaj_transakcji] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([generacjaId]);


GO
CREATE STATISTICS [kod_towarowy]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([kod_towarowy]);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysyl]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([kraj_przezn_wysyl]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([miesiac]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([nr_poz]);


GO
CREATE STATISTICS [regon]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([regon]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([rodzaj_transakcji]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([rok]);


GO
CREATE STATISTICS [typ]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([typ]);


GO
CREATE STATISTICS [udzial_w_obrotach]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_miesieczna]([udzial_w_obrotach]);

