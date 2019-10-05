﻿CREATE TABLE [aimp2].[DPDZ_Dokument] (
    [IdDok]                              NUMERIC (19)    NOT NULL,
    [TypDeklaracji]                      NVARCHAR (4)    NULL,
    [PodmiotAEO]                         TINYINT         NOT NULL,
    [EksportDanych]                      NCHAR (1)       NOT NULL,
    [AwaryjnaRejestracja]                TINYINT         NULL,
    [FlagaDeklaracji]                    NVARCHAR (4)    NULL,
    [PrzyjetaRecznie]                    TINYINT         NULL,
    [MRN]                                NVARCHAR (35)   NULL,
    [IdEwidencjaPapierowa]               NVARCHAR (35)   NULL,
    [EmailPodmiotu]                      NVARCHAR (80)   NULL,
    [PlacowkaPodmiotu]                   NVARCHAR (2)    NULL,
    [SegmentacjaZISAR]                   NTEXT           NULL,
    [NumerWlasny]                        NVARCHAR (35)   NULL,
    [PodpisanaCyfrowo]                   TINYINT         NULL,
    [DataPrzyjecia]                      DATETIME2 (3)   NULL,
    [DodatkowyTypZgloszenia]             NVARCHAR (5)    NULL,
    [DodatkowyTypZgloszeniaPid]          INT             NULL,
    [DataKalkulacji]                     DATETIME2 (3)   NULL,
    [DataAnulowania]                     DATETIME2 (3)   NULL,
    [CzyKontenery]                       BIT             NOT NULL,
    [UrzadCelnyKontrolny]                NVARCHAR (8)    NULL,
    [UrzadCelnyKontrolnyPid]             INT             NULL,
    [KrajPrzeznaczenia]                  NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]               INT             NULL,
    [KrajPrzeznaczeniaRegion]            NVARCHAR (9)    NULL,
    [KrajPrzeznaczeniaRegionPid]         INT             NULL,
    [KrajWysylki]                        NVARCHAR (2)    NULL,
    [KrajWysylkiPid]                     INT             NULL,
    [KodWaluty]                          NVARCHAR (3)    NULL,
    [KodWalutypid]                       INT             NULL,
    [UrzadCelnyZgloszenia]               NVARCHAR (8)    NULL,
    [UrzadCelnyZgloszeniaPid]            INT             NULL,
    [PlatnoscOdroczona]                  NVARCHAR (35)   NULL,
    [DataWydaniaPrzesylkiDPZ]            DATE            NULL,
    [WynikiKontroliDPZ]                  NVARCHAR (35)   NULL,
    [NumerPrzesylkiDPZ]                  NVARCHAR (35)   NULL,
    [DataPowiadomieniaDlugDPZ]           DATE            NULL,
    [ZwyklyPocztowyDPZ]                  BIT             NOT NULL,
    [TypZabezpieczeniaDPZ]               NVARCHAR (1)    NULL,
    [OplacenieZabezpieczenieNaleznosci]  NVARCHAR (1)    NULL,
    [SposobUregulowaniaTowaruDPZ]        NVARCHAR (1024) NULL,
    [DataZwolnieniaDPZ]                  DATE            NULL,
    [PodpisElektroniczny]                BIT             NOT NULL,
    [StatusObslugiEMCS]                  NVARCHAR (8)    NULL,
    [UrzadCelnyWprowadzania]             NVARCHAR (8)    NULL,
    [UrzadCelnyWprowadzaniaPid]          INT             NULL,
    [MasaBrutto]                         NUMERIC (16, 6) NULL,
    [IdDanychCelnychPTW]                 NUMERIC (19)    NULL,
    [TypDokumentu]                       NVARCHAR (3)    NULL,
    [TypDokumentuPid]                    INT             NULL,
    [AdnotacjePrawne]                    NVARCHAR (2000) NULL,
    [LiczbaPozycjiTowarowych]            NUMERIC (5)     NULL,
    [NumerPozwolenia]                    NVARCHAR (35)   NULL,
    [LiczbaOpakowan]                     NUMERIC (8)     NULL,
    [NumerReferencyjnyPrzesylki]         NVARCHAR (35)   NULL,
    [DataPrzedstawieniaTowaru]           DATETIME2 (3)   NULL,
    [PrzedstawienieTowaru]               BIT             NOT NULL,
    [UrzadCelnyPrzedstawieniaTowaru]     NVARCHAR (8)    NULL,
    [NumerDokPoprzedniego]               NVARCHAR (25)   NULL,
    [ZawartoscZC213ObslugaSprostowania]  NTEXT           NULL,
    [DataRejestracji]                    DATETIME2 (3)   NULL,
    [NumerRejestru]                      NVARCHAR (10)   NULL,
    [TerminZwolnieniaTowaru]             DATE            NULL,
    [DataOdrzucenia]                     DATETIME2 (3)   NULL,
    [OgolnaWartoscFaktur]                NUMERIC (16, 2) NULL,
    [CzyWyslanoDeklaracjeDoTQS]          BIT             NOT NULL,
    [LicznikWysylkiDoTQS]                TINYINT         NOT NULL,
    [IdZgloszeniaUZP]                    NUMERIC (19)    NULL,
    [DanePokontrolne]                    NTEXT           NULL,
    [TypZgloszenia]                      NVARCHAR (3)    NULL,
    [OsobaPodpisujacaDokument]           NUMERIC (19)    NULL,
    [StatusDeklaracjiZCP]                NVARCHAR (4)    NULL,
    [NumerSystemowyAIS]                  NVARCHAR (35)   NULL,
    [DataGranicznaZlozeniaZgloszeniaUZP] DATETIME2 (3)   NULL,
    [VAT7]                               TINYINT         NULL,
    CONSTRAINT [DPDZ_Dokument_PK] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

