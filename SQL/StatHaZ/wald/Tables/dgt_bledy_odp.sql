CREATE TABLE [wald].[dgt_bledy_odp] (
    [bd_id_dok]              VARCHAR (35)    NULL,
    [Izba]                   INT             NULL,
    [bd_id_dok_pozid]        BIGINT          NULL,
    [rodzaj_bledu]           VARCHAR (100)   NULL,
    [Wartosc_bledna]         VARCHAR (100)   NULL,
    [Wartosc_poprawna]       VARCHAR (100)   NULL,
    [Pozycja_poprawna]       NVARCHAR (2050) NULL,
    [Korekta_wprowadzona]    NVARCHAR (50)   NULL,
    [Oczekiwanie_na_korekte] NVARCHAR (50)   NULL,
    [UWAGI]                  NVARCHAR (255)  NULL
) ON [WaldDane];

