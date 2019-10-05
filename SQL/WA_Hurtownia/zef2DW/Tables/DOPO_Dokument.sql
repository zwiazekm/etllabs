﻿CREATE TABLE [zef2DW].[DOPO_Dokument] (
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [TypDochodu]             NVARCHAR (32)  NULL,
    [NumerDecyzji]           NVARCHAR (255) NULL,
    [DataDecyzji]            DATE           NULL,
    [DataDoreczenia]         DATE           NULL,
    [NowyTerminPlatnosci]    DATE           NULL,
    [PrzyczynaZadluzenia]    INT            NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512) NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    [IdentyfikatorPodatnika] BIGINT         NOT NULL,
    [KodJednostki]           NVARCHAR (6)   NULL,
    [MigracjaReczna]         NVARCHAR (5)   NULL,
    CONSTRAINT [DOPO_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

