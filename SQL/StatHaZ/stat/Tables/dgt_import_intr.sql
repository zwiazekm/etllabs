CREATE TABLE [stat].[dgt_import_intr] (
    [im_pcn]                         VARCHAR (8)     NULL,
    [im_zp]                          CHAR (1)        NULL,
    [im_pcnp]                        VARCHAR (8)     NULL,
    [im_kraj_pochodzenia]            CHAR (2)        NULL,
    [im_kraj_wysylki]                CHAR (2)        NULL,
    [im_odbiorca]                    VARCHAR (14)    NULL,
    [im_nip]                         VARCHAR (10)    NULL,
    [im_RokMc]                       INT             NULL,
    [im_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [im_kod_transportu]              CHAR (1)        NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [im_kod_izby_celnej]             VARCHAR (2)     NULL,
    [im_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [im_znacznik_kategorii_progowej] CHAR (1)        NULL,
    [im_masa_netto]                  DECIMAL (19, 3) NULL,
    [im_ilosc]                       DECIMAL (19, 3) NULL,
    [im_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [im_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [im_wartosc_stat_euro]           DECIMAL (19, 3) NULL,
    [im_wartosc_faktury]             DECIMAL (19, 3) NULL,
    [im_iddoknr]                     BIGINT          NULL,
    [im_id_dok]                      VARCHAR (35)    NULL,
    [im_iddoknr_pozid]               BIGINT          NULL,
    [im_id_dok_pozid]                BIGINT          NULL,
    [im_typ]                         CHAR (1)        NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_dgt_import_intr_ek_nip]
    ON [stat].[dgt_import_intr]([im_nip] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dgt_import_intr_im_kraj_pochodzenia]
    ON [stat].[dgt_import_intr]([im_kraj_pochodzenia] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dgt_import_intr_im_kraj_wysylki]
    ON [stat].[dgt_import_intr]([im_kraj_wysylki] ASC)
    ON [StatIndeksy];


GO
CREATE CLUSTERED INDEX [im_intr_bledy]
    ON [stat].[dgt_import_intr]([im_RokMc] ASC, [im_kraj_pochodzenia] ASC, [im_kraj_wysylki] ASC, [im_kod_izby_celnej] ASC, [im_pcn] ASC, [im_odbiorca] ASC);

