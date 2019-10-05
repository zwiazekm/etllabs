﻿CREATE TABLE [zc].[ZWA_Towar] (
    [Id]                      DECIMAL (19)    NOT NULL,
    [NrPozycji]               INT             NULL,
    [StanTowaruNaGranicy]     CHAR (1)        NULL,
    [KrajWysylki]             CHAR (2)        NULL,
    [KrajWysylkiPid]          INT             NULL,
    [KrajPrzeznaczenia]       CHAR (2)        NULL,
    [KrajPrzeznaczeniaPid]    INT             NULL,
    [OpisTowaru]              NVARCHAR (280)  NULL,
    [OpisTowaruNaGranicy]     NVARCHAR (280)  NULL,
    [KodTowarowyNaGranicyPid] INT             NULL,
    [KodTowarowy]             VARCHAR (22)    NULL,
    [KodTowarowyPid]          INT             NULL,
    [KodTowarowyNaGranicy]    VARCHAR (22)    NULL,
    [MasaBrutto]              DECIMAL (18, 3) NULL,
    [MasaBruttoNaGranicy]     DECIMAL (18, 3) NULL,
    [MasaNetto]               DECIMAL (18, 3) NULL,
    [MasaNettoNaGranicy]      DECIMAL (18, 3) NULL,
    [KodTypOplTransp]         CHAR (1)        NULL,
    [KodTypOplTranspPid]      INT             NULL,
    [ProceduraWnioskowana]    CHAR (2)        NULL,
    [ProceduraWnioskowanaPid] INT             NULL,
    [ProceduraWymagana]       CHAR (2)        NULL,
    [ProceduraWymaganaPid]    INT             NULL,
    [ProceduraKrajowa]        CHAR (3)        NULL,
    [ProceduraKrajowaPid]     INT             NULL,
    [WalutaWartosciStat]      CHAR (3)        NULL,
    [WalutaWartosciStatPid]   INT             NULL,
    [WartoscStatystyczna]     DECIMAL (17, 2) NULL,
    [CRN]                     VARCHAR (70)    NULL,
    [TowarNiebezpieczny]      VARCHAR (4)     NULL,
    [TowarNiebezpiecznyPid]   INT             NULL,
    [KodScalony]              VARCHAR (8)     NULL,
    [KodTARIC]                CHAR (2)        NULL,
    [DodKodTARIC1]            VARCHAR (4)     NULL,
    [DodKodTARIC1Pid]         INT             NULL,
    [DodKodTARIC2]            VARCHAR (4)     NULL,
    [DodKodTARIC2Pid]         INT             NULL,
    [KodDod]                  VARCHAR (4)     NULL,
    [KodDodPid]               INT             NULL,
    [IdDokZWA]                DECIMAL (19)    NOT NULL,
    CONSTRAINT [PK_ZWA_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

