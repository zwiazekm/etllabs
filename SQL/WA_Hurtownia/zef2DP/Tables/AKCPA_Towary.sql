﻿CREATE TABLE [zef2DP].[AKCPA_Towary] (
    [IdentyfikatorWpisu]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]   BIGINT          NULL,
    [KodCN]                    NVARCHAR (255)  NULL,
    [NazwaGrupyWyrobow]        NVARCHAR (4000) NULL,
    [PodstawObliczPrzedplaty]  DECIMAL (19, 4) NULL,
    [WartoscWgMaksCenyDetal]   DECIMAL (19, 4) NULL,
    [StawkaPodatkuProcent]     DECIMAL (19, 4) NULL,
    [StawkaPodatkuKwota]       DECIMAL (19, 4) NULL,
    [KwotaPrzedplaty]          DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]        NVARCHAR (5)    NULL,
    [RodzajStawkiSpozaISZTAR]  NVARCHAR (16)   NULL,
    [WartoscStawkiSpozaISZTAR] DECIMAL (19, 4) NULL,
    [DataArch]                 DATETIME2 (7)   NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    CONSTRAINT [AKCPA_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

