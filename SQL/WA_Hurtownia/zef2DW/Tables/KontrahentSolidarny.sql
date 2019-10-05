﻿CREATE TABLE [zef2DW].[KontrahentSolidarny] (
    [IdentyfikatorSolidarnego]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [SolidarnyNazwaKontrahenta]  NVARCHAR (64)   NULL,
    [SolidarnyDataPowiadomienia] DATE            NULL,
    [SolidarnyTerminPlatnosci]   DATE            NULL,
    [SolidarnyNazwaPelna]        NVARCHAR (255)  NULL,
    [SolidarnyNIP]               NVARCHAR (255)  NULL,
    [SolidarnyREGON]             NVARCHAR (4000) NULL,
    [SolidarnyRodzajKontrahenta] NVARCHAR (64)   NULL,
    [SolidarnyNazwisko]          NVARCHAR (255)  NULL,
    [SolidarnyImie]              NVARCHAR (255)  NULL,
    [SolidarnyDataUrodzenia]     DATE            NULL,
    [SolidarnyPesel]             NVARCHAR (255)  NULL,
    [SolidarnyKraj]              NVARCHAR (4000) NULL,
    [SolidarnyWojewodztwo]       NVARCHAR (4000) NULL,
    [SolidarnyPowiat]            NVARCHAR (4000) NULL,
    [SolidarnyGmina]             NVARCHAR (4000) NULL,
    [SolidarnyUlica]             NVARCHAR (4000) NULL,
    [SolidarnyNrDomu]            NVARCHAR (4000) NULL,
    [SolidarnyNrLokalu]          NVARCHAR (4000) NULL,
    [SolidarnyMiejscowosc]       NVARCHAR (4000) NULL,
    [SolidarnyKodPocztowy]       NVARCHAR (4000) NULL,
    [SolidarnyPoczta]            NVARCHAR (4000) NULL,
    [SolidarnyNrDokumentu]       NVARCHAR (255)  NULL,
    [SolidarnyEORI]              NVARCHAR (4000) NULL,
    [SolidarnyNumerVATUE]        NVARCHAR (4000) NULL,
    [SolidarnyNumerPodatnika]    NVARCHAR (4000) NULL,
    [SolidarnySystem]            NVARCHAR (8)    NULL,
    [DataArch]                   DATETIME        NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [KontrahentSolidarny_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorSolidarnego] ASC) ON [FG_ZEF2DW]
);

