﻿CREATE TABLE [aes2].[ZWA_Towar] (
    [Id]                           NUMERIC (19)    NOT NULL,
    [MasaBrutto]                   NUMERIC (18, 3) NULL,
    [KrajWysylki]                  NVARCHAR (2)    NULL,
    [KrajWysylkiPid]               NVARCHAR (2)    NULL,
    [KrajPrzeznaczenia]            NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]         NVARCHAR (2)    NULL,
    [MasaBruttoNaGranicy]          NUMERIC (18, 3) NULL,
    [NrPozycji]                    INT             NULL,
    [KodTowarowy]                  NVARCHAR (22)   NULL,
    [KodTowarowyPid]               NVARCHAR (22)   NULL,
    [StanTowaruNaGranicy]          NCHAR (1)       NOT NULL,
    [OpisTowaruNaGranicy]          NVARCHAR (840)  NULL,
    [KodTowarowyNaGranicy]         NVARCHAR (22)   NULL,
    [KodTowarowyNaGranicyPid]      NVARCHAR (22)   NULL,
    [MasaNetto]                    NUMERIC (18, 3) NULL,
    [MasaNettoNaGranicy]           NUMERIC (18, 3) NULL,
    [OpisTowaru]                   NVARCHAR (840)  NULL,
    [IdDokZWA]                     NUMERIC (19)    NULL,
    [ProceduraWnioskowana]         NVARCHAR (2)    NULL,
    [ProceduraWnioskowanaPid]      NVARCHAR (2)    NULL,
    [ProceduraWymagana]            NVARCHAR (2)    NULL,
    [ProceduraWymaganaPid]         NVARCHAR (2)    NULL,
    [KodScalony]                   NVARCHAR (8)    NULL,
    [KodTARICNaGranicy]            NVARCHAR (2)    NULL,
    [KodTypOplTransp]              NVARCHAR (1)    NULL,
    [KodTypOplTranspPid]           NVARCHAR (1)    NULL,
    [ProceduraKrajowa]             NVARCHAR (3)    NULL,
    [ProceduraKrajowaPid]          NVARCHAR (3)    NULL,
    [WalutaWartosciStat]           NVARCHAR (3)    NULL,
    [WalutaWartosciStatPid]        NVARCHAR (3)    NULL,
    [WartoscStatystyczna]          NUMERIC (17, 2) NULL,
    [CRN]                          NVARCHAR (70)   NULL,
    [TowarNiebezpieczny]           NVARCHAR (4)    NULL,
    [TowarNiebezpiecznyPid]        NVARCHAR (4)    NULL,
    [KodTARIC]                     NVARCHAR (2)    NULL,
    [DodKodTARIC1]                 NVARCHAR (4)    NULL,
    [DodKodTARIC1Pid]              NVARCHAR (4)    NULL,
    [DodKodTARIC2]                 NVARCHAR (4)    NULL,
    [DodKodTARIC2Pid]              NVARCHAR (4)    NULL,
    [KodDod]                       NVARCHAR (4)    NULL,
    [KodDodPid]                    NVARCHAR (4)    NULL,
    [KodDodNaGranicy]              NVARCHAR (4)    NULL,
    [SzczegolyProceduryNaGranicy]  NVARCHAR (3)    NULL,
    [CRNRozbieznosc]               NVARCHAR (70)   NULL,
    [OplatyTransportoweNaGranicy]  NVARCHAR (1)    NULL,
    [WartoscStatystycznaNaGranicy] NUMERIC (17, 2) NULL,
    [WalutaNaGranicy]              NVARCHAR (3)    NULL,
    [DodKodTARIC1NaGranicy]        NVARCHAR (4)    NULL,
    [DodKodTARIC2NaGranicy]        NVARCHAR (4)    NULL,
    [TowarNiebezpiecznyNaGranicy]  NVARCHAR (4)    NULL,
    [KodScalonyNaGranicy]          NVARCHAR (8)    NULL,
    CONSTRAINT [ZWA_Towar$PK_ZWA_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

