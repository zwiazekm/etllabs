﻿CREATE TABLE [zef2DW].[POPC_Dokument] (
    [IdentyfikatorDokumentu]                    BIGINT          NOT NULL,
    [DataDoreczenia]                            DATE            NULL,
    [DataWystawienia]                           DATE            NULL,
    [DokumentArchiwalny]                        NVARCHAR (5)    NULL,
    [KwotaOplatyRazem]                          DECIMAL (19, 2) NULL,
    [NumerPokwitowania]                         NVARCHAR (255)  NULL,
    [RodzajOplaty]                              NVARCHAR (32)   NULL,
    [NumerPostanowienia]                        NVARCHAR (255)  NULL,
    [TerminPlatnosci]                           DATE            NULL,
    [AdnotacjeIUwagi]                           NVARCHAR (512)  NULL,
    [RaportWyslaniaSK]                          NVARCHAR (MAX)  NULL,
    [NumerZabezpieczniaJednorazowego]           NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaJednorazowego]          DECIMAL (19, 2) NULL,
    [DataObciazeniaZabezpieczeniaJednorazowego] DATE            NULL,
    [NIPKontrahentaZabezpieczeniaJednorazowego] NVARCHAR (10)   NULL,
    [PotwierdzeniaDataPrzelewu]                 DATE            NULL,
    [MigracjaReczna]                            NVARCHAR (50)   NULL,
    [DataArch]                                  DATE            NULL,
    [ID_Pismo_xml]                              BIGINT          NULL,
    [IdentyfikatorPodatnika]                    BIGINT          NOT NULL,
    CONSTRAINT [POPC_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

