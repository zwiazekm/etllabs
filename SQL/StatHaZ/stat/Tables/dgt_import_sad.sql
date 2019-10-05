CREATE TABLE [stat].[dgt_import_sad] (
    [im_pcn]                         VARCHAR (10)    NULL,
    [im_zp]                          CHAR (1)        NULL,
    [im_pcnp]                        VARCHAR (10)    NULL,
    [im_kraj_pochodzenia]            CHAR (2)        NULL,
    [im_kraj_wysylki]                CHAR (2)        NULL,
    [im_kraj_zakupu]                 CHAR (2)        NULL,
    [im_odbiorca]                    VARCHAR (14)    NULL,
    [im_RokMc]                       INT             NULL,
    [im_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [im_kod_transportu_g]            CHAR (1)        NULL,
    [im_kod_transportu_w]            CHAR (1)        NULL,
    [im_kod_warunkow_dostawy]        VARCHAR (3)     NULL,
    [im_kod_izby_celnej]             VARCHAR (2)     NULL,
    [im_kod_procedury_celnej]        VARCHAR (4)     NULL,
    [im_kod_waluty]                  VARCHAR (3)     NULL,
    [im_kod_kraju_srodka_transportu] CHAR (2)        NULL,
    [im_kontener]                    CHAR (1)        NULL,
    [im_kod_preferencji]             VARCHAR (3)     NULL,
    [im_masa_netto]                  DECIMAL (19, 3) NULL,
    [im_masa_brutto]                 DECIMAL (19, 3) NULL,
    [im_ilosc]                       DECIMAL (19, 3) NULL,
    [im_wartosc_stat_zl]             DECIMAL (19, 3) NULL,
    [im_wartosc_stat_usd]            DECIMAL (19, 3) NULL,
    [im_wartosc_stat_euro]           DECIMAL (19, 3) NULL,
    [im_wartosc_pozycji]             DECIMAL (19, 3) NULL,
    [im_iddoknr]                     BIGINT          NULL,
    [im_iddoknr_pozid]               BIGINT          NULL,
    [im_id]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [im_typ]                         CHAR (1)        NULL
);


GO
CREATE NONCLUSTERED INDEX [dgt_import_sad_im_kraj_pochodzenia_idx]
    ON [stat].[dgt_import_sad]([im_kraj_pochodzenia] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [dgt_import_sad_im_kraj_wysylki_idx]
    ON [stat].[dgt_import_sad]([im_kraj_wysylki] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [dgt_import_sad_im_pcnp_idx]
    ON [stat].[dgt_import_sad]([im_pcnp] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [dgt_import_sad_pcn_idx]
    ON [stat].[dgt_import_sad]([im_pcn] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [dgt_import_sad_wart_stat_zl]
    ON [stat].[dgt_import_sad]([im_wartosc_stat_zl] ASC)
    ON [StatIndeksy];

