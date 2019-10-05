CREATE TABLE [stat].[dgt_kopia_dgt_eksport_intr_agr] (
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
    [ek_id]                          BIGINT          NOT NULL,
    [generacjaId]                    INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_eksport_intr_agr] PRIMARY KEY CLUSTERED ([ek_id] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ek_ilosc]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_ilosc]);


GO
CREATE STATISTICS [ek_kod_izby_celnej]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_kod_izby_celnej]);


GO
CREATE STATISTICS [ek_kod_procedury_celnej]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_kod_procedury_celnej]);


GO
CREATE STATISTICS [ek_kod_transportu]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_kod_transportu]);


GO
CREATE STATISTICS [ek_kod_warunkow_dostawy]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [ek_kraj_przeznaczenia]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_kraj_przeznaczenia]);


GO
CREATE STATISTICS [ek_masa_netto]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_masa_netto]);


GO
CREATE STATISTICS [ek_miesiac_rok]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_RokMc]);


GO
CREATE STATISTICS [ek_nip]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_nip]);


GO
CREATE STATISTICS [ek_odbiorca]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_odbiorca]);


GO
CREATE STATISTICS [ek_pcn]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_pcn]);


GO
CREATE STATISTICS [ek_pcnp]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_pcnp]);


GO
CREATE STATISTICS [ek_rodzaj_transakcji]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_rodzaj_transakcji]);


GO
CREATE STATISTICS [ek_wartosc_faktury]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_wartosc_faktury]);


GO
CREATE STATISTICS [ek_wartosc_stat_euro]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_wartosc_stat_euro]);


GO
CREATE STATISTICS [ek_wartosc_stat_usd]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_wartosc_stat_usd]);


GO
CREATE STATISTICS [ek_wartosc_stat_zl]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_wartosc_stat_zl]);


GO
CREATE STATISTICS [ek_zp]
    ON [stat].[dgt_kopia_dgt_eksport_intr_agr]([ek_zp]);

