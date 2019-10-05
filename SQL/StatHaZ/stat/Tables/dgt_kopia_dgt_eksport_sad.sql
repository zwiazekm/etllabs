CREATE TABLE [stat].[dgt_kopia_dgt_eksport_sad] (
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
    [ek_wartosc_pozycji]             DECIMAL (19, 3) NULL,
    [ek_iddoknr]                     BIGINT          NULL,
    [ek_iddoknr_pozid]               BIGINT          NULL,
    [ek_id]                          BIGINT          NOT NULL,
    [ek_typ]                         CHAR (1)        NULL,
    [generacjaId]                    INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_eksport_sad] PRIMARY KEY CLUSTERED ([ek_id] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ek_iddoknr]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_iddoknr]);


GO
CREATE STATISTICS [ek_iddoknr_pozid]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_iddoknr_pozid]);


GO
CREATE STATISTICS [ek_ilosc]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_ilosc]);


GO
CREATE STATISTICS [ek_kod_izby_celnej]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_izby_celnej]);


GO
CREATE STATISTICS [ek_kod_kraju_sprzedazy]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_kraju_sprzedazy]);


GO
CREATE STATISTICS [ek_kod_kraju_srodka_transportu]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_kraju_srodka_transportu]);


GO
CREATE STATISTICS [ek_kod_procedury_celnej]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_procedury_celnej]);


GO
CREATE STATISTICS [ek_kod_transportu_g]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_transportu_g]);


GO
CREATE STATISTICS [ek_kod_transportu_w]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_transportu_w]);


GO
CREATE STATISTICS [ek_kod_waluty]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_waluty]);


GO
CREATE STATISTICS [ek_kod_warunkow_dostawy]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [ek_kontener]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kontener]);


GO
CREATE STATISTICS [ek_kraj_przeznaczenia]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kraj_przeznaczenia]);


GO
CREATE STATISTICS [ek_kraj_wysylki]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_kraj_wysylki]);


GO
CREATE STATISTICS [ek_masa_brutto]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_masa_brutto]);


GO
CREATE STATISTICS [ek_masa_netto]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_masa_netto]);


GO
CREATE STATISTICS [ek_odbiorca]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_odbiorca]);


GO
CREATE STATISTICS [ek_pcn]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_pcn]);


GO
CREATE STATISTICS [ek_pcnp]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_pcnp]);


GO
CREATE STATISTICS [ek_rodzaj_transakcji]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_rodzaj_transakcji]);


GO
CREATE STATISTICS [ek_RokMc]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_RokMc]);


GO
CREATE STATISTICS [ek_typ]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_typ]);


GO
CREATE STATISTICS [ek_wartosc_pozycji]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_wartosc_pozycji]);


GO
CREATE STATISTICS [ek_wartosc_stat_euro]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_wartosc_stat_euro]);


GO
CREATE STATISTICS [ek_wartosc_stat_usd]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_wartosc_stat_usd]);


GO
CREATE STATISTICS [ek_wartosc_stat_zl]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_wartosc_stat_zl]);


GO
CREATE STATISTICS [ek_zp]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([ek_zp]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dgt_eksport_sad]([generacjaId]);

