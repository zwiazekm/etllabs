CREATE TABLE [stat].[zerowe_wartosci_imp] (
    [im_pcn]                         VARCHAR (8)  NULL,
    [im_zp]                          VARCHAR (1)  NULL,
    [im_pcnp]                        VARCHAR (8)  NULL,
    [im_kraj_pochodzenia]            VARCHAR (2)  NULL,
    [im_kraj_wysylki]                VARCHAR (2)  NULL,
    [im_odbiorca]                    VARCHAR (14) NULL,
    [im_miesiac_rok]                 VARCHAR (4)  NULL,
    [im_rodzaj_transakcji]           VARCHAR (2)  NULL,
    [im_kod_transportu]              VARCHAR (1)  NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (3)  NULL,
    [im_kod_izby_celnej]             VARCHAR (2)  NULL,
    [im_kod_procedury_celnej]        VARCHAR (4)  NULL,
    [im_znacznik_kategorii_progowej] VARCHAR (1)  NULL,
    [im_masa_netto]                  VARCHAR (15) NULL,
    [im_ilosc]                       VARCHAR (15) NULL,
    [im_wartosc_stat_zl]             VARCHAR (15) NULL,
    [im_wartosc_stat_usd]            VARCHAR (15) NULL,
    [im_wartosc_stat_euro]           VARCHAR (15) NULL
) ON [StatDane];

