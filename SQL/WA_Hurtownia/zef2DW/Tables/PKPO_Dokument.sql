﻿CREATE TABLE [zef2DW].[PKPO_Dokument] (
    [IdentyfikatorDokumentu]                BIGINT          NOT NULL,
    [DataOtrzymania]                        DATE            NULL,
    [DataWydania]                           DATE            NULL,
    [DokumentArchiwalny]                    NVARCHAR (5)    NULL,
    [KaraRazem]                             DECIMAL (19, 2) NULL,
    [RodzajKary]                            NVARCHAR (32)   NULL,
    [NumerPostanowienia]                    NVARCHAR (255)  NULL,
    [WWynikuKontroliPostepowania]           NVARCHAR (12)   NULL,
    [TerminPlatnosci]                       DATE            NULL,
    [NrPostanowieniaOWszczeciuPostepowania] NVARCHAR (255)  NULL,
    [NrUpowaznienia]                        NVARCHAR (255)  NULL,
    [WynikKontroliNumerWniosku]             NVARCHAR (255)  NULL,
    [AdnotacjeIUwagi]                       NVARCHAR (512)  NULL,
    [WnioskodawcaPostepowania]              NVARCHAR (25)   NULL,
    [MigracjaReczna]                        NVARCHAR (5)    NULL,
    [DokumentPowiazany]                     NVARCHAR (255)  NULL,
    [RaportWyslaniaSK]                      NVARCHAR (MAX)  NULL,
    [DataArch]                              DATE            NULL,
    [ID_Pismo_xml]                          BIGINT          NULL,
    [IdentyfikatorPodatnika]                BIGINT          NOT NULL,
    CONSTRAINT [PKPO_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

