﻿CREATE TABLE [zc].[ZWU_Dokument] (
    [Id]                         DECIMAL (19)    NOT NULL,
    [Status]                     CHAR (1)        NULL,
    [NrWlasny]                   VARCHAR (22)    NULL,
    [MRN]                        VARCHAR (35)    NULL,
    [CRN]                        NVARCHAR (70)   NULL,
    [UrzadWywozu]                VARCHAR (8)     NULL,
    [UrzadWywozuPid]             INT             NULL,
    [UrzadWyprowadzenia]         VARCHAR (8)     NULL,
    [UrzadWyprowadzeniaPid]      INT             NULL,
    [UrzadWyprowadzeniaZm]       VARCHAR (8)     NULL,
    [UrzadWyprowadzeniaZmPid]    INT             NULL,
    [ProceduraUproszczona]       TINYINT         NULL,
    [Skladowanie]                TINYINT         NULL,
    [TowarNiebezpieczny]         VARCHAR (4)     NULL,
    [SpecyficzneOkolicznosci]    CHAR (1)        NULL,
    [1a]                         CHAR (2)        NULL,
    [1b]                         CHAR (1)        NULL,
    [LiczbaPoz]                  INT             NULL,
    [LiczbaPozNaGranicy]         INT             NULL,
    [LiczbaPozNaGranicyKom]      NVARCHAR (140)  NULL,
    [LiczbaOpak]                 INT             NULL,
    [LiczbaOpakNaGranicy]        INT             NULL,
    [LiczbaOpakNaGranicyKom]     NVARCHAR (140)  NULL,
    [KrajWysylki]                CHAR (2)        NULL,
    [KrajWysylkiPid]             INT             NULL,
    [KrajPrzeznaczenia]          CHAR (2)        NULL,
    [KrajPrzeznaczeniaPid]       INT             NULL,
    [Kontenery]                  TINYINT         NULL,
    [MasaBrutto]                 DECIMAL (18, 3) NULL,
    [MasaBruttoNaGranicy]        DECIMAL (18, 3) NULL,
    [MasaBruttoNaGranicyKom]     NVARCHAR (140)  NULL,
    [KodWarunkowDostawy]         CHAR (3)        NULL,
    [KodWarunkowDostawyPid]      INT             NULL,
    [MiejsceDostawy]             NVARCHAR (35)   NULL,
    [KodMiejscaDostawy]          CHAR (1)        NULL,
    [KodMiejscaDostawyPid]       INT             NULL,
    [DataPrzyjeciaNaEwid]        DATETIME        NULL,
    [Wartosc]                    DECIMAL (17, 2) NULL,
    [KodWaluty]                  CHAR (3)        NULL,
    [KodWalutyPid]               INT             NULL,
    [KursWaluty]                 DECIMAL (11, 5) NULL,
    [KodRodzajuTransakcji]       CHAR (2)        NULL,
    [KodRodzajuTransakcjiPid]    INT             NULL,
    [SumaOplat]                  DECIMAL (17, 2) NULL,
    [PodpisElektroniczny]        TINYINT         NULL,
    [TerminZwolnieniePU]         DATETIME        NULL,
    [TerminUrzadWyprowadzenia]   DATETIME        NULL,
    [TerminWysylkiPotwierdzenia] DATETIME        NULL,
    [DataWyprowadzenia]          DATETIME        NULL,
    [DataZatrzymania]            DATETIME        NULL,
    [KodTypOplatTransp]          CHAR (1)        NULL,
    [KodTypOplatTranspPid]       INT             NULL,
    [UC]                         VARCHAR (8)     NULL,
    [UCPid]                      INT             NULL,
    [MiejsceKodPozaUC]           VARCHAR (17)    NULL,
    [MiejsceKodPozaUCPid]        INT             NULL,
    [MiejsceBezKoduPozaUC]       NVARCHAR (35)   NULL,
    [TrWewnRodzaj]               CHAR (2)        NULL,
    [TrWewnRodzajPid]            INT             NULL,
    [TrWewnZnaki]                VARCHAR (31)    NULL,
    [TrWewnZnakiNaGranicy]       VARCHAR (31)    NULL,
    [TrWewnZnakiNaGranicyKom]    NVARCHAR (140)  NULL,
    [TrDeklRodzaj]               CHAR (2)        NULL,
    [TrDeklRodzajPid]            INT             NULL,
    [TrDeklZnaki]                VARCHAR (31)    NULL,
    [TrDeklKraj]                 CHAR (2)        NULL,
    [TrDeklKrajPid]              INT             NULL,
    [KontrWywozKod]              CHAR (2)        NULL,
    [KontrWywozKodPid]           INT             NULL,
    [KontrWywozTermin]           DATETIME        NULL,
    [ZamkCelneLiczba]            INT             NULL,
    [KontrWyprKod]               CHAR (2)        NULL,
    [KontrWyprKodPid]            INT             NULL,
    [KontrWyprStan]              TINYINT         NULL,
    [Miejsce]                    NVARCHAR (35)   NULL,
    [Data]                       DATETIME        NULL,
    [ImieNazwisko]               NVARCHAR (35)   NULL,
    [Stanowisko]                 NVARCHAR (35)   NULL,
    [ProceduraUproszczonaBOOL]   INT             NULL,
    [SkladowanieBOOL]            INT             NULL,
    [KonteneryBOOL]              INT             NULL,
    [PodpisElektronicznyBOOL]    INT             NULL,
    CONSTRAINT [PK_ZWU_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC)
);

