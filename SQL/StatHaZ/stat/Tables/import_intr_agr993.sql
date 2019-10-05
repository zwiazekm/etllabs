CREATE TABLE [stat].[import_intr_agr993] (
    [im_pcn]                         VARCHAR (255) NULL,
    [im_zp]                          VARCHAR (255) NULL,
    [im_pcnp]                        VARCHAR (255) NULL,
    [im_kraj_pochodzenia]            VARCHAR (255) NULL,
    [im_kraj_wysylki]                VARCHAR (255) NULL,
    [im_odbiorca]                    VARCHAR (255) NULL,
    [im_nip]                         VARCHAR (255) NULL,
    [im_miesiac_rok]                 VARCHAR (255) NULL,
    [im_rodzaj_transakcji]           VARCHAR (255) NULL,
    [im_kod_transportu]              VARCHAR (255) NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (255) NULL,
    [im_kod_izby_celnej]             VARCHAR (255) NULL,
    [im_kod_procedury_celnej]        VARCHAR (255) NULL,
    [im_znacznik_kategorii_progowej] VARCHAR (255) NULL,
    [im_masa_netto]                  VARCHAR (255) NULL,
    [im_ilosc]                       VARCHAR (255) NULL,
    [im_wartosc_stat_zl]             VARCHAR (255) NULL,
    [im_wartosc_stat_usd]            VARCHAR (255) NULL,
    [im_wartosc_stat_euro]           VARCHAR (255) NULL,
    [im_wartosc_faktury]             VARCHAR (255) NULL,
    [im_iddoknr]                     VARCHAR (255) NULL,
    [im_id_dok]                      VARCHAR (255) NULL,
    [im_iddoknr_pozid]               VARCHAR (255) NULL,
    [im_id_dok_pozid]                VARCHAR (255) NULL,
    [im_id]                          VARCHAR (255) NULL
);


GO
CREATE STATISTICS [im_id]
    ON [stat].[import_intr_agr993]([im_id]);


GO
CREATE STATISTICS [im_id_dok]
    ON [stat].[import_intr_agr993]([im_id_dok]);


GO
CREATE STATISTICS [im_id_dok_pozid]
    ON [stat].[import_intr_agr993]([im_id_dok_pozid]);


GO
CREATE STATISTICS [im_iddoknr]
    ON [stat].[import_intr_agr993]([im_iddoknr]);


GO
CREATE STATISTICS [im_iddoknr_pozid]
    ON [stat].[import_intr_agr993]([im_iddoknr_pozid]);


GO
CREATE STATISTICS [im_ilosc]
    ON [stat].[import_intr_agr993]([im_ilosc]);


GO
CREATE STATISTICS [im_kod_izby_celnej]
    ON [stat].[import_intr_agr993]([im_kod_izby_celnej]);


GO
CREATE STATISTICS [im_kod_procedury_celnej]
    ON [stat].[import_intr_agr993]([im_kod_procedury_celnej]);


GO
CREATE STATISTICS [im_kod_transportu]
    ON [stat].[import_intr_agr993]([im_kod_transportu]);


GO
CREATE STATISTICS [im_kod_warunkow_dostawy]
    ON [stat].[import_intr_agr993]([im_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [im_kraj_pochodzenia]
    ON [stat].[import_intr_agr993]([im_kraj_pochodzenia]);


GO
CREATE STATISTICS [im_kraj_wysylki]
    ON [stat].[import_intr_agr993]([im_kraj_wysylki]);


GO
CREATE STATISTICS [im_masa_netto]
    ON [stat].[import_intr_agr993]([im_masa_netto]);


GO
CREATE STATISTICS [im_miesiac_rok]
    ON [stat].[import_intr_agr993]([im_miesiac_rok]);


GO
CREATE STATISTICS [im_nip]
    ON [stat].[import_intr_agr993]([im_nip]);


GO
CREATE STATISTICS [im_odbiorca]
    ON [stat].[import_intr_agr993]([im_odbiorca]);


GO
CREATE STATISTICS [im_pcn]
    ON [stat].[import_intr_agr993]([im_pcn]);


GO
CREATE STATISTICS [im_pcnp]
    ON [stat].[import_intr_agr993]([im_pcnp]);


GO
CREATE STATISTICS [im_rodzaj_transakcji]
    ON [stat].[import_intr_agr993]([im_rodzaj_transakcji]);


GO
CREATE STATISTICS [im_wartosc_faktury]
    ON [stat].[import_intr_agr993]([im_wartosc_faktury]);


GO
CREATE STATISTICS [im_wartosc_stat_euro]
    ON [stat].[import_intr_agr993]([im_wartosc_stat_euro]);


GO
CREATE STATISTICS [im_wartosc_stat_usd]
    ON [stat].[import_intr_agr993]([im_wartosc_stat_usd]);


GO
CREATE STATISTICS [im_wartosc_stat_zl]
    ON [stat].[import_intr_agr993]([im_wartosc_stat_zl]);


GO
CREATE STATISTICS [im_znacznik_kategorii_progowej]
    ON [stat].[import_intr_agr993]([im_znacznik_kategorii_progowej]);


GO
CREATE STATISTICS [im_zp]
    ON [stat].[import_intr_agr993]([im_zp]);

