CREATE TABLE [stat].[dgt_eksport_sads] (
    [ek_pcn]                         VARCHAR (8)     NULL,
    [ek_zp]                          CHAR (1)        NULL,
    [ek_pcnp]                        VARCHAR (8)     NULL,
    [ek_kraj_przeznaczenia]          CHAR (2)        NULL,
    [ek_kraj_wysylki]                CHAR (2)        NULL,
    [ek_kod_kraju_sprzedazy]         CHAR (2)        NULL,
    [ek_odbiorca]                    VARCHAR (14)    NULL,
    [ek_miesiac_rok]                 VARCHAR (4)     NULL,
    [ek_rodzaj_transakcji]           VARCHAR (2)     NULL,
    [ek_kod_transportu]              CHAR (1)        NULL,
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
);


GO
CREATE STATISTICS [ek_ilosc]
    ON [stat].[dgt_eksport_sads]([ek_ilosc]);


GO
CREATE STATISTICS [ek_kod_izby_celnej]
    ON [stat].[dgt_eksport_sads]([ek_kod_izby_celnej]);


GO
CREATE STATISTICS [ek_kod_kraju_sprzedazy]
    ON [stat].[dgt_eksport_sads]([ek_kod_kraju_sprzedazy]);


GO
CREATE STATISTICS [ek_kod_kraju_srodka_transportu]
    ON [stat].[dgt_eksport_sads]([ek_kod_kraju_srodka_transportu]);


GO
CREATE STATISTICS [ek_kod_procedury_celnej]
    ON [stat].[dgt_eksport_sads]([ek_kod_procedury_celnej]);


GO
CREATE STATISTICS [ek_kod_transportu]
    ON [stat].[dgt_eksport_sads]([ek_kod_transportu]);


GO
CREATE STATISTICS [ek_kod_waluty]
    ON [stat].[dgt_eksport_sads]([ek_kod_waluty]);


GO
CREATE STATISTICS [ek_kod_warunkow_dostawy]
    ON [stat].[dgt_eksport_sads]([ek_kod_warunkow_dostawy]);


GO
CREATE STATISTICS [ek_kontener]
    ON [stat].[dgt_eksport_sads]([ek_kontener]);


GO
CREATE STATISTICS [ek_kraj_przeznaczenia]
    ON [stat].[dgt_eksport_sads]([ek_kraj_przeznaczenia]);


GO
CREATE STATISTICS [ek_kraj_wysylki]
    ON [stat].[dgt_eksport_sads]([ek_kraj_wysylki]);


GO
CREATE STATISTICS [ek_masa_brutto]
    ON [stat].[dgt_eksport_sads]([ek_masa_brutto]);


GO
CREATE STATISTICS [ek_masa_netto]
    ON [stat].[dgt_eksport_sads]([ek_masa_netto]);


GO
CREATE STATISTICS [ek_miesiac_rok]
    ON [stat].[dgt_eksport_sads]([ek_miesiac_rok]);


GO
CREATE STATISTICS [ek_odbiorca]
    ON [stat].[dgt_eksport_sads]([ek_odbiorca]);


GO
CREATE STATISTICS [ek_pcn]
    ON [stat].[dgt_eksport_sads]([ek_pcn]);


GO
CREATE STATISTICS [ek_pcnp]
    ON [stat].[dgt_eksport_sads]([ek_pcnp]);


GO
CREATE STATISTICS [ek_rodzaj_transakcji]
    ON [stat].[dgt_eksport_sads]([ek_rodzaj_transakcji]);


GO
CREATE STATISTICS [ek_wartosc_pozycji]
    ON [stat].[dgt_eksport_sads]([ek_wartosc_pozycji]);


GO
CREATE STATISTICS [ek_wartosc_stat_euro]
    ON [stat].[dgt_eksport_sads]([ek_wartosc_stat_euro]);


GO
CREATE STATISTICS [ek_wartosc_stat_usd]
    ON [stat].[dgt_eksport_sads]([ek_wartosc_stat_usd]);


GO
CREATE STATISTICS [ek_wartosc_stat_zl]
    ON [stat].[dgt_eksport_sads]([ek_wartosc_stat_zl]);


GO
CREATE STATISTICS [ek_zp]
    ON [stat].[dgt_eksport_sads]([ek_zp]);

