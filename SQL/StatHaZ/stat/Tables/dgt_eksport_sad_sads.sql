﻿CREATE TABLE [stat].[dgt_eksport_sad_sads] (
    [ek_pcn]                         VARCHAR (8)     NULL,
    [ek_zp]                          CHAR (1)        NULL,
    [ek_pcnp]                        VARCHAR (8)     NULL,
    [ek_kraj_przeznaczenia]          CHAR (2)        NULL,
    [ek_kraj_wysylki]                CHAR (2)        NULL,
    [ek_kod_kraju_sprzedazy]         CHAR (2)        NULL,
    [ek_odbiorca]                    VARCHAR (14)    NULL,
    [ek_RokMc]                       INT             NULL,
    [ek_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [ek_kod_transportu_g]            CHAR (1)        NULL,
    [ek_kod_transportu_w]            CHAR (1)        NULL,
    [ek_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [ek_kod_izby_celnej]             VARCHAR (2)     NULL,
    [ek_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [ek_kod_waluty]                  VARCHAR (3)     NULL,
    [ek_kod_kraju_srodka_transportu] CHAR (2)        NULL,
    [ek_kontener]                    CHAR (1)        NULL,
    [ek_masa_netto]                  DECIMAL (19, 3) NULL,
    [ek_masa_brutto]                 DECIMAL (19, 3) NULL,
    [ek_ilosc]                       DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_euro]           DECIMAL (19, 3) NULL,
    [ek_wartosc_pozycji]             DECIMAL (19, 3) NULL
) ON [StatDane];


GO
CREATE STATISTICS [ek_wartosc_pozycji]
    ON [stat].[dgt_eksport_sad_sads]([ek_wartosc_pozycji]);


GO
CREATE STATISTICS [ek_wartosc_stat_euro]
    ON [stat].[dgt_eksport_sad_sads]([ek_wartosc_stat_euro]);


GO
CREATE STATISTICS [ek_wartosc_stat_usd]
    ON [stat].[dgt_eksport_sad_sads]([ek_wartosc_stat_usd]);


GO
CREATE STATISTICS [ek_wartosc_stat_zl]
    ON [stat].[dgt_eksport_sad_sads]([ek_wartosc_stat_zl]);

