﻿CREATE TABLE [stat].[dgt_eksport_intr] (
    [ek_pcn]                         VARCHAR (8)     NULL,
    [ek_zp]                          CHAR (1)        NULL,
    [ek_pcnp]                        VARCHAR (8)     NULL,
    [ek_kraj_przeznaczenia]          CHAR (2)        NULL,
    [ek_odbiorca]                    VARCHAR (14)    NULL,
    [ek_nip]                         VARCHAR (10)    NULL,
    [ek_RokMc]                       INT             NULL,
    [ek_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [ek_kod_transportu]              CHAR (1)        NULL,
    [ek_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [ek_kod_izby_celnej]             VARCHAR (2)     NULL,
    [ek_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [ek_znacznik_kategorii_progowej] CHAR (1)        NULL,
    [ek_masa_netto]                  DECIMAL (19, 3) NULL,
    [ek_ilosc]                       DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [ek_wartosc_stat_euro]           DECIMAL (19, 3) NULL,
    [ek_wartosc_faktury]             DECIMAL (19, 3) NULL,
    [ek_iddoknr]                     BIGINT          NULL,
    [ek_id_dok]                      VARCHAR (35)    NULL,
    [ek_iddoknr_pozid]               BIGINT          NULL,
    [ek_id_dok_pozid]                BIGINT          NULL,
    [ek_typ]                         CHAR (1)        NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_dgt_eksport_intr_ek_nip]
    ON [stat].[dgt_eksport_intr]([ek_nip] ASC)
    ON [StatIndeksy];

