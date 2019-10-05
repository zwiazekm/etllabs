CREATE TABLE [ncts2].[komunikaty] (
    [id]                     BIGINT         NOT NULL,
    [komunikat_zawartosc_id] BIGINT         NULL,
    [data_utworzenia]        DATETIME       NULL,
    [typ]                    NVARCHAR (32)  NULL,
    [rewizja]                INT            NULL,
    [operacja_tranzytowa_id] BIGINT         NULL,
    [numer_wlasny]           NVARCHAR (14)  NULL,
    [komunikacja_nadawca]    NVARCHAR (17)  NULL,
    [komunikacja_odbiorca]   NVARCHAR (17)  NULL,
    [zrodlo]                 NVARCHAR (5)   NULL,
    [przeznaczenie]          NVARCHAR (5)   NULL,
    [mrn]                    NVARCHAR (18)  NULL,
    [czy_wstawiony_recznie]  BIT            NULL,
    [zadanie_id]             BIGINT         NULL,
    [zadanie_zrodlo]         NVARCHAR (100) NULL,
    [kod_uc]                 NVARCHAR (8)   NULL,
    [login]                  NVARCHAR (128) NULL,
    [status]                 NVARCHAR (40)  NULL,
    [data_komunikacji]       DATETIME       NULL,
    [kanal_typ]              NVARCHAR (15)  NULL,
    [kanal_wartosc]          NVARCHAR (400) NULL,
    [sisc_id_sprawy]         NVARCHAR (400) NULL,
    [sisc_id_wplywu]         NVARCHAR (400) NULL,
    [sisc_id_podmiotu]       NVARCHAR (400) NULL,
    [sisc_id_podmiotu_posr]  NVARCHAR (400) NULL,
    [sisc_id_osoby]          NVARCHAR (400) NULL,
    CONSTRAINT [komunikaty_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160511-122127]
    ON [ncts2].[komunikaty]([komunikat_zawartosc_id] ASC)
    ON [FG_NCTS2];

