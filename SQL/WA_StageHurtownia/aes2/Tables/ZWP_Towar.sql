﻿CREATE TABLE [aes2].[ZWP_Towar] (
    [id]                      NUMERIC (19)    NOT NULL,
    [MasaBrutto]              NUMERIC (18, 3) NULL,
    [KrajWysylki]             NVARCHAR (2)    NULL,
    [KrajWysylkiPid]          NVARCHAR (2)    NULL,
    [KrajPrzeznaczenia]       NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]    NVARCHAR (2)    NULL,
    [MasaBruttoNaGranicy]     NUMERIC (18, 3) NULL,
    [NrPozycji]               INT             NULL,
    [KodTowarowy]             NVARCHAR (22)   NULL,
    [KodTowarowyPid]          NVARCHAR (22)   NULL,
    [StanTowaruNaGranicy]     NCHAR (1)       NOT NULL,
    [OpisTowaruNaGranicy]     NVARCHAR (1680) NULL,
    [KodTowarowyNaGranicy]    NVARCHAR (22)   NULL,
    [KodTowarowyNaGranicyPid] NVARCHAR (22)   NULL,
    [MasaNetto]               NUMERIC (18, 3) NULL,
    [MasaNettoNaGranicy]      NUMERIC (18, 3) NULL,
    [OpisTowaru]              NVARCHAR (1680) NULL,
    [IdDokZWP]                NUMERIC (19)    NULL,
    [ProceduraWnioskowana]    NVARCHAR (2)    NULL,
    [ProceduraWnioskowanaPid] NVARCHAR (2)    NULL,
    [ProceduraWymagana]       NVARCHAR (2)    NULL,
    [ProceduraWymaganaPid]    NVARCHAR (2)    NULL,
    [KodTowarowyUCP]          NVARCHAR (8)    NULL,
    [KodTARICUCP]             NVARCHAR (2)    NULL,
    [KodTypOplTransp]         NVARCHAR (1)    NULL,
    [KodTypOplTranspPid]      NVARCHAR (1)    NULL,
    [ProceduraKrajowa]        NVARCHAR (3)    NULL,
    [ProceduraKrajowaPid]     NVARCHAR (3)    NULL,
    [WalutaWartosciStat]      NVARCHAR (3)    NULL,
    [WalutaWartosciStatPid]   NVARCHAR (3)    NULL,
    [WartoscStatystyczna]     NUMERIC (17, 2) NULL,
    [CRN]                     NVARCHAR (70)   NULL,
    [TowarNiebezpieczny]      NVARCHAR (4)    NULL,
    [TowarNiebezpiecznyPid]   NVARCHAR (4)    NULL,
    [KodScalony]              NVARCHAR (8)    NULL,
    [KodTARIC]                NVARCHAR (2)    NULL,
    [DodKodTARIC1]            NVARCHAR (4)    NULL,
    [DodKodTARIC1Pid]         NVARCHAR (4)    NULL,
    [DodKodTARIC2]            NVARCHAR (4)    NULL,
    [DodKodTARIC2Pid]         NVARCHAR (4)    NULL,
    [KodDod]                  NVARCHAR (4)    NULL,
    [KodDodPid]               NVARCHAR (4)    NULL,
    [SzczegolyProceduryUCP]   NVARCHAR (3)    NULL,
    [CRNRozbieznosc]          NVARCHAR (70)   NULL,
    [OplatyTransportoweUCP]   NVARCHAR (1)    NULL,
    [WartoscStatystycznaUCP]  NUMERIC (17, 2) NULL,
    [WalutaUCP]               NVARCHAR (3)    NULL,
    [DodKodTARIC1UCP]         NVARCHAR (4)    NULL,
    [DodKodTARIC2UCP]         NVARCHAR (4)    NULL,
    [TowarNiebezpiecznyUCP]   NVARCHAR (4)    NULL,
    CONSTRAINT [ZWP_Towar$PK_ZWP_Towar] PRIMARY KEY CLUSTERED ([id] ASC)
);

