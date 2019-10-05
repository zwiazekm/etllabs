CREATE TABLE [stat].[dgt_kopia_istat_dekl_wynik_poz] (
    [id_dok]            VARCHAR (30)  NOT NULL,
    [pozid]             SMALLINT      NOT NULL,
    [Status]            CHAR (1)      NULL,
    [komentarz]         VARCHAR (255) NULL,
    [opis_towaru]       VARCHAR (255) NULL,
    [kraj_przezn_wysyl] VARCHAR (2)   NULL,
    [warunki_dostawy]   VARCHAR (3)   NULL,
    [rodzaj_transakcji] VARCHAR (2)   NULL,
    [rodzaj_transportu] VARCHAR (2)   NULL,
    [kod_towarowy]      VARCHAR (8)   NULL,
    [kraj_pochodzenia]  VARCHAR (2)   NULL,
    [masa_netto]        DECIMAL (11)  NULL,
    [uzup_jm]           DECIMAL (11)  NULL,
    [wartosc_faktury]   DECIMAL (15)  NULL,
    [wartosc_stat]      DECIMAL (15)  NULL,
    [wsk_progowy]       CHAR (1)      NULL,
    [flaga]             VARCHAR (6)   NULL,
    [semafor]           VARCHAR (40)  NULL,
    [generacjaId]       INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_istat_dekl_wynik_poz] PRIMARY KEY CLUSTERED ([id_dok] ASC, [pozid] ASC, [generacjaId] ASC) ON [StatIndeksy]
);

