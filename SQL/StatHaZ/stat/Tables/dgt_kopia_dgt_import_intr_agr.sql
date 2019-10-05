CREATE TABLE [stat].[dgt_kopia_dgt_import_intr_agr] (
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
    [im_id]                          BIGINT          NOT NULL,
    [generacjaId]                    INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_import_intr_agr] PRIMARY KEY CLUSTERED ([im_id] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [im_ilosc]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_ilosc]);


GO
CREATE STATISTICS [im_kod_izby_celnej]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kod_izby_celnej]);


GO
CREATE STATISTICS [im_kod_procedury_celnej]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kod_procedury_celnej]);


GO
CREATE STATISTICS [im_kod_transportu]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kod_transportu]);


GO
CREATE STATISTICS [im_kod_warunkow_dostawy]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [im_kraj_pochodzenia]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kraj_pochodzenia]);


GO
CREATE STATISTICS [im_kraj_wysylki]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_kraj_wysylki]);


GO
CREATE STATISTICS [im_masa_netto]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_masa_netto]);


GO
CREATE STATISTICS [im_nip]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_nip]);


GO
CREATE STATISTICS [im_odbiorca]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_odbiorca]);


GO
CREATE STATISTICS [im_pcn]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_pcn]);


GO
CREATE STATISTICS [im_pcnp]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_pcnp]);


GO
CREATE STATISTICS [im_rodzaj_transakcji]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_rodzaj_transakcji]);


GO
CREATE STATISTICS [im_RokMc]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_RokMc]);


GO
CREATE STATISTICS [im_wartosc_faktury]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_wartosc_faktury]);


GO
CREATE STATISTICS [im_wartosc_stat_euro]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_wartosc_stat_euro]);


GO
CREATE STATISTICS [im_wartosc_stat_usd]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_wartosc_stat_usd]);


GO
CREATE STATISTICS [im_wartosc_stat_zl]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_wartosc_stat_zl]);


GO
CREATE STATISTICS [im_znacznik_kategorii_progowej]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_znacznik_kategorii_progowej]);


GO
CREATE STATISTICS [im_zp]
    ON [stat].[dgt_kopia_dgt_import_intr_agr]([im_zp]);

