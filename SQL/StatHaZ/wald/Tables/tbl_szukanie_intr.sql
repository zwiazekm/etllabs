CREATE TABLE [wald].[tbl_szukanie_intr] (
    [id_dok]              VARCHAR (50)  NOT NULL,
    [pozid]               BIGINT        NOT NULL,
    [regon_zobowiazanego] VARCHAR (14)  NULL,
    [typ]                 CHAR (1)      NULL,
    [miesiac]             INT           NULL,
    [rok]                 INT           NULL,
    [kod_towarowy]        VARCHAR (8)   NULL,
    [opis_towaru]         VARCHAR (255) NULL,
    [kraj_pochodzenia]    VARCHAR (2)   NULL,
    [kraj_przezn_wysyl]   VARCHAR (2)   NULL,
    [warunki_dostawy]     VARCHAR (3)   NULL,
    [rodzaj_transakcji]   VARCHAR (2)   NULL,
    [rodzaj_transportu]   VARCHAR (2)   NULL,
    [masa_netto]          DECIMAL (11)  NULL,
    [uzup_jm]             DECIMAL (11)  NULL,
    [wartosc_faktury]     DECIMAL (15)  NULL,
    [wartosc_stat]        DECIMAL (15)  NULL
) ON [WaldDane];

