CREATE TABLE [stat].[dot_dekl_wynik_poz_tmp] (
    [id]                   VARCHAR (35)  NULL,
    [pozid]                DECIMAL (4)   NULL,
    [status]               VARCHAR (1)   NULL,
    [komentarz]            VARCHAR (255) NULL,
    [opis_towaru]          VARCHAR (255) NULL,
    [kraj_przezn_wysylki]  VARCHAR (2)   NULL,
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
    [nr_grp]               NUMERIC (18)  NULL
);

