CREATE TABLE [stat].[zerowe_wartosci_eks] (
    [ek_pcn]                         VARCHAR (8)  NULL,
    [ek_zp]                          VARCHAR (1)  NULL,
    [ek_pcnp]                        VARCHAR (8)  NULL,
    [ek_kraj_przeznaczenia]          VARCHAR (2)  NULL,
    [ek_odbiorca]                    VARCHAR (14) NULL,
    [ek_miesiac_rok]                 VARCHAR (4)  NULL,
    [ek_rodzaj_transakcji]           VARCHAR (2)  NULL,
    [ek_kod_transportu]              VARCHAR (1)  NULL,
    [ek_kod_warunkow_dostawy]        VARCHAR (3)  NULL,
    [ek_kod_izby_celnej]             VARCHAR (2)  NULL,
    [ek_kod_procedury_celnej]        VARCHAR (4)  NULL,
    [ek_znacznik_kategorii_progowej] VARCHAR (1)  NULL,
    [ek_masa_netto]                  VARCHAR (15) NULL,
    [ek_ilosc]                       VARCHAR (15) NULL,
    [ek_wartosc_stat_zl]             VARCHAR (15) NULL,
    [ek_wartosc_stat_usd]            VARCHAR (15) NULL,
    [ek_wartosc_stat_euro]           VARCHAR (15) NULL
) ON [StatDane];

