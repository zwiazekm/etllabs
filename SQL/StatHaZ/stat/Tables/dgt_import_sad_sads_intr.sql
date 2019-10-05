CREATE TABLE [stat].[dgt_import_sad_sads_intr] (
    [im_pcn]                         VARCHAR (8)     NULL,
    [im_zp]                          CHAR (1)        NULL,
    [im_pcnp]                        VARCHAR (8)     NULL,
    [im_kraj_pochodzenia]            CHAR (2)        NULL,
    [im_kraj_wysylki]                CHAR (2)        NULL,
    [im_odbiorca]                    VARCHAR (14)    NULL,
    [im_RokMc]                       INT             NULL,
    [im_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [im_kod_transportu]              CHAR (1)        NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [im_kod_izby_celnej]             CHAR (2)        NULL,
    [im_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [im_znacznik_kategorii_progowej] CHAR (1)        NULL,
    [im_masa_netto]                  DECIMAL (19, 3) NULL,
    [im_ilosc]                       DECIMAL (19, 3) NULL,
    [im_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [im_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [im_wartosc_stat_euro]           DECIMAL (19, 3) NULL
) ON [StatDane];

