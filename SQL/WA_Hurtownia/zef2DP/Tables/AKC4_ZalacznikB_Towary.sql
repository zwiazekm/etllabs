﻿CREATE TABLE [zef2DP].[AKC4_ZalacznikB_Towary] (
    [IdentyfikatorWpisu]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorZalacznika]   NVARCHAR (255)  NULL,
    [NazwaGrupyWyrobow]         NVARCHAR (4000) NULL,
    [Ubytki]                    NVARCHAR (16)   NULL,
    [KodCN]                     NVARCHAR (255)  NULL,
    [IloscWyrobowWHektolitrach] DECIMAL (19, 4) NULL,
    [StawkaPodatku]             DECIMAL (19, 4) NULL,
    [KwotaPodatku]              DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]         NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR]  DECIMAL (19, 4) NULL,
    [id1]                       NVARCHAR (150)  NULL,
    CONSTRAINT [AKC4_ZalacznikB_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

