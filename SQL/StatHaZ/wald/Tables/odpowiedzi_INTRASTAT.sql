CREATE TABLE [wald].[odpowiedzi_INTRASTAT] (
    [wartosc_stat]           FLOAT (53)     NULL,
    [wartosc_faktury]        FLOAT (53)     NULL,
    [bd_id_dok]              NVARCHAR (50)  NULL,
    [Izba]                   NVARCHAR (255) NULL,
    [bd_id_dok_pozid]        FLOAT (53)     NULL,
    [kod_towarowy]           NVARCHAR (255) NULL,
    [masa_netto]             FLOAT (53)     NULL,
    [uzup_jm]                FLOAT (53)     NULL,
    [rodzaj_bledu]           NVARCHAR (50)  NULL,
    [Wartosc_bledna]         NVARCHAR (255) NULL,
    [Wartosc_poprawna]       NVARCHAR (255) NULL,
    [Pozycja_poprawna]       NVARCHAR (255) NULL,
    [Korekta_wprowadzona]    NVARCHAR (255) NULL,
    [Oczekiwanie_na_korekte] NVARCHAR (255) NULL,
    [UWAGI]                  NVARCHAR (255) NULL,
    [bd_pk]                  INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_odpowiedzi_INTRASTAT] PRIMARY KEY CLUSTERED ([bd_pk] ASC) ON [WaldDane]
);

