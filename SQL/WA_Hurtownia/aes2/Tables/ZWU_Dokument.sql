﻿CREATE TABLE [aes2].[ZWU_Dokument] (
    [Id]                                    NUMERIC (19)    NOT NULL,
    [MasaBrutto]                            NUMERIC (18, 3) NULL,
    [MasaBruttoNaGranicyKom]                NVARCHAR (420)  NULL,
    [LiczbaPozycjiNaGranicyKom]             NVARCHAR (420)  NULL,
    [KontrWyprKod]                          NVARCHAR (2)    NULL,
    [KontrWyprKodPid]                       NVARCHAR (2)    NULL,
    [KontrWyprStan]                         TINYINT         NULL,
    [Miejsce]                               NVARCHAR (105)  NULL,
    [Stanowisko]                            NVARCHAR (105)  NULL,
    [Telefon]                               NVARCHAR (45)   NULL,
    [ImieNazwisko]                          NVARCHAR (105)  NULL,
    [Data]                                  DATETIME        NULL,
    [ZamkCelneLiczba]                       INT             NULL,
    [KontrWywozKod]                         NVARCHAR (2)    NULL,
    [KontrWywozKodPid]                      NVARCHAR (2)    NULL,
    [UC]                                    NVARCHAR (8)    NULL,
    [UCPid]                                 NVARCHAR (8)    NULL,
    [MiejsceBezKoduPozaUC]                  NVARCHAR (105)  NULL,
    [MiejsceKodPozaUC]                      NVARCHAR (17)   NULL,
    [MiejsceKodPozaUCPid]                   NVARCHAR (17)   NULL,
    [SkladTowPozaUCBezKodu]                 NVARCHAR (105)  NULL,
    [SkladTowPozaUCKod]                     NVARCHAR (17)   NULL,
    [TrWewnZnakiNaGranicy]                  NVARCHAR (31)   NULL,
    [TrWewnZnakiNaGranicyKom]               NVARCHAR (420)  NULL,
    [TrWewnZnaki]                           NVARCHAR (31)   NULL,
    [TrWewnRodzaj]                          NVARCHAR (2)    NULL,
    [TrWewnRodzajPid]                       NVARCHAR (2)    NULL,
    [UrzadWyprowadzenia]                    NVARCHAR (8)    NULL,
    [UrzadWyprowadzeniaPid]                 NVARCHAR (8)    NULL,
    [UrzadWyprowadzeniaZm]                  NVARCHAR (8)    NULL,
    [UrzadWyprowadzeniaZmPid]               NVARCHAR (8)    NULL,
    [Skladowanie]                           TINYINT         NULL,
    [UrzadWywozu]                           NVARCHAR (8)    NULL,
    [UrzadWywozuPid]                        NVARCHAR (8)    NULL,
    [1a]                                    NVARCHAR (2)    NULL,
    [1aPid]                                 NVARCHAR (2)    NULL,
    [LiczbaPozycji]                         INT             NULL,
    [LiczbaPozycjiNaGranicy]                INT             NULL,
    [LiczbaOpakowan]                        INT             NULL,
    [LiczbaOpakowanNaGranicy]               INT             NULL,
    [LiczbaOpakowanNaGranicyKom]            NVARCHAR (420)  NULL,
    [KrajWysylki]                           NVARCHAR (2)    NULL,
    [KrajWysylkiPid]                        NVARCHAR (2)    NULL,
    [KrajPrzeznaczenia]                     NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]                  NVARCHAR (2)    NULL,
    [Kontenery]                             TINYINT         NULL,
    [MasaBruttoNaGranicy]                   NUMERIC (18, 3) NULL,
    [DataPrzyjeciaNaEwid]                   DATETIME        NULL,
    [KontrWywozTermin]                      DATETIME        NULL,
    [KodWarunkowDostawy]                    NVARCHAR (3)    NULL,
    [KodWarunkowDostawyPid]                 NVARCHAR (3)    NULL,
    [MiejsceDostawy]                        NVARCHAR (105)  NULL,
    [KodMiejscaDostawy]                     NVARCHAR (1)    NULL,
    [KodMiejscaDostawyPid]                  NVARCHAR (1)    NULL,
    [SkladCelnyKod]                         NVARCHAR (35)   NULL,
    [SkladCelnyKodTyp]                      NVARCHAR (1)    NULL,
    [SkladCelnyKodKraju]                    NVARCHAR (2)    NULL,
    [TrDeklKraj]                            NVARCHAR (2)    NULL,
    [TrDeklKrajPid]                         NVARCHAR (2)    NULL,
    [TrDeklZnaki]                           NVARCHAR (31)   NULL,
    [TrDeklRodzaj]                          NVARCHAR (2)    NULL,
    [TrDeklRodzajPid]                       NVARCHAR (2)    NULL,
    [UCKontrolnyUlicaNumer]                 NVARCHAR (105)  NULL,
    [UCKontrolnyKodPocztowy]                NVARCHAR (9)    NULL,
    [UCKontrolnyMiejscowość]                NVARCHAR (105)  NULL,
    [UCKontrolnyKraj]                       NVARCHAR (8)    NULL,
    [UCKontrolnyNazwa]                      NVARCHAR (105)  NULL,
    [UCKontrolnyKodKraju]                   NVARCHAR (2)    NULL,
    [Wartosc]                               NUMERIC (17, 2) NULL,
    [KursWaluty]                            NUMERIC (11, 5) NULL,
    [KodRodzajuTransakcji]                  NVARCHAR (2)    NULL,
    [KodRodzajuTransakcjiPid]               NVARCHAR (2)    NULL,
    [KodWaluty]                             NVARCHAR (3)    NULL,
    [KodWalutyPid]                          NVARCHAR (3)    NULL,
    [1b]                                    NVARCHAR (1)    NULL,
    [1bPid]                                 NVARCHAR (1)    NULL,
    [CRN]                                   NVARCHAR (210)  NULL,
    [TowarNiebezpieczny]                    NVARCHAR (4)    NULL,
    [TowarNiebezpiecznyPid]                 NVARCHAR (4)    NULL,
    [SumaOplat]                             NUMERIC (17, 2) NULL,
    [SpecyficzneOkolicznosci]               NVARCHAR (1)    NULL,
    [SpecyficzneOkolicznosciPid]            NVARCHAR (1)    NULL,
    [PodpisElektroniczny]                   TINYINT         NULL,
    [TerminZwolnieniePU]                    DATETIME        NULL,
    [TerminUrzadWyprowadzenia]              DATETIME        NULL,
    [TerminWysylkiPotwierdzenia]            DATETIME        NULL,
    [ProceduraUproszczona]                  TINYINT         NULL,
    [DataWyprowadzenia]                     DATETIME        NULL,
    [DataZatrzymania]                       DATETIME        NULL,
    [DataZwolnienia]                        DATETIME        NULL,
    [Status]                                NCHAR (1)       NOT NULL,
    [TerminAutomatycznegoPrzyjęcia]         DATETIME        NULL,
    [KodTypOplatTransp]                     NVARCHAR (1)    NULL,
    [KodTypOplatTranspPid]                  NVARCHAR (1)    NULL,
    [OplatyTransportoweNaGranicy]           NVARCHAR (1)    NULL,
    [OplatyTransportoweNaGranicyKomentarz]  NVARCHAR (140)  NULL,
    [CRNNaGranicy]                          NVARCHAR (70)   NULL,
    [CRNNaGranicyKomentarz]                 NVARCHAR (140)  NULL,
    [DataPowiazaniaZWUNaZgloszUzupeln]      DATETIME        NULL,
    [UCZgloszUzupeln]                       NVARCHAR (8)    NULL,
    [TerminDostarczeniaZgloszUzupeln]       DATETIME        NULL,
    [FlagaZgloszUzupeln]                    TINYINT         NULL,
    [TypWydrukuEAD]                         NUMERIC (1)     NULL,
    [CzyDotyczyEMCS]                        TINYINT         NULL,
    [UCPrzedstawienia]                      NVARCHAR (8)    NULL,
    [Tranzyt]                               BIT             NOT NULL,
    [presentation_goods_co]                 NVARCHAR (8)    NULL,
    [OdprawaScentralizowana]                BIT             NOT NULL,
    [WynikKontroliZWPKod]                   NVARCHAR (2)    NULL,
    [WynikKontroliZWPLiczbaZamkniecCelnych] TINYINT         NULL,
    [PrzekroczenieLimitowNCTS2]             NVARCHAR (1)    NULL,
    [NrWlasny]                              NVARCHAR (22)   NULL,
    [MRN]                                   NVARCHAR (35)   NULL,
    CONSTRAINT [ZWU_Dokument$PK_ZWU_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2]
);

