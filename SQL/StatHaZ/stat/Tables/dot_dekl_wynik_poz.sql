CREATE TABLE [stat].[dot_dekl_wynik_poz] (
    [id]                   VARCHAR (35)  NULL,
    [pozid]                DECIMAL (4)   NULL,
    [status]               VARCHAR (1)   NULL,
    [komentarz]            VARCHAR (255) NULL,
    [opis_towaru]          VARCHAR (255) NULL,
    [kraj_przezn_wysyl]    VARCHAR (2)   NULL,
    [warunki_dostawy]      VARCHAR (3)   NULL,
    [rodzaj_transakcji]    VARCHAR (2)   NULL,
    [rodzaj_transportu]    VARCHAR (2)   NULL,
    [kod_towarowy]         VARCHAR (8)   NULL,
    [kraj_pochodzenia]     VARCHAR (2)   NULL,
    [masa_netto]           DECIMAL (11)  NULL,
    [uzup_jm]              DECIMAL (11)  NULL,
    [wartosc_faktury]      DECIMAL (15)  NULL,
    [wartosc_statystyczna] DECIMAL (15)  NULL,
    [wskaznik_progowy]     VARCHAR (1)   NULL,
    [nr_grp]               NUMERIC (18)  NULL,
    [pk]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([pk] ASC) ON [StatDane]
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_dwp_id]
    ON [stat].[dot_dekl_wynik_poz]([id] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [komentarz]
    ON [stat].[dot_dekl_wynik_poz]([komentarz]);


GO
CREATE STATISTICS [masa_netto]
    ON [stat].[dot_dekl_wynik_poz]([masa_netto]);


GO
CREATE STATISTICS [opis_towaru]
    ON [stat].[dot_dekl_wynik_poz]([opis_towaru]);


GO
CREATE STATISTICS [pozid]
    ON [stat].[dot_dekl_wynik_poz]([pozid]);


GO
CREATE STATISTICS [uzup_jm]
    ON [stat].[dot_dekl_wynik_poz]([uzup_jm]);


GO
CREATE STATISTICS [wartosc_faktury]
    ON [stat].[dot_dekl_wynik_poz]([wartosc_faktury]);

