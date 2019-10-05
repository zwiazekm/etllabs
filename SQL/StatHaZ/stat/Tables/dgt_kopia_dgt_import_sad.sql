CREATE TABLE [stat].[dgt_kopia_dgt_import_sad] (
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
    [im_kontener]                    VARCHAR (1)     NULL,
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
    [im_id]                          BIGINT          NOT NULL,
    [im_typ]                         CHAR (1)        NULL,
    [generacjaId]                    INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_import_sad] PRIMARY KEY CLUSTERED ([im_id] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dgt_import_sad]([generacjaId]);


GO
CREATE STATISTICS [im_iddoknr]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_iddoknr]);


GO
CREATE STATISTICS [im_iddoknr_pozid]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_iddoknr_pozid]);


GO
CREATE STATISTICS [im_ilosc]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_ilosc]);


GO
CREATE STATISTICS [im_kod_izby_celnej]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_izby_celnej]);


GO
CREATE STATISTICS [im_kod_kraju_srodka_transportu]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_kraju_srodka_transportu]);


GO
CREATE STATISTICS [im_kod_preferencji]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_preferencji]);


GO
CREATE STATISTICS [im_kod_procedury_celnej]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_procedury_celnej]);


GO
CREATE STATISTICS [im_kod_transportu_g]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_transportu_g]);


GO
CREATE STATISTICS [im_kod_transportu_w]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_transportu_w]);


GO
CREATE STATISTICS [im_kod_waluty]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_waluty]);


GO
CREATE STATISTICS [im_kod_warunkow_dostawy]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [im_kontener]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kontener]);


GO
CREATE STATISTICS [im_kraj_pochodzenia]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kraj_pochodzenia]);


GO
CREATE STATISTICS [im_kraj_wysylki]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kraj_wysylki]);


GO
CREATE STATISTICS [im_kraj_zakupu]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_kraj_zakupu]);


GO
CREATE STATISTICS [im_masa_brutto]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_masa_brutto]);


GO
CREATE STATISTICS [im_masa_netto]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_masa_netto]);


GO
CREATE STATISTICS [im_odbiorca]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_odbiorca]);


GO
CREATE STATISTICS [im_pcn]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_pcn]);


GO
CREATE STATISTICS [im_pcnp]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_pcnp]);


GO
CREATE STATISTICS [im_rodzaj_transakcji]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_rodzaj_transakcji]);


GO
CREATE STATISTICS [im_RokMc]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_RokMc]);


GO
CREATE STATISTICS [im_typ]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_typ]);


GO
CREATE STATISTICS [im_wartosc_pozycji]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_wartosc_pozycji]);


GO
CREATE STATISTICS [im_wartosc_stat_euro]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_wartosc_stat_euro]);


GO
CREATE STATISTICS [im_wartosc_stat_usd]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_wartosc_stat_usd]);


GO
CREATE STATISTICS [im_wartosc_stat_zl]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_wartosc_stat_zl]);


GO
CREATE STATISTICS [im_zp]
    ON [stat].[dgt_kopia_dgt_import_sad]([im_zp]);

