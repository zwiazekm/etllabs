CREATE TABLE [ncts2].[ar_dokument] (
    [id]                     BIGINT         NOT NULL,
    [numer_dokumentu_zisar]  NVARCHAR (100) NULL,
    [numer_dokumentu_so]     NVARCHAR (100) NULL,
    [system_operacyjny]      NVARCHAR (36)  NULL,
    [rodzaj_dokumentu]       NVARCHAR (36)  NULL,
    [nr_typu_komunikatu]     NVARCHAR (36)  NULL,
    [wynik_analizy_ryzyka]   NVARCHAR (36)  NULL,
    [uc_zglaszajacy_do_aar]  NVARCHAR (20)  NULL,
    [uc_kontroli_towarow]    NVARCHAR (20)  NULL,
    [miejsce_analizy]        NVARCHAR (1)   NULL,
    [czas_analizy]           NVARCHAR (20)  NULL,
    [wersja]                 NVARCHAR (20)  NULL,
    [rola_urzedu]            NVARCHAR (20)  NULL,
    [komunikat_id]           BIGINT         NULL,
    [operacja_tranzytowa_id] BIGINT         NULL,
    CONSTRAINT [ar_dokument_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

