CREATE TABLE [int].[istat_dekl_wynik_poz] (
    [id_dok]            VARCHAR (30)  NOT NULL,
    [pozid]             SMALLINT      NOT NULL,
    [status]            CHAR (1)      NULL,
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
    [id_jedn]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_ISTAT_DEKL_WYNIK_POZ] PRIMARY KEY CLUSTERED ([id_dok] ASC, [pozid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE) ON [FG_INT],
    CONSTRAINT [FK_ISTAT_DE_REF_ISTAT_DEKL_POZ] FOREIGN KEY ([id_dok]) REFERENCES [int].[istat_dekl_wynik_dok] ([id_dok])
);


GO
CREATE NONCLUSTERED INDEX [idx_kod_towarowy]
    ON [int].[istat_dekl_wynik_poz]([kod_towarowy] ASC) WITH (FILLFACTOR = 90)
    ON [FG_INT];

