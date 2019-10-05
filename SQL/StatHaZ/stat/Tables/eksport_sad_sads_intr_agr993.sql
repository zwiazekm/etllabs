CREATE TABLE [stat].[eksport_sad_sads_intr_agr993] (
    [ek_pcn]                         VARCHAR (255) NULL,
    [ek_zp]                          VARCHAR (255) NULL,
    [ek_pcnp]                        VARCHAR (255) NULL,
    [ek_kraj_przeznaczenia]          VARCHAR (255) NULL,
    [ek_odbiorca]                    VARCHAR (255) NULL,
    [ek_RokMc]                       INT           NULL,
    [ek_rodzaj_transakcji]           VARCHAR (255) NULL,
    [ek_kod_transportu]              VARCHAR (255) NULL,
    [ek_kod_warunkow_dostawy]        VARCHAR (255) NULL,
    [ek_kod_izby_celnej]             VARCHAR (255) NULL,
    [ek_kod_procedury_celnej]        VARCHAR (255) NULL,
    [ek_znacznik_kategorii_progowej] VARCHAR (255) NULL,
    [ek_masa_netto]                  VARCHAR (255) NULL,
    [ek_ilosc]                       VARCHAR (255) NULL,
    [ek_wartosc_stat_zl]             VARCHAR (255) NULL,
    [ek_wartosc_stat_usd]            VARCHAR (255) NULL,
    [ek_wartosc_stat_euro]           VARCHAR (255) NULL
);


GO
CREATE STATISTICS [ek_ilosc]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_ilosc]);


GO
CREATE STATISTICS [ek_kod_izby_celnej]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_kod_izby_celnej]);


GO
CREATE STATISTICS [ek_kod_procedury_celnej]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_kod_procedury_celnej]);


GO
CREATE STATISTICS [ek_kod_transportu]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_kod_transportu]);


GO
CREATE STATISTICS [ek_kod_warunkow_dostawy]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [ek_kraj_przeznaczenia]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_kraj_przeznaczenia]);


GO
CREATE STATISTICS [ek_masa_netto]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_masa_netto]);


GO
CREATE STATISTICS [ek_miesiac_rok]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_RokMc]);


GO
CREATE STATISTICS [ek_odbiorca]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_odbiorca]);


GO
CREATE STATISTICS [ek_pcn]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_pcn]);


GO
CREATE STATISTICS [ek_pcnp]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_pcnp]);


GO
CREATE STATISTICS [ek_rodzaj_transakcji]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_rodzaj_transakcji]);


GO
CREATE STATISTICS [ek_wartosc_stat_euro]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_wartosc_stat_euro]);


GO
CREATE STATISTICS [ek_wartosc_stat_usd]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_wartosc_stat_usd]);


GO
CREATE STATISTICS [ek_wartosc_stat_zl]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_wartosc_stat_zl]);


GO
CREATE STATISTICS [ek_znacznik_kategorii_progowej]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_znacznik_kategorii_progowej]);


GO
CREATE STATISTICS [ek_zp]
    ON [stat].[eksport_sad_sads_intr_agr993]([ek_zp]);

