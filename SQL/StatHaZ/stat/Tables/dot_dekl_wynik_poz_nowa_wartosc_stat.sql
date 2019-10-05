CREATE TABLE [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat] (
    [id_dok]            VARCHAR (30)  NOT NULL,
    [pozid]             SMALLINT      NOT NULL,
    [Status]            CHAR (1)      NULL,
    [komentarz]         VARCHAR (255) NULL,
    [opis_towaru]       VARCHAR (255) NULL,
    [kraj_przezn_wysyl] VARCHAR (2)   NULL,
    [warunki_dostawy]   VARCHAR (3)   NULL,
    [rodzaj_transakcji] CHAR (2)      NULL,
    [rodzaj_transportu] CHAR (2)      NULL,
    [kod_towarowy]      VARCHAR (8)   NULL,
    [kraj_pochodzenia]  CHAR (2)      NULL,
    [masa_netto]        DECIMAL (11)  NULL,
    [uzup_jm]           DECIMAL (11)  NULL,
    [wartosc_faktury]   DECIMAL (15)  NULL,
    [wartosc_stat]      DECIMAL (15)  NULL,
    [wsk_progowy]       CHAR (1)      NULL,
    CONSTRAINT [PK_dot_dekl_wynik_poz_nowa_wartosc_stat] PRIMARY KEY CLUSTERED ([id_dok] ASC, [pozid] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [komentarz]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([komentarz]);


GO
CREATE STATISTICS [masa_netto]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([masa_netto]);


GO
CREATE STATISTICS [opis_towaru]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([opis_towaru]);


GO
CREATE STATISTICS [pozid]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([pozid]);


GO
CREATE STATISTICS [rodzaj_transportu]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([rodzaj_transportu]);


GO
CREATE STATISTICS [uzup_jm]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([uzup_jm]);


GO
CREATE STATISTICS [warunki_dostawy]
    ON [stat].[dot_dekl_wynik_poz_nowa_wartosc_stat]([warunki_dostawy]);

