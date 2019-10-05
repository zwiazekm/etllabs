CREATE TABLE [stat].[dgt_import_sad_sads] (
    [im_pcn]                         VARCHAR (10)    NULL,
    [im_zp]                          CHAR (1)        NULL,
    [im_pcnp]                        VARCHAR (10)    NULL,
    [im_kraj_pochodzenia]            CHAR (2)        NULL,
    [im_kraj_wysylki]                CHAR (2)        NULL,
    [im_kraj_zakupu]                 CHAR (2)        NULL,
    [im_odbiorca]                    VARCHAR (14)    NULL,
    [im_miesiac_rok]                 VARCHAR (4)     NULL,
    [im_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [im_kod_transportu_g]            CHAR (1)        NULL,
    [im_kod_transportu_w]            CHAR (1)        NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [im_kod_izby_celnej]             VARCHAR (2)     NULL,
    [im_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [im_kod_waluty]                  VARCHAR (3)     NULL,
    [im_kod_kraju_srodka_transportu] VARCHAR (2)     NULL,
    [im_kontener]                    CHAR (1)        NULL,
    [im_kod_preferencji]             VARCHAR (3)     NULL,
    [im_masa_netto]                  DECIMAL (19, 3) NULL,
    [im_masa_brutto]                 DECIMAL (19, 3) NULL,
    [im_ilosc]                       DECIMAL (19, 3) NULL,
    [im_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [im_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [im_wartosc_stat_euro]           DECIMAL (19, 3) NULL,
    [im_wartosc_pozycji]             DECIMAL (19, 3) NULL
) ON [StatDane];


GO
CREATE STATISTICS [im_ilosc]
    ON [stat].[dgt_import_sad_sads]([im_ilosc]);


GO
CREATE STATISTICS [im_masa_brutto]
    ON [stat].[dgt_import_sad_sads]([im_masa_brutto]);


GO
CREATE STATISTICS [im_masa_netto]
    ON [stat].[dgt_import_sad_sads]([im_masa_netto]);


GO
CREATE STATISTICS [im_wartosc_pozycji]
    ON [stat].[dgt_import_sad_sads]([im_wartosc_pozycji]);


GO
CREATE STATISTICS [im_wartosc_stat_euro]
    ON [stat].[dgt_import_sad_sads]([im_wartosc_stat_euro]);


GO
CREATE STATISTICS [im_wartosc_stat_usd]
    ON [stat].[dgt_import_sad_sads]([im_wartosc_stat_usd]);


GO
CREATE STATISTICS [im_wartosc_stat_zl]
    ON [stat].[dgt_import_sad_sads]([im_wartosc_stat_zl]);

