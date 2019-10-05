CREATE TABLE [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna] (
    [nr_poz]            VARCHAR (35)   NULL,
    [nip]               VARCHAR (10)   NOT NULL,
    [regon]             VARCHAR (14)   NULL,
    [typ]               VARCHAR (1)    NOT NULL,
    [rok]               DECIMAL (4)    NOT NULL,
    [kod_towarowy]      VARCHAR (8)    NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NULL,
    [rodzaj_transakcji] VARCHAR (2)    NULL,
    [udzial_w_obrotach] DECIMAL (6, 5) NOT NULL,
    [generacjaId]       INT            NOT NULL
) ON [StatDane];


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysyl]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([kraj_przezn_wysyl]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([nr_poz]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([rodzaj_transakcji]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([rok]);


GO
CREATE STATISTICS [udzial_w_obrotach]
    ON [stat].[dgt_kopia_dot_struktura_priorytet_5_roczna]([udzial_w_obrotach]);

